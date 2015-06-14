using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CountryAndCityInformationWeb.DAL;
using CountryAndCityInformationWeb.Model;

namespace CountryAndCityInformationWeb.BLL
{
    public class CountryManager
    {
        CountryGateway countryGateway = new CountryGateway();

        public string SaveCountry(Country aCountry) {

            int value = countryGateway.SaveCountry(aCountry);
            if (value > 0)
            {
                return "Saved Successful!";
            }
            else {
                return "Faild to save!";
            }
        }
        public List<Country> GetAllCountry()
        {
            return countryGateway.GetAllCountry();
        }
        public bool IsCountryNameExists(Country aCountry) {

            return countryGateway.IsCountryNameExists(aCountry);
           
        }
        public List<City> SearchCountryInformation(Country aCountry) {

            return countryGateway.SearchCountryInformation(aCountry);
        }
        public List<CountryView> GetNoOfCityAndPeople()
        {
            return countryGateway.ViewCountryInformation();
        }
        public List<CountryView> SearchAllCountryInformation(Country aCountry) {

            return countryGateway.SearchAllCountryInformation(aCountry);
        }

        public string IsCountryNameFound()
        {

            if (countryGateway.IsCountryNameFound())
            {

                return "";
            }
            else { return "Not Found!"; }

        }
    }
}