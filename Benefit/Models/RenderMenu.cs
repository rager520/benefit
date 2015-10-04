using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Benefit.Models
{
    public class RenderMenu
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public List<RenderMenu> Childrens { get; set; }
    }
}