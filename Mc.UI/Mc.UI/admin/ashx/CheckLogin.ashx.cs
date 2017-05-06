using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Mc.Common;
using Mc.Model;
using Mc.BLL;
using System.Web.SessionState;

namespace Mc.UI.admin.ashx
{
    /// <summary>
    /// CheckLogin 的摘要说明
    /// </summary>
    public class CheckLogin : IHttpHandler, IRequiresSessionState
    {
        private UserInfo currentUser;

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string loginName = context.Request["LoginName"];
            string loginPwd = context.Request["LoginPwd"];
            string vCode = context.Request["Vcode"];
            if (string.IsNullOrEmpty(loginName))
            {
                context.Response.Write("用户名不能为空");
                return;
            }
            if (string.IsNullOrEmpty(loginPwd))
            {
                context.Response.Write("密码不能为空");
                return;
            }
            if (string.IsNullOrEmpty(vCode))
            {
                context.Response.Write("验证码不能为空");
                return;
            }
            if (context.Session["vCode"] != null && context.Session["vCode"].ToString() != vCode)
            {
                context.Response.Write("3");
                return;
            }

            loginPwd = CommonHelper.GetMd5(loginPwd + CommonHelper.GetAppSalt());   //处理用户密码
            Model.Enum.LoginState status = UserInfoManage.IsLogin(loginName, loginPwd, out currentUser);
            switch (status)
            {
                case Mc.Model.Enum.LoginState.用户名错误:
                    context.Response.Write("1");
                    context.Session["vCode"] = null;    //清空验证码
                    break;
                case Mc.Model.Enum.LoginState.密码错误:
                    context.Response.Write("2");
                    context.Session["vCode"] = null;
                    break;
                case Mc.Model.Enum.LoginState.登陆成功:
                    context.Session["currentUser"] = currentUser;   //保存当前登陆用户信息.
                    context.Response.Write("ok");
                    break;
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