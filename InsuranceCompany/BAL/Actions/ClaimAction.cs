using System;
using System.Collections.Generic;
using InsuranceCompany.BAL.Actions.Interface;
using InsuranceCompany.BAL.Model;
using InsuranceCompany.DAL;

namespace InsuranceCompany.BAL.Actions
{
  public class ClaimAction : IAction <ClaimModel>, IClaim
  {
    public bool Insert(ClaimModel o)
    {
      return Claim_DAL.Insert(o);
    }

    public bool Delete(int id)
    {
      return Claim_DAL.Delete(id);
    }

    public bool Update(ClaimModel o)
    {
      return Claim_DAL.Update(o);
    }

    public IEnumerable<ClaimModel> Get()
    {
      return Claim_DAL.GetAll();
    }


    public IEnumerable<ClaimModel> Get(int id)
    {
      throw new NotImplementedException();
    }
  }
}