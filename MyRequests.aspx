<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="MyRequests.aspx.vb" Inherits="MyRequests" title="Better Neighbors - My Requests for Free Stuff" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-family: Verdana">&nbsp; &nbsp;&nbsp; Here is where you can follow
        the progress of the items you have requested. You have the option to Release the
        item if you no longer need it as well as the ability to see whether the offerer
        has accepted your request. Finally, you can see the email address of the offerer
        if they accept your request so that you can contact them and establish the details
        of your exchange.</span><br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SelectMyRequests" SelectCommandType="StoredProcedure" UpdateCommand="UpdateStatus" UpdateCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter Name="varUserName" Type="String" />
        </SelectParameters>
        <UpdateParameters>
        <asp:Parameter Name="varItem" Type="int16" />
        <asp:Parameter Name="varStatus" Type="int16" />
        <asp:Parameter Name="varOfferer" Type="string" />
        <asp:Parameter Name="varUser" Type="string" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Response">
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem Selected="True" Value="0">Select an Option.</asp:ListItem>
                        <asp:ListItem Value="5">Release.</asp:ListItem>
                        <asp:ListItem Value="4">Completed.</asp:ListItem>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                SortExpression="ID" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Offerer" HeaderText="Offerer" SortExpression="Offerer" />
            <asp:BoundField DataField="DatePosted" HeaderText="DatePosted" SortExpression="DatePosted" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            <asp:TemplateField HeaderText="Contact Info.">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Font-Names="Verdana" Font-Size="0.8em" Text="Email Address Will Appear Here."></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <EditRowStyle BackColor="#999999" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    <asp:Button ID="Button1" runat="server" Text="Apply Responses." /><br />
</asp:Content>

