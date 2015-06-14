<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCountry.aspx.cs" Inherits="CountryAndCityInformationWeb.UI.ViewCountry" %>

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
                <h1>View Country</h1>
            </header>
             <nav>
                <ul>
                    <li><a href="CountryEntry.aspx">Country Entry</a></li>
                    <li><a href="CityEntry.aspx">City Entry</a></li>
                    <li><a href="ViewCities.aspx">View Cities</a></li>
                    <li><a href="ViewCountry.aspx">View Countries</a></li>
                </ul>
            </nav><br /><br />
            <div class="container">
                <div class="content1">
                    <fieldset>
                        <legend><b>Search Criteria</b></legend>
                        <asp:Label ID="Label1" runat="server" Text="Name "></asp:Label>
                        <asp:TextBox ID="viewCountryNameTextBox" runat="server"></asp:TextBox><br />
                        <br />
                        <asp:Button ID="searchButton" runat="server" Text="Search" OnClick="searchButton_Click" Height="38px" Width="70px" />
                    </fieldset>
                    <br />
                    <br />
                    <asp:Label ID="mesLabel" runat="server"></asp:Label>
                </div>
                <div class="content2">
                    <div style='overflow-x:auto;overflow-y:auto;width:940px'>
                    <asp:GridView ID="countryTotalGridView" runat="server" AllowPaging="True" PageSize="5" OnPageIndexChanging="onPaging" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                        <Columns>
                            <asp:BoundField DataField="MyCountry.SerialNo" HeaderText="Serial No" SortExpression="MyCountry.SerialNo" />
                            <asp:BoundField DataField="MyCountry.CountryName" HeaderText="Country" SortExpression="MyCountry.CountryName" />
                            <asp:BoundField DataField="MyCountry.AboutCountry" HeaderText="About" SortExpression="MyCountry.AboutCountry" HtmlEncode="False" >
                            <ControlStyle Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CityCount" HeaderText="No. Of Cities" SortExpression="CityCount" />
                            <asp:BoundField DataField="TotalDwellers" HeaderText="No. Of Dwellers" SortExpression="TotalDwellers" />
                        </Columns>
                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" Wrap="True" />
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
