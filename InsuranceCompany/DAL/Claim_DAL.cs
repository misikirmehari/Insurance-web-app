using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using InsuranceCompany.BAL.Model;
using InsuranceCompany.Helper;
using System.Data;

namespace InsuranceCompany.DAL
{
  public class Claim_DAL
  {
    public static bool Insert(ClaimModel obj)
    {
      var result = false;
      SqlConnection conn = null;
      try
      {
        var conStr = DbHelper.GetConnectionString();
        var query = "usp_claim_insert";
        conn = new SqlConnection(conStr);
        var cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("member_id", obj.MemberId);
        cmd.Parameters.AddWithValue("Claim_Date", obj.ClaimDate);
        cmd.Parameters.AddWithValue("Due_Date", obj.DueDate);
        cmd.Parameters.AddWithValue("Claim_Amount", obj.ClaimAmount);


        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        result = cmd.ExecuteNonQuery() > 0 ? true : false;
        conn.Close();
      }

      catch (Exception ex)
      {
        Console.WriteLine("An error occurred to insert: '{0}'", ex);
      }
      finally
      {
        conn?.Close();
      }
      return result;
    }


    public static bool Update(ClaimModel obj)
    {
      bool result = false;
      SqlConnection conn = null;
      try
      {
        string conStr = DbHelper.GetConnectionString();
        string query = "usp_Claim_Update";
        conn = new SqlConnection(conStr);
        SqlCommand cmd = new SqlCommand(query, conn);


        cmd.Parameters.AddWithValue("@Claim_Date", obj.ClaimDate);
        cmd.Parameters.AddWithValue("@Due_Date", obj.DueDate);
        cmd.Parameters.AddWithValue("@Claim_Amount", obj.ClaimAmount);
        cmd.Parameters.AddWithValue("@member_id", obj.MemberId);
        cmd.Parameters.AddWithValue("@Claim_id", obj.ClaimId);

        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        conn.Open();
        result = cmd.ExecuteNonQuery() > 0 ? true : false;
        conn.Close();
      }

      catch (Exception ex)
      {
        Console.WriteLine("An error occurred to update: '{0}'", ex);
        Console.ReadKey();
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
        var query = "usp_claim_delete";
        conn = new SqlConnection(conStr);
        var cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("@Claim_id", id);

        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        result = cmd.ExecuteNonQuery() > 0 ? true : false;
        conn.Close();
      }

      catch (Exception ex)
      {
        Console.WriteLine("An error occurred to delete: '{0}'", ex);
      }
      finally
      {
        conn?.Close();
      }
      return result;
    }


    public static ICollection<ClaimModel> GetAll()
    {
      ICollection<ClaimModel> results = new List<ClaimModel>();
      var conStr = DbHelper.GetConnectionString();
      var query = "usp_claim_retrieve";
      using (var conn = new SqlConnection(conStr))
      {
        var cmd = new SqlCommand(query, conn);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataReader dr = null;
        conn.Open();
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
          var obj = new ClaimModel();
          obj.ClaimId = Convert.ToInt32(dr["ID"]);
          obj.MemberId = Convert.ToInt32(dr["member_id"]);
          obj.ClaimDate = Convert.ToDateTime(dr["claim_date"]).ToShortDateString();
          obj.DueDate = Convert.ToDateTime(dr["claim_due_date"]).ToShortDateString();
          obj.ClaimAmount = Convert.ToDouble(dr["claim_amount"]);
          obj.Member.FirstName = dr["member_fname"].ToString();
          obj.Member.Lastname = dr["member_lname"].ToString();
          obj.Member.MemberId = Convert.ToInt32(dr["member_id"]);

          results.Add(obj);
        }
      }

      return results;
    }


  }
}
