using System;
using System.Collections.Generic;
using InsuranceCompany.BAL.Actions.Interface;
using InsuranceCompany.BAL.Model;
using InsuranceCompany.DAL;

namespace InsuranceCompany.BAL.Actions
{
  public class MemberAction : IAction<MemberModel>, IMember
  {
    public bool Insert(MemberModel o)
    {
      return Member_DAL.Insert(o);
    }

    public bool Delete(int id)
    {
      return Member_DAL.Delete(id);
    }



    public bool Update(MemberModel o)
    {
      return Member_DAL.Update(o);
    }

    public IEnumerable<MemberModel> Get()
    {
      return Member_DAL.GetAll();
    }

    public IEnumerable<MemberModel> Get(int id)
    {
      throw new NotImplementedException();
    }

    public IEnumerable<object> GetPlanWithId()
    {
      throw new NotImplementedException();
    }
  }
}