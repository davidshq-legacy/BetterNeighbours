<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="profile.aspx.vb" Inherits="profile" title="Better Neighbors - Friend's Profile - Another Person Who Likes Giving and Getting Free Stuff." %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %> "
    SelectCommand="Select * from UserFeedback" SelectCommandType="Text" >
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" DataSourceID="SqlDataSource1"
        ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" EmptyDataText="Sorry, this person has no feedback yet." Font-Names="Verdana" Font-Size="Small">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <EditRowStyle BackColor="#999999" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                SortExpression="ID" />
            <asp:BoundField DataField="Feedback" HeaderText="Feedback:" SortExpression="Feedback" />
            <asp:BoundField DataField="PosNeg" HeaderText="Positive or Negative:" SortExpression="PosNeg" />
            <asp:BoundField DataField="Item" HeaderText="Regarding Item:" SortExpression="Item" />
            <asp:BoundField DataField="LeftBy" HeaderText="Feedback Left By:" SortExpression="LeftBy" />
        </Columns>
    </asp:GridView>
</asp:Content>

