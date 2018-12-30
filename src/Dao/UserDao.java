package Dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@SuppressWarnings("unchecked")
@Repository("userDao")
public class UserDao <T, PK extends Serializable> extends MyHibernateDaoSupport {
	
	//增加一个User
	@Transactional
	public boolean addUser(T entity) {
		try {
			super.getHibernateTemplate().save(entity);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	//通过Id查询User
	@Transactional
	public List<T> getUserById(String hql, Object[] args) {
		Query<T> query = super.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql);
		if(null != args && args.length > 0) {
			for(int i = 0; i < args.length; i++) {
				query.setParameter(i, args[i]);
			}
		}
		return query.list();
	}
	
	//通过用户名查询User
	@Transactional
	public List<T> getUserByName(String hql, Object[] args) {
		Query<T> query = super.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql);
		if(null != args && args.length > 0) {
			for(int i = 0; i < args.length; i++) {
				query.setParameter(i, args[i]);
			}
		}
		return query.list();
	}
	
	//通过用户名检查User是否存在
	@Transactional
	public boolean checkUserByName(String hql, Object[] args) {
		Query<T> query = super.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql);
		for(int i = 0; i < args.length; i++) {
			query.setParameter(i, args[i]);
		}
		try {
			query.executeUpdate();
			//true说明存在
			return true;
		} catch (Exception e) {
			//false说明不存在
			return false;
		}
//		if(query.list().isEmpty()) {
//			return false;
//		} else {
//			return true;
//		}
//		Long result = (Long) super.getHibernateTemplate().find(hql, args).listIterator().next();
//		return result > 0;
	}
}
