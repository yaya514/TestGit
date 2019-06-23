<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>毕设信息管理系统</title>
<link rel="stylesheet" href="css/login.css">

<script type="text/javascript" src="./js/jquery.min.js"></script>
<script type="text/javascript" src="./js/layer.js"></script>
<script type="text/javascript" src="./lib/layui/layui.js"></script>
<link rel="stylesheet" href="./css/x-admin.css" media="all">

<link rel="stylesheet" type="text/css" href="./lib/layui/css/layui.css"/>

<script src="./js/x-admin.js"></script> 

</head>
<script type="text/javascript">
	function checkNumber() {

		//ajax请求 
		$.post("checkNumber.action", //url 
		{
			"number" : $("#number").val()
		}, //data 
		function(isExist) { //请求成功回调该函数
			if (isExist) {
				$("#error").removeClass("hidden");
			} else {
				$("#error").addClass("hidden");
			}
		});

	}

	function register() {
		alert("注册成功！");
		$("#form").submit();
	}
</script>

<style type="text/css">
.hidden {
	display: none;
}
</style>

<body class="login-bg">
	<canvas id="fullstarbg">你的浏览器不支持canvas标签</canvas>
	<div class="login">
		<div class="message">用户注册</div>
		<div id="darkbannerwrap"></div>
		<form id="form" method="post"
			action="${pageContext.request.contextPath}/register.html"
			class="layui-form">
			<span> 
				<a id="error" style="color: red; font-size: 15px"
				class="hidden">该账号已被注册过！</a>
			</span> 
			<input id="number" name="number" onblur="checkNumber()"
				placeholder="账号" type="text" lay-verify="required" class="layui-input">
			<hr class="hr15">
			<input name="password" lay-verify="required" placeholder="密码"
				type="password" class="layui-input">
			<hr class="hr15">
			<input name="name" lay-verify="required" placeholder="昵称"
				type="text" class="layui-input">
			<hr class="hr15">
			
			<input value="注册" lay-submit lay-filter="login" style="width: 100%;"
				type="button" onclick="register()" />
			<div align="center" style="padding-top: 15px">
				<a href="${pageContext.request.contextPath }/login.jsp"
					style="color: blue; font-size: 15px">返回</a>
			</div>
			<hr class="hr20">
		</form>
	</div>

	<script src="./lib/layui/layui.js" charset="utf-8">
		
	</script>
	<script src="./js/x-layui.js" charset="utf-8">
		
	</script>
	<script>
		layui.use([ 'form', 'layer' ], function() {
			$ = layui.jquery;
			var form = layui.form(), layer = layui.layer;
			
		});
	</script>
	<!-- 底部结束 -->

</body>
</html>