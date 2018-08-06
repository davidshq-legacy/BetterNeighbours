Imports System.Net.Mail
Partial Class MyRequests
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        SqlDataSource1.SelectParameters("varUsername").DefaultValue = Profile.UserName
        If User.Identity.IsAuthenticated = False Then
            Button1.Visible = False
        End If
        If GridView1.Rows.Count = 0 Then
            Button1.Visible = False
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        SqlDataSource1.UpdateParameters("varUser").DefaultValue = Profile.UserName
        For Each row As GridViewRow In GridView1.Rows
            Dim droplast As Integer = CType(row.FindControl("DropDownList1"), DropDownList).SelectedValue
            If droplast <> 0 Then
                SqlDataSource1.UpdateParameters("varItem").DefaultValue = row.Cells(1).Text
                SqlDataSource1.UpdateParameters("varStatus").DefaultValue = droplast
                SqlDataSource1.UpdateParameters("varOfferer").DefaultValue = row.Cells(3).Text
                SqlDataSource1.Update()
                If droplast = 5 Then
                    ' Send email to Offerer.
                    Dim ToAddress As String = Membership.GetUser(row.Cells(3).Text).Email
                    Dim mailClient As New SmtpClient
                    Dim Message As New MailMessage
                    Dim fromAddress As New MailAddress("dmackey@betterneighbours.com")
                    Message.From = fromAddress
                    Message.To.Add(ToAddress)
                    Message.Subject = "BetterNeighbours - Your Item Has Been Released - " & row.Cells(2).Text & " " & Date.Today
                    Message.Body = "Dear " & row.Cells(3).Text & "," & vbCrLf & _
                    "   The requestor of your item - " & row.Cells(2).Text & " has released your item. This " & _
                    "means that for whatever reason they are no longer in need of this item. Your item has been " & _
                    "authomatically reinserted back into the available items." & vbCrLf & _
                "Respectfully," & vbCrLf & _
                "David Mackey"
                    mailClient.Send(Message)
                    ' Send email to Requestor.
                    Dim RToAddress As String = Membership.GetUser(Profile.UserName).Email
                    Dim RmailClient As New SmtpClient
                    Dim RMessage As New MailMessage
                    Dim RfromAddress As New MailAddress("dmackey@betterneighbours.com")
                    RMessage.From = RfromAddress
                    RMessage.To.Add(RToAddress)
                    RMessage.Subject = " BetterNeighbours.Com - You Have Released a Requested Item - " & row.Cells(2).Text & " " & Date.Today
                    RMessage.Body = "Dear " & Profile.UserName & "," & vbCrLf & _
                 "  You have decided to release the item you requested - " & row.Cells(2).Text & ". " & _
                 "This means that this item is no longer in your requests and has been made available for others " & _
                 "to request instead. If this was an accident, you can request the item again." & vbCrLf & _
                "Respectfully," & vbCrLf & _
                "David Mackey"
                    mailClient.Send(RMessage)
                End If
            End If
        Next
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        Select Case e.Row.Cells(5).Text
            Case 0
                e.Row.Cells(5).Text = "Available"
            Case 1
                e.Row.Cells(5).Text = "Requested"
            Case 2
                e.Row.Cells(5).Text = "Accepted"
            Case 3
                e.Row.Cells(5).Text = "Rejected"
            Case 4
                e.Row.Cells(5).Text = "Completed"
            Case 5
                e.Row.Cells(5).Text = "Released"
        End Select
        For Each row As GridViewRow In GridView1.Rows
            Dim varuser As String = row.Cells(3).Text
            If row.Cells(5).Text <> "Available" Then
                If row.Cells(5).Text <> "Requested" Then
                    If String.IsNullOrEmpty(row.Cells(3).Text) = False Then
                        If row.Cells(3).Text <> "&nbsp;" Then
                            row.Cells(6).Text = Membership.GetUser(varuser).Email
                        End If
                    End If
                End If
            End If

        Next
    End Sub
End Class
