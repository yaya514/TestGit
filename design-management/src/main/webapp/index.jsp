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
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="./css/x-admin.css" media="all">

<link rel="stylesheet" type="text/css" href="./lib/layui/css/layui.css"/>
<script src="./lib/layui/layui.js" type="text/javascript" charset="utf-8"></script>

</head>
<script type="text/javascript">
	function signIn(){
		alert("签到成功！");
	}
</script>

<body>
<div class="layui-layout layui-layout-admin">
  <div class="layui-header header header-demo">
    <div class="layui-main">
    <div class="admin-logo-box">
				<a class="logo" href="#" title="logo"  style="">毕设管理</a>
				<div class="larry-side-menu" style="background-color: black">
					<!-- <i class="fa fa-th-large" aria-hidden="true"></i> -->
					<i class=""><span style="color: white">展开</span></i>
				</div>
			</div>
            
    
      <ul class="layui-nav" lay-filter="">
      	 
        <li class="layui-nav-item"><img src="./images/logo.png" class="layui-circle" style="border: 2px solid #A9B7B7;" width="35px" alt=""></li>
        <li style="padding-left: 10px" class="layui-nav-item"><span>您好,</span></li>
        
        <li class="layui-nav-item"> 
        <c:if test="${personal.role ==0}">
        	<a href="javascript:;">${personal.name }</a>
        </c:if>
        <c:if test="${personal.role ==1}">
        	<a href="javascript:;">${personal.teacher_name } 老师</a>
        </c:if>
        <c:if test="${personal.role ==2}">
        	<a href="javascript:;">${personal.student_name }</a>
        </c:if>
        <c:if test="${personal.role ==null}">
        	<a href="javascript:;"></a>
        </c:if>
          <dl class="layui-nav-child">
            <!-- 二级菜单 -->
            <%-- <dd><a _href="${pageContext.request.contextPath }/personal_edit.jsp">个人信息</a></dd>
            <dd><a href="">切换帐号</a></dd> --%>
            <c:if test="${personal.role ==2}">
	            <dd><a href="javascript:;" onclick="signIn()">签到</a></dd>
            </c:if>
	        	<dd><a href="./login.jsp">退出</a></dd>
          </dl>
        </li>
         
        <li class="layui-nav-item x-index"><a href="">前台首页</a></li>
      </ul>
    </div>
  </div>
  <div class="layui-side layui-bg-black x-side" style="left:-200px;">
    <div class="layui-side-scroll">
      <ul class="layui-nav layui-nav-tree site-demo-nav" lay-filter="side">
        
       <c:if test="${personal.role == 0}">
          <li class="layui-nav-item"> 
        	 <a class="javascript:;" href="javascript:;" _href="${pageContext.request.contextPath }/student_list.html"> 
        	 <i class="layui-icon" style="top: 3px;">&#xe770;</i><cite>学生信息管理</cite> </a>
          </li>
       </c:if>
         <c:if test="${personal.role == 1}">
          <li class="layui-nav-item"> 
        	 <a class="javascript:;" href="javascript:;" _href="${pageContext.request.contextPath }/student_list.html"> 
        	 <i class="layui-icon" style="top: 3px;">&#xe770;</i><cite>查看学生</cite> </a>
          </li>
       </c:if>
       
       <c:if test="${personal.role == 0}">
         <li class="layui-nav-item"> 
        	<a class="javascript:;" href="javascript:;" _href="${pageContext.request.contextPath }/teacher_list.html"> 
        	<i class="layui-icon" style="top: 3px;">&#xe613;</i><cite>教师信息管理</cite> </a>
         </li>
       </c:if>
       
       <c:if test="${personal.role == 2}">
         <li class="layui-nav-item"> 
        	<a class="javascript:;" href="javascript:;" _href="${pageContext.request.contextPath }/teacher_listStudent.html"> 
        	<i class="layui-icon" style="top: 3px;">&#xe613;</i><cite>查看教师</cite> </a>
         </li>
       </c:if>
       
        <c:if test="${personal.role == 0}">
	        <li class="layui-nav-item"> 
	        	<a class="javascript:;" href="javascript:;" _href="${pageContext.request.contextPath }/topic_list.html?kind=0"> 
	        	<i class="layui-icon" style="top: 3px;">&#xe63c;</i><cite>课题管理</cite> </a>
	        </li>
        </c:if>
        <c:if test="${personal.role != 0}">
	        <li class="layui-nav-item"> 
	        	<a class="javascript:;" href="javascript:;" _href="${pageContext.request.contextPath }/topic_list.html?kind=0"> 
	        	<i class="layui-icon" style="top: 3px;">&#xe63c;</i><cite>查看课题</cite> </a>
	        </li>
        </c:if>
        
        <li class="layui-nav-item"> 
          <a class="javascript:;" href="javascript:;"> <i class="layui-icon" style="top: 3px;">&#xe630;</i><cite>答辩管理</cite> </a>
          
          <dl class="layui-nav-child">
              <dd class=""> <a href="javascript:;" _href="${pageContext.request.contextPath }/group_list.html?kind=3"> <cite>答辩小组</cite> </a> </dd>
          </dl>
          
		  <c:if test="${personal.role ==0}">
	          <dl class="layui-nav-child">
	            <dd class=""> <a href="javascript:;" _href="${pageContext.request.contextPath }/plan_list.html?kind=1"> <cite>答辩安排</cite> </a> </dd>
	          </dl>
		  </c:if>
		  <c:if test="${personal.role !=0}">
	          <dl class="layui-nav-child">
	            <dd class=""> <a href="javascript:;" _href="${pageContext.request.contextPath }/plan_listNotAdmin.html?kind=1"> <cite>答辩安排</cite> </a> </dd>
	          </dl>
		  </c:if>
			          
    
        </li>
        
        <c:if test="${personal.role ==1}">
        	<li class="layui-nav-item"> 
	        	<a class="javascript:;" href="javascript:;" _href="${pageContext.request.contextPath }/teacher_editTeacher.jsp"> 
	  				<i class="layui-icon" style="top: 3px;">&#xe612;</i><cite>个人信息</cite> 
	  			</a>
        	</li>
        </c:if>
        <c:if test="${personal.role ==2}">
        	<li class="layui-nav-item"> 
	        	<a class="javascript:;" href="javascript:;" _href="${pageContext.request.contextPath }/student_editStudent.jsp"> 
	  				<i class="layui-icon" style="top: 3px;">&#xe612;</i><cite>个人信息</cite> 
	  			</a>
        	</li>
        </c:if>
       
       <c:if test="${personal.role ==1}">
	       <li class="layui-nav-item"> 
	         <a class="javascript:;" href="javascript:;" _href="${pageContext.request.contextPath }/teacher_password.jsp"> 
	   			<i class="layui-icon" style="top: 3px;">&#xe631;</i><cite>修改密码</cite> 
	   		 </a>
	       </li>
       </c:if>
       <c:if test="${personal.role ==2}">
	       <li class="layui-nav-item"> 
	         <a class="javascript:;" href="javascript:;" _href="${pageContext.request.contextPath }/student_password.jsp"> 
	   			<i class="layui-icon" style="top: 3px;">&#xe631;</i><cite>修改密码</cite> 
	   		 </a>
	       </li>
       </c:if>
        
        
        <%--<li class="layui-nav-item" style="height: 30px; text-align: center"> </li>--%>
      <%--</ul>--%>
    </div>
  </div>
  <div class="layui-tab layui-tab-card site-demo-title x-main" lay-filter="x-tab" lay-allowclose="true" style="left: 0px;border-left: solid 2px #2299ee;">
    <ul class="layui-tab-title">
      <li class="layui-this"> 我的桌面 <i class="layui-icon layui-unselect layui-tab-close">ဆ</i> </li>
    </ul>
    <div class="layui-tab-content site-demo site-demo-body">
      <div class="layui-tab-item layui-show">
        <iframe frameborder="0" src="./welcome.jsp" class="x-iframe"></iframe>
      </div>
    </div>
  </div>
  <div class="site-mobile-shade"> </div>
</div>
<script src="./lib/layui/layui.js" charset="utf-8"></script> 
<script src="./js/x-admin.js"></script> 
</body>
</html>