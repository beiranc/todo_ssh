<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Error Page</title>
	<%-- <script type="text/javascript">
			alert("操作失败, 请稍候重试!!");
			history.back(-1);
	</script> --%>
	<!-- 导入icon -->
	<link rel="icon" href="./images/favicon.ico">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- 导入Google图标和字体 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <!-- 导入Materialize的CSS库 -->
    <link type="text/css" rel="stylesheet" href="./materialize/css/materialize.min.css" media="screen,projection">
    <style>
    	a, a:hover {
    		text-decoration: none;
    	}
    </style>
</head>
<body>
	<%-- <h3>Exception:</h3>
    <s:property value="exception"/>

    <h3>Stack trace:</h3>
    <pre>
        <s:property value="exceptionStack"/>
    </pre> --%>
    <div class="row">
    	<div class="col s12">
    		<div class="card-panel blue-grey white-text center">
    			<h4 class="card-title">很抱歉，好像出了一点错误呢。</h4>
    			<span><a href="/todo_ssh/pages/ListPage.jsp" class="white-text">点此返回主列表</a></span>
    		</div>
    	</div>
    </div>
    
    <!-- 导入Materialize的JS库 -->
	<script type="text/javascript" src="./materialize/js/materialize.min.js" charset="utf-8"></script>
</body>
</html>