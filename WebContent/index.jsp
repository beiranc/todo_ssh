<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Index Page</title>
	<link rel="icon" href="./pages/images/favicon.ico">
	<meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- 导入Google图标和字体 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <!-- 导入Materialize的CSS库 -->
    <link type="text/css" rel="stylesheet" href="./pages/materialize/css/materialize.min.css" media="screen,projection">
</head>
<body>
	<script type="text/javascript">
	var options = {
        edge: 'left',
        draggable: true,
        inDuration: 250,
        outDuration: 200
    }
    document.addEventListener('DOMContentLoaded', function() {
        var elems = document.querySelectorAll('.sidenav');
        var instances = M.Sidenav.init(elems, options);
    });
	</script>
	<div class="container">
		<nav class="purple lighten-3">
	        <div class="nav-wrapper">
	            <a href="/todo_ssh" style="margin-left: 10px;" class="brand-logo">ToDoList</a>
	            <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
	            <ul class="right hide-on-med-and-down">
	                <li><s:url id="url" action="pages/register_input"></s:url><s:a class="test" href="%{url}"> 注册 </s:a></li>
					<li><s:url id="url" action="pages/login_input"></s:url><s:a href="%{url}"> 登录  </s:a></li>
	            </ul>
	        </div>
	    </nav>
		
		<ul class="sidenav" id="mobile-demo">
	        <li><s:url id="url" action="pages/register_input"></s:url><s:a class="test" style="color:#f2711c" href="%{url}">注册<i style="color:#f2711c" class="material-icons right">send</i></s:a></li>
			<li><s:url id="url" action="pages/login_input"></s:url><s:a style="color:#f2711c" href="%{url}">登录<i style="color:#f2711c" class="material-icons right">send</i></s:a></li>
	    </ul>
		
      	<div class="row">
      		<div class="col s12">
      			<div class="card-panel grey darken-1 center hoverable">
      				<h1 style="color: #f2711c;">ToDoList</h1>
      				<p class="white-text">Time and task tracking at your fingertips.</p>
      			</div>
      			
      			<div class="divider"></div>
      			
      			<div class="section">
      				<div class="row">
	      				<div class="col s12">
	      					<div class="card blue-grey darken-1 center hoverable">
	      						<div class="card-content">
	      							<em class="card-title" style="color:#f2711c">这是什么？</em><br/><br/>
		                               <p class="white-text">A simple todo application for managing all your needs.
		                               Most use cases should be satisfied.</p>
	      						</div>
	      						<!-- 原有的注册登录链接 -->
	      						<!-- <div class="card-action">
	      							<em style="color:#f2711c" class="left">还没帐号？点此<s:url id="url" action="pages/register_input"></s:url><s:a class="test" href="%{url}"> 注册 </s:a></em>
	                              	<em class="right white-text">已有账号？点此<s:url id="url" action="pages/login_input"></s:url><s:a href="%{url}"> 登录  </s:a></em><br>
	      						</div> -->
	      					</div>
	      				</div>
	      			</div>
      			</div>
      			
      		</div>
      	</div>
      	
      	<footer class="page-footer blue-grey darken-1">
      		<div class="footer-copyright">
	      		<div class="container">
	      			<p class="grey-text text-lighten-4 center">ToDoList&nbsp;&copy;版权所有</p>
	      		</div>
	      	</div>
      	</footer>
     </div>
     
	 <!-- 导入Materialize的JS库 -->
     <script type="text/javascript" src="./pages/materialize/js/materialize.min.js" charset="utf-8"></script>
</body>
</html>