<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="AspWebForms.ClaimView.Create" MasterPageFile="../StaticPages/InsuranceCompany.Master"%>

<asp:Content ID="ControlId" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

  <div>
    <h1 class="title1">Add New Claim</h1>
    <table class="table-hover">
      <tr>
        <td>
          <label>MemberId</label>
        </td>
        <td>
          <asp:DropDownList ID="ddlClaim" runat="server" Width="184px"></asp:DropDownList>
        </td>
      </tr>


      <tr>
        <td>
          <label class="text-uppercase">Claim Date</label>
        </td>
        <td>
          <asp:TextBox ID="txtClaimDate" runat="server"/>

          <ajaxToolkit:CalendarExtender ID="Calendar1" runat="server" TargetControlID="txtClaimDate" Format="MM/dd/yyyy">
          </ajaxToolkit:CalendarExtender>
          <asp:RequiredFieldValidator ID="rqvClaimDate"
                                      runat="server"
                                      ControlToValidate="txtClaimDate"
                                      ErrorMessage="Claim Date is Required"
                                      SetFocusOnError="true"
                                      BackColor="yellow">

          </asp:RequiredFieldValidator>
        </td>
      </tr>

      <tr>
        <td>
          <label class="text-uppercase">Due Date</label>
        </td>
        <td>
          <asp:TextBox ID="txtDueDate" runat="server"/>

          <ajaxToolkit:CalendarExtender ID="Calendar2" runat="server" TargetControlID="txtDueDate" Format="MM/dd/yyyy">
          </ajaxToolkit:CalendarExtender>
          <asp:RequiredFieldValidator ID="rqvDueDate"
                                      runat="server"
                                      ControlToValidate="txtDueDate"
                                      ErrorMessage="Due Date is Required"
                                      SetFocusOnError="true"
                                      BackColor="yellow">

          </asp:RequiredFieldValidator>
        </td>
      </tr>


      <tr>
        <td>
          <label class="text-uppercase">Claim Amount</label>
        </td>
        <td>
          <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                      runat="server"
                                      ControlToValidate="txtAmount"
                                      ErrorMessage="Amount is Required"
                                      SetFocusOnError="true"
                                      BackColor="yellow">

          </asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="RegNameClaim" runat="server"
                                          ControlToValidate="txtAmount"
                                          ValidationExpression="^\d+(\.\d\d)?$"
                                          Text="Enter a positive number" SetFocusOnError="true"
                                          BackColor="yellow"/>
        </td>
      </tr>

      <tr>
        <td>
          <asp:Button ID="btnCreate" runat="server" CssClass="btn btn-primary" OnClick="btnCreate_Click" Text="Create"/>
        </td>
        <td>
          <h6>
            <asp:Label ID="lblResult" runat="server"></asp:Label>
          </h6>
        </td>
      </tr>


    </table>

  </div>


  <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/>
</asp:Content>