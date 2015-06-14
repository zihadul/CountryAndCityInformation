using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using CountryAndCityInformationWeb.Model;


namespace CountryAndCityInformationWeb.DAL
{
    public class CityGateway
    {
        string connectionString = ConfigurationManager.ConnectionStrings["connectionDb"].ConnectionString;

        public int SaveCity(City aCity)
        {

            SqlConnection connection = new SqlConnection(connectionString);
            string query = "INSERT INTO CityTBL VALUES('" + aCity.CityName + "','" + aCity.AboutCity + "','"+aCity.NoOfDwellers+"','"+aCity.Location+"','"+aCity.Weather+"','"+aCity.CountryId+"')";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            int rowAffected = command.ExecuteNonQuery();
            connection.Close();
            return rowAffected;
        }
        
        public List<City> GetAllCityInformation()
        {
            int count = 0;
            List<City> cityList = new List<City>();

            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM CityTBL";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                
                City aCity = new City();
               aCity.Id=int.Parse(reader["Id"].ToString());
               aCity.CityName = reader["CityName"].ToString();
               aCity.AboutCity =reader["AboutCity"].ToString();
               aCity.NoOfDwellers =int.Parse( reader["NoOfDwellers"].ToString());
               aCity.Location = reader["Location"].ToString();
               aCity.Weather = reader["Weather"].ToString();
                int id=int.Parse(reader["CountryId"].ToString());
                Country aCountry = GetCountryName(id);
                aCity.ACountry = new Country();
                aCity.ACountry.CountryName = aCountry.CountryName;
                aCity.ACountry.AboutCountry = aCountry.AboutCountry;
               count++;
               aCity.SerialNo = count;
               cityList.Add(aCity);
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
               
                 aCountry.CountryName= reader["CountryName"].ToString();
                 aCountry.AboutCountry = reader["AboutCountry"].ToString();
            }
            reader.Close();
            connection.Close();
            return aCountry;
        }

        public bool IsCityNameExists(City aCity)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM CityTBL WHERE CityName='" + aCity.CityName + "'";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();

            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                reader.Close();
                connection.Close();
                return true;
            }
            else
            {
                reader.Close();
                connection.Close();
                return false;
            }

        }
        private bool found = false;
        public bool IsCityNameFound()
        {

            return found;
        }

        public List<City> SearchCityInformation(City myCity)
        {
            int count = 0;
            List<City> cityList = new List<City>();
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM CityTBL WHERE CityName LIKE '"+myCity.CityName+"%'";
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
    }
}