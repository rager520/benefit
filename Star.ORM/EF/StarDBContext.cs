using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Star.ORM.EF
{
    using Star.ORM.Model;
    public class StarDBContext : DbContext
    {
        public StarDBContext()
            : base("Model3Container")
        {

        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
            modelBuilder.Conventions.Remove<OneToManyCascadeDeleteConvention>();
            modelBuilder.Conventions.Remove<ManyToManyCascadeDeleteConvention>();

        }

        public virtual DbSet<CMS_CategoryModels> CMS_Category { get; set; }
    }
}
