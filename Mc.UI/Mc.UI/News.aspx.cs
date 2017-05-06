using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mc.BLL;
using mm= Mc.Model;

namespace Mc.UI
{
    public partial class News : System.Web.UI.Page
    {
        protected IEnumerable<mm.News> allNews = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                allNews = NewsManage.GetAll();
                Repeater1.DataSource = allNews;
                Repeater1.DataBind();
            }
        }
    }
}