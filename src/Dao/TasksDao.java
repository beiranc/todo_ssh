package Dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@SuppressWarnings("unchecked")
@Repository("tasksDao")
public class TasksDao <T, PK extends Serializable> extends MyHibernateDaoSupport {
	
	//����һ��tasks
	@Transactional
	public boolean addTasks(T entity){
		try {
			super.getHibernateTemplate().save(entity);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	//ɾ��һ��tasks
	@Transactional
	public boolean deleteTasksById(String hql, Object[] args) {
		Query query = super.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql);
		for(int i = 0; i < args.length; i++) {
			query.setParameter(i, args[i]);
		}
		try {
			query.executeUpdate();
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	//�޸�һ��tasks
	@Transactional
	public boolean updateTasks(String hql, Object[] args){
		Query query = super.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql);
		if(null != args && args.length > 0) {
			for(int i = 0; i < args.length; i++) {
				query.setParameter(i, args[i]);
			}
		}
		try {
			query.executeUpdate();
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	//ͨ��Id��ѯһ��tasks
	@Transactional
	public List<T> getTasksById(String hql, Object[] args) {
		Query query = super.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql);
		if(null != args && args.length > 0) {
			for(int i = 0; i < args.length; i++) {
				query.setParameter(i, args[i]);
			}
		}
		return query.list();
	}
	
	//��ȡ���е�tasks
	@Transactional
	public List<T> getAllTasks() {
		String hql = "FROM tasks task";
		Query query = super.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql);
		return query.list();
	}
	
	//����TodolistId��ȡ���е�Tasks
	@Transactional
	public List<T> getAllTasksById(String hql, Object[] args) {
		Query query = super.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql);
		if(null != args && args.length > 0) {
			for(int i = 0; i < args.length; i++) {
				query.setParameter(i, args[i]);
			}
		}
		return query.list();
	}
	
	//��������Ϊ���
	@Transactional
	public boolean completeTasks(String hql, Object[] args) {
		Query query = super.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql);
		for(int i = 0; i < args.length; i++) {
			query.setParameter(i, args[i]);
		}
		try {
			query.executeUpdate();
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	//����״̬����Ϊδ���
	@Transactional
	public boolean resetTasks(String hql, Object[] args) {
		Query query = super.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql);
		for(int i = 0; i < args.length; i++) {
			query.setParameter(i, args[i]);
		}
		try {
			query.executeUpdate();
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	//���ݹؼ���ģ����ѯtitle
	@Transactional
	public List<T> searchTasksByKey(String hql, Object[] args) {
		Query query = super.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql);
		if(null != args && args.length > 0) {
			for(int i = 0; i < args.length; i++) {
				query.setParameter(i, args[i]);
			}
		}
		return query.list();
	}
}
