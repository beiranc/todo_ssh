package Model;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Dao.TasksDao;

@Service
public class TasksService {
	@Autowired
	private TasksDao tasksDao;
	
	public void setTasksDao(TasksDao tasksDao) {
		this.tasksDao = tasksDao;
	}
	
	public boolean addTasks(Tasks tasks) throws UnsupportedEncodingException {
		tasks.setIsFinished(false);
		return tasksDao.addTasks(tasks);
	}
	
	public boolean deleteTasksById(String tasksId) throws UnsupportedEncodingException {
		String hql = "UPDATE Tasks task SET task.is_del=1 WHERE task.tasksId=?0";
		Object[] args = {tasksId};
		boolean result = false;
		result = tasksDao.deleteTasksById(hql, args);
		return result;
	}
	
	//更新无效，原因不详(通过添加重置isFinished属性暂时解决此问题)
	public boolean updateTasks(Tasks tasks) throws UnsupportedEncodingException {
		String hql = "UPDATE Tasks t SET t.title=?0 , t.contents=?1 , t.isFinished=?2 , t.priority=?3 , t.deadline=?4 , t.todolistId=?5 WHERE t.tasksId=?6";
		Object[] args = {tasks.getTitle(), tasks.getContents(), tasks.getIsFinished(), tasks.getPriority(), tasks.getDeadline(), tasks.getTodolistId(), tasks.getTasksId()};
		boolean result = false;
		result = tasksDao.updateTasks(hql, args);
		return result;
	}
	
	public Tasks getTasksById(String tasksId) throws UnsupportedEncodingException {
		String hql = "FROM Tasks task WHERE task.tasksId=?0";
		Object[] args = {tasksId};
		List<Tasks> list = new ArrayList<Tasks>();
		list = tasksDao.getTasksById(hql, args);
		Iterator iterator = list.iterator();
		while(iterator.hasNext()) {
			return (Tasks) iterator.next();
		}
		return null;
	}
	
	public List<Tasks> getAllTasks() throws UnsupportedEncodingException {
		List<Tasks> list = new ArrayList<Tasks>();
		list = tasksDao.getAllTasks();
		return list;
	}
	
	public List<Tasks> getAllTasksById(String todolistId) throws UnsupportedEncodingException {
		String hql = "FROM Tasks task WHERE task.is_del=0 AND task.todolistId=?0";
		Object[] args = {todolistId};
		List<Tasks> list = new ArrayList<Tasks>();
		list = tasksDao.getAllTasksById(hql, args);
		return list;
	}
	
	public boolean completeTasks(String tasksId) throws UnsupportedEncodingException {
		String hql = "UPDATE Tasks task SET task.isFinished=?0 WHERE task.tasksId=?1";
		Object[] args = {true, tasksId};
		boolean result = false;
		result = tasksDao.completeTasks(hql, args);
		return result;
	}
	
	public boolean resetTasks(String tasksId) throws UnsupportedEncodingException {
		String hql = "UPDATE Tasks task SET task.isFinished=?0 WHERE task.tasksId=?1";
		Object[] args = {false, tasksId};
		boolean result = false;
		result = tasksDao.completeTasks(hql, args);
		return result;
	}
	
	public List<Tasks> searchTasksByKey(String keyWord) throws UnsupportedEncodingException {
		//会查询到其他用户的tasks
		String hql = "FROM Tasks task WHERE task.title LIKE '%" + keyWord + "%' AND task.isFinished=false";
		Object[] args = {};
		List<Tasks> list = new ArrayList<Tasks>();
		list = tasksDao.searchTasksByKey(hql, args);
		return list;
	}
}
