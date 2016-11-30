using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using InsuranceCompany.BAL.Model;
using InsuranceCompany.Helper;

namespace InsuranceCompany.DAL
{
  public class Member_DAL
  {
    public static bool Insert(MemberModel obj)
    {
      var result = false;
      SqlConnection conn = null;
      try
      {
        var conStr = DbHelper.GetConnectionString();
        var query = "usp_member_insert";
        conn = new SqlConnection(conStr);
        var cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("FName", obj.FirstName);
        cmd.Parameters.AddWithValue("LName", obj.Lastname);
        cmd.Parameters.AddWithValue("DOB", obj.Dob);
        cmd.Parameters.AddWithValue("Gender", obj.Gender);
        cmd.Parameters.AddWithValue("UserName", obj.Username);
        cmd.Parameters.AddWithValue("Plan_id", obj.PlanId);

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


    public static bool Update(MemberModel obj)
    {
      bool result = false;
      SqlConnection conn = null;
      try
      {
        string conStr = DbHelper.GetConnectionString();
        string query = "usp_Member_Update";
        conn = new SqlConnection(conStr);
        SqlCommand cmd = new SqlCommand(query, conn);


        cmd.Parameters.AddWithValue("FName", obj.FirstName);
        cmd.Parameters.AddWithValue("LName", obj.Lastname);
        cmd.Parameters.AddWithValue("DOB", obj.Dob);
        cmd.Parameters.AddWithValue("Gender", obj.Gender);
        cmd.Parameters.AddWithValue("UserName", obj.Username);
        cmd.Parameters.AddWithValue("Plan_id", obj.PlanId);
        cmd.Parameters.AddWithValue("member_id", obj.MemberId);


        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        conn.Open();
        result = cmd.ExecuteNonQuery() > 0 ? true : false;
        conn.Close();
      }

      catch (Exception ex)
      {
        Console.WriteLine("An error occurred to update: '{0}'", ex);
      }
      finally
      {
        conn?.Close();
      }
      return result;
    }

    public static bool Delete(int id)
    {
      bool result = false;
      SqlConnection conn = null;
      try
      {
        string conStr = DbHelper.GetConnectionString();
        string query = "usp_member_delete";
        conn = new SqlConnection(conStr);
        SqlCommand cmd = new SqlCommand(query, conn);

        cmd.Parameters.AddWithValue("@member_id", id);


        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        result = cmd.ExecuteNonQuery() > 0 ? true : false;

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


    public static ICollection<MemberModel> GetAll()
    {
      ICollection<MemberModel> results = new List<MemberModel>();
      var conStr = DbHelper.GetConnectionString();
      var query = "usp_member_retrieve";
      using (var conn = new SqlConnection(conStr))
      {
        var cmd = new SqlCommand(query, conn);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataReader dr = null;
        conn.Open();
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
          var obj = new MemberModel();
          obj.MemberId = Convert.ToInt32(dr["ID"]);
          obj.FirstName = dr["member_fname"].ToString();
          obj.Lastname = dr["member_lname"].ToString();
          obj.Dob = Convert.ToDateTime(dr["member_DOB"]).Date.ToShortDateString();
          obj.Gender = dr["member_gender"].ToString();
          obj.Username = dr["member_username"].ToString();
          obj.Plan.PlanName = dr["Plan_Name"].ToString();
          results.Add(obj);
        }
      }

      return results;
    }
  }
}

