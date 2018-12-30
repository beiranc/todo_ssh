<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Add Todolist Page</title>
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
</head>
<body>
	<div class="container">
	    <form class="form-signin" action="addTodolist.action" method="post">
	        <h2 class="form-signin-heading" style="text-align:center;">添加一个清单</h2>
	        <label for="inputTitle" class="sr-only">标题</label>
	        <input type="text" id="inputTitle" name="title" class="form-control" placeholder="标题..." required autofocus><br/>
	        <label for="inputComments" class="sr-only">备注</label>
	        <input type="text" id="inputComments" name="comments" class="form-control" placeholder="备注..." required><br/>
	        <button class="btn btn-lg btn-success btn-block" type="submit">提交</button>
	    </form>
	</div>
</body>
</html>