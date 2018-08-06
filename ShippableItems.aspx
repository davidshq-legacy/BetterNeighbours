<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ShippableItems.aspx.vb" Inherits="ShippableItems" title="Better Neighbours - Shippable Items - Free Stuff Shipped By Mail." %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="Select * From Categories ORDER by Category ASC" SelectCommandType="Text">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="ShowShippable" SelectCommandType="StoredProcedure">
    <SelectParameters>
    <asp:Parameter Name="varCategory" Type="int16" DefaultValue="1" />
    </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="ShowItem" SelectCommandType="StoredProcedure" UpdateCommand="UpdateStatus" UpdateCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter Name="varItem" Type="int16" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="varItem" Type="int16" />
        <asp:Parameter Name="varStatus" Type="int16" />
        <asp:Parameter Name="varUser" Type="string" />
        <asp:Parameter Name="varOfferer" Type="string" />
    </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <span style="font-family: Verdana">&nbsp; &nbsp;&nbsp; <span style="font-size: 10pt; color=#284775">
        Some people don't mind shipping
        items that they are offering so that those who don't live locally can have them.
        Select any category to see the items that are available to be shipped across the
        nation. Please remember that the offerer may charge a nominal fee to cover shipping
        and handling costs, but that there still must be no cost for the item itself.</span>&nbsp;<br />
    </span>
    <br />
    <center>
    <span style="font-family: Verdana">
        <asp:Button ID="Button2" runat="server" Text="To See All Items Click Here." /><br />
        <br />
    </span></center>
    <!-- google_ad_section_start -->
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" DataSourceID="SqlDataSource1"
        ForeColor="#333333" GridLines="None" Width="537px" AutoGenerateColumns="False">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" SortExpression="ID" />
            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
        </Columns>
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <EditRowStyle BackColor="#999999" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
        </asp:View>
        <asp:View ID="View2" runat="server">
    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True"
        CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" EmptyDataText="Sorry, No Items in This Category Are Currently Available.">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" SortExpression="ID" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Offerer" HeaderText="Offerer" SortExpression="Offerer" />
            <asp:BoundField DataField="State1" HeaderText="State" SortExpression="State1" />
            <asp:BoundField DataField="County1" HeaderText="County" SortExpression="County1" />
            <asp:BoundField DataField="Category1" HeaderText="Category" SortExpression="Category1" />
            <asp:BoundField DataField="DatePosted" HeaderText="Date Posted" SortExpression="DatePosted" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
        </Columns>
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <EditRowStyle BackColor="#999999" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EmptyDataRowStyle Font-Names="Verdana" HorizontalAlign="Center" />
    </asp:GridView>
        </asp:View>
        <asp:View ID="View3" runat="server">
            &nbsp;<asp:DetailsView ID="DetailsView1" runat="server" CellPadding="4" DataSourceID="SqlDataSource3"
                ForeColor="#333333" GridLines="None" Height="50px" Width="535px" AutoGenerateRows="False">
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <EditRowStyle BackColor="#999999" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Fields>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" SortExpression="ID" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="Offerer" HeaderText="Offerer" SortExpression="Offerer" />
                    <asp:BoundField DataField="State1" HeaderText="State" SortExpression="State1" />
                    <asp:BoundField DataField="County1" HeaderText="County" SortExpression="County1" />
                    <asp:BoundField DataField="Category1" HeaderText="Category" SortExpression="Category1" />
                    <asp:BoundField DataField="DatePosted" HeaderText="DatePosted" SortExpression="DatePosted" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
                </Fields>
            </asp:DetailsView>
            <div style="z-index: 101; left: 493px; width: 100px; position: absolute; top: 817px;
                height: 100px">
                <asp:Label ID="Label1" runat="server" ForeColor="#C00000" Text="Sorry, you must be logged in to request an item. The good news is, registeration is free!"
                    Visible="False"></asp:Label></div>
            <asp:Button ID="Button1" runat="server" Text="Request Item." />
        </asp:View>
    </asp:MultiView><br />
    <strong><center>The Place to Find Free Stuff!</center></strong><br />
    <!-- google_ad_section_end -->
    &nbsp;
    <br />
    <br />
</asp:Content>

