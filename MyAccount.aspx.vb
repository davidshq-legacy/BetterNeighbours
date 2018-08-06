
Partial Class MyAccount
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Label2.Text = Profile.UserName
        If User.Identity.IsAuthenticated = False Then
            MultiView1.Visible = False
        End If
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub GridView2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView2.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            If e.Row.Cells(2).Text = "1" Then
                e.Row.Cells(2).Text = "Positive"
            Else
                e.Row.Cells(2).Text = "Negative"
            End If
        End If
    End Sub
End Class
