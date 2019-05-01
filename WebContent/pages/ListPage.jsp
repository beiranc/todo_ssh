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
    		<!-- 工具栏 -->
    		<div class="card-panel center deep-purple lighten-5 hoverable">
				<div class="row">
					<div class="col s12 m12 l12 xl12">
						<div class="col s3 m3 l3 xl3">
							<div class="card-panel">
	           					<em class="chip">
		           					<i class="material-icons left">account_circle</i>
		           					&nbsp;欢迎您，<%= user.getUserName() %>
	           					</em>
							</div>
						</div>
						
						<ul class="collapsible col s9 m9 l9 xl9">
			    			<li>
			    				<div class="collapsible-header"><i class="medium material-icons">filter_drama</i>工具栏</div>
			            		<div class="collapsible-body">
			            			<ul class="collection">
			            				<li class="collection-item avatar">
			            					<a href='/todo_ssh/pages/AddTodolistPage.jsp'><button type="button" class="btn waves-effect waves-light left green"><i class="material-icons left">add</i><span>&nbsp;添加一个清单</span></button></a>
			            					
			            					<a href='/todo_ssh'><button type="button" class="btn waves-effect waves-light blue"><i class="material-icons left">arrow_back</i>&nbsp;返回主页面</button></a>
			            					
			            					<a href="javascript:void(0);"><button type="button" onclick="logout();" id="logout" class="btn waves-effect waves-light right red"><i class="material-icons left">settings_power</i>&nbsp;注销</button></a>
			            				</li>
			            			</ul>
			            		</div>
			    			</li>
			    		</ul>
					</div>
				</div>
    		</div>
    		
    		<!-- 搜索框 -->
    		<div class="card-panel well center deep-purple lighten-5 hoverable">
   	    		<div class="row">
   					<div class="col s12">
                        <form class="form" action="searchTasks.action" autocomplete="off" method="POST">
                        	<div class="card-panel">
                        		
                        		<div class="input-field col s12">
                        			<input  id="keywords" class="" type="text" name="keyWord" required/>
                        			<label for="keywords">输入关键字</label>
			                	</div>
                        		
                        		<button style="width: 100%" type="submit" class="btn waves-effect waves-light"><span class="glyphicon glyphicon-search"></span>&nbsp;查找</button>
                        	</div>
                        </form>
					</div>
   				</div>
        	</div>
        	
        	<div class="card-panel well center deep-purple lighten-5 hoverable">
        		<div class="row">
	        		<div class="col s12">
	        			<!-- <table class="table table-hover table-bordered text-center">
	        				<thead>
	                            <caption class="text-center"></caption>
	        					<tr>
	        						<th class="text-center">标题</th>
	        						<th class="text-center">备注</th>
	        						<th class="text-center">修改</th>
	        						<th class="text-center">删除</th>
	        					</tr>
	        				</thead>
	        				<tbody>
	        					<tr class="success">
	        						
	        					</tr>
	        				</tbody>
	        			</table>  -->
	        			
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
	        									<span class="title">
	        										<a class="left" href='/todo_ssh/pages/ListTasksPage.jsp?todolistId=<%= list.get(i).getTodolistId() %>'><%= list.get(i).getTitle() %></a>
	        										<span class="new badge left" data-badge-caption="<%= list.get(i).getComments() %>"></span>
	        									</span>
	        									
	        									<!-- 删除类高危操作可以弹出一个遮罩框进行确认 -->
	        									<div class="secondary-content">
	        										<a href='/todo_ssh/pages/UpdateTodolist.jsp?todolistId=<%= list.get(i).getTodolistId() %>'><button class="btn waves-effect waves-light green" type="button">修改</button></a>
	        										<a href='listPage.action?todolistId=<%= list.get(i).getTodolistId() %>'><button class="btn waves-effect waves-light red" type="button">删除</button></a>
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
	        			
	        		</div>
	        	</div>
        	</div>
      </div>
      
      <!-- 导入Materialize的JS库 -->
	  <script type="text/javascript" src="./materialize/js/materialize.min.js" charset="utf-8"></script>
</body>
</html>