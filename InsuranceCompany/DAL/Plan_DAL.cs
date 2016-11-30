using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using InsuranceCompany.BAL.Model;
using InsuranceCompany.Helper;

namespace InsuranceCompany.DAL
{
  public class Plan_DAL
  {
    public static bool Insert(PlanModel o)
    {
      var result = false;
      SqlConnection conn = null;
      try
      {
        var conStr = DbHelper.GetConnectionString();
        var query = "usp_plan_insert";

        conn = new SqlConnection(conStr);
        var cmd = new SqlCommand(query, conn);

        cmd.Parameters.AddWithValue("PlanName", o.PlanName);
        cmd.Parameters.AddWithValue("PlanDescr", o.Descr);
        cmd.Parameters.AddWithValue("PlanDeduct", o.Deductable);

        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();

        result = cmd.ExecuteNonQuery() > 0 ? true : false;
      }

      catch (Exception ex)
      {
        
      }


      finally
      {
        conn?.Close();
      }
      return result;
    }


    public static bool Update(PlanModel obj)
    {
      var result = false;
      SqlConnection conn = null;
      try
      {
        var conStr = DbHelper.GetConnectionString();
        var query = "usp_plan_update";
        conn = new SqlConnection(conStr);
        var cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("PlanId", obj.PlanId);
        cmd.Parameters.AddWithValue("PlanName", obj.PlanName);
        cmd.Parameters.AddWithValue("PlanDescr", obj.Descr);
        cmd.Parameters.AddWithValue("PlanDeduct", obj.Deductable);

        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        result = cmd.ExecuteNonQuery() > 0 ? true : false;
        conn.Close();
      }

      catch (Exception ex)
      {
       
      }
      finally
      {
        conn?.Close();
      }
      return result;
    }




    public static bool Delete(int id)
    {
      var result = false;
      SqlConnection conn = null;
      try
      {
        var conStr = DbHelper.GetConnectionString();
        var query = "usp_plan_delete";
        conn = new SqlConnection(conStr);
        var cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("@Plan_id", id);

        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        result = cmd.ExecuteNonQuery() > 0 ? true : false;
        conn.Close();
      }

      catch (Exception ex)
      {
        
      }
      finally
      {
        conn?.Close();
      }
      return result;
    }

    
    public static ICollection<PlanModel> GetAll()
    {
      ICollection<PlanModel> results = new List<PlanModel>();
      var conStr = DbHelper.GetConnectionString();
      var query = "usp_plan_GetAll";
      using (var conn = new SqlConnection(conStr))
      {
        var cmd = new SqlCommand(query, conn);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataReader dr = null;
        conn.Open();
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
          var obj = new PlanModel();
          obj.PlanId = Convert.ToInt32(dr["ID"]);
          obj.PlanName = dr["plan_Name"].ToString();
          obj.Descr = dr["plan_descr"].ToString();
          obj.Deductable = Convert.ToDouble(dr["plan_deduct"]);
          results.Add(obj);
        }
      }

      return results;
    }
  }
}
