using System;
using System.Web.UI;
using InsuranceCompany.BAL.Actions;
using InsuranceCompany.BAL.Model;


namespace AspWebForms.MemberView
{
  public partial class Insert : Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      if (!IsPostBack)
      {
        BindDropDown();       
        Calendar1.EndDate = DateTime.Today;
      }
    }


    private void BindDropDown()
    {
      ddlPlan.DataSource = new PlanAction().Get();
      ddlPlan.DataValueField = "PlanId";
      ddlPlan.DataTextField = "PlanName";
      ddlPlan.DataBind();
    }

    protected void btnCreate_Click(object sender, EventArgs e)
    {
     // var model1 = new MemberModel();
     // IAction<MemberModel> actionobj = new MemberAction();

      var model = new MemberModel(Convert.ToInt32(ddlPlan.SelectedValue),
        txtFirstName.Text,
        txtLastName.Text,
        Convert.ToDateTime(txtDateOfBirth.Text).ToShortDateString(),
        txtGender.Text,
        txtUserName.Text);

      if (txtFirstName.Text == string.Empty || txtLastName.Text == string.Empty|| txtDateOfBirth.Text == string.Empty|| txtGender.Text == string.Empty|| txtUserName.Text == string.Empty)
      {
        txtFirstName.Text = "";
        txtLastName.Text = "";
        txtDateOfBirth.Text = "";
        txtGender.Text = "";
        txtUserName.Text = "";
      }
      else
      {
        var result = new MemberAction().Insert(model);

        if (result == true)
          lblResult.Text = "Member Has Been Added Successfully! ";
        else
          lblResult.Text = "Member Is Not Added ";
      }           
    }

  }
}