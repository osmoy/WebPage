using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Mc.DLL;

namespace Mc.BLL
{
    public class SettingManage
    {
        public static string GetValue(string key)
        {
            return new SettringDAL().GetValue(key);
        }

        public static void SetValue(string key, string value)
        {
            new SettringDAL().SetValue(key, value);
        }
    }
}