Imports System.Net.Mail
Partial Class MyOffered
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        SqlDataSource1.SelectParameters("varUser").DefaultValue = Profile.UserName
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
            If droplast = 6 Then
                If row.Cells(3).Text <> "Available" Then
                    Label2.Visible = True
                Else
                    SqlDataSource1.DeleteCommand = "Delete from Items where ID=" & row.Cells(1).Text
                    SqlDataSource1.Delete()
                    Profile.PackRats = Profile.PackRats - 1
                    Label2.Visible = False
                End If
            Else
                If row.Cells(3).Text = "Available" Then
                    Label2.Visible = True
                    Label2.Text = "Sorry, you cannot accept or reject an item until it has been requested."
                Else
                    If droplast <> 0 Then
                        SqlDataSource1.UpdateParameters("varItem").DefaultValue = row.Cells(1).Text
                        SqlDataSource1.UpdateParameters("varStatus").DefaultValue = droplast
                        SqlDataSource1.UpdateParameters("varOfferer").DefaultValue = row.Cells(3).Text
                        SqlDataSource1.Update()
                        ' If the Item Is Accepted.
                        If droplast = 2 Then
                            ' Send email to Offerer.
                            Dim ToAddress As String = Membership.GetUser(Profile.UserName).Email
                            Dim mailClient As New SmtpClient
                            Dim Message As New MailMessage
                            Dim fromAddress As New MailAddress("dmackey@betterneighbours.com")
                            Message.From = fromAddress
                            Message.To.Add(ToAddress)
                            Message.Subject = "BetterNeighbours.Com - You Accepted Request For Item - " & row.Cells(2).Text & " " & Date.Today
                            Message.Body = "Dear " & Profile.UserName & "," & vbCrLf & _
                         "Thank you for accepting the request by " & row.Cells(4).Text & "for " & row.Cells(2).Text & _
                         ". Please contact them at " & Membership.GetUser(row.Cells(4).Text).Email & ". You can then " & _
                         "arrange the details of your exchange." & vbCrLf & _
                         "Thanks for participating in the BetterNeighbours community and remember to always be safe in " & _
                         "your exchanges." & vbCrLf & _
                         "Respectfully," & vbCrLf & _
                         "David Mackey"
                            mailClient.Send(Message)
                            ' Send email to Requestor.
                            Dim RToAddress As String = Membership.GetUser(row.Cells(4).Text).Email
                            Dim RmailClient As New SmtpClient
                            Dim RMessage As New MailMessage
                            Dim RfromAddress As New MailAddress("dmackey@betterneighbours.com")
                            RMessage.From = RfromAddress
                            RMessage.To.Add(RToAddress)
                            RMessage.Subject = "BetterNeighbours.Com - Your Request For An Item Was Accepted - " & row.Cells(2).Text & " " & Date.Today
                            RMessage.Body = "Dear " & row.Cells(4).Text & "," & vbCrLf & _
                         "  Congratulations! Your request has been accepted for" & row.Cells(2).Text & " offered by " & Profile.UserName & _
                         ". Their email address is " & Membership.GetUser(Profile.UserName).Email & ". Please use it " & _
                         "to contact them and set up the details of your exchange." & vbCrLf & _
                         "  Thanks for participing in the BetterNeighbours community and remember to always be safe " & _
                         "in your exchanges." & vbCrLf & _
                         "Respectfully," & vbCrLf & _
                         "David Mackey"
                            mailClient.Send(RMessage)
                        End If
                        ' If The Item is Rejected.
                        If droplast = 3 Then
                            ' Send email to Offerer.
                            Dim ToAddress As String = Membership.GetUser(Profile.UserName).Email
                            Dim mailClient As New SmtpClient
                            Dim Message As New MailMessage
                            Dim fromAddress As New MailAddress("dmackey@betterneighbours.com")
                            Message.From = fromAddress
                            Message.To.Add(ToAddress)
                            Message.Subject = "BetterNeighbours - You Have Rejected the Request For - " & row.Cells(2).Text & " " & Date.Today
                            Message.Body = "Dear " & Profile.UserName & "," & vbCrLf & _
                         "   We are sorry that you have chosen to reject the request for " & row.Cells(2).Text & "," & _
                          "however we understand that sometimes it is necessary for a variety of reasons - such as " & _
                          "safety, physical, or the reputation of the requestor. We hope that you find someone who " & _
                        "meets your criteria for this item. Thank you for taking the time to let the requestor know " & _
                        " you will not be accepting their request. At this time your item has been put back into the " & _
                        "available items list." & vbCrLf & _
                        "Respectfully," & _
                        "David Mackey"
                            mailClient.Send(Message)


                            ' Send email to Requestor.
                            Dim RToAddress As String = Membership.GetUser(Profile.UserName).Email
                            Dim RmailClient As New SmtpClient
                            Dim RMessage As New MailMessage
                            Dim RfromAddress As New MailAddress("dmackey@betterneighbours.com")
                            RMessage.From = RfromAddress
                            RMessage.To.Add(RToAddress)
                            RMessage.Subject = " BetterNeighbours.Com - Request for Item Rejected - " & row.Cells(2).Text & " " & Date.Today
                            RMessage.Body = "Dear " & row.Cells(4).Text & "," & vbCrLf & _
                         "  We are sorry to inform you that your request for " & row.Cells(2).Text & " was rejected by " & _
                         "the Offerer. We do not have information on why they rejected your request - but it could " & _
                         "have been for a number of good and valid reasons - such as health problems, the item was " & _
                         "destroyed, or they found a use for it. We hope you will continue to use BetterNeighbours to " & _
                         "find items you can use. We trust that the number of acceptances will far outweigh the " & _
                         "rejections." & _
                        "Respectfully," & _
                        "David Mackey"
                            mailClient.Send(RMessage)
                        End If
                    End If
                End If
            End If
        Next
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        Select Case e.Row.Cells(3).Text
            Case 0
                e.Row.Cells(3).Text = "Available"
            Case 1
                e.Row.Cells(3).Text = "Requested"
            Case 2
                e.Row.Cells(3).Text = "Accepted"
            Case 3
                e.Row.Cells(3).Text = "Rejected"
            Case 4
                e.Row.Cells(3).Text = "Completed"
            Case 5
                e.Row.Cells(3).Text = "Released"
        End Select
        For Each row As GridViewRow In GridView1.Rows
            Dim varuser As String = row.Cells(4).Text
            Dim muser As MembershipUser
            muser = Membership.GetUser(varuser)
            If String.IsNullOrEmpty(row.Cells(4).Text) = False Then
                If row.Cells(4).Text <> "&nbsp;" Then
                    If row.Cells(3).Text <> "&nbsp;" Then
                        If row.Cells(3).Text <> "Available" Then
                            row.Cells(5).Text = muser.Email.ToString
                        End If
                    End If
                End If
            End If

        Next
    End Sub
End Class
