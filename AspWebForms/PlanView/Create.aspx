<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="AspWebForms.PlanView.Create" MasterPageFile="../StaticPages/InsuranceCompany.Master"%>

<asp:Content ID="ControlId" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
  <div>
    <h1 class="title1">Add New Plan</h1>
    <table class="table-hover">

      <tr>
        <td>
          <label>Name</label>
        </td>
        <td>
          <asp:TextBox ID="txtPlanName" Font-Size="Medium" runat="server" ></asp:TextBox>
          <asp:RequiredFieldValidator ID="rqvPlanName"
                                      runat="server"
                                      ControlToValidate="txtPlanName"
                                      ErrorMessage="Name is Required"
                                      SetFocusOnError="true"
                                      BackColor="yellow">

          </asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="regNamePlan" runat="server"
                                          ControlToValidate="txtPlanName"
                                          ValidationExpression="^[a-zA-Z'.]{1,25}$"
                                          Text="Enter a valid name" SetFocusOnError="true"
                                          BackColor="yellow"/>
        </td>
      </tr>

      <tr>
        <td>
          <label>Description</label>
        </td>
        <td>
          <asp:TextBox ID="txtDescr" Font-Size="Medium" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rqvDescr"
                                      runat="server"
                                      ControlToValidate="txtDescr"
                                      ErrorMessage="Description is Required"
                                      SetFocusOnError="true"
                                      BackColor="yellow">
          </asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="RegNameDescr" runat="server"
                                          ControlToValidate="txtDescr"
                                          ValidationExpression="^[a-zA-Z''-'\s]{1,25}$"
                                          Text="Enter a valid Description" SetFocusOnError="true"
                                          BackColor="yellow"/>
        </td>
      </tr>

      <tr>
        <td>
          <label>Deductable Amount </label>;
        </td>
        <td>
          <asp:TextBox ID="txtDetuc" Font-Size="Medium" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rqvDetuc"
                                      runat="server"
                                      ControlToValidate="txtDetuc"
                                      ErrorMessage="Deductible Value is Required"
                                      SetFocusOnError="true"
                                      BackColor="yellow">
          </asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="RegNameDetuc" runat="server"
                                          ControlToValidate="txtDetuc"
                                          ValidationExpression="^\d+(\.\d\d)?$"
                                          Text="Enter a positive number" SetFocusOnError="true"
                                          BackColor="yellow"/>
        </td>
      </tr>

      <tr>
        <td>

          <asp:Button ID="btnCreate" runat="server" Text="Create" OnClick="btnCreate_Click" CssClass="btn btn-primary"/>
        </td>
        <td>
          <h6 >
            <asp:Label ID="lblResult" runat="server"></asp:Label>
          </h6>
        </td>
      </tr>

    </table>


  </div>

  <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/>
</asp:Content>