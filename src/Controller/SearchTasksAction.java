package Controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import Model.Tasks;
import Model.TasksService;
@Controller
public class SearchTasksAction extends BaseSupport {
	@Autowired
	private TasksService tasksService;
	
	public void setTasksService(TasksService tasksService) {
		this.tasksService = tasksService;
	}
	
	public String execute() throws Exception {
		Map map = (Map) ActionContext.getContext().getParameters();
		
		String keyWord = ((String[]) map.get("keyWord"))[0];
		
		List<Tasks> list = new ArrayList();
		
		list = tasksService.searchTasksByKey(keyWord);
		if(!list.isEmpty()) {
			ServletActionContext.getRequest().setAttribute("keyWord", keyWord);
			ServletActionContext.getRequest().setAttribute("list", list);
			return SUCCESS;
		} else {
			System.out.println("该查询无结果！");
			return ERROR;
		}
	}
}
