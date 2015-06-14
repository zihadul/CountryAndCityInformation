using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CountryAndCityInformationWeb.Model
{
    public class City
    {
        public int Id { get; set; }
        public int SerialNo { get; set; }
        public string CityName { get; set; }
        public string AboutCity { get; set; }
        public int NoOfDwellers { get; set; }
        public string Location { get; set; }
        public string Weather { get; set; }
        public int CountryId { get; set; }
        public Country ACountry { get; set; }
    }
}