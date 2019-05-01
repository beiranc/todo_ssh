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
	<!-- <link href="./css/Login.css" rel='stylesheet' type='text/css' />  -->
	
	<!-- 导入Google图标和字体 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <!-- 导入Materialize的CSS库 -->
    <link type="text/css" rel="stylesheet" href="./materialize/css/materialize.min.css" media="screen,projection">
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
    	var accordion = true;
        document.addEventListener('DOMContentLoaded', function() {
            var elems = document.querySelectorAll('.collapsible');
            var instances = M.Collapsible.init(elems, accordion);
        });
        
        document.addEventListener('DOMContentLoaded', function() {
            var elems = document.querySelectorAll('.fixed-action-btn');
            var instances = M.FloatingActionButton.init(elems, {
                direction: 'top',
                hoverEnabled: false
            });
        });
        
        document.addEventListener('DOMContentLoaded', function() {
            var elems = document.querySelectorAll('.tooltipped');
            var instances = M.Tooltip.init(elems, {
            	exitDelay: 0,
            	enterDelay: 200
            });
        });
        
        document.addEventListener('DOMContentLoaded', function() {
            var elems = document.querySelectorAll('.sidenav');
            var instances = M.Sidenav.init(elems, {
                edge: 'left',
                draggable: true,
                inDuration: 250,
                outDuration: 200
            });
        });
        document.addEventListener('DOMContentLoaded', function() {
            var elems = document.querySelectorAll('.dropdown-trigger');
            var instances = M.Dropdown.init(elems, {
            	alignment: 'right',
            	autoTrigger: false,
            	constrainWidth: true,
            	closeOnClick: true,
            	coverTrigger: true
            });
        });
    </script>
</head>
<body>
	<!-- 用户注销功能待做 -->
	<%@ page import="java.util.*" %>
	<%@ page import="Model.Todolist"%>
	<div class="container">
            <%
            	HttpSession httpSession = request.getSession();
            	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
    			UserService userService = (UserService) context.getBean("UserService");
    			User user = new User();
    			String userId = (String) httpSession.getAttribute("userId");
    			user = userService.getUserById(userId);
    		%>

        	<!-- 清单主体 -->
        	<div class="card-panel well center deep-purple lighten-5 hoverable">
        		<div class="row">
	        		<div class="col s12">
	        			<div class="row">
	        				<div class="col s12 m12">
	        					<div class="card blue-grey darken-1">
	        						<div class="card-content">
	        							<span class="card-title white-text">
	        								<h3>待办清单</h3>
	        							</span>
	        							<ul class="collection">
	        								<%
				                				List<Todolist> list = new ArrayList();
				                				//获取List
				                				TodolistService todolistService = (TodolistService) context.getBean("TodolistService");
				                				list = todolistService.getAllTodolistById(userId);;
				                				for(int i=0; i < list.size(); i++){
				                			%>
	        								<li class="collection-item avatar">
	        									<i class="material-icons circle yellow darken-4">snooze</i>
	        									<span class="title left">
	        										<a class="left" href='/todo_ssh/pages/ListTasksPage.jsp?todolistId=<%= list.get(i).getTodolistId() %>&userName=<%= user.getUserName() %>'><%= (i + 1) + ". " + list.get(i).getTitle() %></a>
	        										<span class="new badge left" data-badge-caption="<%= list.get(i).getComments() %>"></span>
	        									</span>
	        									
	        									<!-- 删除类高危操作可以弹出一个遮罩框进行确认 -->
	        									<div class="secondary-content">
	        										<button class="btn btn-floating waves-effect waves-light green tooltipped dropdown-trigger" type="button" data-target='dropdownedit' data-position="top" data-tooltip="编辑"><i class="material-icons">mode_edit</i></button>
	        										<ul id="dropdownedit" class="dropdown-content">
		        										<li><a href='/todo_ssh/pages/UpdateTodolist.jsp?todolistId=<%= list.get(i).getTodolistId() %>'><button class="btn btn-floating waves-effect waves-light green" type="button">修改</button></a></li>
		        										<li><a href='listPage.action?todolistId=<%= list.get(i).getTodolistId() %>'><button class="btn btn-floating waves-effect waves-light red" type="button">删除</button></a></li>
		        									</ul>
	        									</div>
	        								</li>
	        								<%
				                				}
				                			%>
	        							</ul>
	        						</div>
	        					</div>
	        				</div>
	        			</div>
	        			
	        			<!-- 悬浮按钮 -->
	        			<div class="fixed-action-btn">
					        <a class="btn-floating btn-large red waves-effect waves-light">
					            <i class="large material-icons">menu</i>
					        </a>
					        <ul>
					            <li>
					            	<a href='/todo_ssh/pages/SearchPage.jsp' class="btn-floating red waves-effect waves-light tooltipped" data-position="left" data-tooltip="搜索一个子任务">
					            		<i class="material-icons">search</i>
					            	</a>
					            </li>
					            <li>
					            	<a href='/todo_ssh/pages/AddTodolistPage.jsp' class="btn-floating green waves-effect waves-light tooltipped" data-position="left" data-tooltip="添加一个清单">
					            		<i class="material-icons">publish</i>
					            	</a>
					            </li>
					            <li>
					            	<a data-target="slide-out" class="btn-floating blue waves-effect waves-light tooltipped sidenav-trigger" data-position="left" data-tooltip="详细信息">
					            		<i class="material-icons">attach_file</i>
					            	</a>
					            </li>
					        </ul>
					    </div>
					    
					    <!-- 工具栏 -->
					    <ul id="slide-out" class="sidenav">
					        <li>
					            <div class="user-view">
					                <div class="background">
					                    <img src="images/office.jpg">
					                </div>
					                <div class="name">
					                	<a href="javascript:void(0);"><img class="circle" src="images/head.jpg"></a>
					                	<a href="javascript:void(0);"><h5 class="white-text"><%= user.getUserName() %></h5></a><br>
					                </div>
					            </div>
					        </li>
					        <li><a href="/todo_ssh" class="waves-effect">返回主页面</a></li>
					        <li>
					        	<a href="javascript:void(0);" onclick="logout();" class="waves-effect">注销</a>
					        </li>
					        <li>
					            <div class="divider"></div>
					        </li>
					        <li><a class="subheader">Update User</a></li>
					        <li><a class="waves-effect" href="#!">修改密码(未实现)</a></li>
					    </ul>
					    
	        		</div>
	        	</div>
        	</div>
      </div>
      
      <!-- 导入Materialize的JS库 -->
	  <script type="text/javascript" src="./materialize/js/materialize.min.js" charset="utf-8"></script>
</body>
</html>