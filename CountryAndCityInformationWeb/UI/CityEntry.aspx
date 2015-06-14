<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CityEntry.aspx.cs" Inherits="CountryAndCityInformationWeb.UI.CityEntry" ValidateRequest="false" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <meta charset="UTF-8">
    <title>Country Entry</title>
    <%--<link href="reset.css" rel="stylesheet" />--%>
    <link href="Style.css" rel="stylesheet" />
    <link href="../Content/font-awesome.css" rel="stylesheet" />
    <link href="../froala_editor_1.2.7/css/froala_editor.css" rel="stylesheet" />
    <link href="../froala_editor_1.2.7/css/froala_style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <header>
                <h1>City Entry</h1>
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
                    <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                    <asp:TextBox ID="cityNameTextBox" runat="server" Width="147px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="About"></asp:Label>
                    <section id="editor">

                        <textarea id='edit' runat="server" style="margin-top: 30px;"></textarea>
                    </section>
                    <br />
                    <br />
                    <asp:Label ID="Label3" runat="server" Text="No. of Dwellers"></asp:Label>
                    <asp:TextBox ID="cityDwellersTextBox" runat="server" Width="86px"></asp:TextBox><br />
                    <br />
                    <asp:Label ID="Label4" runat="server" Text="Location"></asp:Label>
                    <asp:TextBox ID="cityLocationTextBox" runat="server" Height="33px" Width="133px"></asp:TextBox><br />
                    <br />
                    <asp:Label ID="Label5" runat="server" Text="Weather"></asp:Label>
                    <asp:TextBox ID="cityWeatherTextBox" runat="server" Width="135px"></asp:TextBox><br />
                    <br />
                    <asp:Label ID="Label6" runat="server" Text="Country"></asp:Label>
                    <asp:DropDownList ID="countryDropDownList" runat="server" Height="29px" Width="146px" AutoPostBack="false"></asp:DropDownList><br />
                    <br />

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    <asp:Button ID="citySaveButton" runat="server" Text="Save" Height="31px" Width="56px" OnClick="citySaveButton_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="cityCancelButton" runat="server" Text="Cancel" Height="30px" />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="cityMagLabel" runat="server" Text=""></asp:Label>
                </div>
                <div class="content2">
                    <div style='overflow-x: auto; overflow-y: auto; width: 940px'>
                        <asp:GridView ID="cityGridView" runat="server" AllowPaging="True" PageSize="5" OnPageIndexChanging="onPaging" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="SerialNo" HeaderText="Serial No" SortExpression="SerialNo" />
                                <asp:BoundField DataField="CityName" HeaderText="Name" SortExpression="CityName" />
                                <asp:BoundField DataField="NoOfDwellers" HeaderText="No Of Dwellers" SortExpression="NoOfDwellers" />
                                <asp:BoundField DataField="ACountry.CountryName" HeaderText="Country" SortExpression="ACountry.CountryName" />
                            </Columns>
                            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
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
    <script src="../Scripts/jquery-2.1.4.js"></script>
    <script src="../froala_editor_1.2.7/js/froala_editor.min.js"></script>

    <script src="../froala_editor_1.2.7/js/plugins/tables.min.js"></script>
    <script src="../froala_editor_1.2.7/js/plugins/lists.min.js"></script>
    <script src="../froala_editor_1.2.7/js/plugins/colors.min.js"></script>
    <script src="../froala_editor_1.2.7/js/plugins/font_family.min.js"></script>
    <script src="../froala_editor_1.2.7/js/plugins/font_size.min.js"></script>
    <script src="../froala_editor_1.2.7/js/plugins/media_manager.min.js"></script>
    <script src="../froala_editor_1.2.7/js/plugins/block_styles.min.js"></script>

    <script>
        $(function () {
            $('#edit').editable({ inlineMode: false, height: 150, width: 900 })
        });
    </script>

    <script src="../Scripts/jquery.validate.js"></script>
    <script>
        $(document).ready(function () {
            $("#form1").validate({
                rules: {
                    cityNameTextBox: "required",
                    cityDwellersTextBox:{
                        required:true
                    },
                    cityLocationTextBox: {
                        required:true
                    },
                    cityWeatherTextBox: {
                        required: true
                    }


                },
                messages: {
                    cityNameTextBox: "Please enter city name!",
                    cityDwellersTextBox: {
                        required:"Please enter no of dwellers!"
                       
                    },
                    cityLocationTextBox: {
                        required:"Please enter the location!"
                    },
                    cityWeatherTextBox: {
                        required: "Please enter about weather!"
                    }
                }
            });
        });
    </script>
</body>
</html>
