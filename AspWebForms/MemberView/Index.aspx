<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AspWebForms.MemberView.Index" MasterPageFile="../StaticPages/InsuranceCompany.Master"%>

<asp:Content ID="ControlId" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
<div class="container-fluid">
<div class="jumbotron">
<table>
<tr>
<td style="text-align: center" class="t1">
  <h1 class="text-primary">Current Members</h1>
  <asp:UpdatePanel ID="udp2" runat="server" UpdateMode="Conditional" style="display: inline">
    <ContentTemplate>
      <asp:GridView ID="GridView1" runat="server"
                    AutoGenerateColumns="false"
                    CssClass="floatLeft"
                    RowStyle-CssClass="rowHover"
                    DataKeyNames="MemberId">


        <Columns>
          <asp:BoundField DataField="MemberId" HeaderText="Member Id" Visible="False"/>
          <asp:BoundField DataField="FirstName" HeaderText="First Name"/>
          <asp:BoundField DataField="LastName" HeaderText="Last Name"/>
          <asp:BoundField DataField="DOB" HeaderText="Date Of Birth"/>
          <asp:BoundField DataField="Gender" HeaderText="Gender"/>
          <asp:BoundField DataField="UserName" HeaderText="User Name"/>

          <asp:TemplateField HeaderText="Plan Name">
            <ItemTemplate>
              <asp:Label ID="lblName" runat="server" Text='<%# Eval("Plan.PlanName") %>'></asp:Label>
            </ItemTemplate>
          </asp:TemplateField>


        </Columns>
      </asp:GridView>
    </ContentTemplate>
  </asp:UpdatePanel>
</td>
  
<td style="text-align: center" class="t2">

<asp:UpdatePanel ID="udp" runat="server" UpdateMode="Conditional" style="display: inline">
<ContentTemplate>
</div>

<div class ="jumbotron">
<h1 class="title2">Edit/Delete Member</h1>
<asp:GridView ID="gvMember" runat="server" AutoGenerateColumns="false"
              CssClass="floatRight"
              OnRowCommand="gvMember_RowCommand"
              RowStyle-CssClass="rowHover"
              DataKeyNames="MemberId"
              AllowPaging="True">

  <Columns>
    <asp:BoundField DataField="MemberId" HeaderText="Member Id" Visible="False"/>
    <asp:BoundField DataField="FirstName" HeaderText="First Name"/>
    <asp:BoundField DataField="LastName" HeaderText="Last Name"/>
    <asp:BoundField DataField="DOB" HeaderText="Date Of Birth"/>
    <asp:BoundField DataField="Gender" HeaderText="Gender"/>
    <asp:BoundField DataField="UserName" HeaderText="User Name"/>

    <asp:TemplateField HeaderText="Plan Name">
      <ItemTemplate>
        <asp:Label id="lblName" runat="server" Text='<%# Eval("Plan.PlanName") %>'></asp:Label>
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
  </div>
<h6 >
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


<div class="jumbotron">
  <asp:Panel ID="Panel1" runat="server" BorderStyle="Solid"

             BorderWidth="5px" CssClass="panel" align-self="baseline">


    <div class="modal-dialog modal-sm">
      <div class="modal-header" id="PopupHeader">Update Member</div>

      <table class="table-hover">
        <tr>
          <td>
            <label class="text-uppercase">First Name:</label>
          </td>
          <td>
            <asp:TextBox ID="firstname" runat="server" CssClass="form-control"></asp:TextBox>
          </td>
        </tr>
        <tr>
          <td>
            <label class="text-uppercase">Last Name:</label>
          </td>
          <td>
            <asp:TextBox ID="lastname" runat="server" CssClass="form-control"></asp:TextBox>
          </td>
        </tr>

        <tr>
          <td>
            <label class="text-uppercase">Date Of Birth:</label>
          </td>
          <td>
            <asp:TextBox ID="dob" runat="server" CssClass="form-control"/>

            <ajaxToolkit:CalendarExtender ID="Calendar1" runat="server" TargetControlID="dob" >
            </ajaxToolkit:CalendarExtender>

          </td>

        </tr>

        <tr>
          <td>
            <label class="text-uppercase">Gender:</label>
          </td>
          <td>
            <asp:TextBox ID="gender" runat="server" CssClass="form-control"></asp:TextBox>
          </td>
        </tr>

        <tr>
          <td>
            <label class="text-uppercase">UserName:</label>
          </td>
          <td>
            <asp:TextBox ID="username" runat="server" CssClass="form-control"></asp:TextBox>
          </td>
        </tr>
        <tr>
          <td>
            <label class="text-uppercase">Plan:</label>
          </td>
          <td>
            <asp:DropDownList ID="ddlPlan" runat="server" CssClass="form-control"></asp:DropDownList>
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


  <asp:Panel ID="Panel2" runat="server" BorderStyle="Solid"

             BorderWidth="5px" CssClass="panel" align-self="baseline">


    <div class="jumbotron">
      <div class="modal-header" id="PopupHeader1">Delete Member</div>
      <h6 >Do you want to delete this record?</h6>
      <table class="table-hover">
        <tr>
          <td>
            <label class="text-uppercase">First Name:</label>
          </td>
          <td>
            <asp:TextBox ID="firstname1" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
          </td>
        </tr>
        <tr>
          <td>
            <label class="text-uppercase">Last Name:</label>
          </td>
          <td>
            <asp:TextBox ID="lastname1" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
          </td>
        </tr>

        <tr>
          <td>
            <label class="text-uppercase">Date Of Birth:</label>
          </td>
          <td>
            <asp:TextBox ID="dob1" runat="server" CssClass="form-control" Enabled="False"/>

            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="dob" Format="MM/dd/yyyy">
            </ajaxToolkit:CalendarExtender>

          </td>

        </tr>

        <tr>
          <td>
            <label class="text-uppercase">Gender:</label>
          </td>
          <td>
            <asp:TextBox ID="gender1" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
          </td>
        </tr>

        <tr>
          <td>
            <label class="text-uppercase">UserName:</label>
          </td>
          <td>
            <asp:TextBox ID="username1" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
          </td>
        </tr>
        <tr>
          <td>
            <label class="text-uppercase">Plan:</label>
          </td>
          <td>
            <asp:DropDownList ID="ddlPlan1" runat="server" CssClass="form-control" Enabled="False"></asp:DropDownList>
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
</div>
</asp:Content>