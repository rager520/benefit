using System;
using System.Collections.Generic;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.Mvc;

namespace Benefit.Controllers
{
    using Star.ORM.EF;
    using Star.ORM.Model;
    using Benefit.Models;
    public class HomeController : Controller
    {

        public ActionResult Index()
        {

            return View();
        }

        public ActionResult Menu()
        {
            List<CMS_CategoryModels> models = null;

            using (TransactionScope scope = new TransactionScope())// 事务对象
            {
                using (var ctx = new StarDBContext())
                {
                    EFAction<CMS_CategoryModels> model = new EFAction<CMS_CategoryModels>();
                    model.ctx = ctx;

                    models = model.GetAll().ToList();
                }
            }

            return View(GetMenu(models));
        }

        /// <summary>
        /// 目录遍历
        /// 针对二层
        /// </summary>
        /// <param name="input"></param>
        private List<RenderMenu> GetMenu(List<CMS_CategoryModels> input)
        {
            List<RenderMenu> models = new List<RenderMenu>();

            if (input == null || input.Count == 0) return models;

            // 第一层
            foreach (var pInput in input.Where(p => p.Level == 1).OrderBy(p => p.Order))
            {
                RenderMenu pParent = new RenderMenu() { ID = pInput.ID, Name = pInput.Name };
                models.Add(pParent);
            }
            // 第二层
            foreach (var model in models)
            {
                var pChildren = input.Where(p => p.UpperLayer == model.ID).OrderBy(p => p.Order);
                model.Childrens = pChildren.Select(p => new RenderMenu { ID = p.ID, Name = p.Name }).ToList();
            }

            return models;
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}