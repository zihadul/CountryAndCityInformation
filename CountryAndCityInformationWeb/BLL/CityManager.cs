using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CountryAndCityInformationWeb.DAL;
using CountryAndCityInformationWeb.Model;

namespace CountryAndCityInformationWeb.BLL
{
    public class CityManager
    {
          CityGateway cityGateway = new CityGateway();

          public string SaveCity(City aCity)
          {

              int value = cityGateway.SaveCity(aCity);
              if (value > 0)
              {
                  return "Saved Successful!";
              }
              else
              {
                  return "Faild to save!";
              }
          }

          public List<City> GetAllCityInformation()
          {
              return cityGateway.GetAllCityInformation();
          }
          public bool IsCityNameExists(City aCity) {

              return cityGateway.IsCityNameExists(aCity);
          }
          public List<City> SearchCityInformation(City myCity)
          {
              return cityGateway.SearchCityInformation(myCity);
          }
          public string IsCityNameFound()
          {

              if (cityGateway.IsCityNameFound())
              {

                  return "";
              }
              else { return "Not Found!"; }

          }
    }
}