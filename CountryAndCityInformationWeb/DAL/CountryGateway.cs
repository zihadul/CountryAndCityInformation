using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using CountryAndCityInformationWeb.Model;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

namespace CountryAndCityInformationWeb.DAL
{
    public class CountryGateway
    {
        string connectionString = ConfigurationManager.ConnectionStrings["connectionDb"].ConnectionString;

        public int SaveCountry(Country aCountry) {

            SqlConnection connection = new SqlConnection(connectionString);
            string query = "INSERT INTO CountryTBL VALUES('"+aCountry.CountryName+"','"+aCountry.AboutCountry+"')";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            int rowAffected = command.ExecuteNonQuery();
            connection.Close();
            return rowAffected;
        }
        public List<Country> GetAllCountry()
        {
            int count = 0;
            List<Country> countrylist = new List<Country>();
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM CountryTBL";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                Country aCountry = new Country();
                aCountry.Id = int.Parse(reader["Id"].ToString());
                aCountry.CountryName =reader["CountryName"].ToString();
                aCountry.AboutCountry =reader["AboutCountry"].ToString();
                count++;
                aCountry.SerialNo = count;
                countrylist.Add(aCountry);
                
            }
            reader.Close();
            connection.Close();
            return countrylist;
        }

        public bool IsCountryNameExists(Country aCountry) { 
             SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM CountryTBL WHERE CountryName='"+aCountry.CountryName+"'";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();

            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                reader.Close();
                connection.Close();
                return true;
            }
            else {
                reader.Close();
                connection.Close();
                return false;
            }
        
        }

        public List<City> SearchCountryInformation(Country myCountry)
        {
            int count = 0;
            List<City> cityList = new List<City>();
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM CityTBL WHERE CountryId='"+myCountry.Id+"'";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {

                City aCity = new City();
                aCity.Id = int.Parse(reader["Id"].ToString());
                aCity.CityName = reader["CityName"].ToString();
                aCity.AboutCity = reader["AboutCity"].ToString();
                aCity.NoOfDwellers = int.Parse(reader["NoOfDwellers"].ToString());
                aCity.Location = reader["Location"].ToString();
                aCity.Weather = reader["Weather"].ToString();
                int id = int.Parse(reader["CountryId"].ToString());
                Country aCountry = GetCountryName(id);
                aCity.ACountry = new Country();
                aCity.ACountry.CountryName = aCountry.CountryName;
                aCity.ACountry.AboutCountry = aCountry.AboutCountry;
                count++;
                aCity.SerialNo = count;
                cityList.Add(aCity);
                found = true;
            }
            reader.Close();
            connection.Close();
            return cityList;
        }
        public Country GetCountryName(int id)
        {

            Country aCountry = new Country();
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM CountryTBL WHERE Id='" + id + "'";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {

                aCountry.CountryName = reader["CountryName"].ToString();
                aCountry.AboutCountry = reader["AboutCountry"].ToString();
            }
            reader.Close();
            connection.Close();
            return aCountry;
        }
        public List<CountryView> ViewCountryInformation()
        {
            int count = 0;
            List<CountryView> countryList = new List<CountryView>();
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM CountryTBL ";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                CountryView countryView = new CountryView();
                countryView.MyCountry = new Country();
                countryView.MyCountry.CountryName = reader["CountryName"].ToString();
                countryView.MyCountry.AboutCountry = reader["AboutCountry"].ToString();
                count++;
                countryView.MyCountry.SerialNo = count;
                int id = int.Parse(reader["Id"].ToString());

                countryView.CityCount = GetNoOfCityAndPeople(id);
                countryView.TotalDwellers = totalDwellers;
                countryList.Add(countryView);

                
            }
            reader.Close();
            connection.Close();
            return countryList;
        }

        private bool found = false;
        public bool IsCountryNameFound()
        {

            return found;
        }
        public List<CountryView> SearchAllCountryInformation(Country aCountry)
        {
            int count = 0;
            List<CountryView> countryList = new List<CountryView>();
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM CountryTBL WHERE CountryName LIKE '"+aCountry.CountryName+"%' ";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                CountryView countryView = new CountryView();
                countryView.MyCountry = new Country();
                countryView.MyCountry.CountryName = reader["CountryName"].ToString();
                countryView.MyCountry.AboutCountry = reader["AboutCountry"].ToString();
                count++;
                countryView.MyCountry.SerialNo = count;
                int id = int.Parse(reader["Id"].ToString());

                countryView.CityCount = GetNoOfCityAndPeople(id);
                countryView.TotalDwellers = totalDwellers;
                countryList.Add(countryView);

              
            }
            reader.Close();
            connection.Close();
            return countryList;
        }
        private int totalDwellers;
        public int GetNoOfCityAndPeople(int id)
        {
            int cityCount = 0;
            totalDwellers = 0;
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM CityTBL WHERE CountryId='" + id + "'";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();

            

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
               cityCount++;
             
               totalDwellers+= int.Parse(reader["NoOfDwellers"].ToString());
     
            }
            
            reader.Close();
            connection.Close();
            return cityCount;
        }
    }
}