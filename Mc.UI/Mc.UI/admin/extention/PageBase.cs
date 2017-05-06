using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using Mc.Model;

namespace Mc.UI.admin.extention
{
    public class PageBase : Page
    {
        protected UserInfo currentUser = null;

        protected override void OnInit(EventArgs e)
        {
            if (Session["currentUser"] == null)
            {
                Response.Redirect("/admin/Login.aspx");
            }
            currentUser = Session["currentUser"] as UserInfo;
            base.OnInit(e);
        }
    }
}