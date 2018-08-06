<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="MyAccount.aspx.vb" Inherits="MyAccount" title="Better Neighbors - My Account for Getting and Giving Free Stuff" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="z-index: 101; left: 3px; width: 223px; position: absolute; top: 115px;
        height: 27px; text-align: left;">
        &nbsp;&nbsp;
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="UserName:" Font-Bold="True"></asp:Label>
        <asp:Label ID="Label2" runat="server"></asp:Label><br />
                <br />
                <strong>My States:</strong>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="441px">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                    SortExpression="ID" />
                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
            </Columns>
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <EditRowStyle BackColor="#999999" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
            <br />
            <strong>My Feedback:<br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Width="443px">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                    SortExpression="ID" />
                <asp:BoundField DataField="Feedback" HeaderText="Feedback" SortExpression="Feedback" />
                <asp:BoundField DataField="PosNeg" HeaderText="Type" SortExpression="PosNeg" />
                <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
                <asp:BoundField DataField="LeftBy" HeaderText="Left By" SortExpression="LeftBy" />
            </Columns>
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <EditRowStyle BackColor="#999999" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView></strong></asp:View></asp:MultiView><br />
        <br />
        <br />
        &nbsp;<br />
        <br />
    </div>
    &nbsp;
    <div style="z-index: 102; left: 552px; width: 100px; position: absolute; top: 43px;
        height: 100px">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT * FROM [States] S RIGHT JOIN UserMemberships UM ON S.ID=UM.MembershipID" InsertCommand="UpdateMemberships" InsertCommandType="StoredProcedure">
            <InsertParameters>
            <asp:Parameter Name="varUserName" Type="string" />
            <asp:Parameter Name="varMembershipID" Type="int16" />
            <asp:Parameter Name="varActiveMember" Type="int16" />
            </InsertParameters>
            </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT * FROM [UserFeedback] WHERE ([UserName] = @UserName)">
        <SelectParameters>
            <asp:ProfileParameter Name="UserName" PropertyName="UserName" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    </div>
    
    <div style="z-index: 103; left: 8px; width: 442px; position: absolute; top: 45px;
        height: 36px">
        &nbsp; &nbsp;&nbsp;<span style="font-family: Verdana"> In this section you can view and edit your user details. This
    section includes your favorite states, as well as your feedback. </span>
    </div>
    
</asp:Content>

