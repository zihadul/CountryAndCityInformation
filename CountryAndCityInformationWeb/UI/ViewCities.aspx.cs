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
    public partial class ViewCities : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadCountryNameDropDown();
            viewCitiesGridView.DataSource = cityManager.GetAllCityInformation();
            viewCitiesGridView.DataBind();
        }
        CityManager cityManager = new CityManager();
        CountryManager countryManager = new CountryManager();
        public void LoadCountryNameDropDown()
        {
            if (!IsPostBack)
            {
                viewCountryDropDownList.DataSource = countryManager.GetAllCountry();
                viewCountryDropDownList.DataTextField = "CountryName";
                viewCountryDropDownList.DataValueField = "Id";
                viewCountryDropDownList.DataBind();
            }
        }

        protected void viewCitiesSearchButton_Click(object sender, EventArgs e)
        {
            if (cityRadioButton.Checked) {
                City aCity = new City();
                aCity.CityName = viewCityNameTextBox.Text;
                viewCitiesGridView.DataSource = cityManager.SearchCityInformation(aCity);
                viewCitiesGridView.DataBind();
                megLabel.Text = cityManager.IsCityNameFound();
            }
            if (countryRadioButton.Checked) {
                Country aCountry = new Country();
                aCountry.Id = int.Parse(viewCountryDropDownList.SelectedItem.Value);
                viewCitiesGridView.DataSource = countryManager.SearchCountryInformation(aCountry);
                viewCitiesGridView.DataBind();
                megLabel.Text = countryManager.IsCountryNameFound();
            }
        }

        protected void onPaging(object sender, GridViewPageEventArgs e)
        {
            viewCitiesGridView.PageIndex = e.NewPageIndex;
            viewCitiesGridView.DataBind();
        }
    }
}