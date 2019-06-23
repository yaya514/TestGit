<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="./lib/bootstrap/css/bootstrap.css"
	media="all">
<link rel="stylesheet" href="./lib/bootstrap/js/bootstrap.min.js"
	media="all">
</head>
<body>
	<style type="text/css">
legend {
	display: block;
	width: 100px;
	border-bottom: 0px;
	font-family: "Microsoft YaHei", "Helvetica Neue";
}

legend a {
	color: #666;
}

legend a:hover {
	text-decoration: none;
}

.layui-table {
	font-family: "Microsoft YaHei", "Helvetica Neue";
}
</style>
	<div class="x-body">
		<blockquote class="layui-elem-quote">
			欢迎使用 毕设信息管理系统！<span class="f-14">v1.0</span> &nbsp;&nbsp;登录次数：18
		</blockquote>
		<div class="row">
			<div class="col-xs-6 col-sm-4 col-md-3">
				<section class="panel">
				<div class="symbol bgcolor-blue">
					<i class="fa fa-address-card"></i>
				</div>
				<div class="value tab-menu" bind="1">
					<a href="javascript:;" data-url="user-info.html" data-parent="true"
						data-title="会员总数"><i class="iconfont " data-icon=""></i>
						<h1>233</h1> </a> <a href="javascript:;" data-url="user-info.html"
						data-parent="true" data-title="会员总数"> <i class="iconfont "
						data-icon=""></i><span>会员总数</span></a>

				</div>
				</section>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<section class="panel">
				<div class="symbol bgcolor-commred">
					<i class="fa fa-plus"></i>
				</div>
				<div class="value tab-menu" bind="1">
					<a href="javascript:;" data-url="user-info.html" data-parent="true"
						data-title="图片新增"> <i class="iconfont " data-icon=""></i>
						<h1>64</h1>
					</a> <a href="javascript:;" data-url="user-info.html"
						data-parent="true" data-title="图片新增"> <i class="iconfont "
						data-icon=""></i><span>图片新增</span></a>

				</div>
				</section>
			</div>

			<div class="col-xs-6 col-sm-4 col-md-3">
				<section class="panel">
				<div class="symbol bgcolor-dark-green">
					<i class="fa fa-bar-chart"></i>
				</div>
				<div class="value tab-menu" bind="1">
					<a href="javascript:;" data-url="user-info.html" data-parent="true"
						data-title="订单总数"> <i class="iconfont " data-icon=""></i>
						<h1>846</h1>
					</a> <a href="javascript:;" data-url="user-info.html"
						data-parent="true" data-title="下载总数"> <i class="iconfont "
						data-icon=""></i><span>下载总数</span></a>
				</div>
				</section>
			</div>

			<div class="col-xs-6 col-sm-4 col-md-3">
				<section class="panel">
				<div class="symbol bgcolor-yellow-green">
					<i class="fa fa-cubes"></i>
				</div>
				<div class="value tab-menu" bind="1">
					<a href="javascript:;" data-url="user-info.html" data-parent="true"
						data-title="今日新增"> <i class="iconfont " data-icon=""></i>
						<h1>123</h1>
					</a> <a href="javascript:;" data-url="user-info.html"
						data-parent="true" data-title="今日新增"> <i class="iconfont "
						data-icon=""></i><span>今日新增</span></a>
				</div>
				</section>
			</div>

		</div>

		<fieldset class="layui-elem-field layui-field-title site-title">
			<legend>
				<a name="default">信息统计</a>
			</legend>
		</fieldset>

		<!--相关统计-->
		<div class="row">
			<div class="col-sm-6">
				<section class="panel">
				<div class="panel-heading">区域统计</div>
				<div class="panel-body">
					<div class="echarts" id="area" style="height: 300px; height: 350px"></div>
				</div>
				</section>
			</div>
			<div class="col-sm-6">
				<section class="panel">
				<div class="panel-heading">一周统计</div>
				<div class="panel-body">
					<div class="echarts" id="main" style="height: 300px; height: 350px"></div>
				</div>
				</section>
			</div>
			<div class="col-sm-6">
				<section class="panel">
				<div class="panel-heading">年度统计</div>
				<div class="panel-body">
					<div class="echarts" id="years"
						style="height: 300px; height: 350px"></div>
				</div>
				</section>
			</div>
			<div class="col-sm-6">
				<section class="panel">
				<div class="panel-heading">下载统计</div>
				<div class="panel-body">
					<div class="echarts" id="product"
						style="height: 300px; height: 350px"></div>
				</div>
				</section>
			</div>
		</div>

		<script src="./lib/layui/layui.js" charset="utf-8"></script>
		<script src="./js/index.js"></script>
		<script src="./js/echarts.min.js"></script>
		<script src="./js/echart.js"></script>
		<script type="text/javascript">
			// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('main'));

			// 指定图表的配置项和数据
			var option = {
				tooltip : {
					trigger : 'axis'
				},
				legend : {
					data : [ '风景', '科技', '美食' ]
				},
				grid : {
					left : '3%',
					right : '4%',
					bottom : '3%',
					containLabel : true
				},
				toolbox : {
					feature : {
						saveAsImage : {}
					}
				},
				xAxis : {
					type : 'category',
					boundaryGap : false,
					data : [ '周一', '周二', '周三', '周四', '周五', '周六', '周日' ]
				},
				yAxis : {
					type : 'value'
				},
				series : [ {
					name : '风景',
					type : 'line',
					stack : '总量',
					data : [ 120, 132, 101, 134, 90, 230, 210 ]
				}, {
					name : '科技',
					type : 'line',
					stack : '总量',
					data : [ 220, 182, 191, 234, 290, 330, 310 ]
				}, {
					name : '美食',
					type : 'line',
					stack : '总量',
					data : [ 150, 232, 201, 154, 190, 330, 410 ]
				} ]
			};

			// 使用刚指定的配置项和数据显示图表。
			myChart.setOption(option);
		</script>
		<script type="text/javascript">
			// 指定图表的配置项和数据
			var myChart = echarts.init(document.getElementById('area'));

			// 指定图表的配置项和数据
			var option = {
				title : {
					text : '会员区域统计',
					subtext : '纯属虚构',
					x : 'center'
				},
				tooltip : {
					trigger : 'item',
					formatter : "{a} <br/>{b} : {c} ({d}%)"
				},
				legend : {
					orient : 'vertical',
					left : 'left',
					data : [ '广州', '佛山', '东莞', '中山', '深圳' ]
				},
				series : [ {
					name : '地区会员数量',
					type : 'pie',
					radius : '55%',
					center : [ '50%', '60%' ],
					data : [ {
						value : 6335,
						name : '广州'
					}, {
						value : 4310,
						name : '佛山'
					}, {
						value : 2310,
						name : '东莞'
					}, {
						value : 3310,
						name : '中山'
					}, {
						value : 9310,
						name : '深圳'
					} ],
					itemStyle : {
						emphasis : {
							shadowBlur : 10,
							shadowOffsetX : 0,
							shadowColor : 'rgba(0, 0, 0, 0.5)'
						}
					}
				} ]
			};
			// 使用刚指定的配置项和数据显示图表。
			myChart.setOption(option);
		</script>
		<script type="text/javascript">
			// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('years'));

			// 指定图表的配置项和数据
			var option = {
				title : {
					text : '年度下载次数统计',
					subtext : '纯属虚构',
					x : 'center'
				},
				color : [ '#3398DB' ],
				tooltip : {
					trigger : 'axis',
					axisPointer : { // 坐标轴指示器，坐标轴触发有效
						type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
					}
				},
				grid : {
					left : '3%',
					right : '4%',
					bottom : '3%',
					containLabel : true
				},
				xAxis : [ {
					type : 'category',
					data : [ '一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月',
							'九月', '十月', '十一月', '十二月' ],
					axisTick : {
						alignWithLabel : true
					}
				} ],
				yAxis : [ {
					type : 'value'
				} ],
				series : [ {
					name : '活跃度',
					type : 'bar',
					barWidth : '60%',
					data : [ 256, 520, 2010, 3304, 3090, 3130, 2320, 2030, 3344, 3690,
							3350, 2420 ]
				} ]
			};
			// 使用刚指定的配置项和数据显示图表。
			myChart.setOption(option);
		</script>
		<script type="text/javascript">
			// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('product'));

			// 指定图表的配置项和数据
			var option = {
				title : {
					text : '下载比例',
					subtext : '纯属虚构',
					x : 'center'
				},
				tooltip : {
					trigger : 'item',
					formatter : "{a} <br/>{b} : {c} ({d}%)"
				},
				legend : {
					orient : 'vertical',
					left : 'left',
					data : [ '风景', '科技', '美食' ]
				},
				series : [ {
					name : '访问来源',
					type : 'pie',
					radius : '55%',
					center : [ '50%', '60%' ],
					data : [ {
						value : 1335,
						name : '风景'
					}, {
						value : 650,
						name : '科技'
					}, {
						value : 310,
						name : '美食'
					}],
					itemStyle : {
						emphasis : {
							shadowBlur : 10,
							shadowOffsetX : 0,
							shadowColor : 'rgba(0, 0, 0, 0.5)'
						}
					}
				} ]
			};

			// 使用刚指定的配置项和数据显示图表。
			myChart.setOption(option);
		</script>

	</div>
	<div class="layui-footer footer footer-demo">
		<div class="layui-main">
			<p>
				<a href="/"> Copyright ©2017 17sucai.com All Rights Reserved. </a>
			</p>

		</div>
	</div>

</body>
</html>