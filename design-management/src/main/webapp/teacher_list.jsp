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
</head>
<script type="text/javascript">
	function changePage(currentPage){
		var searchName = $("#searchName").val();
		location.href = "${pageContext.request.contextPath }/teacher_list.html?currentPage="+ currentPage + "&searchName="+searchName;
	}
	
	function deleteTeacher(number){
		var v = window.confirm("您确定要删除该教师信息吗？");
		if(v){
			location.href = "${pageContext.request.contextPath }/teacher_delete.html?number="+number;
		}
	}
	
	function searchName(){
		var searchName = $("#searchName").val();
		location.href = "${pageContext.request.contextPath }/teacher_list.html?searchName="+searchName;
	}
	
	function addTeacher(){
		location.href = "${pageContext.request.contextPath }/teacher_add.jsp";
	}
	
	function deleteAll(){
		var confirm = window.confirm("您确定要删除选中的教师吗？");
		if(confirm){
			$("#form").submit();
		}
}
</script>

<body>
	<form id="form"
		action="${pageContext.request.contextPath }/teacher_deleteAll.html"
		method="post">
		<div class="x-nav">
			<span class="layui-breadcrumb"> <a><cite>首页</cite></a> <a><cite>教师信息管理</cite></a>
			</span> <a class="layui-btn layui-btn-small"
				style="line-height: 1.6em; margin-top: 3px; float: right"
				href="javascript:location.replace(location.href);" title="刷新"><i
				class="layui-icon" style="line-height: 30px">ဂ</i></a>
		</div>
		<div class="x-body" style="height: 1050px; width: 1113px">
			<xblock> <a class="layui-btn layui-btn-danger"
				onclick="deleteAll()"> <i class="layui-icon">&#xe640;</i>批量删除
			</a> <a class="layui-btn" onclick="addTeacher()"> <i class="layui-icon">&#xe608;</i>添加
			</a>
			<div class="layui-input-inline">
				<input type="text" id="searchName" name="searchName"
					value="${page.params.searchName }" placeholder="根据教师姓名搜索"
					autocomplete="off" class="layui-input">
			</div>
			<div class="layui-input-inline" style="width: 80px">
				<a class="layui-btn" lay-submit="" lay-filter="sreach"
					onclick="searchName()"> <i class="layui-icon">&#xe615;</i>
				</a>
			</div>
			<span class="x-right" style="line-height: 40px">共有数据：${page.totalCount } 条</span></xblock>
			<table class="layui-table">
				<thead>
					<tr>
						<th><input type="checkbox" name="" value=""></th>
						<th>排序</th>
						<th>工号</th>
						<th>姓名</th>
						<th>性别</th>
						<th>授课课程</th>
						<th>操作</th>
					</tr>
				</thead>

				<c:forEach items="${page.list }" var="teacher" varStatus="vs">
					<tbody id="x-img${teacher.teacher_number }">
						<tr>
							<td><input type="checkbox" value="${teacher.teacher_number }" name="numbers"></td>
							<td>${vs.count +page.index}</td>
							<td>${teacher.teacher_number }</td>
							<td>${teacher.teacher_name }</td>
							<td>
								<c:if test="${teacher.gender == 0}">女</c:if>
								<c:if test="${teacher.gender == 1}">男</c:if>
							</td>
							<td>${teacher.teach_course}</td>
							<td class="td-manage">
								<a title="编辑" href="javascript:;"
									onclick="member_edit('编辑','teacher_show.html','${teacher.teacher_number}','','510')"
									class="ml-5" style="text-decoration: none"> <i
										class="layui-icon" style="font-size: 25px; color: blue">&#xe642;</i>
								</a> 
								<a title="删除" href="javascript:;"
									onclick="deleteTeacher(${teacher.teacher_number})" style="text-decoration: none">
									<i class="layui-icon" style="font-size: 25px; color: red">&#xe640;</i>
								</a>
							</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
			<!-- 分页 -->
			<div class="grteacher.teacher_idItem"
				style="padding: 5px; width: 400px; float: left; text-align: left; height: 20px; font-size: 15px;">
				共<span id="spanTotalInfor" style="color: blue">{
					${page.totalCount} }</span>条记录 &nbsp;&nbsp; 当前第<span id="spanPageNum"
					style="color: blue">{ ${page.currentPage} }</span>页 &nbsp;&nbsp; 共<span
					id="spanTotalPage" style="color: blue">{ ${page.totalPage} }</span>页
			</div>
			<div class="gridItem"
				style="margin-left: 50px; padding: 5px; width: 270px; float: right; text-align: center; height: 20px; vertical-align: middle; font-size: 15px;">
				<a style="color: blue" href="javascript:void(0)"
					onclick="changePage(1)"> <span id="spanFirst">首页</span> &nbsp;
				</a>

				<c:if test="${page.currentPage ==1}">
					<span id="spanPre">上一页</span>&nbsp; 
	            </c:if>
				<c:if test="${page.currentPage !=1}">
					<a style="color: blue" href="javascript:void(0)"
						onclick="changePage(${page.currentPage-1})"> <span
						id="spanPre">上一页</span>&nbsp;
					</a>
				</c:if>

				<c:if test="${page.currentPage ==page.totalPage}">
					<span id="spanPre">下一页</span>&nbsp; 
	            </c:if>
				<c:if test="${page.currentPage !=page.totalPage}">
					<a style="color: blue" href="javascript:void(0)"
						onclick="changePage(${page.currentPage+1})"> <span
						id="spanNext">下一页</span> &nbsp;
					</a>
				</c:if>

				<a style="color: blue" href="javascript:void(0)"
					onclick="changePage(${page.totalPage})"> <span id="spanLast">尾页</span>
				</a>
			</div>

		</div>
	</form>
	<script src="./lib/layui/layui.js" charset="utf-8"></script>
	<script src="./js/x-layui.js" charset="utf-8"></script>
	<script>
		layui.use([ 'laydate', 'element', 'laypage', 'layer' ], function() {
			$ = layui.jquery;//jquery
			laydate = layui.laydate;//日期插件
			lement = layui.element();//面包导航
			laypage = layui.laypage;//分页
			layer = layui.layer;//弹出层

			//以上模块根据需要引入

			

		});
		
		function showTeacher(id){
			layer.ready(function() { //为了layer.ext.js加载完毕再执行
				layer.photos({
					photos : '#x-img' + id
				//,shift: 5 //0-6的选择，指定弹出图片动画类型，默认随机
				});
			});
		}

		//批量删除提交
		function delAll() {
			layer.confirm('确认要删除吗？', function(index) {
				//捉到所有被选中的，发异步进行删除
				layer.msg('删除成功', {
					icon : 1
				});
			});
		}
		/*添加*/
		function banner_add(title, url, w, h) {
			x_admin_show(title, url, w, h);
		}
		/*停用*/
		function banner_stop(obj, id) {
			layer
					.confirm(
							'确认不显示吗？',
							function(index) {
								//发异步把图片状态进行更改
								$(obj)
										.parents("tr")
										.find(".td-manage")
										.prepend(
												'<a style="text-decoration:none" onClick="banner_start(this,id)" href="javascript:;" title="显示"><i class="layui-icon">&#xe62f;</i></a>');
								$(obj)
										.parents("tr")
										.find(".td-status")
										.html(
												'<span class="layui-btn layui-btn-disabled layui-btn-mini">不显示</span>');
								$(obj).remove();
								layer.msg('不显示!', {
									icon : 5,
									time : 1000
								});
							});
		}

		/*启用*/
		function banner_start(obj, id) {
			layer
					.confirm(
							'确认要显示吗？',
							function(index) {
								//发异步把图片状态进行更改
								$(obj)
										.parents("tr")
										.find(".td-manage")
										.prepend(
												'<a style="text-decoration:none" onClick="banner_stop(this,id)" href="javascript:;" title="不显示"><i class="layui-icon">&#xe601;</i></a>');
								$(obj)
										.parents("tr")
										.find(".td-status")
										.html(
												'<span class="layui-btn layui-btn-normal layui-btn-mini">已显示</span>');
								$(obj).remove();
								layer.msg('已显示!', {
									icon : 6,
									time : 1000
								});
							});
		}
		// 编辑
		function member_edit(title, url, number, w, h) {
			url = url + "?number=" +number;
			x_admin_show(title, url, w, h);
		}
		/*删除*/
		function member_del(obj, id) {
			layer.confirm('确认要删除吗？', function(index) {
				//发异步删除数据
				$(obj).parents("tr").remove();
				layer.msg('已删除!', {
					icon : 1,
					time : 1000
				});
			});
		}
	</script>

</body>
</html>