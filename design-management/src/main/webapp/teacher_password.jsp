<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">
<title>毕设信息管理系统</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="./css/x-admin.css" media="all">

<script type="text/javascript" src="./lib/layui/layui.js"></script>
<script type="text/javascript" src="./js/jquery.min.js"></script>

</head>
<script type="text/javascript">
	
	function checkPassword(){
		var v = window.confirm("您确定要修改新的密码吗？");
		
		var password = $("#password").val();
		var repassword = $("#repassword").val();
		if(v){
			if(password != repassword){
					alert("两次密码不一致！！");
				}else{
					
					layer.msg('修改成功！请重新登录！', {
						  icon: 1,
						  time: 2000,//2秒关闭（如果不配置，默认是3秒）
						  title: "系统提示"
						}, function(){
							$("#editForm").submit();
						});
				}
		}
	}
</script>

<body>
	<div class="x-body">
		<form id="editForm" class="layui-form" action="${pageContext.request.contextPath }/teacher_password.html" method="post" target="_parent">
			<input type="hidden" name="id" value="${personal.teacher_id }">
			<div class="layui-form-item">
				<label for="L_username" class="layui-form-label"> 账号 </label>
				<div class="layui-input-inline">
					<input type="text" id="" name="number" readonly="readonly" style="color: blue"
						lay-verify="required" autocomplete="off" value="${personal.teacher_number }"
						class="layui-input">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label for="L_email" class="layui-form-label"> 密码 </label>
				<div class="layui-input-inline">
					<input type="text" id="password" name="password" required placeholder="请输入新密码"
						lay-verify="email" autocomplete="off" value=""
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="L_email" class="layui-form-label"> 确认密码 </label>
				<div class="layui-input-inline">
					<input type="text" id="repassword" name="repassword" required placeholder="请输入确认密码"
						lay-verify="email" autocomplete="off" value=""
						class="layui-input">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label for="L_sign" class="layui-form-label"> </label>
				<a class="layui-btn" key="set-mine" lay-filter="save" onclick="checkPassword()">修改</a>
			</div>
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

			//自定义验证规则
			// form.verify({
			//   nikename: function(value){
			//     if(value.length < 5){
			//       return '昵称至少得5个字符啊';
			//     }
			//   }
			//   ,pass: [/(.+){6,12}$/, '密码必须6到12位']
			//   ,repass: function(value){
			//       if($('#L_pass').val()!=$('#L_repass').val()){
			//           return '两次密码不一致';
			//       }
			//   }
			// });
			//监听提交
			
		});
	</script>

</body>

</html>