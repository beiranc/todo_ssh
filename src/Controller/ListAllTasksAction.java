package Controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import Model.Tasks;
import Model.TasksService;
@Controller
public class ListAllTasksAction extends BaseSupport {
	@Autowired
	private TasksService tasksService;
	
	public void setTasksService(TasksService tasksService) {
		this.tasksService = tasksService;
	}
	
	public String changeComplete() throws Exception {
		Map map = (Map) ActionContext.getContext().getParameters();
		
		String tasksId = ((String[]) map.get("tasksId"))[0];
		String todolistId = ((String[]) map.get("todolistId"))[0];
		String completed = ((String[]) map.get("complete"))[0];
		
		//completeΪ1 ��ǰ״̬Ϊδ��� ����Ҫ�޸ĳ����
		//completeΪ0 ��ǰ״̬Ϊ����� ����Ҫ�޸ĳ�δ���
		System.out.println("tasksId��" + tasksId + "\t" + "todolistId��" + todolistId + "\t" + "complete: " + completed);
		
		if(completed.equals("1")) {
			boolean result = tasksService.completeTasks(tasksId);
			if(result) {
				ServletActionContext.getResponse().sendRedirect(ServletActionContext.getRequest().getContextPath() + "/pages/ListTasksPage.jsp?todolistId=" + todolistId);
				return null;
				//return actionMapping.findForward("success");
			} else {
				return ERROR;
			}
		} else {
			boolean result = tasksService.resetTasks(tasksId);
			if(result) {
				ServletActionContext.getResponse().sendRedirect(ServletActionContext.getRequest().getContextPath() + "/pages/ListTasksPage.jsp?todolistId=" + todolistId);
				return null;
				//return actionMapping.findForward("success");
			} else {
				return ERROR;
			}
		}
	}
	
	public String update() throws Exception{
		Map map = (Map) ActionContext.getContext().getParameters();
		
		String tasksId = ((String[]) map.get("tasksId"))[0];
		String todolistId = ((String[]) map.get("todolistId"))[0];
		String title = ((String[]) map.get("title"))[0];
		String contents = ((String[]) map.get("contents"))[0];
		String deadline = ((String[]) map.get("deadline"))[0];
		
		int priority = Integer.parseInt(((String[]) map.get("priority"))[0]);
		
		//��ʱͨ��tasksService��ȡold taskȻ��ͨ��setter�����޸����Բ��ֶ�����isFinished�����������
		Tasks tasks = tasksService.getTasksById(tasksId);
		tasks.setTitle(title);
		tasks.setContents(contents);
		tasks.setIsFinished(false);
		tasks.setPriority(priority);
		tasks.setDeadline(deadline);
		tasks.setTodolistId(todolistId);
		
		boolean result = tasksService.updateTasks(tasks);
		
		if(result) {
			ServletActionContext.getResponse().sendRedirect(ServletActionContext.getRequest().getContextPath() + "/pages/ListTasksPage.jsp?todolistId=" + todolistId);
			return null;
		} else {
			System.out.println("Update Error ! ");
			return ERROR;
		}
	}
	
	public String delete() throws Exception{
		Map map = (Map) ActionContext.getContext().getParameters();
		
		String tasksId = ((String[]) map.get("tasksId"))[0];
		
		boolean result = tasksService.deleteTasksById(tasksId);
		if(result) {
			return SUCCESS;
		} else {
			return ERROR;
		}
	}
}
