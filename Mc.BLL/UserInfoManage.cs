using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Mc.Model.Enum;
using Mc.Model;
using Mc.DLL;

namespace Mc.BLL
{
    public class UserInfoManage
    {
        /// <summary>
        /// 判断是否登陆成功
        /// </summary>
        /// <param name="loginName"></param>
        /// <param name="loginPwd"></param>
        /// <param name="userInfo"></param>
        /// <returns>登陆状态</returns>
        public static LoginState IsLogin(string loginName, string loginPwd, out UserInfo userInfo)
        {
            return new UserInfoDAL().IsLogin(loginName, loginPwd, out userInfo);
        }

        /// 添加用户
        public static int Add(UserInfo user)
        {
            return new UserInfoDAL().Add(user);
        }

        ///返回所有用户
        public static IEnumerable<UserInfo> GetAll()
        {
            return new UserInfoDAL().GetAll();
        }

        ///删除用户
        public static int Delete(int id)
        {
            return new UserInfoDAL().Delete(id);
        }

        ///修改用户
        public static int Modify(UserInfo user)
        {
            return new UserInfoDAL().Modify(user);
        }

        public static UserInfo GetById(int id)
        {
            return new UserInfoDAL().GetById(id);
        }

        public static IEnumerable<UserInfo> GetByPaging(int pageIndex, int pageSize, out int totalCount)
        {
            return new UserInfoDAL().GetByPaging(pageIndex, pageSize,out totalCount);
        }
    }
}
