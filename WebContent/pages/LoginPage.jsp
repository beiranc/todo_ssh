<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Login Page</title>
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
            <form class="form-signin" action="login.action" method="post">
                <h2 class="form-signin-heading" style="text-align:center;">User Sign in</h2>
                <label for="inputUserName" class="sr-only">UserName</label>
                <input type="text" id="inputUserName" name="userName" class="form-control" placeholder="UserName" required autofocus><br/>
                <label for="inputPassword" class="sr-only">Password</label>
                <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required><br/>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" value="remember-me"> Remember me
                    </label>
                </div>
                <button class="btn btn-lg btn-danger btn-block" type="submit">登录</button>
            </form>
        </div>
	</body>
</html>