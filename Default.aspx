<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" title="Better Neighbors - For the Exchange of Free Stuff Between Neighbors." %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label2" runat="server" Text="Better Neighbors is your source for offering a helping hand as well as receiving one. The purpose of Better Neighbors is to network people together so that they can share their wealth and need with each other. It is also an attempt to help keep our environment clean, as we share what we have rather than disposing of it into waste fills. If you still have questions please visit the Help! page." Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775"></asp:Label><br />
    <br />
    <!-- google_ad_section_start -->
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT * FROM [States] ORDER BY State ASC" UpdateCommand="UPDATE Counties SET Users=Users+1"></asp:SqlDataSource>
            &nbsp;<br />
            &nbsp;
    <asp:Label ID="Label1" runat="server" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775"
        Text="Please Select a State:"></asp:Label>
    <asp:DropDownList ID="drpdwnlistSelectState" runat="server" DataSourceID="SqlDataSource1"
        DataTextField="State" DataValueField="ID">
    </asp:DropDownList>
            <asp:Button ID="Button2" runat="server" Text="Go" />
            <asp:Button ID="Button3" runat="server" Text="Default." />
            <asp:Label ID="Label3" runat="server" Font-Names="Verdana" Font-Size="0.8em" ForeColor="Red"
                Text="Sorry, you have to be a member to set a default."></asp:Label></asp:View>
        <asp:View ID="View2" runat="server">
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SelectCounties" SelectCommandType="StoredProcedure">
        <SelectParameters>
        <asp:Parameter Name="varID" Type="String" DefaultValue="0" />
        </SelectParameters>
        </asp:SqlDataSource>
    <asp:GridView ID="grdSelectCounties" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Visible="False" Width="519px">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                SortExpression="ID" />
            <asp:BoundField DataField="County" HeaderText="County" SortExpression="County" />
            <asp:BoundField DataField="State1" HeaderText="State" SortExpression="State1" />
        </Columns>
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <EditRowStyle BackColor="#999999" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
        </asp:View>
        <asp:View ID="View3" runat="server">
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT * FROM [Categories] ORDER BY Category ASC"></asp:SqlDataSource>
            &nbsp;
    <center><asp:Button ID="Button4" runat="server" Text="Show All Available Items." /></center>
    <br />
    <br />
    <asp:GridView ID="GridView2" runat="server" CellPadding="4"
        DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Visible="False" DataKeyNames="ID" Width="519px" AutoGenerateColumns="False">
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
            &nbsp;<br />
        </asp:View>
        <asp:View ID="View4" runat="server">
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SelectItems" SelectCommandType="StoredProcedure">
        <SelectParameters>
        <asp:Parameter Name="varCategory" Type="int16" />
        <asp:Parameter Name="varCounty" Type="int16" />
        </SelectParameters>
        </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="ShowAllItems" SelectCommandType="StoredProcedure">
            <SelectParameters>
            <asp:Parameter Name="varCounty" DefaultValue="0" />
            </SelectParameters>
            </asp:SqlDataSource>
            &nbsp;&nbsp;
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" Visible="False" AllowPaging="True" Width="595px">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" SortExpression="ID" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Offerer" HeaderText="Offerer" SortExpression="Offerer" />
            <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
        </Columns>
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <EditRowStyle BackColor="#999999" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EmptyDataTemplate>
            <strong><span style="color: #284775; font-family: Verdana"><center>
                <br />
                <br />
                SORRY<br />
                We apologize, but at this time there are no items listed in this category. Since
                the site is so new, this may be the state for a little while. In the meantime, we
                recommend using the 
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="ShippableItems.aspx">Shippable Items</asp:HyperLink> page which will show you all items available
                across all states where people are willing to ship the items.</center></span></strong>
        </EmptyDataTemplate>
    </asp:GridView>
        </asp:View>
        <asp:View ID="View5" runat="server">
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
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
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4"
        DataSourceID="SqlDataSource5" ForeColor="#333333" GridLines="None" Height="50px"
        Width="524px" Visible="False">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                SortExpression="ID" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="Offerer" HeaderText="Offerer" SortExpression="Offerer" />
            <asp:BoundField DataField="State1" HeaderText="State" SortExpression="State1" />
            <asp:BoundField DataField="County1" HeaderText="County" SortExpression="County1" />
            <asp:BoundField DataField="Category1" HeaderText="Category" SortExpression="Category1" />
            <asp:BoundField DataField="DatePosted" HeaderText="Date Posted" SortExpression="DatePosted" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
        </Fields>
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:DetailsView>
            <div style="z-index: 101; left: 461px; width: 137px; position: absolute; top: 1103px;
                height: 100px">
                <asp:Label ID="Label4" runat="server" Font-Names="Verdana" Font-Size="0.8em" ForeColor="Red"
                    Text="Sorry, but only registered users can request an item. The good news is - registeration is free!"></asp:Label></div>
                <asp:Button ID="Button1" runat="server" Text="Request Item." Width="147px" />&nbsp;
            <br />
        </asp:View>
    </asp:MultiView>
    <!-- google_ad_section_end -->
    <asp:SqlDataSource ID="SqlDataSource6" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" runat="server">
    </asp:SqlDataSource>
    <br />
    &nbsp;<span style="font-size: 0.8em; font-family: Verdana"></span>
    <br />
    <!-- google_ad_section_start -->
    <strong><center>The Place to Find Free Stuff!</center>
        <center>
            &nbsp;</center>
        <center>
            Other David Mackey Sites:<br />
            <a href="http://www.dhq.nu/churchresources/">Church Resources.</a> - <a href="http://www.dhq.nu/christianfilms/">
                Christian &amp; Family Films.</a> - <a href="http://www.dhq.nu/koinegreek/">Koine Greek
                    Open Source Audio.</a> - <a href="http://www.dhq.nu/freewargames/">Free Computer War
                        and Strategy Games.</a> &nbsp;-<br />
            <a href="http://www.dhq.nu/freewargames/"></a><a href="http://www.gamesecretary.com/">
                GameSecretary.Com</a> - <a href="http://www.dhq.nu/hutsell/">W.R. Hutsell's Games.</a>
            - <a href="http://www.dhq.nu/wanderingmind/">Wandering Mind's Quotation Collection.</a>&nbsp;<br />
            - <a href="http://www.civilwarsearch.com/">Civil War Search Directory</a>.<br />
            <span style="font-size: 8pt"><strong>
                <br />
                Copyright 2006 by David Mackey. All Rights Reserved.</strong></span></center>
    </strong><br />
    <!-- google_ad_section_end -->
    &nbsp;
    &nbsp;<br />
    <br />
    <br />
    <br />
</asp:Content>

