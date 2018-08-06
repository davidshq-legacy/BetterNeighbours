
Partial Class Admin_ApproveItems
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        SqlDataSource1.UpdateCommand = "UPDATE ITEMS set Approved=1 where ID=" & GridView1.SelectedRow.Cells(1).Text
        SqlDataSource1.Update()
    End Sub
End Class
