<%@page import="Model.TasksService"%>
<%@page import="Model.Tasks"%>
<%@page import="Model.TodolistService"%>
<%@page import="Model.UserService"%>
<%@page import="Model.User"%>

<!-- 导入Spring容器从而获取bean -->
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>List Page</title>
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
    <script>
    	function logout() {
    		var button = document.getElementById("logout");
    		if(confirm('确定要注销？')) {
    			alert("注销成功！");
    			window.location.href="/todo_ssh";
    		}
    	}
    </script>
</head>
<body>
	<!-- 用户注销功能待做 -->
	<%@ page import="java.util.*" %>
	<%@ page import="Model.Todolist"%>
	<div class="container-fluid">
            <%
            	HttpSession httpSession = request.getSession();
            	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
    			UserService userService = (UserService) context.getBean("UserService");
    			User user = new User();
    			String userId = (String) httpSession.getAttribute("userId");
    			user = userService.getUserById(userId);
    		%>
    		<!-- 工具栏 -->
    		<div class="jumbotron well text-center">
	    		<div class="container-fluid" id="XS">
					<div class="row-fluid">
						<div class="span12">
                            <table class="table">
                				<tbody>
                					<tr> <!-- btn-lg -->
                                        <td style="border: 0px;"><button type="button" class="btn btn-warning btn-block active disabled visible-xs"><%= user.getUserName() %></button></td>
                                        <td style="border: 0px;"><button type="button" class="btn btn-warning btn-block active disabled visible-sm"><%= user.getUserName() %></button></td>
                                        <td style="border: 0px;"><button type="button" class="btn btn-warning btn-block active disabled visible-md"><span class="glyphicon glyphicon-user"></span>&nbsp;当前用户: <%= user.getUserName() %></button></td>
                                        <td style="border: 0px;"><button type="button" class="btn btn-warning btn-block active disabled visible-lg"><span class="glyphicon glyphicon-user"></span>&nbsp;当前用户: <%= user.getUserName() %></button></td>

                                        <td style="border: 0px;"><a href='/todo_ssh/pages/AddTodolistPage.jsp'><button type="button" class="btn btn-info btn-block active visible-xs">添加</button></a></td>
                                        <td style="border: 0px;"><a href='/todo_ssh/pages/AddTodolistPage.jsp'><button type="button" class="btn btn-info btn-block active visible-sm">添加</button></a></td>
                                        <td style="border: 0px;"><a href='/todo_ssh/pages/AddTodolistPage.jsp'><button type="button" class="btn btn-info btn-block active visible-md"><span class="glyphicon glyphicon-plus"></span>&nbsp;添加一个清单</button></a></td>
                                        <td style="border: 0px;"><a href='/todo_ssh/pages/AddTodolistPage.jsp'><button type="button" class="btn btn-info btn-block active visible-lg"><span class="glyphicon glyphicon-plus"></span>&nbsp;添加一个清单</button></a></td>

                                        <td style="border: 0px;"><a href='/todo_ssh'><button type="button" class="btn btn-danger btn-block active visible-xs">返回</button></a></td>
                                        <td style="border: 0px;"><a href='/todo_ssh'><button type="button" class="btn btn-danger btn-block active visible-sm">返回</button></a></td>
                                        <td style="border: 0px;"><a href='/todo_ssh'><button type="button" class="btn btn-danger btn-block active visible-md"><span class="glyphicon glyphicon-chevron-left"></span>&nbsp;返回主页面</button></a></td>
                                        <td style="border: 0px;"><a href='/todo_ssh'><button type="button" class="btn btn-danger btn-block active visible-lg"><span class="glyphicon glyphicon-chevron-left"></span>&nbsp;返回主页面</button></a></td>
                                        
                                        <td style="border: 0px;"><a href="javascript:void(0);"><button type="button" onclick="logout();" id="logout" class="btn btn-primary btn-block active visible-xs">注销</button></a></td>
                                        <td style="border: 0px;"><a href="javascript:void(0);"><button type="button" onclick="logout();" id="logout" class="btn btn-primary btn-block active visible-sm">注销</button></a></td>
                                        <td style="border: 0px;"><a href="javascript:void(0);"><button type="button" onclick="logout();" id="logout" class="btn btn-primary btn-block active visible-md"><span class="glyphicon glyphicon-off"></span>&nbsp;注销</button></a></td>
                                        <td style="border: 0px;"><a href="javascript:void(0);"><button type="button" onclick="logout();" id="logout" class="btn btn-primary btn-block active visible-lg"><span class="glyphicon glyphicon-off"></span>&nbsp;注销</button></a></td>
                					</tr>
                				</tbody>
                			</table>
						</div>
					</div>
				</div>
    		</div>
    		<!-- 搜索框 -->
    		<div class="jumbotron well text-center">
   	    		<div class="container-fluid" id="XS">
   					<div class="row-fluid">
   						<div class="span12">
                            <form class="form form-search form-inline" action="searchTasks.action" method="POST">
                                <table class="table">
                    				<tbody>
                    					<tr> <!-- btn-lg -->
                    						<td style="border: 0px;"><input style="width: 100%;" class="input-medium search-query form-control" type="text" name="keyWord" placeholder="input keyword..." required/></td>
                    						<td style="border: 0px;"><button type="submit" class="btn btn-success btn-block active"><span class="glyphicon glyphicon-search"></span>&nbsp;查找</button></td>
                    					</tr>
                    				</tbody>
                    			</table>
                            </form>
   						</div>
   					</div>
   				</div>
        	</div>
        	<div class="row-fluid">
        		<div class="span12">
        			<table class="table table-hover table-bordered text-center">
        				<thead>
                            <caption class="text-center"><h1>待办清单</h1></caption>
        					<tr>
        						<th class="text-center">标题</th>
        						<th class="text-center">备注</th>
        						<th class="text-center">修改</th>
        						<th class="text-center">删除</th>
        					</tr>
        				</thead>
        				<tbody>
                            <%
                				List<Todolist> list = new ArrayList();
                				//获取List
                				TodolistService todolistService = (TodolistService) context.getBean("TodolistService");
                				list = todolistService.getAllTodolistById(userId);;
                				for(int i=0; i < list.size(); i++){
                			%>
        					<tr class="success">
        						<td><a href='/todo_ssh/pages/ListTasksPage.jsp?todolistId=<%= list.get(i).getTodolistId() %>'><%= list.get(i).getTitle() %></a></td>
        						<td><%= list.get(i).getComments() %></td>
        						<td><a href='/todo_ssh/pages/UpdateTodolist.jsp?todolistId=<%= list.get(i).getTodolistId() %>'><button class="btn btn-block btn-large btn-success" type="button">修改</button></a></td>
        						<td><a href='listPage.action?todolistId=<%= list.get(i).getTodolistId() %>'><button class="btn btn-block btn-large btn-primary" type="button">删除</button></a></td>
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