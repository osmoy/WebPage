using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using Mc.Model;

namespace Mc.DLL
{
    public class CaseInfoDAL
    {
        /// <summary>
        /// 查询所有案例信息
        /// </summary>
        /// <returns></returns>
        public IEnumerable<CaseInfo> GetAll()
        {
            IList<CaseInfo> list = null;
            string sql = "select [Id],Title,Content,ImgPath from T_Case where IsDeleted=0";
            SqlDataReader reader = SqlHelper.ExecuteReader(sql, CommandType.Text);
            using (reader)
            {
                if (reader.HasRows)
                {
                    list = new List<CaseInfo>();
                    while (reader.Read())
                    {
                        CaseInfo caseInfo = ToModel(reader);
                        list.Add(caseInfo);
                    }
                }
            }
            return list;
        }

        /// <summary>
        /// 创建model
        private CaseInfo ToModel(SqlDataReader reader)
        {
            return new CaseInfo()
            {
                Id = reader.GetInt32(0),
                Title = reader.GetString(1),
                Content = reader.GetString(2),
                ImgPath = reader.GetString(3),
            };
        }

        /// <summary>
        /// 添加案例
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public int Add(CaseInfo caseInfo)
        {
            string sql = "insert into T_Case values(@Title,@Content,@ImgPath,0)";
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,
                new SqlParameter("@Title", caseInfo.Title), new SqlParameter("@Content", caseInfo.Content),
                new SqlParameter("@ImgPath", caseInfo.ImgPath));
        }

        /// <summary>
        /// 根据id软删
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public int Delete(int id)
        {
            return SqlHelper.ExecuteNonQuery("update T_Case set IsDeleted=1 where Id=@Id", CommandType.Text,
                new SqlParameter("@Id", id));
        }

        /// <summary>
        /// 修改案例
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public int Modify(CaseInfo caseInfo)
        {
            return SqlHelper.ExecuteNonQuery(@"update T_Case set Title=@Title,Content=@Content,
                ImgPath=@ImgPath where Id=@Id", CommandType.Text,
                new SqlParameter("@Title", caseInfo.Title), new SqlParameter("@Id", caseInfo.Id),
                new SqlParameter("@Content", caseInfo.Content), new SqlParameter("@ImgPath", caseInfo.ImgPath));
        }

        /// <summary>
        /// 根据id查询案例信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public CaseInfo GetById(int id)
        {
            CaseInfo caseInfo = null;
            SqlDataReader reader = SqlHelper.ExecuteReader(@"select [Id],Title,Content,ImgPath from T_Case 
                where Id=@Id", CommandType.Text, new SqlParameter("@Id", id));
            using (reader)
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        caseInfo = ToModel(reader);
                    }
                }
            }
            return caseInfo;
        }

        /// <summary>
        /// 分页
        /// </summary>
        /// <param name="pageIndex">页码</param>
        /// <param name="pageSize">页容量</param>
        /// <param name="totalCount">总记录数</param>
        /// <returns>分页数据，总记录数</returns>
        public IEnumerable<CaseInfo> GetByPaging(int pageIndex, int pageSize, out int totalCount)
        {
            IList<CaseInfo> list = null;
            string sql = @"select top 5 * from T_Case where IsDeleted=0 and Id not in
                (
                select top {0} [Id] from T_Case where IsDeleted=0 order by Id
                )
                order by Id";
            sql = string.Format(sql, (pageIndex - 1) * pageSize);
            SqlDataReader reader = SqlHelper.ExecuteReader(sql, CommandType.Text);
            if (reader.HasRows)
            {
                list = new List<CaseInfo>();
                while (reader.Read())
                {
                    CaseInfo caseInfo = ToModel(reader);
                    list.Add(caseInfo);
                }
            }
            totalCount = (int)SqlHelper.ExecuteScalar("select count(0) from T_Case where IsDeleted=0", CommandType.Text);
            return list;
        }

    }
}