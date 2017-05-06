using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Mc.Model;
using Mc.BLL;
using System.Web.Script.Serialization;
using Mc.UI.Utility;

namespace Mc.UI.admin.ashx
{
    /// <summary>
    /// ProcessUser 的摘要说明
    /// </summary>
    public class ProcessUser : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string action = context.Request["Action"];
            string id = context.Request["Uid"];
            int uid = 0;
            if (!string.IsNullOrEmpty(action))
            {
                if (action == "add")
                {
                    string loginId = context.Request.Form["loginId"];
                    string loginPwd = context.Request.Form["loginPwd"];
                    string rePwd = context.Request.Form["confirmPwd"];
                    string realName = context.Request.Form["realName"];
                    string tel = context.Request.Form["tel"];
                    string birthday = context.Request.Form["birthday"];
                    bool b = true;

                    CheckEmpty(out b, loginId, loginPwd, rePwd, realName, tel, birthday);
                    if (!b)
                    {
                        context.Response.Write("empty");
                        return;
                    }
                    if (loginPwd != rePwd)
                    {
                        context.Response.Write("error");
                        return;
                    }
                    //todo:用户已存在 手机合法性
                    loginPwd = Common.CommonHelper.GetMd5(loginPwd + Common.CommonHelper.GetAppSalt());//密码处理
                    UserInfo user = new UserInfo()
                    {
                        LoginId = loginId,
                        LoginPwd = loginPwd,
                        RealName = realName,
                        Tel = tel,
                        Birthday = Convert.ToDateTime(birthday)
                    };
                    try
                    {
                        int count = UserInfoManage.Add(user);
                        if (count > 0)
                        {
                            context.Response.Write("ok");
                        }
                    }
                    catch (Exception ex)
                    {
                        LogHelper.WriteLog(typeof(ProcessUser), ex.Message);
                    }
                }
                else if (action == "modify")
                {
                    if (string.IsNullOrEmpty(id))
                    {
                        context.Response.Write("参数有误");
                        return;
                    }
                    if (int.TryParse(id, out uid))
                    {
                        string loginId = context.Request.Form["loginId"];
                        string realName = context.Request.Form["realName"];
                        string tel = context.Request.Form["tel"];
                        string birthday = context.Request.Form["birthday"];
                        UserInfo user = UserInfoManage.GetById(uid);
                        if (user != null)
                        {
                            user.LoginId = loginId;
                            user.RealName = realName;
                            user.Tel = tel;
                            user.Birthday = Convert.ToDateTime(birthday);
                            try
                            {
                                int count = UserInfoManage.Modify(user);
                                if (count > 0)
                                {
                                    context.Response.Write("yes");
                                }
                            }
                            catch (Exception ex)
                            {
                                LogHelper.WriteLog(typeof(ProcessUser), ex.Message);
                            }
                        }
                    }
                }
                else if (action == "detail")
                {
                    if (string.IsNullOrEmpty(id))
                    {
                        context.Response.Write("参数有误");
                        return;
                    }
                    if (int.TryParse(id, out uid))
                    {
                        UserInfo user = UserInfoManage.GetById(uid);
                        if (user != null)
                        {
                            context.Response.Write(new JavaScriptSerializer().Serialize(user));
                        }
                    }
                }
                else if (action == "delete")
                {
                    if (string.IsNullOrEmpty(id))
                    {
                        context.Response.Write("参数有误");
                        return;
                    }
                    if (int.TryParse(id, out uid))
                    {
                        try
                        {
                            int count = UserInfoManage.Delete(uid);
                            if (count > 0)
                            {
                                context.Response.Write("ok");
                            }
                        }
                        catch (Exception ex)
                        {
                            LogHelper.WriteLog(typeof(ProcessUser), ex.Message);
                        }
                    }
                }
                else
                {
                    context.Response.Write("action参数有误");
                }
            }
            else
            {
                context.Response.Write("action参数有误");
            }
        }

        /// <summary>
        /// 非空验证
        /// </summary>
        /// <param name="result"></param>
        /// <param name="strArr"></param>
        private void CheckEmpty(out bool result, params string[] strArr)
        {
            result = true;
            foreach (string str in strArr)
            {
                if (string.IsNullOrEmpty(str))
                {
                    result = false;
                }
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