using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mc.BLL;
using Mc.Model;
using Mc.UI.Utility;
using Mc.UI.admin.extention;

namespace Mc.UI.admin
{
    public partial class Setting : PageBase
    {
        protected string coName = string.Empty;
        protected string servicePhone = string.Empty;
        protected string coFax = string.Empty;
        protected string coEmail = string.Empty;
        protected string coAddress = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                servicePhone = SettingManage.GetValue("售后服务热线");
                coName = SettingManage.GetValue("公司名称");
                coFax = SettingManage.GetValue("公司传真");
                coEmail = SettingManage.GetValue("公司邮箱");
                coAddress = SettingManage.GetValue("公司地址");
            }
            else
            {
                string phone = Request.Form["txtPhone"];
                string fax = Request.Form["txtFax"];
                string mail = Request.Form["txtMail"];
                string address = Request.Form["txtAddress"];
                string name = Request.Form["txtName"];

                try
                {
                    SettingManage.SetValue("售后服务热线", phone);
                    SettingManage.SetValue("公司名称", fax);
                    SettingManage.SetValue("公司传真", mail);
                    SettingManage.SetValue("公司邮箱", address);
                    SettingManage.SetValue("公司地址", name);
                    Response.Write("<script type='text/javascript'>alert('修改成功') </script>");
                }
                catch (Exception ex)
                {
                    LogHelper.WriteLog(typeof(Setting), ex.Message);
                }
            }
        }
    }
}