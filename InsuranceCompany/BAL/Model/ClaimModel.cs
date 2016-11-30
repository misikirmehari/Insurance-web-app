

namespace InsuranceCompany.BAL.Model
{
  public class ClaimModel
  {
    public int ClaimId { get; set; }
    public int MemberId { get; set; }
    public string ClaimDate { get; set; }
    public string DueDate { get; set; }
    public double ClaimAmount { get; set; }
    public MemberModel Member { get; set; }

    public ClaimModel()
    {
      ClaimDate = string.Empty;
      DueDate = string.Empty;
      Member = new MemberModel();
    }


    public ClaimModel(int memid, string claimdate, string duedate, double claimamount)
    {
      MemberId = memid;
      ClaimDate = claimdate;
      DueDate = duedate;
      ClaimAmount = claimamount;
    }
  }
}
