using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mc.BLL;
using Mc.Model;
using Mc.Common;

namespace Mc.UI.admin
{
    public partial class Login : System.Web.UI.Page
    {

        protected UserInfo currentUser;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                #region 校验登陆
                //string loginName = Request["LoginName"];
                //string loginPwd = Request["LoginPwd"];
                //string vCode = Request["Vcode"];
                //if (string.IsNullOrEmpty(loginName))
                //{
                //    Response.Write("用户名不能为空");
                //    return;
                //}
                //if (string.IsNullOrEmpty(loginPwd))
                //{
                //    Response.Write("密码不能为空");
                //    return;
                //}
                //if (string.IsNullOrEmpty(vCode))
                //{
                //    Response.Write("验证码不能为空");
                //    return;
                //}
                //loginPwd = CommonHelper.GetMd5(loginPwd + CommonHelper.GetAppSalt());   //处理用户密码
                //Model.Enum.LoginState status = UserInfoManage.IsLogin(loginName, loginPwd, out currentUser);
                //switch (status)
                //{
                //    case Mc.Model.Enum.LoginState.用户名错误:
                //        Response.Write("1");
                //        break;
                //    case Mc.Model.Enum.LoginState.密码错误:
                //        Response.Write("2");
                //        break;
                //    case Mc.Model.Enum.LoginState.登陆成功:
                //        Session["currentUser"] = currentUser;   //保存当前登陆用户信息.
                //        Response.Write("ok");
                //        break;
                //}
                #endregion

                #region 测试添加数据
                //string loginName = Request["loginName"];
                //string loginPwd = Request["loginPwd"];
                //loginPwd = CommonHelper.GetMd5(loginPwd + CommonHelper.GetAppSalt());

                //UserInfo user = new UserInfo()
                //{
                //    LoginId = loginName,
                //    LoginPwd = loginPwd,
                //    RealName = "jason",
                //    Tel = "15588888888",
                //    Birthday = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"))
                //};
                //int i = UserInfoManage.Add(user);
                //if (i > 0)
                //{
                //    Response.Write("ok");
                //}
                #endregion
            }
        }

    }
}