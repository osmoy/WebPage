using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Mc.DLL;
using Mc.Model;

namespace Mc.BLL
{
    public class NewsManage
    {
        ///获取所有分类
        public static IEnumerable<News> GetAll()
        {
            return new NewsDAL().GetAll();  
        }

        /// <summary>
        /// 分页查询
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="totalPage"></param>
        /// <returns></returns>
        public static IEnumerable<News> GetByPaging(int pageIndex, int pageSize, out int totalPage)
        {
            return new NewsDAL().GetByPaging(pageIndex, pageSize, out totalPage);
        }

        public static News GetById(int id)
        {
            return new NewsDAL().GetById(id);
        }

        public static int Delete(int id)
        {
            return new NewsDAL().Delete(id);
        }

        public static int Modify(News news)
        {
            return new NewsDAL().Modify(news);
        }

        public static int Add(News news)
        {
            return new NewsDAL().Add(news);
        }
    }
}
