<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Add Tasks Page</title>
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
    <form class="form-signin" action="addTasks.action?todolistId=<%= request.getParameter("todolistId") %>" method="post">
        <h2 class="form-signin-heading" style="text-align:center;">添加一个任务</h2>
        <label for="inputTitle" class="sr-only">标题</label>
        <input type="text" id="inputTitle" name="title" class="form-control" placeholder="标题..." required autofocus><br/>

        <label for="inputContents" class="sr-only">内容</label>
        <input type="text" id="inputContents" name="contents" class="form-control" placeholder="内容..." required><br/>

        <label for="inputPriority" class="sr-only">优先级</label>
        <select id="inputPriority" class="form-control" name="priority" required>
            <option value='1'>1(一般)</option>
			<option value='2'>2(重要)</option>
			<option value='3'>3(紧急)</option>
        </select><br/>

        <label for="inputDeadline" class="sr-only">最后期限</label>
        <input type="date" id="inputDeadline" name="deadline" class="form-control" required><br/>

        <button class="btn btn-lg btn-info btn-block" type="submit">提交</button>
    </form>
</div>
</body>
</html>