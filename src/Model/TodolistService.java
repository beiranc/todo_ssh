package Model;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.xml.internal.bind.v2.TODO;

import Dao.TodolistDao;

@Service
public class TodolistService {
	@Autowired
	private TodolistDao todolistDao;
	
	public void setTodolistDao(TodolistDao todolistDao) {
		this.todolistDao = todolistDao;
	}
	
	public boolean addTodolist(Todolist todolist) throws UnsupportedEncodingException {
		return todolistDao.addTodolist(todolist);
	}
	
	public boolean deleteTodolistById(String todolistId) throws UnsupportedEncodingException {
		String hql = "UPDATE Todolist t SET t.is_del=1 WHERE t.todolistId=?0";
		Object[] args = {todolistId};
		boolean result = false;
		result = todolistDao.deleteTodolistById(hql, args);
		return result;
	}
	
	public boolean updateTodolist(Todolist todolist) throws UnsupportedEncodingException {
		String hql = "UPDATE Todolist t SET t.title=?0 , t.comments=?1 WHERE t.todolistId=?2";
		Object[] args = {todolist.getTitle(), todolist.getComments(), todolist.getTodolistId()};
		boolean result = false;
		result = todolistDao.updateTodolist(hql, args);
		return result;
	}
	
	public Todolist getTodolistById(String todolistId) throws UnsupportedEncodingException {
		String hql = "FROM Todolist t WHERE t.todolistId=?0";
		Object[] args = {todolistId};
		List<Todolist> list = new ArrayList<Todolist>();
		list = todolistDao.getTodolistById(hql, args);
		Iterator iterator = list.iterator();
		while(iterator.hasNext()) {
			return (Todolist) iterator.next();
		}
		return null;
	}
	
	public List<Todolist> getAllTodolist() throws UnsupportedEncodingException {
		List<Todolist> list = new ArrayList<Todolist>();
		list = todolistDao.getAllTodolist();
		return list;
	}
	
	public List<Todolist> getAllTodolistById(String userId) throws UnsupportedEncodingException {
		String hql = "FROM Todolist t WHERE t.is_del=0 AND t.userId=?0";
		Object[] args = {userId};
		List<Todolist> list = new ArrayList<Todolist>();
		list = todolistDao.getTodolistById(hql, args);
		return list;
	}
}
