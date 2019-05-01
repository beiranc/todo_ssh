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
		<!-- 导入Google图标和字体 -->
	    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	
	    <!-- 导入Materialize的CSS库 -->
	    <link type="text/css" rel="stylesheet" href="./materialize/css/materialize.min.css" media="screen,projection">
	</head>
	<body>
        
        <div class="container">
			<div class="row">
				<div class="card-panel grey darken-1 center hoverable white-text">
					<form class="form-signin" action="login.action" method="post" autocomplete="off">
		                <h2 class="form-signup-heading" style="text-align:center;">User Sign in</h2>
		                
		                <div class="row">
		                	<div class="input-field col s12">
			                	<i class="material-icons prefix">account_circle</i>
			                	<input type="text" id="inputUserName" name="userName" class="validate white-text" required autofocus>
			                	<label for="inputUserName">UserName</label>
			                	<span class="helper-text" data-error="不能为空" data-success="合法"></span>
			                </div>
		                </div>
		                
		                <div class="row">
		                	<div class="input-field col s12">
			                	<i class="material-icons prefix">lock</i>
			                	<input type="password" id="inputPassword" name="password" class="validate white-text" required><br/>
			                	<label for="inputPassword">Password</label>
			                	<span class="helper-text" data-error="不能为空" data-success="合法"></span>
			                </div>
		                </div>
		                
		                <div class="row">
		                	<div class="input-field col s12">
		                		<div class="checkbox">
				                    <label>
				                        <input type="checkbox" value="remember-me">
				                        <span>Remember me</span>
				                    </label>
				                </div>
		                	</div>
		                </div>
		                
		                <button class="btn waves-effect waves-light center" type="submit">登录
		                	<i class="material-icons right">send</i>
		                </button>
		            </form>
				</div>
			</div>
        </div>
        
        <!-- 导入Materialize的JS库 -->
    	<script type="text/javascript" src="./materialize/js/materialize.min.js" charset="utf-8"></script>
	</body>
</html>