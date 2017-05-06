using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;


namespace Mc.DLL
{
    public class SettringDAL
    {
        /// <summary>
        /// 查询相应配置项
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public string GetValue(string key)
        {
            string value = string.Empty;
            string sql = "select sysValue from T_Setting where sysKey=@sysKey";
            SqlDataReader reader = SqlHelper.ExecuteReader(sql, CommandType.Text, new SqlParameter("@sysKey", key));
            using (reader)
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        value = reader.GetString(0);
                    }
                }
            }
            return value;
        }

        /// <summary>
        /// 更改相应配置项
        /// </summary>
        /// <param name="key"></param>
        /// <param name="value"></param>
        public void SetValue(string key, string value)
        {
            string sql = "update T_Setting set sysValue=@sysValue where sysKey=@sysKey";
            SqlHelper.ExecuteNonQuery(sql, CommandType.Text, new SqlParameter("@sysKey", key),
                new SqlParameter("@sysValue", value));
        }

    }
}
