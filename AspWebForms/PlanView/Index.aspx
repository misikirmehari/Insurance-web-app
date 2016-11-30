<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AspWebForms.PlanView.Index" MasterPageFile="../StaticPages/InsuranceCompany.Master" %>

<asp:Content ID="ControlId" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
<div>

<table>
  <tr>
    <td style="text-align: center" class="t1">
      <h1 class="title1">Plans</h1>
      <asp:UpdatePanel ID="udp2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
          <asp:GridView ID="GridView1" runat="server"
                        AutoGenerateColumns="false"
                        CssClass="floatLeft"
                        DataKeyNames="PlanId" RowStyle-CssClass="rowHover">
            <Columns>
              <asp:BoundField DataField="ID" HeaderText="Id" Visible="False"/>
              <asp:TemplateField HeaderText="Plan">
                <ItemTemplate>
                  <asp:Label ID="lblName" runat="server" Text='<%# Eval("PlanName") %>'></asp:Label>
                </ItemTemplate>
              </asp:TemplateField>

              <asp:BoundField DataField="Descr" HeaderText="Plan Description"/>
              <asp:BoundField DataField="Deductable" HeaderText="Detectuble Value"/>

            </Columns>
          </asp:GridView>
        </ContentTemplate>
      </asp:UpdatePanel>
    </td>

    <td style="text-align: center" class="t2">

      <asp:UpdatePanel ID="udp" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

          <h1 class="title1">Edit/Delete Plans</h1>
          <asp:GridView ID="gvPlan" runat="server"
                        AutoGenerateColumns="false"
                        CssClass="floatRight"
                        OnRowCommand="gvPlan_RowCommand"
                        DataKeyNames="PlanId" RowStyle-CssClass="rowHover">
            <Columns>
              <asp:BoundField DataField="ID" HeaderText="Plan Id" Visible="False"/>

              <asp:TemplateField HeaderText="Plan">
                <ItemTemplate>
                  <asp:Label ID="lblName" runat="server" Text='<%# Eval("PlanName") %>'></asp:Label>
                </ItemTemplate>
              </asp:TemplateField>

              <asp:BoundField DataField="Descr" HeaderText="Description"/>
              <asp:BoundField DataField="Deductable" HeaderText="Detuctible Value"/>

              <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                  
                  <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="EditRow" CssClass="btn btn-primary"/>
                  <asp:Button ID="btnDelte" runat="server" Text="Delete" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="DeleteRow" CssClass="btn btn-primary"/>

                </ItemTemplate>

              </asp:TemplateField>

            </Columns>
          </asp:GridView>
          <h6>
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
                <div class="modal-header" id="PopupHeader">Update Plan</div>

                <table class="table-hover">
                  <tr>
                    <td>
                      <label class="text-uppercase">Plan:</label>
                    </td>
                    <td>
                      <asp:DropDownList ID="ddlPlan" runat="server" CssClass="form-control"></asp:DropDownList>
                    </td>
                  </tr>


                  <tr>
                    <td>
                      <label class="text-uppercase">Description:</label>
                    </td>
                    <td>
                      <asp:TextBox ID="descr" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                  </tr>


                  <tr>
                    <td>
                      <label class="text-uppercase">Detuctible Value:</label>
                    </td>
                    <td>
                      <asp:TextBox ID="dectVal" runat="server" CssClass="form-control"></asp:TextBox>
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
                <div class="modal-header" id="PopupHeader1">Delete Plan:</div>
                <h6 style="color: red">Do you want to delete this record?</h6>
                <table class="table-hover">
                  <tr>
                    <td>
                      <label class="text-uppercase">Plan:</label>
                    </td>
                    <td>
                      <asp:DropDownList ID="ddlPlan1" runat="server" CssClass="form-control" Enabled="False"></asp:DropDownList>
                    </td>
                  </tr>


                  <tr>
                    <td>
                      <label class="text-uppercase">Description:</label>
                    </td>
                    <td>
                      <asp:TextBox ID="descr1" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                    </td>
                  </tr>


                  <tr>
                    <td>
                      <label class="text-uppercase">Detuctible Value:</label>
                    </td>
                    <td>
                      <asp:TextBox ID="dectval1" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
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


<div>

 
  <asp:TextBox ID="txtsearch" runat="server"></asp:TextBox>
  <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search"/>
</div>
</asp:Content>