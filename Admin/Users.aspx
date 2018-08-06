<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Users.aspx.vb" Inherits="Admin_Users" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="Select UserID, UserName, LastActivityDate from aspnet_Users where IsAnonymous='False'" runat="server"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
        CellPadding="4" ForeColor="#333333" GridLines="None" Height="277px" Width="622px">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
        </Columns>
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <EditRowStyle BackColor="#999999" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    SelectCommand="Select * from States" runat="server"></asp:SqlDataSource>
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="State" DataValueField="ID">
    </asp:DropDownList><asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
        <asp:ListItem Selected="True" Value="0">State Level.</asp:ListItem>
        <asp:ListItem Value="1">Global Level.</asp:ListItem>
    </asp:RadioButtonList><asp:Button ID="Button1" runat="server" Text="Submit." /><br />
    <br />
</asp:Content>

