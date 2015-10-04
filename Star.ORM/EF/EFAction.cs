using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Star.ORM.EF
{
    public class EFAction<TEntity> where TEntity : class
    {
        public StarDBContext ctx;
        public TEntity Get(int key)
        {
            try
            {
                return ctx.Set<TEntity>().Find(1);
            }
            catch (Exception ex)
            {
                return null;
            }
            //ctx.Person.Find(1);
        }

        public IQueryable<TEntity> GetAll()
        {
            return ctx.Set<TEntity>().AsNoTracking();
        }

        public void Insert(TEntity entity)
        {
            var state = ctx.Entry(entity).State;
            if (state == EntityState.Detached)
            {
                state = EntityState.Added;
            }
            //  ctx.Database.ExecuteSqlCommand("", "");
        }

        public void Delete(TEntity entity)
        {
            ctx.Entry(entity).State = EntityState.Deleted;
        }

        public void Update(TEntity entity)
        {
            if (ctx.Entry(entity).State == EntityState.Detached)
            {
                var result = ctx.Set<TEntity>();
                ctx.Set<TEntity>().Attach(entity);
            }

            ctx.Entry(entity).State = EntityState.Modified;
        }

        public void Commit()
        {
            ctx.SaveChanges();
        }

        public void Query()
        {
            // exe sql command
            //var parameters = new DbParameter[]{
            //        new SqlParameter(parameterName:"Field1",value:"tt"),
            //        new SqlParameter(parameterName:"Field2",value:"ddd")
            //    };
            //var result = new Table1();
            //var res = ctx.Database.SqlQuery<Table1>("select * from Table1 where Field1=@Field1 and Field2=@Field2", parameters).ToList();
        }
    }
}
