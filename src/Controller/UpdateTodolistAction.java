package Controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import Model.Todolist;
import Model.TodolistService;
@Controller
public class UpdateTodolistAction extends BaseSupport {
	@Autowired
	private TodolistService todolistService;
	
	public void setTodolistService(TodolistService todolistService) {
		this.todolistService = todolistService;
	}
	
	public String execute() throws Exception {
		Map map = (Map) ActionContext.getContext().getParameters();
		
		String title = ((String[]) map.get("title"))[0];
		String comments = ((String[]) map.get("comments"))[0];
		String todolistId = ((String[]) map.get("todolistId"))[0];
		
		Todolist todolist = new Todolist();
		todolist.setTitle(title);
		todolist.setComments(comments);
		todolist.setTodolistId(todolistId);
		
		boolean result = todolistService.updateTodolist(todolist);
		
		if(result) {
			return SUCCESS;
		} else {
			System.out.println("Update Error ! ");
			return ERROR;
		}
	}
}
