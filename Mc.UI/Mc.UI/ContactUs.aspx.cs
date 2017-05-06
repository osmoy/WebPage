using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mc.BLL;

namespace Mc.UI
{
    public partial class ContactUs : System.Web.UI.Page
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
        }
    }
}