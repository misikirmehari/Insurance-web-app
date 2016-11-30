<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Insert.aspx.cs" Inherits="AspWebForms.MemberView.Insert" MasterPageFile="../StaticPages/InsuranceCompany.Master" %>
<asp:Content ID="ControlId" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
  <div>
    <h1 class="title1">Add New Member</h1>
    <table class="table-hover">

      <tr>
        <td>
          <label class="text-uppercase">First Name<sup style="color: red">*</sup></label>
        </td>
        <td>
          <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rqvFirstName"
                                      runat="server"
                                      ControlToValidate="txtFirstName"
                                      ErrorMessage="First Name is Required"
                                      SetFocusOnError="true"
                                      BackColor="yellow">

          </asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="regFirstName" runat="server"
                                          ControlToValidate="txtFirstName"
                                          ValidationExpression="^[a-zA-Z'.]{1,10}$"
                                          Text="Enter a valid Name" SetFocusOnError="true"
                                          BackColor="yellow"/>
        </td>
      </tr>

      <tr>
        <td>
          <label class="text-uppercase">Last Name<sup style="color: red">*</sup></label>
        </td>
        <td>
          <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rqvLastName"
                                      runat="server"
                                      ControlToValidate="txtLastName"
                                      ErrorMessage="Last Name is Required"
                                      SetFocusOnError="true"
                                      BackColor="yellow">

          </asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="RegLastName" runat="server"
                                          ControlToValidate="txtLastName"
                                          ValidationExpression="^[a-zA-Z'.]{1,10}$"
                                          Text="Enter a valid Name" SetFocusOnError="true"
                                          BackColor="yellow"/>
        </td>
      </tr>

      <tr>
        <td>
          <label class="text-uppercase">Date Of Birth<sup style="color: red">*</sup></label>
        </td>
        <td>

          <asp:TextBox ID="txtDateOfBirth" runat="server"/>

          <ajaxToolkit:CalendarExtender ID="Calendar1" runat="server" TargetControlID="txtDateOfBirth" Format="MM/dd/yyyy">
          </ajaxToolkit:CalendarExtender>
          <asp:RequiredFieldValidator ID="rqvDateOfBirth"
                                      runat="server"
                                      ControlToValidate="txtDateOfBirth"
                                      ErrorMessage="Date of Birth is Required"
                                      SetFocusOnError="true"
                                      BackColor="yellow">

          </asp:RequiredFieldValidator>


        </td>
      </tr>

      <tr>
        <td>
          <label class="text-uppercase">Gender<sup style="color: red">*</sup></label>
        </td>
        <td>
          <asp:TextBox ID="txtGender" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rqvGender"
                                      runat="server"
                                      ControlToValidate="txtGender"
                                      ErrorMessage="Gender is Required"
                                      SetFocusOnError="true"
                                      BackColor="yellow">

          </asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="RegGender" runat="server"
                                          ControlToValidate="txtGender"
                                          ValidationExpression="^M(ale)?$|^F(emale)?$"
                                          Text="Enter M/F or Male/Female" SetFocusOnError="true"
                                          BackColor="yellow"/>
        </td>
      </tr>

      <tr>
        <td>
          <label class="text-uppercase">User Name<sup style="color: red">*</sup></label>
        </td>
        <td>
          <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rqvUserName"
                                      runat="server"
                                      ControlToValidate="txtUserName"
                                      ErrorMessage="User Name is Required"
                                      SetFocusOnError="true"
                                      BackColor="yellow">

          </asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="RegUserName" runat="server"
                                          ControlToValidate="txtUserName"
                                          ValidationExpression="^[A-Za-z][A-Za-z0-9._]{5,14}$"
                                          Text="Enter a valid User Name" SetFocusOnError="true"
                                          BackColor="yellow"/>
        </td>
      </tr>

      <tr>
        <td>
          <label class="text-uppercase">Plan<sup style="color: red">*</sup></label>
        </td>
        <td>
          <asp:DropDownList ID="ddlPlan" runat="server" Width="185px"></asp:DropDownList>
        </td>
      </tr>
      <tr>
        <td>
          <asp:Button ID="btnCreate" runat="server" CssClass="btn btn-primary" OnClick="btnCreate_Click" Text="Create"/>
        </td>
        <td>
          <h6 style="color: red">
            <asp:Label ID="lblResult" runat="server"></asp:Label>
          </h6>
        </td>
      </tr>


    </table>
  </div>

  <br/> <br/> <br/> <br/> <br/><br/>
</asp:Content>