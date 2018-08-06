<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="register.aspx.vb" Inherits="register" title="Better Neighbors - Register for a Free Account for Free Stuff." %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-family: Verdana">&nbsp; &nbsp;&nbsp; You are more than welcome to
        browse around the site, but you won't be able to participate in many of the site's
        functions until you are registered. But don't worry. Registeration is <strong>free</strong>.
        So why do we have you register? Its basically so that you as an individual person
        are tied to a specific user name. This is useful because it allows you as well as
        others to form a repertoire on Better Neighbors. This reputation can be good and
        bad and will help others to determine whether they want to interact with you. Its
        basically a form of accountability and a method of ensuring safety for our users.
        So take two minutes to register and you will be fully on your way to giving and
        receiving great items.<br />
        <strong>&nbsp; &nbsp; &nbsp; Please do not register until you are 18 or older or have
            explicit parental permission.<br />
        </strong></span><br />
    <center>
    <asp:Label ID="Label1" runat="server" Font-Names="Verdana" Text="Please login using your new username and password at the top of this page." Font-Bold="True"></asp:Label><br />
    
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" BackColor="#F7F6F3"
        BorderColor="#E6E2D8" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana"
        Font-Size="0.8em" >
        <WizardSteps>
            <asp:CreateUserWizardStep runat="server">
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep runat="server">
            </asp:CompleteWizardStep>
        </WizardSteps>
        <SideBarStyle BackColor="#5D7B9D" BorderWidth="0px" Font-Size="0.9em" VerticalAlign="Top" />
        <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" />
        <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid"
            BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
        <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" Font-Size="0.9em"
            ForeColor="White" HorizontalAlign="Center" />
        <CreateUserButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid"
            BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
        <ContinueButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid"
            BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
        <StepStyle BorderWidth="0px" />
    </asp:CreateUserWizard>
    </center>
</asp:Content>

