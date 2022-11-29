using EmailMarketing.Persistences.Context;
using System.Linq.Expressions;

namespace EmailMarketing.Common.RepositoriesBase
{
    public interface IRepositoryBase<T>
    {
        void Create(T entity);
        void Update(T entity);
        void Delete(T entity);
        void CreateMulti(List<T> entities);
        void DeleteMulti(List<T> entities);
        IQueryable<T> FindAll();
        IQueryable<T> FindByCondition(Expression<Func<T,bool>> expression);
    }
    public class RepositoryBase<T> : IRepositoryBase<T> where T : class
    {
        private readonly AppDbContext context;

        public RepositoryBase(AppDbContext context)
        {
            this.context = context;
        }

        public void CreateMulti(List<T> entities) => context.Set<T>().AddRange(entities);

        public void Create(T entity) => context.Set<T>().Add(entity);

        public void Delete(T entity) => context.Set<T>().Remove(entity);

        public void DeleteMulti(List<T> entities) => context.Set<T>().RemoveRange(entities);

        public IQueryable<T> FindAll() => context.Set<T>();

        public IQueryable<T> FindByCondition(Expression<Func<T, bool>> expression) => context.Set<T>().Where(expression);

        public void Update(T entity) => context.Set<T>().Update(entity);
    }

}
