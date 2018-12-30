package Model;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Dao.UserDao;

@Service
public class UserService {
	@Autowired
	private UserDao userDao;
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	//增加一个User
	public boolean addUser(User user) throws UnsupportedEncodingException {
		return userDao.addUser(user);
	}
	
	//通过Id查询User
	public User getUserById(String userId) throws UnsupportedEncodingException {
		String hql = "FROM User u WHERE u.userId=?0";
		Object[] args = {userId};
		List<User> list = new ArrayList<User>();
		list = userDao.getUserById(hql, args);
		Iterator iterator = list.iterator();
		while(iterator.hasNext()) {
			return (User) iterator.next();
		}
		return null;
	}
	
	//通过用户名查询User
	public User getUserByName(String userName) throws UnsupportedEncodingException {
		String hql = "FROM User u WHERE u.userName=?0";
		Object[] args = {userName};
		List<User> list = new ArrayList<User>();
		list = userDao.getUserByName(hql, args);
		Iterator iterator = list.iterator();
		while(iterator.hasNext()) {
			return (User) iterator.next();
		}
		return null;
	}
	
	//通过用户名检查User是否存在
	public boolean checkUserByName(String userName) throws UnsupportedEncodingException {
		String hql = "FROM User u WHERE u.userName=?0";
		Object[] args = {userName};
		boolean result = false;
		result = userDao.checkUserByName(hql, args);
		return result;
	}
}
