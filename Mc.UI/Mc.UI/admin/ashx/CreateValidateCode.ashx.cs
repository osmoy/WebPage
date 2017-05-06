using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Mc.UI.Utility;
using System.Web.SessionState;
using System.Drawing;

namespace Mc.UI.admin.ashx
{
    /// <summary>
    /// CreateValidateCode 的摘要说明
    /// </summary>
    public class CreateValidateCode : IHttpHandler,IRequiresSessionState
    {
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "image/gif";
            string code = ValidataCode.CreateRandomCode(4);
            ///验证码放入session
            context.Session["vCode"] = code;
            byte[] img = ValidataCode.DrawImage(code, 20, background : Color.White);
            context.Response.BinaryWrite(img);
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