<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="MyOffered.aspx.vb" Inherits="MyOffered" title="Better Neighbors - My Offered Free Stuff" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-family: Verdana">&nbsp; &nbsp;&nbsp; This is where you can monitor
        and manage your offered items throughout the exchange process. You can accept or
        reject requests for the item as well as see the email address of the requestor whose
        request you accept in order to contact them and work out the details of the exchange.<br />
    </span>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SelectMyOffered" SelectCommandType="StoredProcedure"
    UpdateCommand="UpdateStatus" UpdateCommandType="StoredProcedure">
    <SelectParameters>
    <asp:Parameter Name="varUser" Type="string" />
    </SelectParameters>
    <UpdateParameters>
    <asp:Parameter Name="varStatus" Type="int16" />
    <asp:Parameter Name="varItem" Type="int16" />
    <asp:Parameter Name="varUser" Type="string" />
    <asp:Parameter Name="varOfferer" Type="string" />
    </UpdateParameters>
    </asp:SqlDataSource>
    <center><asp:Label ID="Label2" runat="server" Text="Please Reject the Current Request for This Item Before Removing It." Font-Bold="False" Font-Names="Verdana" ForeColor="#FF8000" Visible="False"></asp:Label></center>
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" DataSourceID="SqlDataSource1"
        ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <EditRowStyle BackColor="#999999" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="Respond">
            <ItemTemplate>
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem Value="0">Select an Option.</asp:ListItem>
                    <asp:ListItem Value="2">Accept.</asp:ListItem>
                    <asp:ListItem Value="3">Reject.</asp:ListItem>
                    <asp:ListItem Value="4">Completed.</asp:ListItem>
                    <asp:ListItem Value="6">Remove.</asp:ListItem>
                </asp:DropDownList>
            </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" SortExpression="ID" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            <asp:BoundField DataField="Requestor" HeaderText="Requestor" SortExpression="Requestor" />
            <asp:TemplateField HeaderText="Contact Info.">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Font-Names="Verdana" Font-Size="0.8em" Text="Email Address Will Appear Here."></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Button ID="Button1" runat="server" Text="Apply Responses." /><br />
    &nbsp;<br />
    <br />
</asp:Content>

