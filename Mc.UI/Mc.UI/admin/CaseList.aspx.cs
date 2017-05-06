﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mc.BLL;
using Mc.UI.admin.extention;

namespace Mc.UI.admin
{
    public partial class CaseList : PageBase
    {
        protected IEnumerable<Mc.Model.CaseInfo> allCase;
        protected int pageSize = 5;
        protected string pageBar = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //查询所有信息
                //allCase = CaseInfoManage.GetAll();

                string page = Request.QueryString["pageIndex"];
                int totalCount;
                int pageIndex = string.IsNullOrEmpty(page) ? 1 : Convert.ToInt32(page);
                allCase = CaseInfoManage.GetByPaging(pageIndex, pageSize, out totalCount);
                int totalPage = (int)Math.Ceiling((double)totalCount / pageSize);   //总页数

                pageBar = Utility.Paging.PageList(pageIndex, totalPage);
            }
        }
    }
}