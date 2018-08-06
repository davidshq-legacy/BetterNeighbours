<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AddItem.aspx.vb" Inherits="AddItem" title="Better Neighbors - Add An Item and Give Away Something for Free." %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-family: Verdana">&nbsp; &nbsp;&nbsp; Here you can add an item to the
        items available in the Better Neighbours Database. Please remember that items are
        not added instantly, rather they must be approved by a moderator before they appear.
        Don't worry though, this should happen within twenty-four hours unless you want
        to submit something with an illegal or adult-oriented nature.</span><br />
    <br />
    <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" BackColor="#F7F6F3" BorderColor="#CCCCCC"
        BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em"
        Width="399px">
        <StepStyle BorderWidth="0px" ForeColor="#5D7B9D" />
        <SideBarStyle BackColor="#7C6F57" BorderWidth="0px" Font-Size="0.9em" VerticalAlign="Top" />
        <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid"
            BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
        <WizardSteps>
            <asp:WizardStep runat="server" Title="Step 1">
                Select a State:<br />
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
                    DataTextField="State" DataValueField="ID" AutoPostBack="True">
                </asp:DropDownList>
                <asp:Button ID="Button4" runat="server" Text="Set Default." Width="75px" />
                <br />
                Select a County:<br />
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2"
                    DataTextField="County" DataValueField="ID">
                </asp:DropDownList>
                <asp:Button ID="Button1" runat="server" Text="Set Default." Width="74px" />
                <br />
                Enter Your Zip Code:<br />
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                &nbsp;
                <asp:Button ID="Button3" runat="server" Text="Set Default." Width="74px" />
                <br />
                Select a Category:<br />
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3"
                    DataTextField="Category" DataValueField="ID">
                </asp:DropDownList>
                <asp:Button ID="Button5" runat="server" Text="Set Default." Width="75px" />
                <br />
                Willing to Ship:<br />
                <asp:CheckBox ID="CheckBox1" runat="server" Text="Yes." />
                <br />
                Wanted:<br />
                <asp:CheckBox ID="CheckBox2" runat="server" Text="Yes." />
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Step 2">
                Select a Title for your Item:<br />
                <asp:TextBox ID="TextBox1" runat="server" Width="340px"></asp:TextBox>
                <br />
                Enter a Description of your Item:<br />
                <asp:TextBox ID="TextBox2" runat="server" Rows="4" TextMode="MultiLine" Width="339px"></asp:TextBox>
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Finished.">
                Thanks for adding an item. Click finish to complete the submission process and return
                to the main page.</asp:WizardStep>
        </WizardSteps>
        <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" Font-Size="0.9em"
            ForeColor="White" HorizontalAlign="Left" />
    </asp:Wizard>
    <div style="z-index: 101; left: 407px; width: 181px; position: absolute; top: 164px;
        height: 100px">
        <asp:Label ID="Label1" runat="server" Font-Names="Verdana" Font-Size="0.8em" Text="Sorry, you must be registered to list items. However, the good news is - registration is free!" ForeColor="Red" Width="186px"></asp:Label></div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT * FROM [States]" InsertCommand="AddItem" InsertCommandType="StoredProcedure">
       <InsertParameters>
            <asp:Parameter Name="varState" Type="int16" />
            <asp:Parameter Name="varCounty" Type="int16" />
            <asp:Parameter Name="varCategory" Type="int16" />
            <asp:Parameter Name="varTitle" Type="string" />
            <asp:Parameter Name="varDescription" Type="string" />
            <asp:Parameter Name="varOfferer" Type="string" />
            <asp:Parameter Name="varShip" Type="int16" />
            <asp:Parameter Name="varZip" Type="int32" />
            <asp:Parameter Name="varWanted" Type="int16" />
        </InsertParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT * FROM [Counties] where State=@varState ORDER BY County ASC">
        <SelectParameters>
        <asp:Parameter Name="varState" DefaultValue="1" />
        </SelectParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT * FROM [Categories] ORDER BY Category ASC"></asp:SqlDataSource>
    <br />
    <!-- google_ad_section_start -->
    <strong><center>The Place to Find Free Stuff.</center></strong>
    <!-- google_ad_section_end -->
</asp:Content>

