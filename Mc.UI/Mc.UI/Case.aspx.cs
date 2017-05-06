using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mc.Model;
using Mc.BLL;

namespace Mc.UI
{
    public partial class Case : System.Web.UI.Page
    {
        protected IEnumerable<CaseInfo> allCase = null;
        protected int pageSize = 5;
        protected string pageBar = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //allCase = CaseInfoManage.GetAll();
                string page = Request.QueryString["pageIndex"];
                int totalCount;
                int pageIndex = string.IsNullOrEmpty(page) ? 1 : Convert.ToInt32(page);
                allCase = CaseInfoManage.GetByPaging(pageIndex, pageSize, out totalCount);
                caseLi.DataSource = allCase;
                caseLi.DataBind();

                int totalPage = (int)Math.Ceiling((double)totalCount / pageSize);   //总页数
                pageBar = Utility.Paging.PageList(pageIndex, totalPage);
            }
        }
    }
}