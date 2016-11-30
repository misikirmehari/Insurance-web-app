using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using InsuranceCompany.BAL.Actions;
using InsuranceCompany.BAL.Model;
using InsuranceCompany.DAL;

namespace AspWebForms.ClaimView
{
  public partial class Index : Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      if (!IsPostBack)
      {
        BindData();
        BindData1();
      }
    }

    private void BindDropDown()
    {
      ddlFirstName.DataSource = new MemberAction().Get();
      ddlFirstName.DataValueField = "MemberId";
      ddlFirstName.DataTextField = "FirstName";
      ddlFirstName.DataBind();


      ddlLastName.DataSource = new MemberAction().Get();
      ddlLastName.DataValueField = "MemberId";
      ddlLastName.DataTextField = "LastName";
      ddlLastName.DataBind();

      ddlFirstName1.DataSource = new MemberAction().Get();
      ddlFirstName1.DataValueField = "MemberId";
      ddlFirstName1.DataTextField = "FirstName";
      ddlFirstName1.DataBind();


      ddlLastName1.DataSource = new MemberAction().Get();
      ddlLastName1.DataValueField = "MemberId";
      ddlLastName1.DataTextField = "LastName";
      ddlLastName1.DataBind();
    }

    private void BindData()
    {
      gvClaim.DataSource = new ClaimAction().Get();
      gvClaim.DataBind();
    }


    private void BindData1()
    {
      GridView1.DataSource = new ClaimAction().Get();
      GridView1.DataBind();
    }

    protected void gvClaim_RowCommand(object sender, GridViewCommandEventArgs e)
    {
      int index = Convert.ToInt32(e.CommandArgument);
      if (e.CommandName == "EditRow")
      {
        //Get the value of command argument, i.e cuurent row index.

       GridViewRow row = gvClaim.Rows[index];
        txtClaimDate.Text = row.Cells[1].Text;
        txtDueDate.Text = row.Cells[2].Text;
        txtAmount.Text = row.Cells[3].Text;
        BindDropDown();

        Label lbl1 = (Label) row.FindControl("lblFirstName");
        ddlFirstName.SelectedIndex = ddlFirstName.Items.IndexOf(ddlFirstName.Items.FindByText(lbl1.Text));
        ViewState["Claim_id"] = gvClaim.DataKeys[index].Value;





        Label lbl2 = (Label)row.FindControl("lblLastName");
        ddlLastName.SelectedIndex = ddlLastName.Items.IndexOf(ddlLastName.Items.FindByText(lbl2.Text));
        ViewState["Claim_id"] = gvClaim.DataKeys[index].Value;



        ModalPopupExtender1.Show();
      }
      else if (e.CommandName == "DeleteRow")
      {
        //Get the value of command argument, i.e cuurent row index.

        GridViewRow row = gvClaim.Rows[index];
        txtClaimDate1.Text = row.Cells[1].Text;
        txtDueDate1.Text = row.Cells[2].Text;
        txtAmount1.Text = row.Cells[3].Text;
        BindDropDown();

        Label lbl3 = (Label)row.FindControl("lblFirstName");
        ddlFirstName1.SelectedIndex = ddlFirstName1.Items.IndexOf(ddlFirstName1.Items.FindByText(lbl3.Text));
        ViewState["Claim_id"] = gvClaim.DataKeys[index].Value;





        Label lbl4 = (Label)row.FindControl("lblLastName");
        ddlLastName1.SelectedIndex = ddlLastName1.Items.IndexOf(ddlLastName1.Items.FindByText(lbl4.Text));
        ViewState["Claim_id"] = gvClaim.DataKeys[index].Value;



        ModalPopupExtender2.Show();
      }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
      ClaimModel obj = new ClaimModel();

      obj.ClaimDate = Convert.ToDateTime(txtClaimDate.Text).ToShortDateString();
      obj.DueDate = Convert.ToDateTime(txtDueDate.Text).ToShortDateString();
      obj.ClaimAmount = Convert.ToDouble(txtAmount.Text);

      obj.Member.FirstName = ddlFirstName.SelectedItem.Text;
      obj.Member.Lastname = ddlLastName.SelectedItem.Text;

      obj.MemberId = Convert.ToInt32(ddlFirstName.SelectedValue);
      obj.MemberId = Convert.ToInt32(ddlLastName.SelectedValue);

      obj.ClaimId = Convert.ToInt32(ViewState["Claim_id"]);

      bool result = new ClaimAction().Update(obj);


      if (result==true)
        Label1.Text = "Claim Has Been Updated Successfully!";
      else
        Label1.Text = "Error to delete -> " + result;

      BindData();
      udp.Update();
    }


    protected void btnDelete_Click(object sender, EventArgs e)
    {
     bool msg = Claim_DAL.Delete(Convert.ToInt32(ViewState["Claim_id"]));


      if (msg == true)
        Label1.Text = "Claim Has Been Deleted Successfully!";
      else
        Label1.Text = "Error -> " + msg;


      BindData();

      udp.Update();
    }
    protected void btnUCancel_Click(object sender, EventArgs e)
    {
    }

    protected void btnDCancel_Click(object sender, EventArgs e)
    {
    }
  }
}