﻿using System;
using System.Globalization;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;

namespace Benefit.Controllers
{
    //[Authorize]
    public class AdminController : Controller
    {
        public AdminController()
        {
        }

        public ActionResult Index()
        {
            return View();
        }
    }
}