<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CountryAndCityInformationWeb.UI.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="reset.css" rel="stylesheet" />
    <link href="Style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="wrapper">
           <div class="home">
               <ul>
                   <li><a href="CountryEntry.aspx"><img src="../image/world-map.png" height="100" width="200"  /> Country Entry</a></li>
                   <li><a href="CityEntry.aspx"><img src="../image/city_middle.png" height="100" width="200" />City Entry</a></li>
                   <li><a href="ViewCities.aspx"><img src="../image/images (1).jpg" height="100" width="200"/> View Cities</a></li>
                   <li><a href="ViewCountry.aspx"><img src="../image/images.jpg" height="100" width="200" /> view Countries</a></li>
               </ul>
           </div>
        <br />
    
    </div>
    </form>
</body>
</html>
