<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AspWebForms.ClaimView.Index" MasterPageFile="../StaticPages/InsuranceCompany.Master"%>

<asp:Content ID="ControlId" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
<div>
<table>
<tr>
<td style="text-align: center" class="t1">
  <h1 class="title1">Claims</h1>


  <asp:UpdatePanel ID="udp2" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
      <asp:GridView ID="GridView1" runat="server"
                    AutoGenerateColumns="false" CssClass="floatLeft"
                    RowStyle-CssClass="rowHover"
                    DataKeyNames="ClaimId">
        <Columns>
          <asp:BoundField DataField="ClaimId" HeaderText="Claim Id" Visible="False"/>
          <asp:BoundField DataField="ClaimDate" HeaderText="Claim Date" SortExpression="ClaimDate" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false"/>
          <asp:BoundField DataField="DueDate" HeaderText="Due Date" SortExpression="DueDate" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false"/>
          <asp:BoundField DataField="ClaimAmount" HeaderText="Claim Amount"/>


          <asp:TemplateField HeaderText="First Name">
            <ItemTemplate>
              <asp:Label ID="lblFirstName" runat="server" Text='<%# Eval("Member.FirstName") %>'></asp:Label>
            </ItemTemplate>
          </asp:TemplateField>

          <asp:TemplateField HeaderText="Last Name">
            <ItemTemplate>
              <asp:Label ID="lblLastName" runat="server" Text='<%# Eval("Member.LastName") %>'></asp:Label>
            </ItemTemplate>
          </asp:TemplateField>
        </Columns>
      </asp:GridView>
    </ContentTemplate>
  </asp:UpdatePanel>
</td>

<td style="text-align: center" class="t2">


<asp:UpdatePanel ID="udp" runat="server" UpdateMode="Conditional">
<ContentTemplate>
<h1 class="title1">Edit/Delete Claim</h1>
<asp:GridView ID="gvClaim" runat="server"
              AutoGenerateColumns="false"
              CssClass="floatRight"
              OnRowCommand="gvClaim_RowCommand"
              RowStyle-CssClass="rowHover"
              DataKeyNames="ClaimId">
  <Columns>
    <asp:BoundField DataField="ClaimId" HeaderText="Claim Id" Visible="False"/>
    <asp:BoundField DataField="ClaimDate" HeaderText="Claim Date" HtmlEncode="false" DataFormatString="{0:MM/dd/yyyy}"/>
    <asp:BoundField DataField="DueDate" HeaderText="Due Date" HtmlEncode="false" DataFormatString="{0:MM/dd/yyyy}"/>
    <asp:BoundField DataField="ClaimAmount" HeaderText="Claim Amount"/>


    <asp:TemplateField HeaderText="First Name">
      <ItemTemplate>
        <asp:Label ID="lblFirstName" runat="server" Text='<%# Eval("Member.FirstName") %>'></asp:Label>
      </ItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Last Name">
      <ItemTemplate>
        <asp:Label ID="lblLastName" runat="server" Text='<%# Eval("Member.LastName") %>'></asp:Label>
      </ItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Action">
      <ItemTemplate>
        <%--                            Pass Command argumnet to pass the row index so that we know which row we are working with--%>
        <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="EditRow" CssClass="btn btn-primary"/>
        <asp:Button ID="btnDelte" runat="server" Text="Delete" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="DeleteRow" CssClass="btn btn-primary"/>

      </ItemTemplate>

    </asp:TemplateField>


  </Columns>
</asp:GridView>
<h6 style="color: red">
  <asp:Label ID="Label1" runat="server" EnableViewState="False"></asp:Label>
</h6>

<asp:Label ID="lbl" runat="server"></asp:Label>
<ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1"
                                runat="server"
                                TargetControlID="lbl"
                                PopupControlID="Panel1"
                                PopupDragHandleControlID=""
                                Drag="true">
