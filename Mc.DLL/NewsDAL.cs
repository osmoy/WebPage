using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Mc.Model;
using System.Data;
using System.Data.SqlClient;

namespace Mc.DLL
{
    public class NewsDAL
    {
        /// <summary>
        /// 获取所有新闻
        /// </summary>
        /// <returns></returns>
        public IEnumerable<News> GetAll()
        {
            IList<News> list = null;
            string sql = "select [Id],ssfl,title,author,click,addtime,linkaddress,content,source from T_News";
            SqlDataReader reader = SqlHelper.ExecuteReader(sql, CommandType.Text);
            using (reader)
            {
                if (reader.HasRows)
                {
                    list = new List<News>();
                    while (reader.Read())
                    {
                        News news = ToModel(reader);
                        list.Add(news);
                    }
                }
            }
            return list;
        }

        ///封装model
        private News ToModel(SqlDataReader reader)
        {
            return new News()
            {
                Id = reader.GetInt32(0),
                Ssfl = reader.GetInt32(1),
                Title = reader.GetString(2),
                Author = reader.GetString(3),
                Click = reader.GetInt32(4),
                Addtime = reader.GetDateTime(5),
                LinkAddress = reader.GetString(6),
                Content = reader.GetString(7),
                Source = reader.GetString(8)
            };
        }

        /// <summary>
        /// 分页查询
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="totalPage"></param>
        /// <returns>分页查询结果以及总页数</returns>
        public IEnumerable<News> GetByPaging(int pageIndex, int pageSize, out int totalPage)
        {
            IList<News> list = null;
            string sql = @"select top 10 * from T_News where id >
                (select max(id) from
	                (select top @pageSize*@pageIndex [id] from T_News order by [id]) as t
                )
                order by [id]";
            SqlDataReader reader = SqlHelper.ExecuteReader(sql, CommandType.Text,
                new SqlParameter("@pageSize", pageSize), new SqlParameter("@pageIndex", pageIndex));
            using (reader)
            {
                if (reader.HasRows)
                {
                    list = new List<News>();
                    while (reader.Read())
                    {
                        News news = ToModel(reader);
                        list.Add(news);
                    }
                }
            }
            int totalCount = Convert.ToInt32(SqlHelper.ExecuteScalar("select count(*) from T_News", CommandType.Text));
            totalPage = Convert.ToInt32(Math.Ceiling((double)totalCount / pageSize));
            return list;
        }

        /// <summary>
        /// 根据id查询信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public News GetById(int id)
        {
            News news = null;
            SqlDataReader reader = SqlHelper.ExecuteReader(@"select[Id],ssfl,title,author,click,addtime,
                linkaddress,content,source from T_News where Id=@Id", CommandType.Text, new SqlParameter("@Id", id));
            using (reader)
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        news = ToModel(reader);
                    }
                }
            }
            return news;
        }

        /// <summary>
        /// 根据id删除
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public int Delete(int id)
        {
            return SqlHelper.ExecuteNonQuery("delete from T_News where Id=@Id", CommandType.Text,
                new SqlParameter("@Id", id));
        }

        /// <summary>
        /// 修改信息
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public int Modify(News news)
        {
            return SqlHelper.ExecuteNonQuery(@"update T_News set title=@title,author=@author,
                addtime=@addtime,content=@content,source=@source where Id=@Id", CommandType.Text,
                new SqlParameter("@title", news.Title), new SqlParameter("@author", news.Author),
                new SqlParameter("@addtime", news.Addtime), new SqlParameter("@content", news.Content),
                new SqlParameter("@source", news.Source), new SqlParameter("@Id", news.Id));
        }

        public int Add(News news)
        {
            return SqlHelper.ExecuteNonQuery(@"insert into T_News values(0,@title,@author,0,@addtime,
                @linkaddress,@content,@source)", CommandType.Text, new SqlParameter("@title", news.Title),
                new SqlParameter("@author", news.Author), new SqlParameter("@addtime", news.Addtime),
                new SqlParameter("@linkaddress", news.LinkAddress), new SqlParameter("@content", news.Content),
                new SqlParameter("@source", news.Source));
        }


    }
}
