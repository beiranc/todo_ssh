package Dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@SuppressWarnings("unchecked")
@Repository("tasksDao")
public class TasksDao <T, PK extends Serializable> extends MyHibernateDaoSupport {
	
	//增加一个tasks
	@Transactional
	public boolean addTasks(T entity){
		try {
			super.getHibernateTemplate().save(entity);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	//删除一个tasks
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
	
	//修改一个tasks
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
	
	//通过Id查询一个tasks
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
	
	//获取所有的tasks
	@Transactional
	public List<T> getAllTasks() {
		String hql = "FROM tasks task";
		Query query = super.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql);
		return query.list();
	}
	
	//根据TodolistId获取所有的Tasks
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
	
	//将任务设为完成
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
	
	//任务状态重置为未完成
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
	
	//根据关键字模糊查询title
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