</ajaxToolkit:ModalPopupExtender>
<div>
  <asp:Panel ID="Panel1" runat="server" BackColor="lightgreen" BorderStyle="Solid"

             BorderWidth="5px" CssClass="panel" align-self="baseline">

    <div class="modal-dialog modal-sm">
      <div class="modal-header" id="PopupHeader">Update Claim</div>

      <table class="table-hover">
        <tr>
          <td>
            <label class="text-uppercase">Claim Date </label>
          </td>
          <td>
            <asp:TextBox ID="txtClaimDate" runat="server" CssClass="form-control"/>

            <ajaxToolkit:CalendarExtender ID="Calendar1" runat="server" TargetControlID="txtClaimDate" Format="MM/dd/yyyy">
            </ajaxToolkit:CalendarExtender>
          </td>
        </tr>

        <tr>
          <td>
            <label class="text-uppercase">Due Date </label>
          </td>
          <td>
            <asp:TextBox ID="txtDueDate" runat="server" CssClass="form-control"/>

            <ajaxToolkit:CalendarExtender ID="Calendar2" runat="server" TargetControlID="txtDueDate" Format="MM/dd/yyyy">
            </ajaxToolkit:CalendarExtender>
          </td>
        </tr>


        <tr>
          <td>
            <label class="text-uppercase">Claim Amount </label>
          </td>
          <td>
            <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control"></asp:TextBox>

          </td>
        </tr>

        <tr>
          <td>
            <label class="text-uppercase">First Name</label>
          </td>
          <td>
            <asp:DropDownList ID="ddlFirstName" runat="server" CssClass="form-control" Enabled="False"></asp:DropDownList>
          </td>
        </tr>

        <tr>
          <td>
            <label class="text-uppercase">Last Name</label>
          </td>
          <td>
            <asp:DropDownList ID="ddlLastName" runat="server" CssClass="form-control" Enabled="False"></asp:DropDownList>
          </td>
        </tr>

      </table>

      <div class="modal-footer" style="text-align: center;">
        <asp:Button CssClass="bfooter" ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Update"/>
        <asp:Button CssClass="bfooter" ID="btnUCancel" runat="server" OnClick="btnUCancel_Click" Text="Cancel"/>
      </div>
    </div>

  </asp:Panel>
  <%--  todo Add one  ModelPopup for Delete
                        Add on Panel for Delete--%>

  <asp:Label ID="lbl1" runat="server"></asp:Label>
  <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2"
                                  runat="server"
                                  TargetControlID="lbl1"
                                  PopupControlID="Panel2"
                                  PopupDragHandleControlID=""
                                  Drag="true">
  </ajaxToolkit:ModalPopupExtender>
  <asp:Panel ID="Panel2" runat="server" BackColor="lightgreen" BorderStyle="Solid"

             BorderWidth="5px" CssClass="panel" align-self="baseline">

    <div class="modal-dialog modal-sm">
      <div class="modal-header" id="PopupHeader1">Delete Claim</div>
      <h6 style="color: red">Do you want to delete this record?</h6>
      <table class="table-hover">
        <tr>
          <td>
            <label class="text-uppercase">Claim Date </label>
          </td>
          <td>
            <asp:TextBox ID="txtClaimDate1" runat="server" CssClass="form-control" Enabled="False"/>

            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtClaimDate" Format="MM/dd/yyyy">
            </ajaxToolkit:CalendarExtender>
          </td>
        </tr>

        <tr>
          <td>
            <label class="text-uppercase">Due Date </label>
          </td>
          <td>
            <asp:TextBox ID="txtDueDate1" runat="server" CssClass="form-control" Enabled="False"/>

            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtDueDate" Format="MM/dd/yyyy">
            </ajaxToolkit:CalendarExtender>
          </td>
        </tr>


        <tr>
          <td>
            <label class="text-uppercase">Claim Amount </label>
          </td>
          <td>
            <asp:TextBox ID="txtAmount1" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>

          </td>
        </tr>

        <tr>
          <td>
            <label class="text-uppercase">First Name</label>
          </td>
          <td>
            <asp:DropDownList ID="ddlFirstName1" runat="server" CssClass="form-control" Enabled="False"></asp:DropDownList>
          </td>
        </tr>

        <tr>
          <td>
            <label class="text-uppercase">Last Name</label>
          </td>
          <td>
            <asp:DropDownList ID="ddlLastName1" runat="server" CssClass="form-control" Enabled="False"></asp:DropDownList>
          </td>
        </tr>

      </table>

      <div class="modal-footer" style="text-align: center;">
        <asp:Button CssClass="bfooter" ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="Delete"/>
        <asp:Button CssClass="bfooter" ID="btnDCancel" runat="server" OnClick="btnDCancel_Click" Text="Cancel"/>
      </div>
    </div>

  </asp:Panel>
</div>


</ContentTemplate>
</asp:UpdatePanel>

</td>
</tr>
</table>
</div>
</asp:Content>