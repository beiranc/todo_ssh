package Controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import Model.TodolistService;
@Controller
public class ListAllTodoAction extends BaseSupport {
	@Autowired
	private TodolistService todolistService;
	
	public void setTodolistService(TodolistService todolistService) {
		this.todolistService = todolistService;
	}
	
	public String execute() throws Exception {
		Map map = (Map) ActionContext.getContext().getParameters();
		
		String todolistId = ((String[]) map.get("todolistId"))[0];
		
		boolean result = todolistService.deleteTodolistById(todolistId);
		if(result) {
			return SUCCESS;
		} else {
			return ERROR;
		}
	}
}
