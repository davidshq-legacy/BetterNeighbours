
Partial Class Admin_Users
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim UserName As String = GridView1.SelectedRow.Cells(2).Text
        If RadioButtonList1.SelectedValue = 0 Then
            Dim p As ProfileCommon = Profile.GetProfile(UserName)
            p.Defaults.ModeratorGroup = DropDownList1.SelectedValue
            p.Save()
        Else
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        GridView1.DataSource = ProfileManager.GetAllProfiles(ProfileAuthenticationOption.Authenticated)
        GridView1.DataBind()
    End Sub
End Class
