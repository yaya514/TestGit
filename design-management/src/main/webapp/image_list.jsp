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
<script type="text/javascript" src="./js/layui.js"></script>
<script type="text/javascript" src="./js/jquery.min.js"></script>
		
</head>
<script type="text/javascript">
	function changePage(currentPage) {
		var searchName = $("#searchName").val();
		var kind = $("#kind").val();
		location.href = "${pageContext.request.contextPath }/image_list.html?currentPage="
				+ currentPage + "&searchName=" + searchName + "&kind=" + kind;
	}


	function searchName() {
		var searchName = $("#searchName").val();
		var kind = $("#kind").val();
		location.href = "${pageContext.request.contextPath }/image_list.html?searchName="
				+ searchName + "&kind=" + kind;
	}
	
	function showImage(id){
		var image = $("#image"+id).val();
	
		 layer.open({
			  
			  type:1,
	          shift: 2,
	          shade:0,
	          title:'图片展示',
	          shadeClose:true,
	          content: "<image src="+image+" width=100%/>",
	          area: 'auto',
	          maxWidth: '300px'

			});

 // layer.alert("<image src="+image+" width=100%/>")
		 
	}
	
	function downloadImage(id){
		var v = window.confirm("您确定要下载这张图片吗？");
		if(v){
			location.href="${pageContext.request.contextPath}/imageDownload.action?id="+id;
				/* $.ajax( {url:"imageDownload.action",
					data: {"id" : id},
					type:"post",
					dataType:'json',
					success:function(data){
						
						}
				}); */
		}
	}


</script>
<form class="layui-form" style="width: 1154px;height: 918px;">
	<blockquote class="layui-elem-quote news_search">
		<div class="layui-input-inline">
				<input type="text" id="searchName" name="searchName"
					value="${page.params.searchName }" placeholder="根据图片名称搜索"
					autocomplete="off" class="layui-input">
			</div>
			<div class="layui-input-inline" style="width: 80px">
				<a class="layui-btn" lay-submit="" lay-filter="sreach"
					onclick="searchName()"> <i class="layui-icon">&#xe615;</i>
				</a>
			</div>
			<span class="x-right" style="line-height: 40px">共有数据：${page.totalCount } 条</span></xblock>
	</blockquote>

	
	<input type="hidden" id="kind" name="kind" value="${page.params.kind }">


	<ul class="layer-photos-demo" id="Images" style="padding-left: 18px; float: left">
		<c:forEach items="${page.list }" var="image">
			<div style="float: left; width: 200px;height: 200px;margin-left: 20px;margin-bottom: 30px" >
			
				<input type="hidden" id="image${image.id }" value="${image.image_path }">
				<img onclick="showImage(${image.id})" style="width: 100%;height: 100%" alt="${image.name }" src="${image.image_path }">
				<div align="center">
					<span style="color: gray;font-size: 20px">${image.name }</span>
					<a >
						<i onclick="downloadImage(${image.id})" class="layui-icon"  style="top: 3px;font-size: 25px">&#xe601;</i>
					</a>
				</div>
			</div>
		</c:forEach>
	</ul>
	
	<!-- 分页 -->
			<div class="gridItem"
				style="padding: 5px; width: 400px; text-align: left; height: 20px; font-size: 15px;padding-left: 50px;">
				共<span id="spanTotalInfor" style="color: blue">{
					${page.totalCount} }</span>条记录 &nbsp;&nbsp; 当前第<span id="spanPageNum"
					style="color: blue">{ ${page.currentPage} }</span>页 &nbsp;&nbsp; 共<span
					id="spanTotalPage" style="color: blue">{ ${page.totalPage} }</span>页
			</div>
			<div class="gridItem"
				style="margin-left: 850px; padding: 5px;padding-right:150px; width: 270px;  height: 20px; vertical-align: middle; font-size: 15px;">
				<a style="color: blue" href="javascript:void(0)"
					onclick="changePage(1)"> <span id="spanFirst">首页</span> &nbsp;
				</a>

				<c:if test="${page.currentPage ==1}">
					<span id="spanPre">上一页</span>&nbsp; 
	            </c:if>
				<c:if test="${page.currentPage !=1}">
			<a style="color: blue" href="javascript:void(0)"
				onclick="changePage(${page.currentPage-1})"> <span id="spanPre">上一页</span>&nbsp;
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

</form>

<body>

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

		/* function showImage(id) {
			layer.ready(function() { //为了layer.ext.js加载完毕再执行
				layer.photos({
					photos : '#x-img' + id
				//,shift: 5 //0-6的选择，指定弹出图片动画类型，默认随机
				});
			});
		} */

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
		function member_edit(title, url, id, w, h) {
			url = url + "?id=" + id;
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