<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>毕业信息管理系统</title>
  <link rel="stylesheet" href="css/login.css">
  <link rel="stylesheet" href="lib/layui/css/layui.css">
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/index.js"></script>
  <script src="./lib/layui/layui.js" charset="utf-8"></script>
  
  
</head>

<body class="login-bg">
    <canvas id="fullstarbg">你的浏览器不支持canvas标签</canvas>
    <div class="login">
        <div class="message">用户登录</div>
        <div id="darkbannerwrap"></div>
        <form method="post" action="${pageContext.request.contextPath}/login.html" class="layui-form" >
        	<span>
				<span style="color: red;font-size: 16px">${error }</span>
			</span>
            <input name="number" placeholder="账号"  type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="password" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
            <hr class="hr15">
            <div class="layui-form-item">
			      <input type="radio" name="role" value="0" title="管理员" checked> 
			      <input type="radio" name="role" value="1" title="教师">
			      <input type="radio" name="role" value="2" title="学生">
		  	</div>
			<hr class="hr15">
            <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
            <%-- <div align="center" style="padding-top: 20px">
				<a href="${pageContext.request.contextPath }/register.jsp" style="color: blue;font-size: 15px" >没有账号？去注册</a>
			</div> --%>
            <hr class="hr20" >
        </form>
    </div>
    
    
<script src="lib/layui/layui.js"></script>
<script>
//一般直接写在一个js文件中
layui.use(['layer', 'form'], function(){
  var layer = layui.layer
  ,form = layui.form;
  
});
</script> 
    
</body>
</html>