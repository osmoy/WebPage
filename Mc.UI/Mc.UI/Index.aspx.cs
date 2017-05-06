using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mc.BLL;

namespace Mc.UI
{
    public partial class Index : System.Web.UI.Page
    {
        protected IEnumerable<Mc.Model.News> allNews = null;
        protected IEnumerable<Mc.Model.CaseInfo> allCase = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                allNews = NewsManage.GetAll();
                Repeater1.DataSource = allNews;
                Repeater1.DataBind();

                //查询所有信息
                allCase = CaseInfoManage.GetAll();
                RepCase.DataSource = allCase;
                RepCase.DataBind();
            }
        }
    }
}