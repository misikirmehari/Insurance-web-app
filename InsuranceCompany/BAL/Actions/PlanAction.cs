using System;
using System.Collections.Generic;
using System.Linq;
using InsuranceCompany.BAL.Actions.Interface;
using InsuranceCompany.BAL.Model;
using InsuranceCompany.DAL;

namespace InsuranceCompany.BAL.Actions
{
  public class PlanAction : IAction<PlanModel>, IPlan
  {
    public bool Insert(PlanModel o)
    {
      bool result = false;
      if (o == null)
        return result;
      else
      {
        //todo Apply my business logic if any or call DAL.
        if (string.IsNullOrEmpty(o.PlanName) || o.PlanName.Length <= 1)
          return result;
        else

          return result = Plan_DAL.Insert(o);
      }
    }

    public bool Delete(int id)
    {
      return Plan_DAL.Delete(id);
    }

    public bool Update(PlanModel o)
    {
      return Plan_DAL.Update(o);
    }

    public IEnumerable<PlanModel> Get(int id)
    {
      return Plan_DAL.GetAll().Where(s => s.PlanId == id);
    }

    public IEnumerable<PlanModel> Get()
    {
      return Plan_DAL.GetAll();
    }

    public IEnumerable<object> GetMemberWithPlanIdCount()
    {
      throw new NotImplementedException();
    }

    public IEnumerable<object> GetMemberWithNoPlanIdCount()
    {
      throw new NotImplementedException();
    }
  }
}

