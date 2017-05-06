using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Mc.Model;
using System.Data;
using System.Data.SqlClient;
using Mc.Model.Enum;

namespace Mc.DLL
{
    public class UserInfoDAL
    {
        /// <summary>
        /// 返回所有用户
        /// </summary>
        /// <returns></returns>
        public IEnumerable<UserInfo> GetAll()
        {
            IList<UserInfo> list = null;
            string sql = "select [Id],LoginId,LoginPwd,RealName,Tel,Birthday from T_User where IsDeleted=0";
            SqlDataReader reader = SqlHelper.ExecuteReader(sql, CommandType.Text);
            using (reader)
            {
                if (reader.HasRows)
                {
                    list = new List<UserInfo>();
                    while (reader.Read())
                    {
                        UserInfo news = ToModel(reader);
                        list.Add(news);
                    }
                }
            }
            return list;
        }

        /// <summary>
        /// 创建model
        private UserInfo ToModel(SqlDataReader reader)
        {
            return new UserInfo()
            {
                Id = reader.GetInt32(0),
                LoginId = reader.GetString(1),
                LoginPwd = reader.GetString(2),
                RealName = reader.GetString(3),
                Tel = reader.GetString(4),
                //reader.IsDBNull(5) ? null : (DateTime?)reader.GetDateTime(5)
                Birthday = (DateTime?)SqlHelper.FromDBNull(reader.GetDateTime(5))
            };
        }

        #region 判断登陆
        /// <summary>
        /// 是否登陆成功
        /// </summary>
        /// <param name="loginName"></param>
        /// <param name="loginPwd"></param>
        /// <param name="userInfo"></param>
        /// <returns></returns>
        public LoginState IsLogin(string loginName, string loginPwd, out UserInfo userInfo)
        {
            string sql = @"select count(0) from T_User where LoginId=@LoginId";
            int count = Convert.ToInt32(SqlHelper.ExecuteScalar(sql, CommandType.Text,
                new SqlParameter("@LoginId", loginName)));
            if (count <= 0)
            {
                userInfo = null;
                return LoginState.用户名错误;
            }
            else if (count > 1)
            {
                throw new Exception("查处多条loginId=" + loginName + "的用户");
            }
            else
            {
                UserInfo user = GetByLoginNameAndPwd(loginName, loginPwd);
                if (user == null)
                {
                    userInfo = null;
                    return LoginState.密码错误;
                }
                else
                {
                    userInfo = user;
                    return LoginState.登陆成功;
                }
            }
        }

        /// <summary>
        /// 根据登录名和密码查询用户
        /// </summary>
        /// <param name="loginName"></param>
        /// <param name="loginPwd"></param>
        /// <returns></returns>
        public UserInfo GetByLoginNameAndPwd(string loginName, string loginPwd)
        {
            UserInfo userInfo = null;
            SqlDataReader reader = SqlHelper.ExecuteReader(@"select [Id],LoginId,LoginPwd,RealName,Tel,Birthday from T_User 
                where LoginId=@LoginId and LoginPwd=@Loginpwd and IsDeleted=0", CommandType.Text,
                new SqlParameter("@LoginId", loginName), new SqlParameter("@LoginPwd", loginPwd));
            using (reader)
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        userInfo = ToModel(reader);
                    }
                }
            }
            return userInfo;
        }
        #endregion

        /// <summary>
        /// 添加用户
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public int Add(UserInfo user)
        {
            string sql = "insert into T_User values(@LoginId,@LoginPwd,@RealName,@Tel,@Birthday,0)";
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,
                new SqlParameter("@LoginId", user.LoginId), new SqlParameter("@LoginPwd", user.LoginPwd),
                new SqlParameter("@RealName", user.RealName), new SqlParameter("@Tel", user.Tel),
                new SqlParameter("@Birthday", user.Birthday));
        }

        /// <summary>
        /// 根据id软删
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public int Delete(int id)
        {
            return SqlHelper.ExecuteNonQuery("update T_User set IsDeleted=1 where Id=@Id", CommandType.Text,
                new SqlParameter("@Id", id));
        }

        /// <summary>
        /// 修改用户
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public int Modify(UserInfo user)
        {
            return SqlHelper.ExecuteNonQuery(@"update T_User set LoginId=@LoginId,RealName=@RealName,
                Tel=@Tel,Birthday=@Birthday where Id=@Id", CommandType.Text, new SqlParameter("@LoginId", user.LoginId),
                new SqlParameter("@RealName", user.RealName), new SqlParameter("@Tel", user.Tel),
                new SqlParameter("@Birthday", user.Birthday), new SqlParameter("@Id", user.Id));
        }

        /// <summary>
        /// 根据id查询用户
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public UserInfo GetById(int id)
        {
            UserInfo user = null;
            SqlDataReader reader = SqlHelper.ExecuteReader(@"select [Id],LoginId,LoginPwd,RealName,Tel,Birthday 
                from T_User where Id=@Id", CommandType.Text, new SqlParameter("@Id", id));
            using (reader)
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        user = ToModel(reader);
                    }
                }
            }
            return user;
        }

        /// <summary>
        /// 分页
        /// </summary>
        /// <param name="pageIndex">页码</param>
        /// <param name="pageSize">页容量</param>
        /// <param name="totalCount">总记录数</param>
        /// <returns>分页数据，总记录数</returns>
        public IEnumerable<UserInfo> GetByPaging(int pageIndex, int pageSize, out int totalCount)
        {
            IList<UserInfo> list = null;
            string sql = @"select top 5 * from T_User where IsDeleted=0 and Id not in
                (
                select top {0} [Id] from T_User where IsDeleted=0 order by Id
                )
                order by Id";
            sql = string.Format(sql, (pageIndex - 1) * pageSize);
            SqlDataReader reader = SqlHelper.ExecuteReader(sql, CommandType.Text);
            if (reader.HasRows)
            {
                list = new List<UserInfo>();
                while (reader.Read())
                {
                    UserInfo news = ToModel(reader);
                    list.Add(news);
                }
            }
            totalCount = (int)SqlHelper.ExecuteScalar("select count(0) from T_User where IsDeleted=0", CommandType.Text);
            return list;
        }

        #region row_Number
        /// <summary>
        /// 分页展示
        /// </summary>
        public List<UserInfo> PagingList(int pageIndex, int pageSize, int deptId, out int totalCount)
        {
            List<UserInfo> list = null;
            string sql = @"select * from
                (
                select *,row_number() over (oder by id desc)as num from T_User{0}
                )as s 
                where s.num between @start and @end";
            sql = string.Format(sql, deptId == 0 ? "" : " where deptId=@deptId");
            SqlParameter[] paras ={
                                   new  SqlParameter("@start",(pageIndex-1)*pageSize+1),
                                   new SqlParameter ("@end",pageSize*pageIndex),
                                   new SqlParameter ("@deptId",deptId)
                                   };
            SqlDataReader reader = SqlHelper.ExecuteReader(sql, CommandType.Text, paras);
            using (reader)
            {
                if (reader.HasRows)
                {
                    list = new List<UserInfo>();
                    while (reader.Read())
                    {
                        list.Add(ToModel(reader));
                    }
                }
            }
            totalCount = (int)SqlHelper.ExecuteScalar("select count(1) from T_User", CommandType.Text);
            return list;
        }
        #endregion

    }
}