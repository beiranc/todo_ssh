package Controller;

import java.util.Date;
import java.util.Map;
import java.util.UUID;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import Model.Tasks;
import Model.TasksService;
@Controller
public class AddTasksAction extends BaseSupport {
	@Autowired
	private TasksService tasksService;
	
	public void setTasksService(TasksService tasksService) {
		this.tasksService = tasksService;
	}
	
	public String execute() throws Exception {
		Map map = (Map) ActionContext.getContext().getParameters();
		
		Map<String, Object> session = ActionContext.getContext().getSession();
		
		String todolistId = ((String[]) map.get("todolistId"))[0];
		String title = ((String[]) map.get("title"))[0];
		String contents = ((String[]) map.get("contents"))[0];
		String deadline = ((String[]) map.get("deadline"))[0];
		
		int priority = Integer.parseInt(((String[]) map.get("priority"))[0]);
		//deadline值为一个字符串(2018-11-12)
		//格式化创建日期
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String createTime = dateFormat.format(new Date());
		//生成tasksId
		String tasksId = UUID.randomUUID().toString().replace("-", "").toLowerCase();
		
		Tasks tasks = new Tasks();
		tasks.setIs_del(0);
		tasks.setIsFinished(false);
		tasks.setCreateTime(createTime);
		tasks.setContents(contents);
		tasks.setDeadline(deadline);
		tasks.setPriority(priority);
		tasks.setTasksId(tasksId);
		tasks.setTodolistId(todolistId);
		if(!(title.equals(null)) && !(title.equals(""))) {
			tasks.setTitle(title);
		}
		
		boolean result = false;
		result = tasksService.addTasks(tasks);
		if(result) {
//			httpSession.setAttribute("todolistId", todolistId);
			
			//跳转至ListTasksPage时缺失todolistId导致无法显示所有任务
			System.out.println("Add Tasks Success. ");
			ServletActionContext.getResponse().sendRedirect(ServletActionContext.getRequest().getContextPath() + "/pages/ListTasksPage.jsp?todolistId=" + todolistId);
			return null;
//			return actionMapping.findForward("success");
		}else {
			return SUCCESS;
		}
		
	}
}
