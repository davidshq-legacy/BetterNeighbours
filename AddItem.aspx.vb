Imports System.Net.Mail
Partial Class AddItem
    Inherits System.Web.UI.Page

    Protected Sub Wizard1_NextButtonClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.WizardNavigationEventArgs) Handles Wizard1.NextButtonClick
        Profile.CurrentLocation.CurrentState = DropDownList1.SelectedValue
        Profile.CurrentLocation.CurrentCounty = DropDownList2.SelectedValue
        Profile.CurrentLocation.CurrentCategory = DropDownList3.SelectedValue
    End Sub
    Protected Sub Wizard1_FinishButtonClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.WizardNavigationEventArgs) Handles Wizard1.FinishButtonClick
        If User.Identity.IsAuthenticated = True Then
            SqlDataSource1.InsertParameters("varState").DefaultValue = Profile.CurrentLocation.CurrentState
            SqlDataSource1.InsertParameters("varCounty").DefaultValue = Profile.CurrentLocation.CurrentCounty
            SqlDataSource1.InsertParameters("varCategory").DefaultValue = Profile.CurrentLocation.CurrentCategory
            SqlDataSource1.InsertParameters("varTitle").DefaultValue = TextBox1.Text
            SqlDataSource1.InsertParameters("varDescription").DefaultValue = TextBox2.Text
            SqlDataSource1.InsertParameters("varOfferer").DefaultValue = Profile.UserName
            SqlDataSource1.InsertParameters("varZip").DefaultValue = TextBox3.Text
            If CheckBox1.Checked = True Then
                SqlDataSource1.InsertParameters("varShip").DefaultValue = 1
            Else
                SqlDataSource1.InsertParameters("varShip").DefaultValue = 0
            End If
            If CheckBox2.Checked = True Then
                SqlDataSource1.InsertParameters("varWanted").DefaultValue = 1
            Else
                SqlDataSource1.InsertParameters("varWanted").DefaultValue = 0
            End If
            SqlDataSource1.Insert()
            Profile.PackRats = Profile.PackRats + 1
            Dim ToAddress As String = "dmackey@dhq.nu"
            Dim mailClient As New SmtpClient
            Dim Message As New MailMessage
            Dim fromAddress As New MailAddress("dmackey@betterneighbours.com")
            Message.From = fromAddress
            Message.To.Add(ToAddress)
            Message.Subject = "BetterNeighbours - New Item Added."
            Message.Body = "A new item has been added. Please logon and approve or deny this item."
            mailClient.Send(Message)
        Else
            Label1.Visible = True
        End If
        Response.Redirect("default.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Me.IsPostBack = False Then
            Label1.Visible = False
            DropDownList1.SelectedValue = Profile.Defaults.DefaultState
            TextBox3.Text = Profile.Defaults.DefaultZip
        End If
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        SqlDataSource2.SelectParameters("varState").DefaultValue = DropDownList1.SelectedValue
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Profile.Defaults.DefaultCounty = DropDownList2.SelectedValue
    End Sub

    Protected Sub DropDownList2_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList2.DataBinding
        SqlDataSource2.SelectParameters("varState").DefaultValue = DropDownList1.SelectedValue
    End Sub
    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        Profile.Defaults.DefaultZip = TextBox3.Text
    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        Profile.Defaults.DefaultState = DropDownList1.SelectedValue
    End Sub

    Protected Sub Button5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button5.Click
        Profile.Defaults.DefaultCategory = DropDownList3.SelectedValue
    End Sub

    Protected Sub DropDownList3_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList3.DataBound
        If Profile.Defaults.DefaultCategory > 0 Then
            DropDownList3.SelectedValue = Profile.Defaults.DefaultCategory
        End If
    End Sub

    Protected Sub DropDownList2_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList2.DataBound
        Dim item As ListItem
        For Each item In DropDownList2.Items
            If item.Value = Profile.Defaults.DefaultCounty Then
                DropDownList2.SelectedValue = Profile.Defaults.DefaultCounty
            End If
        Next

    End Sub
End Class
