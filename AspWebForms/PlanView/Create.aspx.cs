using System;
using System.Web.UI;
using InsuranceCompany.BAL.Actions;
using InsuranceCompany.BAL.Actions.Interface;
using InsuranceCompany.BAL.Model;


namespace AspWebForms.PlanView
{
  public partial class Create : Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnCreate_Click(object sender, EventArgs e)
    {
      IAction<PlanModel> actionobj = new PlanAction();
      var model = new PlanModel();
      model.PlanName = txtPlanName.Text;
      model.Descr = txtDescr.Text;

      if (txtDetuc.Text == string.Empty)
        txtDetuc.Text = "";
      
      int val;
      var result = int.TryParse(txtDetuc.Text, out val);
      if (!result)
        return;

      model.Deductable = Convert.ToDouble(txtDetuc.Text);

      if (actionobj.Insert(model) == true)
        lblResult.Text = "Plan Has Been Added Successfully! ";
      else
        lblResult.Text = "Plan Is Not Added ";

    }
  }
}