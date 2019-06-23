<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	function edit() {
		var v = window.confirm("您确定要修改这张图片的信息吗？");
		if (v) {
			$("#addForm").submit();
		}
	}
	
</script>

<style>
    .layui-form-select dl { max-weight:200px; }
</style>
<body>
	<div class="x-body">
		<form id="addForm" class="layui-form" enctype="multipart/form-data" 
			action="${pageContext.request.contextPath }/image_edit.html" method="post" target="_parent">
			
			<input type="hidden" name="id" value="${image.id }">
			<div class="layui-form-item">
				<label for="L_username" class="layui-form-label"> 图片名称： </label>
				<div class="layui-input-inline">
					<input type="text" id="" name="name" value="${image.name }" style="color: blue"
						lay-verify="required" autocomplete="off" class="layui-input">
				</div>
			</div>
			
			
			<input type="hidden" name="image_path" value="${image.image_path }">
	
	
			<div class="layui-form-item">
				<label for="L_username" class="layui-form-label"> 图片类型： </label>
				<div class="layui-input-inline">
					<c:if test="${image.kind ==1}">
						<select style="width:20px;" id="selectKind" name="kind"  value="" > 
							<option style="width: 20px">——请选择——</option>
							<option style="width: 20px" value=1 selected="selected">风景 </option>			
							<option style="width: 20px" value=2>科技</option>
							<option style="width: 20px" value=3>美食</option>
						 </select>
					</c:if>
					<c:if test="${image.kind ==2}">
						<select style="width:20px;" id="selectKind" name="kind"  value="" > 
							<option style="width: 20px">——请选择——</option>
							<option style="width: 20px" value=1>风景 </option>			
							<option style="width: 20px" value=2 selected="selected">科技</option>
							<option style="width: 20px" value=3>美食</option>
						 </select>
					</c:if>
					<c:if test="${image.kind ==3}">
						<select style="width:20px;" id="selectKind" name="kind"  value="" > 
							<option style="width: 20px">——请选择——</option>
							<option style="width: 20px" value=1>风景 </option>			
							<option style="width: 20px" value=2>科技</option>
							<option style="width: 20px" value=3 selected="selected">美食</option>
						 </select>
					</c:if>
					
				</div>
			</div>
			
			<div class="layui-form-item">
				<label for="L_username" class="layui-form-label"> 上传图片： </label>
				<div class="layui-input-inline">
					<input type="file" name="file" style="margin-left: 13px">
				</div>
			</div>
			

			<div class="layui-form-item">
				<label for="L_sign" class="layui-form-label"> </label>
				<button class="layui-btn" key="set-mine" lay-filter="save"
					onclick="edit()">修改</button>
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