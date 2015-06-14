<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CountryEntry.aspx.cs" Inherits="CountryAndCityInformationWeb.UI.CountryEntry" ValidateRequest="false" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="UTF-8">
    <title>Country Entry</title>
  <%--  <link href="reset.css" rel="stylesheet" />--%>
    <link href="../Content/font-awesome.css" rel="stylesheet" />
    <link href="../froala_editor_1.2.7/css/froala_editor.css" rel="stylesheet" />
    <link href="../froala_editor_1.2.7/css/froala_style.css" rel="stylesheet" />
    <link href="Style.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <header>
                <h1>Country Entry</h1>
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
                    <asp:Label ID="Label1" runat="server" Text="Name of the Country"></asp:Label>
                    <asp:TextBox ID="countryNameTextBox" runat="server" Width="177px"></asp:TextBox><br />
                    <br />

                    <section id="editor">
                        <asp:Label ID="Label2" runat="server" Text="About"></asp:Label>
                        <textarea id='edit' runat="server" style="margin-top: 30px;"></textarea>
                    </section>

                    <br />
                    &nbsp;<asp:Button ID="countrySaveButton" runat="server" OnClick="countrySaveButton_Click" Text="Save" Width="69px" Height="32px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
                 <asp:Button ID="cancelButton" runat="server" Text="Cancel" Width="78px" Height="31px" OnClick="cancelButton_Click1" />
                    &nbsp;&nbsp;<br />
                    &nbsp;<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="msgLabel" runat="server" Text=""></asp:Label>
                </div>
                <div class="content2">
                    <div style='overflow-x:auto;overflow-y:auto;width:940px'>
                    <asp:GridView ID="countryGridView" runat="server" AllowPaging="True" PageSize="5" OnPageIndexChanging="onPaging" CellPadding="4" AutoGenerateColumns="False" OnSelectedIndexChanged="countryGridView_SelectedIndexChanged" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" Width="208px" >
                        <Columns>
                            <asp:BoundField DataField="SerialNo" HeaderText="Serial No " SortExpression="SerialNo" />
                            <asp:BoundField DataField="CountryName" HeaderText="Name" SortExpression="CountryName" />
                            <asp:BoundField DataField="AboutCountry" HeaderText="About" SortExpression="AboutCountry" ItemStyle-Wrap="true" HtmlEncode="False" >
                            <ControlStyle BorderStyle="Solid" Width="200px" />
                            <ItemStyle Width="200px" />
                            </asp:BoundField>
                        </Columns>
                        <EditRowStyle Wrap="False" />
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

</body>
</html>
