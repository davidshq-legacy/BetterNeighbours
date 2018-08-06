<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="rules.aspx.vb" Inherits="help_rules" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-family: Verdana"></span>
    <ul>
        <li><span style="font-family: Verdana">All users must be over the age of eighteen.</span></li>
        <li><span style="font-family: Verdana">Any user under the age of eighteen must have
            explicit parental permission and oversight throughout all stages of the exchange
            and usage of this site.</span></li>
        <li><span style="font-family: Verdana">All materials posted on this site must be appropriate
            for any ages consumption.</span></li>
        <li><span style="font-family: Verdana">New items do not appear in real-time, they are
            approved (or refused) by a moderator, please be patient.</span></li>
        <li><span style="font-family: Verdana">All users should take all possible
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/help/safety.aspx">safety precaution steps.</asp:HyperLink></span></li>
        <li><span style="font-family: Verdana">No item may be sold, all items must be given
            at no charge.</span></li>
        <li><span style="font-family: Verdana">The requestor must pick up the item at their
            own time and expense.</span></li>
        <li><span style="font-family: Verdana">If the item is shippable, the offerer may charge
            a nominal fee to cover shipping and handling.</span></li>
    </ul>
    <span style="font-family: Verdana"></span>
</asp:Content>

