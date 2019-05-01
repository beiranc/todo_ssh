<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Search View</title>
		<!-- 导入icon -->
		<link rel="icon" href="./images/favicon.ico">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<!-- 导入Google图标和字体 -->
	    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	
	    <!-- 导入Materialize的CSS库 -->
	    <link type="text/css" rel="stylesheet" href="./materialize/css/materialize.min.css" media="screen,projection">
	</head>
	<body>
		<div class="container">
			<div class="row col s12">
				<!-- 搜索框 -->
	    		<div class="card-panel well center deep-purple lighten-5 hoverable">
	   	    		<div class="row">
                        <form action="searchTasks.action" autocomplete="off" method="POST">
                        	<div class="card-panel">
                        		
			                	<div class="row">
				                	<div class="input-field col s12">
					                	<input type="text" id="keywords" class="validate" name="keyWord" required/>
                        				<label for="keywords">输入关键字</label>
					                	<span class="helper-text" data-error="不能为空" data-success="合法"></span>
					                </div>
				                </div>
                        		
                        		<button style="width: 100%" type="submit" class="btn waves-effect waves-light">查找</button>
                        	</div>
                        </form>
	   				</div>
	        	</div>
			</div>
		</div>
		
		<!-- 导入Materialize的JS库 -->
	  	<script type="text/javascript" src="./materialize/js/materialize.min.js" charset="utf-8"></script>
	</body>
</html>