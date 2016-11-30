using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InsuranceCompany.BAL.Actions
{
  public abstract class Actions
  {
    public abstract bool Insert(object o);
    public abstract bool Delete(int id);
    public abstract bool Update(object o);
    public abstract IEnumerable<object> Get();
    public abstract object Get(int id);
    public virtual int GetCount(IEnumerable<object> o)
    {
      if (o == null)
        return 0;
      else
        return o.Count();
    }
  }
}
