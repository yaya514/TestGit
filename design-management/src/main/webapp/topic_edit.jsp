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
	window.onload=function(){
		
		 $.ajax({
             type: "GET",
             url: "${pageContext.request.contextPath }/teacher_listAll.action",
             success: function(teacherList){
		            	var html = "<option value='0'>---请选择---</option>";
		            	 
                       //下面使用each进行遍历  
                        $.each(teacherList,function(i,teacher) {
                        	 html += "<option value='"+teacher.teacher_number+"'>"+teacher.teacher_name+"</option>";
                         });
                      //根据id查找对象，
		            	 $("#chooseTeacher").append(html);
                      
		            	//下拉框中选中教师
		     			var chooseValue = document.getElementById("choose").value;
		     		    var optionsLength = document.getElementById('chooseTeacher').options.length;

		     			 for(var i = 0; i < optionsLength; i++){
		     	          var option = document.getElementById('chooseTeacher').options[i].value;
		     	          if(option == chooseValue){
		     	        	  document.getElementById('chooseTeacher').options[i].setAttribute("selected","true");
		     	          }
		     	      	}
                      }
         });
		 
	}

	function add(){
		var v = window.confirm("您确定要修改该课题信息吗？");
		if(v){
			 $("#addForm").submit();
		} 
	}
	
</script>

<body>
	<div class="x-body">
	<form id="addForm" action="${pageContext.request.contextPath }/topic_edit.html" target="_parent">
	
		<input type="hidden" id="choose" value="${topic.teacher_number }">
		<div>
			<label class="layui-form-label">申报老师</label>
			<select id="chooseTeacher" name="teacher_number">
				<!-- 下拉框 -->
			</select>
		</div>
	
		<form id="" class="layui-form" method="post">
			<input type="hidden" name="topic_id" value="${topic.topic_id }">
			
			<div class="layui-form-item">
			    <label class="layui-form-label">课题名称 </label>
			    <div class="layui-input-block">
			      <input type="text" name="topic_name" value="${topic.topic_name }" required  lay-verify="required" placeholder="请输入课题名称" autocomplete="off" class="layui-input">
			    </div>
			    <span style="color: red">${error }</span>
		  	</div>
		  	
			<div class="layui-form-item layui-form-text">
			    <label class="layui-form-label">课题内容</label>
			    <div class="layui-input-block"> 
			      <textarea id="content" name="content" placeholder="请输入课题内容" class="layui-textarea">${topic.content }</textarea>
			    </div>
			 </div>
			
			<div class="layui-form-item">
				<label for="L_sign" class="layui-form-label"> </label>
				<!-- <button class="layui-btn" key="set-mine" lay-filter="save" onclick="add()">添加</button> -->
				<input type="button" class="layui-btn" value="修改" onclick="add()"/>
			</div>
		</form>
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