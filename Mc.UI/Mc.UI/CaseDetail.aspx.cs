using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mc.BLL;
using Mc.Model;

namespace Mc.UI
{
    public partial class CaseDetail : System.Web.UI.Page
    {
        protected CaseInfo caseInfo = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string cId = Request.QueryString["id"];
                if (string.IsNullOrEmpty(cId))
                {
                    return;
                }
                caseInfo = CaseInfoManage.GetById(Convert.ToInt32(cId));

            }
        }
    }
}