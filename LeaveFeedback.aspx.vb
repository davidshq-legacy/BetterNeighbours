
Partial Class LeaveFeedback
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        SqlDataSource1.SelectParameters("varUser").DefaultValue = Profile.UserName
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        MultiView1.ActiveViewIndex = 1
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim varUser As String = Profile.UserName
        Dim varID As Integer = GridView1.SelectedRow.Cells(2).Text
        Dim varFeedback As String = TextBox1.Text
        Dim varPositiveOrNegative As Integer = RadioButtonList1.SelectedValue
        Dim varFeedbackLeftFor As String
        If GridView1.SelectedRow.Cells(3).Text = varUser Then
            varFeedbackLeftFor = GridView1.SelectedRow.Cells(4).Text
        Else
            varFeedbackLeftFor = GridView1.SelectedRow.Cells(3).Text
        End If
        SqlDataSource1.InsertParameters("varUser").DefaultValue = varUser
        SqlDataSource1.InsertParameters("varID").DefaultValue = varID
        SqlDataSource1.InsertParameters("varFeedback").DefaultValue = varFeedback
        SqlDataSource1.InsertParameters("varFeedbackLeftFor").DefaultValue = varFeedbackLeftFor
        SqlDataSource1.InsertParameters("varPositiveOrNegative").DefaultValue = varPositiveOrNegative
        SqlDataSource1.Insert()
    End Sub
End Class
