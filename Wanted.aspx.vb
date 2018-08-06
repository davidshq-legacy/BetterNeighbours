
Partial Class ShippableItems
    Inherits System.Web.UI.Page

    Protected Sub GridView2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView2.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Select Case e.Row.Cells(8).Text
                Case 0
                    e.Row.Cells(8).Text = "Available"
                Case 1
                    e.Row.Cells(8).Text = "Available"
                Case 2
                    e.Row.Cells(8).Text = "Accepted"
                Case 3
                    e.Row.Cells(8).Text = "Rejected"
                Case 4
                    e.Row.Cells(8).Text = "Completed"
                Case 5
                    e.Row.Cells(8).Text = "Released"
            End Select
        End If
    End Sub


    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        MultiView1.ActiveViewIndex = 1
        SqlDataSource2.SelectParameters("varCategory").DefaultValue = GridView1.SelectedRow.Cells(1).Text
        Dim row As GridViewRow
        For Each row In GridView2.Rows
            If row.Cells(3).Text <> "&nbsp;" Then
                Dim varProfile As String = row.Cells(3).Text
                Dim varURL As String = "<a href=profile.aspx?profile=" & varProfile & ">" & varProfile & "</a>"
                row.Cells(3).Text = varURL
            End If
        Next
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            MultiView1.ActiveViewIndex = 0
        End If
    End Sub

    Protected Sub GridView2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView2.SelectedIndexChanged
        MultiView1.ActiveViewIndex = 2
        SqlDataSource3.SelectParameters("varItem").DefaultValue = GridView2.SelectedRow.Cells(1).Text
        Select Case DetailsView1.Rows(8).Cells(1).Text
            Case 0
                DetailsView1.Rows(8).Cells(1).Text = "Available"
            Case 1
                DetailsView1.Rows(8).Cells(1).Text = "Available"
            Case 2
                DetailsView1.Rows(8).Cells(1).Text = "Accepted"
            Case 3
                DetailsView1.Rows(8).Cells(1).Text = "Rejected"
            Case 4
                DetailsView1.Rows(8).Cells(1).Text = "Completed"
            Case 5
                DetailsView1.Rows(8).Cells(1).Text = "Released"
        End Select
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If User.Identity.IsAuthenticated = True Then
            Dim varItem As String = DetailsView1.Rows(0).Cells(1).Text
            SqlDataSource3.UpdateParameters("varItem").DefaultValue = varItem
            SqlDataSource3.UpdateParameters("varStatus").DefaultValue = 1
            SqlDataSource3.UpdateParameters("varUser").DefaultValue = Profile.UserName
            SqlDataSource3.UpdateParameters("varOfferer").DefaultValue = DetailsView1.Rows(3).Cells(1).Text
            SqlDataSource3.Update()
        Else
        End If
    End Sub
End Class
