using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace Mc.UI.admin.ashx
{
    /// <summary>
    /// ExitSys 的摘要说明
    /// </summary>
    public class ExitSys : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            if (context.Session["currentUser"] != null)
            {
                context.Session.Remove("currentUser");  //清除当前登录用户
                context.Session.Abandon();
                context.Response.Write("ok");
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}