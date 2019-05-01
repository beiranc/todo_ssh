<%@ page import="Model.Tasks"%>
<%@ page import="Model.TasksService"%>
<%@ page import="java.util.*"%>
<!-- 导入Spring容器从而获取bean -->
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Search Result View</title>
	<!-- 导入icon -->
	<link rel="icon" href="./images/favicon.ico">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 导入自定义CSS -->
	<link href="./css/Login.css" rel='stylesheet' type='text/css' />
	<!-- 导入Google图标和字体 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <!-- 导入Materialize的CSS库 -->
    <link type="text/css" rel="stylesheet" href="./materialize/css/materialize.min.css" media="screen,projection">
    <style>
    	a, a:hover {
    		text-decoration: none;
    	}
    </style>
    
    <script type="text/javascript">
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
    </script>
</head>
<body>
      <%@ page import="java.util.*" %>
	  <%@ page import="Model.Todolist"%>
	  <%@page import="Model.UserService"%>
	  <%@page import="Model.User"%>
      <%
    	  WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
          UserService userService = (UserService) context.getBean("UserService");
          HttpSession httpSession = request.getSession();
	  	  User user = new User();
		  String userId = (String) httpSession.getAttribute("userId");
		  user = userService.getUserById(userId);
      %>
      <nav>
    	<div class="nav-wrapper">
           <div class="col s12">
               <a href="javascript:void(0);" style="margin: 10px;" class="breadcrumb"><%= user.getUserName() %></a>
               <a href="javascript:void(0);" class="breadcrumb">搜索结果</a>
           </div>
        </div>
    </nav>
      
      <!-- ListTasksPage界面  -->
      <div class="card-panel well center deep-purple lighten-5 hoverable">
        <div class="row">
            <div class="col s12">
                <div class="row">
                    <div class="col s12 m12">
                        <div class="card blue-grey darken-1">
                            <div class="card-content">
                                <span class="card-title white-text">
                                    <h5>搜索结果</h5>
                                </span>
                                <ul class="collection">
                                    <%
		                            	List<Tasks> tasksList = new ArrayList();
		                            	String keyWord = (String) request.getAttribute("keyWord");
		                            	tasksList = (List<Tasks>) request.getAttribute("list");
		                				for(int i=0; i < tasksList.size(); i++){
		                			%>
                                    <li class="collection-item avatar">
                                        <i class="material-icons circle yellow darken-4">assistant</i>
                                        <span class="title left">
                                            <a class="left tooltipped" data-position="bottom" data-tooltip="<%= tasksList.get(i).getContents() %>" href="javascript:void(0);"><%= (i + 1) + ". " + tasksList.get(i).getTitle() %></a>
                                            <%
                                            	switch(tasksList.get(i).getPriority()) {
                                            		case 1:
                                            %>
                                            <span class="new badge left teal darken-3" data-badge-caption="一般"></span>
                                            <%
                                            			break;
                                            		case 2:
                                            %>
                                            <span class="new badge left orange lighten-1" data-badge-caption="重要"></span>
                                            <%
                                            			break;
                                            		case 3:
                                            %>
                                            <span class="new badge left red accent-4" data-badge-caption="紧急"></span>
                                            <%
                                            			break;
                                            	}
                                            %>
                                            <%
			                                	if(!tasksList.get(i).getIsFinished()) {
			                                %>
			                                <span class="new badge left red" data-badge-caption="未完成"></span>
			                                <%
			                                	} else {
			                                %>
			                                <span class="new badge left lime darken-1" data-badge-caption="已完成"></span>
			                                <%
			                                	}
			                                %>
                                        </span>
                                        <span class="new badge left cyan darken-4" data-badge-caption="<%= tasksList.get(i).getDeadline() %>"></span>
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
                                <a href="javascript:void(0);">
                                    <h5 class="white-text"><%= user.getUserName() %></h5>
                                </a><br>
                            </div>
                        </div>
                    </li>
                    <li><a href='/todo_ssh/pages/ListPage.jsp' class="waves-effect">返回主页面</a></li>
                </ul>

            </div>
        </div>
      </div>
      <!-- 导入Materialize的JS库 -->
	  <script type="text/javascript" src="./materialize/js/materialize.min.js" charset="utf-8"></script>
</body>
</html>