using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography;
using System.Configuration;
using System.IO;

namespace Mc.Common
{
    public class CommonHelper
    {
        /// <summary>
        /// 获取加密后的字符串
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static string GetMd5(string str)
        {
            MD5 md5 = MD5.Create();
            byte[] buffer = Encoding.UTF8.GetBytes(str);
            byte[] hashBuffer = md5.ComputeHash(buffer);
            StringBuilder sb = new StringBuilder();
            foreach (byte item in hashBuffer)
            {
                sb.Append(item.ToString("x2"));
            }
            return sb.ToString();
        }

        /// <summary>
        /// 获取AppSettings
        /// </summary>
        /// <returns></returns>
        public static string GetAppSalt()
        {
            return ConfigurationManager.AppSettings["Salt"];
        }

        /// <summary>
        /// 计算文件流的MD5值
        /// </summary>
        /// <param name="strem"></param>
        /// <returns></returns>
        public static string GetMd5(Stream stream)
        {
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            byte[] arrbytHashValue = md5.ComputeHash(stream); //计算指定Stream 对象的哈希值
            md5.Clear();
            //由以连字符分隔的十六进制对构成的String，其中每一对表示value 中对应的元素；例如“F-2C-4A”
            string strHashData = BitConverter.ToString(arrbytHashValue);
            //替换-
            strHashData = strHashData.Replace("-", "");
            return strHashData;
        }

        /// <summary>
        /// 返回默认字符串
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static string GetDefault(string str,int length)
        {
            if (str.Length > length)
            {
                return str.Substring(0, length) + "...";
            }
            return str;
        }
    }
}