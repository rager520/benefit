using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Star.API.Controllers
{
    using Star.ORM.Model;

    public class CategoryController : ApiController
    {
        public IEnumerable<CMS_CategoryModels> products = null;
        public IEnumerable<CMS_CategoryModels> GetAllProducts()
        {
            return products;
        }

        public IHttpActionResult GetProduct(int id)
        {
            var product = products.FirstOrDefault((p) => p.ID == id);
            if (product == null)
            {
                return NotFound();
            }
            return Ok(product);
        }

        public CMS_CategoryModels Add([FromBody]CMS_CategoryModels pd)
        {
            products.ToList().Add(pd);

            return pd;
        }
    }
}
