package com.rjxy.core;

import java.util.List;


import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSourceUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service 
public class BaseDaoImpl<T>  implements BaseDao<T>{
	private SessionFactory sessionFactory;
	//private Session session=null;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	/**
	 * query
	 */
	public List<T> createQuery(final String queryString) {
		Session session=sessionFactory.getCurrentSession();
		List<T> list=session.createQuery(queryString).list();
		return list;
	}
	
	/**
	 *分页信息 
	 */
	public List<T> queryByPage(String hql, int startIndex, int PageSize){
		Session session=sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setFirstResult(startIndex);
		query.setMaxResults(PageSize);
		return query.list();
		
	}
	 /**
     * 模糊查询
     */
    public List<T> queryByWhere(String tableSimpleName,String columns,String query){
    	Session session=sessionFactory.getCurrentSession();
        List<T> list=session.createCriteria(tableSimpleName).add(Restrictions.like(columns, "%"+query+"%")).list();
        return list;
    }
	
	/**
	 * add
	 */
	public T save(final T model) {
		Session session=sessionFactory.getCurrentSession();
	//	SqlParameterSource[] batch = SqlParameterSourceUtils.createBatch(null);  
		T o=(T) session.save(model);
		return o;
	}
	
	/**
	 * update
	 */
	public void update(final T model) {
		Session session=sessionFactory.getCurrentSession();
		session.update(model);
	}
	/**
	 * delete
	 */
	public void delete(final T model) {
		Session session=sessionFactory.getCurrentSession();
		session.delete(model);
	}
	public T getBean(Class<?> obj, String id) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		return (T) session.get(obj, id);
	}
	public T getBean(Class<?> obj, int id) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		return (T) session.get(obj, id);
	}
}
