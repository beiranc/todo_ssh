package Controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import Model.Todolist;
import Model.TodolistService;
@Controller
public class AddTodolistAction extends BaseSupport {
	@Autowired
	private TodolistService todolistService;
	
	public void setTodolistService(TodolistService todolistService) {
		this.todolistService = todolistService;
	}
	
	public String execute() throws Exception {
		Todolist todolist = new Todolist();
		Map map = (Map) ActionContext.getContext().getParameters();
		
		Map<String, Object> httpSession = ActionContext.getContext().getSession();
		
		String title = ((String[]) map.get("title"))[0];
		String comments = ((String[]) map.get("comments"))[0];
		
		String userId = (String) httpSession.get("userId");
		String todolistId = UUID.randomUUID().toString().replace("-", "").toLowerCase();
		
		//用于创建tasks
//		httpSession.setAttribute("todolistId", todolistId);
		
		todolist.setIs_del(0);
		todolist.setTodolistId(todolistId);
		todolist.setUserId(userId);
		
		if( (!title.equals(null)) && (!comments.equals(null))) {
			todolist.setTitle(title);
			todolist.setComments(comments);
		} else {
			return ERROR;
		}
		
		boolean result = false;
		result = todolistService.addTodolist(todolist);
		if(result) {
			//获取当前用户所有的清单
//			List<Todolist> list = new ArrayList<>();
//			list = todolistService.getAllTodolistById(userId);
//			httpSession.setAttribute("list", list);
			System.out.println("Add Todolist Success ! ");
			return SUCCESS;
		} else {
			return ERROR;
		}
	}
}
