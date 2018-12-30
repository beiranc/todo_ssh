package Dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import Model.Todolist;
import Util.ConnectionUtil;

@SuppressWarnings("unchecked")
@Repository("todolistDao")
public class TodolistDao <T, PK extends Serializable> extends MyHibernateDaoSupport {
	
	//增加一个todolist
	@Transactional
	public boolean addTodolist(T entity) {
		try {
			super.getHibernateTemplate().save(entity);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	//删除一个todolist
	@Transactional
	public boolean deleteTodolistById(String hql, Object[] args) {
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
	
	//修改一个todolist
	@Transactional
	public boolean updateTodolist(String hql, Object[] args) {
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
	
	//查询一个todolist
	@Transactional
	public List<T> getTodolistById(String hql, Object[] args) {
		Query query = super.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql);
		if(null != args && args.length > 0){  
            for(int i = 0; i < args.length; i++){  
                query.setParameter(i, args[i]);  
            }  
        }
        return query.list();
	}
	
	//获取所有的todolist
	@Transactional
	public List<T> getAllTodolist() {
		String hql = "FROM todolist t WHERE t.is_del=0";
		Query query = super.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql);
		return query.list();
	}
	
	//分用户获取所有的todolist
	@Transactional
	public List<T> getAllTodolistById(String hql, Object[] args) {
		Query query = super.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql);
		if(null != args && args.length > 0){  
            for(int i = 0; i < args.length; i++){  
                query.setParameter(i, args[i]);  
            }  
        }
        return query.list();
	}
}
