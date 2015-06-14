using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CountryAndCityInformationWeb.BLL;
using CountryAndCityInformationWeb.Model;

namespace CountryAndCityInformationWeb.UI
{
    public partial class CityEntry : System.Web.UI.Page
    {
        CountryManager countryManager = new CountryManager();
        CityManager cityManager = new CityManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadCountryNameDropDown();
            cityGridView.DataSource = cityManager.GetAllCityInformation();
            cityGridView.DataBind();
        }
        public void LoadCountryNameDropDown()
        {
            if (!IsPostBack)
            {
                countryDropDownList.DataSource = countryManager.GetAllCountry();
                countryDropDownList.DataTextField = "CountryName";
                countryDropDownList.DataValueField = "Id";
                countryDropDownList.DataBind();
            }
               
        }

        protected void citySaveButton_Click(object sender, EventArgs e)
        {
            City aCity = new City();
            aCity.CityName = cityNameTextBox.Text;
            aCity.AboutCity = Request.Form["edit"];
            aCity.NoOfDwellers =int.Parse( cityDwellersTextBox.Text);
            aCity.Location = cityLocationTextBox.Text;
            aCity.Weather = cityWeatherTextBox.Text;
           
            aCity.CountryId = int.Parse(countryDropDownList.SelectedValue);

            if (cityManager.IsCityNameExists(aCity)) {
                cityMagLabel.Text = "City Name Already Exists!";
                return;
            }
            cityMagLabel.Text = cityManager.SaveCity(aCity);

            cityGridView.DataSource = cityManager.GetAllCityInformation();
            cityGridView.DataBind();
            cityNameTextBox.Text = "";
            cityDwellersTextBox.Text = "";
            cityLocationTextBox.Text = "";
            cityWeatherTextBox.Text = "";
        }

        protected void onPaging(object sender, GridViewPageEventArgs e)
        {
            cityGridView.PageIndex = e.NewPageIndex;
            cityGridView.DataBind();
        }

       
    }
}