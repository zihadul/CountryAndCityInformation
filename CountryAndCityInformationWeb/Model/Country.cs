using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CountryAndCityInformationWeb.Model
{
    public class Country
    {
        public int Id { get;  set; }
        public int SerialNo { get; set; }
        public string CountryName { get; set; }
        public string AboutCountry { get; set; }
        public City ACity { get; set; }
    }
}