using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

[assembly: log4net.Config.XmlConfigurator(Watch = true)]
namespace Mc.UI.Utility
{
    public class LogHelper
    {
        /// <summary>
        /// 初始日志配置
        /// </summary>
        public static void SetConfig()
        {
            log4net.Config.XmlConfigurator.Configure();
        }

        public static void SetConfig(FileInfo configFile)
        {
            log4net.Config.XmlConfigurator.Configure(configFile);
        }

        /// <summary>
        /// 输出日志到Log4Net
        /// </summary>      
        public static void WriteLog(Type type, Exception ex)
        {
            log4net.ILog log = log4net.LogManager.GetLogger(type);
            log.Error("Error", ex);
        }

        public static void WriteLog(Type type, string msg)
        {
            log4net.ILog log = log4net.LogManager.GetLogger(type);
            log.Error(msg);
        }
    }
}