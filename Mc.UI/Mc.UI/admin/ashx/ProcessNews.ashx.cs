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
    /// ProcessNews 的摘要说明
    /// </summary>
    public class ProcessNews : IHttpHandler
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
                    string author = context.Request.Form["author"];
                    string addTime = context.Request.Form["addTime"];
                    string content = context.Request.Form["content"];
                    string source = context.Request.Form["source"];
                    bool b = true;

                    CheckEmpty(out b, title, author, addTime, content, source);
                    if (!b)
                    {
                        context.Response.Write("empty");
                        return;
                    }
                    Mc.Model.News news = new Model.News()
                    {
                        Title = title,
                        Author = author,
                        Addtime = Convert.ToDateTime(addTime),
                        Content = content,
                        Source = source,
                        LinkAddress = "www.baidu.com"
                    };
                    try
                    {
                        int count = NewsManage.Add(news);
                        if (count > 0)
                        {
                            context.Response.Write("ok");
                        }
                    }
                    catch (Exception ex)
                    {
                        LogHelper.WriteLog(typeof(ProcessNews), ex.Message);
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
                        string author = context.Request.Form["author"];
                        string addTime = context.Request.Form["addTime"];
                        string content = context.Request.Form["content"];
                        string source = context.Request.Form["source"];
                        Mc.Model.News news = NewsManage.GetById(uid);
                        if (news != null)
                        {
                            news.Title = title;
                            news.Author = author;
                            news.Addtime = Convert.ToDateTime(addTime);
                            news.Content = content;
                            news.Source = source;
                            try
                            {
                                int count = NewsManage.Modify(news);
                                if (count > 0)
                                {
                                    context.Response.Write("yes");
                                }
                            }
                            catch (Exception ex)
                            {
                                LogHelper.WriteLog(typeof(ProcessNews), ex.Message);
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
                        Mc.Model.News news = NewsManage.GetById(uid);
                        if (news != null)
                        {
                            context.Response.Write(new JavaScriptSerializer().Serialize(news));
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
                            int count = NewsManage.Delete(uid);
                            if (count > 0)
                            {
                                context.Response.Write("ok");
                            }
                        }
                        catch (Exception ex)
                        {
                            LogHelper.WriteLog(typeof(ProcessNews), ex.Message);
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