using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Mc.Model
{
    [Serializable]
    public class CaseInfo
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public string ImgPath { get; set; }
        public bool IsDeleted { get; set; }
    }
}
