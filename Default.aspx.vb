Imports System.Net.Mail
Partial Class _Default
    Inherits System.Web.UI.Page

    Public Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' Sets up initial layout of the page.
        If Me.IsPostBack = False Then
            MultiView1.ActiveViewIndex = 0
            drpdwnlistSelectState.SelectedValue = Profile.Defaults.DefaultState
            Label3.Visible = False
            Label4.Visible = False
        End If
    End Sub
    Protected Sub grdSelectCounties_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdSelectCounties.SelectedIndexChanged
        ' Changes from County to Category display.
        Dim varCounty As String = grdSelectCounties.SelectedRow.Cells(1).Text
        grdSelectCounties.Visible = False
        Label1.Visible = False
        GridView2.Visible = True
        Profile.CurrentLocation.CurrentCounty = varCounty
        MultiView1.ActiveViewIndex = 2
    End Sub

    Protected Sub GridView2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView2.SelectedIndexChanged
        ' Changes from Category to Items display.
        Dim varCategory As String = GridView2.SelectedRow.Cells(1).Text
        GridView2.Visible = False
        GridView3.Visible = True
        Profile.CurrentLocation.CurrentCategory = varCategory
        SqlDataSource4.SelectParameters("varCategory").DefaultValue = varCategory
        SqlDataSource4.SelectParameters("varCounty").DefaultValue = Profile.CurrentLocation.CurrentCounty
        MultiView1.ActiveViewIndex = 3
        Dim row As GridViewRow
        For Each row In GridView3.Rows
            If row.Cells(3).Text <> "&nbsp;" Then
                Dim varProfile As String = row.Cells(3).Text
                Dim varURL As String = "<a href=profile.aspx?profile=" & varProfile & ">" & varProfile & "</a>"
                row.Cells(3).Text = varURL
            End If
        Next
    End Sub

    Protected Sub GridView3_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView3.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
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
        End If
    End Sub

    Protected Sub GridView3_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView3.SelectedIndexChanged
        ' Changes from Items to Item display.
        Dim varItem As String = GridView3.SelectedRow.Cells(1).Text
        GridView3.Visible = False
        DetailsView1.Visible = True
        Profile.CurrentLocation.CurrentItem = varItem
        MultiView1.ActiveViewIndex = 4
        SqlDataSource5.SelectParameters("varItem").DefaultValue = varItem
    End Sub
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        ' Requests an item.
        If User.Identity.IsAuthenticated = True Then
            If Profile.PackRats > 0 Then
                If Profile.UserName <> DetailsView1.Rows(3).Cells(1).Text Then
                    Dim varItem As String = DetailsView1.Rows(0).Cells(1).Text
                    SqlDataSource5.UpdateParameters("varItem").DefaultValue = varItem
                    SqlDataSource5.UpdateParameters("varStatus").DefaultValue = 1
                    SqlDataSource5.UpdateParameters("varUser").DefaultValue = Profile.UserName
                    SqlDataSource5.UpdateParameters("varOfferer").DefaultValue = DetailsView1.Rows(3).Cells(1).Text
                    SqlDataSource5.Update()
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
                    Label4.Visible = True
                    Label4.Text = "Sorry, you cannot request an item you posted."
                End If
            Else
            End If
        Else
            Label4.Visible = True
        End If
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dim varID As String = drpdwnlistSelectState.SelectedItem.Value
        SqlDataSource2.SelectParameters("varID").DefaultValue = varID
        grdSelectCounties.Visible = True
        Profile.CurrentLocation.CurrentState = varID
        MultiView1.ActiveViewIndex = 1
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        If User.Identity.IsAuthenticated Then
            Profile.Defaults.DefaultState = drpdwnlistSelectState.SelectedItem.Value
            SqlDataSource1.Update()
        Else
            Label3.Visible = True
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

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        SqlDataSource7.SelectParameters("varCounty").DefaultValue = grdSelectCounties.SelectedRow.Cells(1).Text
        ViewState("viewAll") = 1
        MultiView1.ActiveViewIndex = 3
        GridView3.Visible = True
        GridView3.DataSourceID = "SqlDataSource7"
    End Sub
End Class
