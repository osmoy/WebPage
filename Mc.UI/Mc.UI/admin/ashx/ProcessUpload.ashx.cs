using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using Mc.Common;

namespace Mc.UI.admin.ashx
{
    /// <summary>
    /// ProcessUpload 的摘要说明
    /// </summary>
    public class ProcessUpload : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            HttpPostedFile uploadFile = context.Request.Files["uploadfile"];
            if (uploadFile != null && uploadFile.ContentLength > 0)
            {
                string fileName = Path.GetFileName(uploadFile.FileName);
                string fileEx = Path.GetExtension(uploadFile.FileName);
                if (fileEx == ".jpg" || fileEx == ".png" || fileEx == ".gif" || fileEx == ".bmp")
                {
                    string dir = "/upload/" + DateTime.Now.Year + DateTime.Now.Month + DateTime.Now.Day + '/';
                    Directory.CreateDirectory(Path.GetDirectoryName(context.Server.MapPath(dir)));
                    string path = dir + CommonHelper.GetMd5(uploadFile.InputStream) + fileEx;
                    uploadFile.SaveAs(context.Server.MapPath(path));
                    context.Response.Write(path);
                }
                else
                {
                    context.Response.Write("error");
                }
            }
            else
            {
                context.Response.Write("empty");
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