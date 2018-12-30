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
			System.out.println("�û�������Ϊ�գ�����");
			return ERROR;
		} else {
			user.setUserName(userName);
		}
		
		if(password == null || "".equals(password)) {
			System.out.println("���벻��Ϊ�գ�����");
			return ERROR;
		} else {
			user.setPassword(password);
		}
		
		//һ�ַ���
		//��success��ת��Ϊ����ҳ�棬��SuccessRegisterPage.jsp��дһ��ģ̬����ʾע��ɹ�����ת��LoginPage.jsp����
		//Login.jspͬ��
		boolean isUserExist = userService.checkUserByName(userName);
		if(isUserExist) {
			System.out.println("�û��Ѵ��ڣ�");
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
