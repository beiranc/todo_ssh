package Controller;

import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import Model.User;
import Model.UserService;
@Controller
public class LoginAction extends BaseSupport {
	@Autowired
	private UserService userService;
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public String execute() throws Exception {
		Map map = (Map) ActionContext.getContext().getParameters();
		
		String userName = ((String[]) map.get("userName"))[0];
		String password = ((String[]) map.get("password"))[0];
		
		//��ȡ���ݿ��е�ǰUser����
		User user = userService.getUserByName(userName);
		
		//���ڴ���Todolist
		Map<String, Object> httpSession = ActionContext.getContext().getSession();
		
		httpSession.put("userId",user.getUserId());
		
		if(user.getUserName().equals(userName) && user.getPassword().equals(password)) {
			System.out.println("Login Success !! ");
			return SUCCESS;
		} else {
			System.out.println("Login Error !! ");
			return ERROR;
		}
	}
}
