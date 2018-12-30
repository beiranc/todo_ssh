package Dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@SuppressWarnings("unchecked")
@Repository("userDao")
public class UserDao <T, PK extends Serializable> extends MyHibernateDaoSupport {
	
	//����һ��User
	@Transactional
	public boolean addUser(T entity) {
		try {
			super.getHibernateTemplate().save(entity);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	//ͨ��Id��ѯUser
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
	
	//ͨ���û�����ѯUser
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
	
	//ͨ���û������User�Ƿ����
	@Transactional
	public boolean checkUserByName(String hql, Object[] args) {
		Query<T> query = super.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql);
		for(int i = 0; i < args.length; i++) {
			query.setParameter(i, args[i]);
		}
		try {
			query.executeUpdate();
			//true˵������
			return true;
		} catch (Exception e) {
			//false˵��������
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
