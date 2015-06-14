<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCities.aspx.cs" Inherits="CountryAndCityInformationWeb.UI.ViewCities" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <meta charset="UTF-8">
    <title>Country Entry</title>
    <%--<link href="reset.css" rel="stylesheet" />--%>
    <link href="Style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <header>
                <h1>View Cities!</h1>
            </header>
            <nav>
                <ul>
                    <li><a href="CountryEntry.aspx">Country Entry</a></li>
                    <li><a href="CityEntry.aspx">City Entry</a></li>
                    <li><a href="ViewCities.aspx">View Cities</a></li>
                    <li><a href="ViewCountry.aspx">View Countries</a></li>
                </ul>
            </nav>
            <br />
            <br />
            <div class="container">

                <div class="content1">
                    <fieldset>
                        <legend><b>Search Criteria</b></legend>
                        <asp:RadioButton ID="cityRadioButton" runat="server" Text="City Name: " GroupName="Search" />
                        <asp:TextBox ID="viewCityNameTextBox" runat="server"></asp:TextBox><br />
                        <br />
                        <asp:RadioButton ID="countryRadioButton" runat="server" Text="Country: " GroupName="Search" />
                        <asp:DropDownList ID="viewCountryDropDownList" runat="server" Height="22px" Width="154px"></asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="viewCitiesSearchButton" runat="server" Text="Search" Height="33px" OnClick="viewCitiesSearchButton_Click" Width="72px" />
                        <br />
                        <br />
                    </fieldset><br />
                    <br />
&nbsp;<asp:Label ID="megLabel" runat="server"></asp:Label>
                </div>

                <div class="content2">
                    <div style='overflow-x: auto; overflow-y: auto; width: 940px'>
                        <asp:GridView ID="viewCitiesGridView" runat="server" AllowPaging="True" PageSize="5" OnPageIndexChanging="onPaging" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                            <Columns>
                                <asp:BoundField DataField="SerialNo" HeaderText="Serial No" SortExpression="SerialNo" />
                                <asp:BoundField DataField="CityName" HeaderText="City Name" SortExpression="CityName" />
                                <asp:BoundField DataField="AboutCity" HeaderText="About" SortExpression="AboutCity" HtmlEncode="False" />
                                <asp:BoundField DataField="NoOfDwellers" HeaderText="No. Of Dwellers" SortExpression="NoOfDwellers" />
                                <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                                <asp:BoundField DataField="Weather" HeaderText="Weather" SortExpression="Weather" />
                                <asp:BoundField DataField="ACountry.CountryName" HeaderText="Country" SortExpression="ACountry.CountryName" />
                                <asp:BoundField DataField="ACountry.AboutCountry" HeaderText="About Country" SortExpression="ACountry.AboutCountry" HtmlEncode="False" />
                            </Columns>
                            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                            <PagerStyle ForeColor="#330099" HorizontalAlign="Center" BackColor="#FFFFCC" />
                            <RowStyle BackColor="White" ForeColor="#330099" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                            <SortedAscendingCellStyle BackColor="#FEFCEB" />
                            <SortedAscendingHeaderStyle BackColor="#AF0101" />
                            <SortedDescendingCellStyle BackColor="#F6F0C0" />
                            <SortedDescendingHeaderStyle BackColor="#7E0000" />
                        </asp:GridView>
                    </div>
                </div>
            </div>

            <footer>
                <p><a href="Home.aspx">Back To The Menu</a></p>
            </footer>
        </div>


    </form>
</body>
</html>
