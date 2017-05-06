using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mc.BLL;
using Mc.Model;
using Mc.UI.admin.extention;

namespace Mc.UI.admin
{
    public partial class UserList : PageBase
    {
        protected IEnumerable<UserInfo> allUser;
        protected int pageSize = 5;
        protected string pageBar = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //查询所有用户
                //allUser = UserInfoManage.GetAll();

                string page = Request.QueryString["pageIndex"];
                int totalCount;
                int pageIndex = string.IsNullOrEmpty(page) ? 1 : Convert.ToInt32(page);
                allUser = UserInfoManage.GetByPaging(pageIndex, pageSize, out totalCount);
                int totalPage = (int)Math.Ceiling((double)totalCount / pageSize);   //总页数

                pageBar = Utility.Paging.PageList(pageIndex, totalPage);
            }
        }
    }
}