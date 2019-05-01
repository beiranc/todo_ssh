<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Update Tasks Page</title>
	<!-- 导入icon -->
	<link rel="icon" href="./images/favicon.ico">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 导入自定义CSS -->
	<link href="./css/Login.css" rel='stylesheet' type='text/css' />
	<!-- 导入Google图标和字体 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <!-- 导入Materialize的CSS库 -->
    <link type="text/css" rel="stylesheet" href="./materialize/css/materialize.min.css" media="screen,projection">
    
    <script type="text/javascript">
	    document.addEventListener('DOMContentLoaded', function() {
	        var elems = document.querySelectorAll('select');
	        var instances = M.FormSelect.init(elems, {
	        	classes: ''
	        });
	    });
	    document.addEventListener('DOMContentLoaded', function() {
	        var elems = document.querySelectorAll('.datepicker');
	        var instances = M.Datepicker.init(elems, {
	        	format: 'yyyy/mm/dd',
	        	startDate: new Date(),
	        	minDate: new Date()
	        });
	    });
    </script>
</head>
<body>
	<!-- 修改后 -->
	<div class="container">
		<!-- 导入Spring容器从而获取bean -->
		<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
		<%@page import="org.springframework.web.context.WebApplicationContext"%>
		<%@ page import="Model.Tasks" %>
		<%@ page import="Model.TasksService" %>
		<%
			WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
			String tasksId = request.getParameter("tasksId");
			String todolistId = request.getParameter("todolistId");
			TasksService tasksService = (TasksService) context.getBean("TasksService");
			Tasks tasks = new Tasks();
			tasks = tasksService.getTasksById(tasksId);
		%>
		<div class="row">
			<div class="card-panel grey darken-1 center hoverable">
				<form class="form-signin" action="listTasksPage_update.action?tasksId=<%= tasksId %>&todolistId=<%= todolistId %>" method="post" autocomplete="off">
			        <h4 class="form-signin-heading white-text" style="text-align:center;">修改此任务</h4>
			        
			        <div class="row">
	                	<div class="input-field col s12">
		                	<input type="text" id="inputTitle" name="title" value="<%= tasks.getTitle() %>" class="validate white-text" required autofocus>
		                	<label for="inputTitle">标题</label>
		                	<span class="helper-text" data-error="不能为空" data-success="合法"></span>
		                </div>
	                </div>
	                
	                <div class="row">
	                	<div class="input-field col s12">
		                	<input type="text" id="inputContents" name="contents" value="<%= tasks.getContents() %>" class="validate white-text" required><br/>
		                	<label for="inputComments">内容</label>
		                	<span class="helper-text" data-error="不能为空" data-success="合法"></span>
		                </div>
	                </div>
	                
	                <div class="row">
	                	<div class="input-field col s12 white-text">
					        <select id="inputPriority" class="validate" name="priority" required>
					            <%
						        	if(tasks.getPriority() == 1) {
						        %>
							            <option value='1' selected="selected">1(一般)</option>
							            <option value='2'>2(重要)</option>
							            <option value='3'>3(紧急)</option>
						        <%
						        	} else if(tasks.getPriority() == 2) {
						        %>
							        	<option value='1'>1(一般)</option>
										<option value='2' selected="selected">2(重要)</option>
										<option value='3'>3(紧急)</option>
								<%
						        	} else {
								%>
									<option value='1'>1(一般)</option>
									<option value='2'>2(重要)</option>
									<option value='3' selected="selected">3(紧急)</option>
								<%
						        	}
								%>
					        </select>
					        <label for="inputPriority">优先级</label>
		                </div>
	                </div>
	                
	                <div class="row">
	                	<div class="input-field col s12">
	        				<input type="text" class="datepicker validate white-text disabled" value="<%= tasks.getDeadline() %>" id="inputDeadline" name="deadline" required>
	        				<label for="inputDeadline">最后期限</label>
		                </div>
	                </div>
			        
			        <button class="btn waves-effect waves-light center" type="submit">提交</button>
			    </form>
			</div>
		</div>
	</div>
	<!-- 导入Materialize的JS库 -->
    <script type="text/javascript" src="./materialize/js/materialize.min.js" charset="utf-8"></script>
</body>
</html>