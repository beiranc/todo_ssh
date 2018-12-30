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
	
	//����һ��todolist
	@Transactional
	public boolean addTodolist(T entity) {
		try {
			super.getHibernateTemplate().save(entity);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	//ɾ��һ��todolist
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
	
	//�޸�һ��todolist
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
	
	//��ѯһ��todolist
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
	
	//��ȡ���е�todolist
	@Transactional
	public List<T> getAllTodolist() {
		String hql = "FROM todolist t WHERE t.is_del=0";
		Query query = super.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql);
		return query.list();
	}
	
	//���û���ȡ���е�todolist
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
