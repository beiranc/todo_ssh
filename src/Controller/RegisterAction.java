package Controller;

import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import Dao.UserDao;
import Model.User;
import Model.UserService;
@Controller
public class RegisterAction extends BaseSupport {
	@Autowired
	private UserService userService;
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public String execute() throws Exception {
		String userId = UUID.randomUUID().toString().replace("-", "").toLowerCase();
		
		Map map = (Map) ActionContext.getContext().getParameters();
		
		String userName = ((String[]) map.get("userName"))[0];
		String password = ((String[]) map.get("password"))[0];
		
		User user = new User();
		
		user.setUserId(userId);
		
		if(userName == null || "".equals(userName)) {
			System.out.println("用户名不能为空！！！");
			return ERROR;
		} else {
			user.setUserName(userName);
		}
		
		if(password == null || "".equals(password)) {
			System.out.println("密码不能为空！！！");
			return ERROR;
		} else {
			user.setPassword(password);
		}
		
		//一种方法
		//将success跳转设为新增页面，在SuccessRegisterPage.jsp中写一个模态框提示注册成功并跳转至LoginPage.jsp界面
		//Login.jsp同理
		boolean isUserExist = userService.checkUserByName(userName);
		if(isUserExist) {
			System.out.println("用户已存在！");
			return ERROR;
		} else {
			boolean result = false;
			result = userService.addUser(user);
			if(result) {
				return SUCCESS;
			} else {
				return ERROR;
			}
		}
	}
}
