<%@ page import="Model.Tasks"%>
<%@ page import="Model.TasksService"%>
<%@ page import="java.util.*"%>

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
	<div class="container-fluid">
   		<div class="jumbotron well text-center">
    		<div class="container-fluid" id="XS">
				<div class="row-fluid">
					<div class="span12">
                        <table class="table">
               				<tbody>
               					<tr>
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
   		 
   		 <!-- 搜索结果展示 -->
        	<div class="row-fluid">
        		<div class="span12">
        			<table class="table table-hover table-bordered text-center">
        				<thead>
                            <caption class="text-center"><h1>搜索结果</h1></caption>
        					<tr>
        						<th class="text-center">标题</th>
        						<th class="text-center">内容</th>
        						<th class="text-center">优先级</th>
        						<th class="text-center">创建时间</th>
        						<th class="text-center">最后期限</th>
        					</tr>
        				</thead>
        				<tbody>
                            <%
                            	List<Tasks> tasksList = new ArrayList();
                            	String keyWord = (String) request.getAttribute("keyWord");
                            	tasksList = (List<Tasks>) request.getAttribute("list");
                				for(int i=0; i < tasksList.size(); i++){
                			%>
        					<tr class="success">
        						<%
        							int index = tasksList.get(i).getTitle().indexOf(keyWord);
        						%>
        						<td><%= tasksList.get(i).getTitle().substring(0, index) %><font color="red"><%= keyWord %></font><%= tasksList.get(i).getTitle().substring(index + keyWord.length()) %></td>
        						<td><%= tasksList.get(i).getContents() %></td>
        						<td><%= tasksList.get(i).getPriority() %></td>
        						<td><%= tasksList.get(i).getCreateTime() %></td>
        						<td><%= tasksList.get(i).getDeadline() %></td>
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