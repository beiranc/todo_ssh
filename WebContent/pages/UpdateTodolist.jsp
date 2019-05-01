<%@page import="Model.TodolistService"%>
<!-- 导入Spring容器从而获取bean -->
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Update Todolist Page</title>
	<!-- 导入icon -->
	<link rel="icon" href="./images/favicon.ico">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 导入自定义CSS -->
	<link href="./css/Update.css" rel='stylesheet' type='text/css' />
	<!-- 导入Google图标和字体 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <!-- 导入Materialize的CSS库 -->
    <link type="text/css" rel="stylesheet" href="./materialize/css/materialize.min.css" media="screen,projection">
</head>
<body>
	<div class="container">
		<%@ page import="Model.Todolist" %>
		<%@ page import="Model.TodolistService" %>
		<%
			WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
			String todolistId = request.getParameter("todolistId");
			TodolistService todolistService = (TodolistService) context.getBean("TodolistService");
			Todolist todolist = new Todolist();
			todolist = todolistService.getTodolistById(todolistId);
		%>
		<div class="row">
			<div class="card-panel grey darken-1 center hoverable white-text">
				<form class="form-signin" action="updateTodolist.action?todolistId=<%= todolistId %>" method="post" autocomplete="off">
			        <h4 class="form-signin-heading" style="text-align:center;">修改此清单</h4>
			        
			        <div class="row">
	                	<div class="input-field col s12">
		                	<input type="text" id="inputTitle" value="<%= todolist.getTitle() %>" name="title" class="validate white-text" required autofocus>
		                	<label for="inputTitle">标题</label>
		                	<span class="helper-text" data-error="不能为空" data-success="合法"></span>
		                </div>
	                </div>
			        
			        <div class="row">
	                	<div class="input-field col s12">
		                	<input type="text" id="inputComments" value="<%= todolist.getComments() %>" name="comments" class="validate white-text" required><br/>
		                	<label for="inputComments">备注</label>
		                	<span class="helper-text" data-error="不能为空" data-success="合法"></span>
		                </div>
	                </div>
			        
			        <button class="btn waves-effect waves-light center" type="submit">确认修改</button>
			    </form>
			</div>
		</div>
	</div>
	
	<!-- 导入Materialize的JS库 -->
    <script type="text/javascript" src="./materialize/js/materialize.min.js" charset="utf-8"></script>
</body>
</html>