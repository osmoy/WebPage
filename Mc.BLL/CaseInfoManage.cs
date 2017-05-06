using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Mc.Model;
using Mc.DLL;

namespace Mc.BLL
{
    public class CaseInfoManage
    {
        public static IEnumerable<CaseInfo> GetAll()
        {
            return new CaseInfoDAL().GetAll();
        }

        public static int Add(CaseInfo caseInfo)
        {
            return new CaseInfoDAL().Add(caseInfo);
        }

        public static int Delete(int id)
        {
            return new CaseInfoDAL().Delete(id);
        }

        public static int Modify(CaseInfo caseInfo)
        {
            return new CaseInfoDAL().Modify(caseInfo);
        }

        public static CaseInfo GetById(int id)
        {
            return new CaseInfoDAL().GetById(id);
        }

        public static IEnumerable<CaseInfo> GetByPaging(int pageIndex, int pageSize, out int totalCount)
        {
            return new CaseInfoDAL().GetByPaging(pageIndex, pageSize, out totalCount);
        }
    }
}