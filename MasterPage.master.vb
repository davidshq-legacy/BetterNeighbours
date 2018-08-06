
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Profile.IsAnonymous = False Then
            If Profile.LastPack = 0 Or (Profile.LastPack <> Date.Now.Month) Then
                Profile.LastPack = Date.Now.Month
                Profile.PackRats = Profile.PackRats + 2
            End If
        End If
        If Profile.IsAnonymous = False Then
            Label1.Text = "Packrats Available: " & Profile.PackRats
        End If
    End Sub
End Class

