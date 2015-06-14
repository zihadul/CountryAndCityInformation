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
    public partial class CountryEntry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            countryGridView.GridLines = GridLines.Both;
            countryGridView.DataSource = countryManager.GetAllCountry();
            countryGridView.DataBind();
            
        }

        CountryManager countryManager = new CountryManager();

       

        protected void cancelButton_Click1(object sender, EventArgs e)
        {
            countryNameTextBox.Text = "";
          
        }

        protected void countryGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
           countryGridView.GridLines = GridLines.Both;
        }

        protected void countrySaveButton_Click(object sender, EventArgs e)
        {
            Country aCountry = new Country();
            aCountry.CountryName = countryNameTextBox.Text;
            aCountry.AboutCountry = Request.Form["edit"];
            if (aCountry.CountryName == "" || aCountry.AboutCountry == "")
            {
                msgLabel.Text = "Please fill the blank field!";
                return;
            }
            if (countryManager.IsCountryNameExists(aCountry))
            {
                msgLabel.Text = "Country Name Already Exists!";
                return;
            }
            msgLabel.Text = countryManager.SaveCountry(aCountry);

            countryGridView.DataSource = countryManager.GetAllCountry();
            countryGridView.DataBind();
            countryNameTextBox.Text = "";
            
        }

        protected void onPaging(object sender, GridViewPageEventArgs e)
        {
            countryGridView.PageIndex = e.NewPageIndex;
            countryGridView.DataBind();
        }

       

       

        

       
    }
}