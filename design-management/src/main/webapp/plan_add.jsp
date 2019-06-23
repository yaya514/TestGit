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
		/* alert("页面加载完毕事件"); */
		
		 $.ajax({
             type: "GET",
             url: "${pageContext.request.contextPath }/group_listAll.action",
             success: function(groupList){
		            	var html = "<option value='0'>---请选择---</option>";
		            	 
                       //下面使用each进行遍历  
                        $.each(groupList,function(i,group) {
                        	 html += "<option value='"+group.group_id+"'>"+group.group_name+"</option>";
                         });
                      //根据id查找对象，
		            	 $("#chooseGroup").append(html);
                      }
         });
	}
 
	function add(){
		var v = window.confirm("您确定要添加该课题信息吗？");
		if(v){
			 $("#addForm").submit();
		} 
	}
	
</script>

<body>
	<div class="x-body">
	<form id="addForm"  action="${pageContext.request.contextPath }/plan_add.html">
	<div>
		<label class="layui-form-label">小组</label>
		<select id="chooseGroup" name="group_id"></select>
	</div>
		<form id="" class="layui-form" method="post">
			
			 <div class="layui-form-item">
			    <label class="layui-form-label">安排日期 </label>
			    <div class="layui-input-block">
			      <select name="plan_date" lay-verify="required">
			        <option value=""></option>
			        <option value="2019-5-20">2019-5-20</option>
			        <option value="2019-5-21">2019-5-21</option>
			        <option value="2019-5-22">2019-5-22</option>
			        <option value="2019-5-23">2019-5-23</option>
			        <option value="2019-5-24">2019-5-24</option>
			      </select>
			    </div>
			  </div>
			
			 <div class="layui-form-item">
			    <label class="layui-form-label">安排时间</label>
			    <div class="layui-input-block">
			      <select name="time" lay-verify="required">
			        <option value=""></option>
			        <option value="上午 8:30">上午 8:30</option>
			        <option value="下午 1:30">下午 1:30</option>
			      </select>
			    </div>
			  </div>
			 
			  <div class="layui-form-item">
			    <label class="layui-form-label">安排地点</label>
			    <div class="layui-input-block">
			      <select name="place" lay-verify="required">
			        <option value=""></option>
			        <option value="十栋A006">十栋A006</option>
			        <option value="十栋A106">十栋A106</option>
			        <option value="十栋A206">十栋A206</option>
			      </select>
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