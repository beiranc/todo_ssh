<%@page import="Model.Tasks"%>
<%@page import="Model.TasksService"%>
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
	<title>List Tasks Page</title>
	<!-- 导入icon -->
	<link rel="icon" href="./images/favicon.ico">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 导入自定义CSS -->
	<link href="./css/Login.css" rel='stylesheet' type='text/css' />
	<!-- jquery for Bootstrap 导入-->
    <script src="./bootstrap/js/jquery/2.0.0/jquery.min.js"></script>

    <!-- bootstrap 导入 -->
    <link rel="stylesheet" href="./bootstrap/css/bootstrap/3.3.6/bootstrap.min.css">
    <script src="./bootstrap/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <style>
    	a, a:hover {
    		text-decoration: none;
    	}
    </style>
</head>
<body>
	<%@ page import="java.util.*" %>
	<%@ page import="Model.Todolist"%>
	<div class="container-fluid">
            <%
            	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
                TodolistService todolistService = (TodolistService) context.getBean("TodolistService");
                String todolistId = (String) request.getParameter("todolistId");
                Todolist todolist = todolistService.getTodolistById(todolistId);
            %>
    		<div class="jumbotron well text-center">
	    		<div class="container-fluid" id="XS">
					<div class="row-fluid">
						<div class="span12">
                            <table class="table">
                				<tbody>
                					<tr> <!-- btn-lg -->
                                        <td style="border: 0px;"><button type="button" class="btn btn-warning btn-block active disabled visible-xs"><%= todolist.getTitle() %></button></td>
                                        <td style="border: 0px;"><button type="button" class="btn btn-warning  active disabled visible-sm"><%= todolist.getTitle() %></button></td>
                                        <td style="border: 0px;"><button type="button" class="btn btn-warning btn-block active disabled visible-md"><span class="glyphicon glyphicon-eye-open"></span>&nbsp;当前清单: <%= todolist.getTitle() %></button></td>
                                        <td style="border: 0px;"><button type="button" class="btn btn-warning btn-block active disabled visible-lg"><span class="glyphicon glyphicon-eye-open"></span>&nbsp;当前清单: <%= todolist.getTitle() %></button></td>

                                        <td style="border: 0px;"><a href='/todo_ssh/pages/AddTasksPage.jsp?todolistId=<%= todolistId %>'><button type="button" class="btn btn-info btn-block active visible-xs">添加</button></a></td>
                                        <td style="border: 0px;"><a href='/todo_ssh/pages/AddTasksPage.jsp?todolistId=<%= todolistId %>'><button type="button" class="btn btn-info btn-block active visible-sm">添加</button></a></td>
                                        <td style="border: 0px;"><a href='/todo_ssh/pages/AddTasksPage.jsp?todolistId=<%= todolistId %>'><button type="button" class="btn btn-info btn-block active visible-md"><span class="glyphicon glyphicon-plus"></span>&nbsp;添加一个任务</button></a></td>
                                        <td style="border: 0px;"><a href='/todo_ssh/pages/AddTasksPage.jsp?todolistId=<%= todolistId %>'><button type="button" class="btn btn-info btn-block active visible-lg"><span class="glyphicon glyphicon-plus"></span>&nbsp;添加一个任务</button></a></td>

                                        <td style="border: 0px;"><a href='/todo_ssh/pages/ListPage.jsp'><button type="button" class="btn btn-danger btn-block active visible-xs">返回</button></a></td>
                                        <td style="border: 0px;"><a href='/todo_ssh/pages/ListPage.jsp'><button type="button" class="btn btn-danger btn-block active visible-sm">返回</button></a></td>
                                        <td style="border: 0px;"><a href='/todo_ssh/pages/ListPage.jsp'><button type="button" class="btn btn-danger btn-block active visible-md"><span class="glyphicon glyphicon-chevron-left"></span>&nbsp;返回主列表</button></a></td>
                                        <td style="border: 0px;"><a href='/todo_ssh/pages/ListPage.jsp'><button type="button" class="btn btn-danger btn-block active visible-lg"><span class="glyphicon glyphicon-chevron-left"></span>&nbsp;返回主列表</button></a></td>
                					</tr>
                				</tbody>
                			</table>
						</div>
					</div>
				</div>
    		</div>
        	<div class="row-fluid">
        		<div class="span12">
        			<table class="table table-hover table-bordered text-center">
        				<thead>
                            <caption class="text-center"><h1><%= todolist.getTitle() %>的未完成事项</h1></caption>
        					<tr>
        						<th class="text-center">标题</th>
        						<th class="text-center">内容</th>
        						<th class="text-center">优先级</th>
        						<th class="text-center">创建时间</th>
                                <th class="text-center">最后期限</th>
                                <th class="text-center">设为完成</th>
                                <th class="text-center">修改</th>
                                <th class="text-center">删除</th>
        					</tr>
        				</thead>
        				<tbody>
                            <%
                				List<Tasks> list = new ArrayList();
                				//获取tasks
                				TasksService tasksService = (TasksService) context.getBean("TasksService");
                				list = tasksService.getAllTasksById(todolistId);
                				for(int i=0; i < list.size(); i++){
                			%>
        					<tr class="info">
                                <%
                                	if(!list.get(i).getIsFinished()) {
                                %>
                                <td><%= list.get(i).getTitle() %></td>
            					<td><%= list.get(i).getContents() %></td>
            					<td><%= list.get(i).getPriority() %></td>
            					<td><%= list.get(i).getCreateTime() %></td>
            					<td><%= list.get(i).getDeadline() %></td>
            					<!-- list.get(i).getTasksId -->
            					<td><a href='listTasksPage_changeComplete.action?tasksId=<%= list.get(i).getTasksId() %>&todolistId=<%= todolistId %>&complete=1'><button class="btn btn-large btn-primary" type="button">完成</button></a></td>
            					<td><a href='/todo_ssh/pages/UpdateTasks.jsp?tasksId=<%= list.get(i).getTasksId() %>&todolistId=<%= todolistId %>'><button class="btn btn-large btn-info" type="button">修改</button></a></td>
            					<td><a href='listTasksPage_delete.action?tasksId=<%= list.get(i).getTasksId() %>&todolistId=<%= todolistId %>'><button class="btn btn-large btn-danger" type="button">删除</button></a></td>
            					<%
                                	}
                                %>
        					</tr>
                            <%
                				}
                			%>
        				</tbody>
        			</table>
        			
        			<table class="table table-hover table-bordered text-center">
        				<thead>
                            <caption class="text-center"><h1><%= todolist.getTitle() %>的已完成事项</h1></caption>
        					<tr>
        						<th class="text-center">标题</th>
        						<th class="text-center">内容</th>
        						<th class="text-center">优先级</th>
        						<th class="text-center">创建时间</th>
                                <th class="text-center">最后期限</th>
                                <th class="text-center">切换为未完成</th>
                                <th class="text-center">修改</th>
                                <th class="text-center">删除</th>
        					</tr>
        				</thead>
        				<tbody>
                            <%
                				for(int i=0; i < list.size(); i++){
                			%>
        					<tr class="info" style="color: grey; text-decoration: line-through; font-style: italic; font-weight: bold;">
        						<%
        							if(list.get(i).getIsFinished()) {
        						%>
                                <td><%= list.get(i).getTitle() %></td>
            					<td><%= list.get(i).getContents() %></td>
            					<td><%= list.get(i).getPriority() %></td>
            					<td><%= list.get(i).getCreateTime() %></td>
            					<td><%= list.get(i).getDeadline() %></td>
            					<!-- list.get(i).getTasksId -->
            					<td><a href='listTasksPage_changeComplete.action?tasksId=<%= list.get(i).getTasksId() %>&todolistId=<%= todolistId %>&complete=0'><button class="btn btn-large btn-success" type="button">切换</button></a></td>
            					<td><a href='/todo_ssh/pages/UpdateTasks.jsp?tasksId=<%= list.get(i).getTasksId() %>&todolistId=<%= todolistId %>'><button class="btn btn-large btn-info" type="button">修改</button></a></td>
            					<td><a href='listTasksPage_delete.action?tasksId=<%= list.get(i).getTasksId() %>&todolistId=<%= todolistId %>'><button class="btn btn-large btn-danger" type="button">删除</button></a></td>
            					<%
        							}
        						%>
        					</tr>
                            <%
                				}
                			%>
        				</tbody>
        			</table>
        		</div>
        	</div>
      </div>
</body>
</html>