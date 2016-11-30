using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InsuranceCompany.Helper
{
  class DbHelper
  {
    public static string GetConnectionString()
    {
      return ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();
    }
  }
}
