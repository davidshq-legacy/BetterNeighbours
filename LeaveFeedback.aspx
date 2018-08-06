<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="LeaveFeedback.aspx.vb" Inherits="LeaveFeedback" title="Better Neighbors - Leave Feedback About Your Free Stuff Exchange" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-family: Verdana; font-size: 10pt; color=#284775">&nbsp; &nbsp;&nbsp; In this section you can leave
        feedback for other users whom you have either given or received items. This way
        we can build a safe and accountable community where those who are trustworthy are
        known, as well as those who are difficult or downright dangerous.</span><br />
    <br />
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SelectLeaveFeedback" SelectCommandType="StoredProcedure" InsertCommand="LeaveFeedback" InsertCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter Name="varUser" Type="String" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="varUser" Type="String" />
            <asp:Parameter Name="varID" Type="Int16" />
            <asp:Parameter Name="varFeedback" Type="String" />
            <asp:Parameter Name="varFeedbackLeftFor" Type="String" />
            <asp:Parameter Name="varPositiveOrNegative" Type="Int16" />
            <asp:Parameter Name="varOfferer" />
            <asp:Parameter Name="varIsRCom" />
            <asp:Parameter Name="varIsOCom" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" DataSourceID="SqlDataSource1"
        ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Width="477px">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <EditRowStyle BackColor="#999999" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" SortExpression="ID" />
            <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
            <asp:BoundField DataField="Offerer" HeaderText="Offerer" SortExpression="Offerer" />
            <asp:BoundField DataField="Requestor" HeaderText="Requestor" SortExpression="Requestor" />
        </Columns>
    </asp:GridView>
        </asp:View>
        <asp:View ID="View2" runat="server">
            &nbsp;<asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Width="438px"></asp:TextBox>&nbsp;
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Value="1">Positive Experience!</asp:ListItem>
                <asp:ListItem Value="0">Negative Experience!</asp:ListItem>
            </asp:RadioButtonList>
            <asp:Button ID="Button1" runat="server" Text="Submit Feedback." />&nbsp;
        </asp:View>
    </asp:MultiView>
</asp:Content>

