using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using InsuranceCompany.BAL.Actions;
using InsuranceCompany.BAL.Model;
using InsuranceCompany.DAL;


namespace AspWebForms.PlanView
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
      ddlPlan.DataSource = new PlanAction().Get();
      ddlPlan.DataValueField = "PlanId";
      ddlPlan.DataTextField = "PlanName";
      ddlPlan.DataBind();


      ddlPlan1.DataSource = new PlanAction().Get();
      ddlPlan1.DataValueField = "PlanId";
      ddlPlan1.DataTextField = "PlanName";
      ddlPlan1.DataBind();
    }


    private void BindData()
    {
      gvPlan.DataSource = new PlanAction().Get();
      gvPlan.DataBind();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
      BindData(Convert.ToInt32(txtsearch.Text));
    }

    private void BindData(int v)
    {
      GridView1.DataSource = new PlanAction().Get(v);
      GridView1.DataBind();
    }

    private void BindData1()
    {
      GridView1.DataSource = new PlanAction().Get();
      GridView1.DataBind();
    }


    protected void gvPlan_RowCommand(object sender, GridViewCommandEventArgs e)
    {
      var index = Convert.ToInt32(e.CommandArgument);
      if (e.CommandName == "EditRow")
      {
        //Get the value of command argument, i.e cuurent row index.
        var row = gvPlan.Rows[index];


        //ddlPlan.Text = row.Cells[1].Text;
        descr.Text = row.Cells[2].Text;
        dectVal.Text = row.Cells[3].Text;

        BindDropDown();
        var lbl = (Label) row.FindControl("lblName");
        ddlPlan.SelectedIndex = ddlPlan.Items.IndexOf(ddlPlan.Items.FindByText(lbl.Text));

        ViewState["Plan_id"] = gvPlan.DataKeys[index].Value;

        ModalPopupExtender1.Show();
      }
      else if (e.CommandName == "DeleteRow")
      {
        //Get the value of command argument, i.e cuurent row index.
        var row = gvPlan.Rows[index];


        //ddlPlan.Text = row.Cells[1].Text;
        descr1.Text = row.Cells[2].Text;
        dectval1.Text = row.Cells[3].Text;

        BindDropDown();
        var lbl1 = (Label) row.FindControl("lblName");
        ddlPlan1.SelectedIndex = ddlPlan1.Items.IndexOf(ddlPlan1.Items.FindByText(lbl1.Text));
        ViewState["Plan_id"] = gvPlan.DataKeys[index].Value;

        ModalPopupExtender2.Show();
      }
    }


    protected void btnUpdate_Click(object sender, EventArgs e)
    {
      var obj = new PlanModel();


      obj.Descr = descr.Text;
      obj.Deductable = Convert.ToDouble(dectVal.Text);

      obj.PlanName = ddlPlan.SelectedItem.Text;
      obj.PlanId = Convert.ToInt32(ViewState["Plan_id"]);

      var result = new PlanAction().Update(obj);

      if (result)
        Label1.Text = "Plan Has Been Updated Successfully!";
      else
        Label1.Text = "Error to delete -> " + result;

      BindData();
      udp.Update();
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
      var msg = Plan_DAL.Delete(Convert.ToInt32(ViewState["Plan_id"]));

      if (msg)
        Label1.Text = "Plan Has Been Deleted Successfully!";
      else
        Label1.Text = "Error to delete -> " + msg;

      BindData();

      udp.Update();
    }


    //DeleteItem (row.Cells[2].Text);


    protected void btnUCancel_Click(object sender, EventArgs e)
    {
    }

    protected void btnDCancel_Click(object sender, EventArgs e)
    {
    }
  }
}