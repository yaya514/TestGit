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

<script src="./lib/layui/layui.js" charset="utf-8"></script>

</head>
<script type="text/javascript">

	function add(){
		var v = window.confirm("您确定要添加该课题信息吗？");
		if(v){
			 $("#addForm").submit();
		} 
	}
	
</script>

<body>
	<div class="x-body">
	<form id="addForm"  action="${pageContext.request.contextPath }/topic_add.html">
		<form id="form" class="layui-form" method="post">
			
			<input type="hidden" name="teacher_number" value="${personal.teacher_number }"/>
			<div class="layui-form-item">
			    <label class="layui-form-label">申报老师 </label>
				    <div class="layui-input-block">
				      <input style="color: blue;" type="text" name="teacher_name" value="${personal.teacher_name }" readonly="readonly" lay-verify="required" placeholder="请输入课题名称" autocomplete="off" class="layui-input">
				    </div>
		  	</div>
			<div class="layui-form-item">
			    <label class="layui-form-label">课题名称 </label>
			    <div class="layui-input-block">
			      <input type="text" name="topic_name" required  lay-verify="required" placeholder="请输入课题名称" autocomplete="off" class="layui-input">
			    </div>
			    <span style="color: red">${error }</span>
		  	</div>
		  	
			<div class="layui-form-item layui-form-text">
			    <label class="layui-form-label">课题内容</label>
			    <div class="layui-input-block">
			      <textarea name="content" placeholder="请输入课题内容" class="layui-textarea"></textarea>
			    </div>
			 </div>
			
			<div class="layui-form-item">
				<label for="L_sign" class="layui-form-label"> </label>
				<!-- <button class="layui-btn" key="set-mine" lay-filter="save" onclick="add()">添加</button> -->
				<input type="button" class="layui-btn" value="添加" onclick="add()"/>
			</div>
		</form>
	</form>
	</div>
	
	
	<script src="./lib/layui/layui.js" charset="utf-8"></script>
	<script src="./js/x-layui.js" charset="utf-8"></script>

</body>

</html>