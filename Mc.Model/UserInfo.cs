using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Mc.Model
{
    public class UserInfo
    {
        public int Id { get; set; }
        public string LoginId { get; set; }
        public string LoginPwd { get; set; }
        public string RealName { get; set; }
        public string Tel { get; set; }
        public DateTime? Birthday { get; set; }
        public bool IsDeleted { get; set; }
    }
}
