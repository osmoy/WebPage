using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Mc.UI.Utility;
using Mc.BLL;
using System.Web.Script.Serialization;

namespace Mc.UI.admin.ashx
{
    /// <summary>
    /// ProcessCase 的摘要说明
    /// </summary>
    public class ProcessCase : IHttpHandler
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
                    string title = context.Request.Form["title"];
                    string content = context.Request.Form["hidContent"];
                    string uploadFile = context.Request.Form["hidImgPath"];
                    bool b = true;

                    CheckEmpty(out b, title, content, uploadFile);
                    if (!b)
                    {
                        context.Response.Write("empty");
                        return;
                    }
                    Mc.Model.CaseInfo caseInfo = new Model.CaseInfo()
                    {
                        Title = title,
                        Content = content,
                        ImgPath = uploadFile
                    };
                    try
                    {
                        int count = CaseInfoManage.Add(caseInfo);
                        if (count > 0)
                        {
                            context.Response.Write("ok");
                        }
                    }
                    catch (Exception ex)
                    {
                        LogHelper.WriteLog(typeof(ProcessCase), ex.Message);
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
                        string title = context.Request.Form["title"];
                        string content = context.Request.Form["content"];
                        string uploadFile = context.Request.Form["hidImgPath"];

                        Mc.Model.CaseInfo caseInfo = CaseInfoManage.GetById(uid);
                        if (caseInfo != null)
                        {
                            caseInfo.Title = title;
                            caseInfo.Content = content;
                            caseInfo.ImgPath = uploadFile;
                            try
                            {
                                int count = CaseInfoManage.Modify(caseInfo);
                                if (count > 0)
                                {
                                    context.Response.Write("yes");
                                }
                            }
                            catch (Exception ex)
                            {
                                LogHelper.WriteLog(typeof(ProcessCase), ex.Message);
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
                        Mc.Model.CaseInfo caseInfo = CaseInfoManage.GetById(uid);
                        if (caseInfo != null)
                        {
                            context.Response.Write(new JavaScriptSerializer().Serialize(caseInfo));
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
                            int count = CaseInfoManage.Delete(uid);
                            if (count > 0)
                            {
                                context.Response.Write("ok");
                            }
                        }
                        catch (Exception ex)
                        {
                            LogHelper.WriteLog(typeof(ProcessCase), ex.Message);
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
        /// 校验非空
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