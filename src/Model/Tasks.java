package Model;

/*import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tasks")*/
public class Tasks {
//	@Id
	private String tasksId;
	
//	@Column(name = "title")
	private String title;
	
//	@Column(name = "contents")
	private String contents;
	
//	@Column(name = "isFinished")
	private boolean isFinished;
	
//	@Column(name = "priority")
	private int priority;
	
//	@Column(name = "createTime")
	private String createTime;
	
//	@Column(name = "deadline")
	private String deadline;
	
//	@Column(name = "is_del")
	private int is_del;
	
//	@Column(name = "todolistId")
	private String todolistId;
	
	//任务需要加入一个状态：过期
	//即到达设定的deadline时自动将任务设为过期  ，过期状态需修改样式
	//Next bug : deadline能设置成已过期的时间
	
	public Tasks() {
		
	}
	
	public Tasks(String tasksId, String title, String contents, int priority, String createTime, String deadline, int is_del, String todolistId) {
		this.tasksId = tasksId;
		this.title = title;
		this.contents = contents;
		this.isFinished = false; //默认为未完成
		this.priority = priority;
		this.createTime = createTime;
		this.deadline = deadline;
		this.is_del = is_del;
		this.todolistId = todolistId;
	}

	public String getTasksId() {
		return tasksId;
	}

	public void setTasksId(String tasksId) {
		this.tasksId = tasksId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public int getIs_del() {
		return is_del;
	}

	public void setIs_del(int is_del) {
		this.is_del = is_del;
	}

	public String getTodolistId() {
		return todolistId;
	}

	public void setTodolistId(String todolistId) {
		this.todolistId = todolistId;
	}

	public boolean getIsFinished() {
		return isFinished;
	}

	public void setIsFinished(boolean isFinished) {
		this.isFinished = isFinished;
	}
}
