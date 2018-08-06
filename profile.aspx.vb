
Partial Class profile
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim varprofileName As String = Request.QueryString("profile")
        SqlDataSource1.SelectCommand = "Select * from UserFeedback where UserName='" & varprofileName & "'"
    End Sub
End Class
