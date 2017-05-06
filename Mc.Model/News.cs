using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Mc.Model
{
    public class News
    {
        public int Id { get; set; }
        /// <summary>
        /// 所属分类
        /// </summary>
        public int Ssfl { get; set; }

        public string Title { get; set; }
        public string Author { get; set; }
        /// <summary>
        /// 点击次数
        /// </summary>
        public int Click { get; set; }
        public DateTime Addtime { get; set; }
        public string LinkAddress { get; set; }
        public string Content { get; set; }
        /// <summary>
        /// 新闻来源
        /// </summary>
        public string Source { get; set; }
    }
}
