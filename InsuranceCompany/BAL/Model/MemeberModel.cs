
namespace InsuranceCompany.BAL.Model
{
  public class MemberModel
  {
    public int MemberId { get; set; }
    public string FirstName { get; set; }
    public string Lastname { get; set; }
    public string Dob { get; set; }
    public string Gender { get; set; }
    public string Username { get; set; }
    public int PlanId { get; set; }
    public PlanModel Plan { get; set; }


    public MemberModel()
    {
      FirstName = string.Empty;
      Lastname = string.Empty;
      Dob = string.Empty;
      Gender = string.Empty;
      Username = string.Empty;
      Plan = new PlanModel();
    }
    public MemberModel(int planid, string firstname, string lastname, string dob, string gender, string username)
    {
      PlanId = planid;
      FirstName = firstname;
      Lastname = lastname;
      Dob = dob;
      Gender = gender;
      Username = username;

    }
  }
}
