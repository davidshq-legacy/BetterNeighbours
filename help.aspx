<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="help.aspx.vb" Inherits="help" title="Better Neighbors - Help - How Do I Use This To Get Or Give Free Stuff?" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-family: Verdana"><strong>Introduction:</strong><br />
        &nbsp; &nbsp;&nbsp; Welcome to Better Neighbors.
        Better Neighbors was designed as a central resource for individuals to help each
        other by sharing their resources as well as taking better care of the environment.
        Through Better Neighbors you can list items you have lying around the house that
        would simply decay with age or be thrown into a landfill, you can also find items
        through Better Neighbors that might be of interest to you as well.<br />
        &nbsp; &nbsp; &nbsp; You'll be surprised how much you as well as others have laying
        around the house. From old computers to those clothes you just can't fit into any
        more - these are things which others can use and appreciate.<br />
        &nbsp; &nbsp; &nbsp;&nbsp; Better Neighbors was designed to be very simple to use.
        Simply find the state you are located in, select a county, select a category of
        items you are interested in, and when you find the appropriate item, click Request
        Item. You and the offerer will be able to see each other's email addresses if the
        offerer accepts your request and you can then arrange a pickup date and time. Once
        you have received or given an item, you can leave feedback on how the transaction
        went so others know whether this individual is easy to work with or not.<br />
        &nbsp; &nbsp; &nbsp;&nbsp; Finally, it is worth noting that Better Neighbors is
        entirely free. You don't have to pay a cent to register, offer, or receive through
        Better Neighbors.<br />
        <center>Further Assistance:</center>
        <table style="width: 601px">
            <tr>
                <td style="width: 100px">
                    <a href="help/finditems.aspx">
                    How Do I Find Items?</a></td>
                <td style="width: 100px">
                    <a href="help/requestitems.aspx">How Do I Request Items?</a></td>
                <td style="width: 100px">
                    <a href="help/getrequesteditem.aspx">When Do I Get an Item I've Requested?</a></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    <a href="help/leavefeedback.aspx">
                    How Do I Leave Feedback?</a></td>
                <td style="width: 100px">
                    <a href="help/additem.aspx">
                    How Do I Offer An Item?</a></td>
                <td style="width: 100px">
                    <a href="help/giveitem.aspx">How Do I Give an Item I've Offered?</a></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/help/safety.aspx">How Can I Be Safe?</asp:HyperLink></td>
                <td style="width: 100px">
                    <a href="help/shippableitems.aspx">
                    What Are Shippable Items?</a></td>
                <td style="width: 100px">
                    <a href="help/rules.aspx">
                    What Are the Rules?</a></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 38px">
                    <a href="help/BetterNeighboursFreecycle.aspx">Is BetterNeighbours Better than Freecycle?</a></td>
                <td style="width: 100px; height: 38px">
                    More Coming Soon...</td>
                <td style="width: 100px; height: 38px">
                    More Coming Soon...</td>
            </tr>
        </table>
    </span>
</asp:Content>

