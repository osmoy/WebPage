using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mc.BLL;
using Mc.UI.admin.extention;

namespace Mc.UI.admin
{
    public partial class NewsList : PageBase
    {
        protected IEnumerable<Mc.Model.News> allNews;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //查询所有信息
                allNews = NewsManage.GetAll();
            }
        }
    }
}