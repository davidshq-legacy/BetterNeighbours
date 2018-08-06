Imports System.Net.Mail
Partial Class ShippableItems
    Inherits System.Web.UI.Page

    Protected Sub GridView2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView2.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Select Case e.Row.Cells(8).Text
                Case 0
                    e.Row.Cells(8).Text = "Available"
                Case 1
                    e.Row.Cells(8).Text = "Requested"
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
        If ViewState("showall") = 1 Then
            SqlDataSource2.SelectCommand = "ShowAllShippable"
        End If
    End Sub

    Protected Sub GridView2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView2.SelectedIndexChanged
        MultiView1.ActiveViewIndex = 2
        SqlDataSource3.SelectParameters("varItem").DefaultValue = GridView2.SelectedRow.Cells(1).Text
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If User.Identity.IsAuthenticated = True Then
            If Profile.PackRats > 0 Then
                If Profile.UserName <> DetailsView1.Rows(3).Cells(1).Text Then
                    Dim varItem As String = DetailsView1.Rows(0).Cells(1).Text
                    SqlDataSource3.UpdateParameters("varItem").DefaultValue = varItem
                    SqlDataSource3.UpdateParameters("varStatus").DefaultValue = 1
                    SqlDataSource3.UpdateParameters("varUser").DefaultValue = Profile.UserName
                    SqlDataSource3.UpdateParameters("varOfferer").DefaultValue = DetailsView1.Rows(3).Cells(1).Text
                    SqlDataSource3.Update()
                    ' Send an email to the requestor.
                    Dim ToAddress As String = Membership.GetUser(Profile.UserName).Email
                    Dim mailClient As New SmtpClient
                    Dim Message As New MailMessage
                    Dim fromAddress As New MailAddress("dmackey@betterneighbours.com")
                    Message.From = fromAddress
                    Message.To.Add(ToAddress)
                    Message.Subject = "BetterNeighbours.Com Item Request Successful - " & DetailsView1.Rows(1).Cells(1).Text & " " & Date.Today
                    Message.Body = "Dear " & Profile.UserName & "," & vbCrLf & _
                    "	Congratulations. You have successfully requested " & DetailsView1.Rows(1).Cells(1).Text & _
                    ". The next step is a hard one - waiting. The offerer of the item will review your request and" & _
                    "either accept or reject it. If they reject it, you will not receive the item. If they accept it " & _
                    "you can log into your account and click on 'My Requests' to see their email address. Use their email " & _
                    "address to set up the details of the exchange." & vbCrLf & _
                    "   Thanks for participating in the BetterNeighbours community." & vbCrLf & _
                    "Respectfully," & vbCrLf & _
                    "David Mackey"
                    mailClient.Send(Message)
                    ' Send an email to the offerer.
                    Dim RToAddress As String = Membership.GetUser(DetailsView1.Rows(3).Cells(1).Text).Email
                    Dim RmailClient As New SmtpClient
                    Dim RMessage As New MailMessage
                    Dim RfromAddress As New MailAddress("dmackey@betterneighbours.com")
                    RMessage.From = RfromAddress
                    RMessage.To.Add(RToAddress)
                    RMessage.Subject = "BetterNeighbours.Com Item Requested - " & DetailsView1.Rows(1).Cells(1).Text & " " & Date.Today
                    RMessage.Body = "Dear " & DetailsView1.Rows(3).Cells(1).Text & "," & vbCrLf & _
                    "   Congratulations. One of the items you listed on BetterNeighbours.Com has been requested." & _
                    "This means that someone wants the " & DetailsView1.Rows(1).Cells(1).Text & " you offered." & vbCrLf & _
                    "   Please log onto your account at BetterNeighbours.Com and click 'My Offers.' You will have " & _
                    "the choice to accept their request or reject it. If you accept their request you will be able to " & _
                    "see their email address and can contact them to set up the details of the exchange." & vbCrLf & _
                    "   Thanks for participating in the BetterNeighbours community." & vbCrLf & _
                    "Respectfully," & vbCrLf & _
                    "David Mackey"
                    mailClient.Send(RMessage)
                    Profile.PackRats = Profile.PackRats - 1
                Else
                    Label1.Text = "Sorry, but you cannot request an item that you posted."
                    Label1.Visible = True
                End If
            Else
                Label1.Visible = True
            End If
        End If
    End Sub

    Protected Sub DetailsView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DetailsView1.DataBound
        If DetailsView1.Rows(8).Cells(1).Text > 0 Then
            Button1.Visible = False
        End If
        Select Case DetailsView1.Rows(8).Cells(1).Text
            Case 0
                DetailsView1.Rows(8).Cells(1).Text = "Available"
            Case 1
                DetailsView1.Rows(8).Cells(1).Text = "Requested"
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

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        SqlDataSource2.SelectCommand = "ShowAllShippable"
        MultiView1.ActiveViewIndex = 1
        ViewState("showall") = 1
    End Sub
End Class
