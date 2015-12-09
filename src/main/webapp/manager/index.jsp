<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title>设备管理</title>

    <link href="../manager/css/bootstrap.min.css" rel="stylesheet">
    <link href="../manager/css/font-awesome.css" rel="stylesheet">
	<link href="../manager/css/dataTables.bootstrap.css" rel="stylesheet">
    <link href="../manager/css/animate.css" rel="stylesheet">
    <link href="../manager/css/style.css" rel="stylesheet">
	<%
		request.getSession().setAttribute("appPath",request.getContextPath());
		/*List listTest = new ArrayList();
		listTest.add("aa");
		listTest.add("bb");
		listTest.add("cc");
	    request.getSession().setAttribute("listTest",listTest);*/
	 %>
	 
	 
	 <script type="text/javascript">
	 	function clickLink(url,info){
	 		if(info == "主页"){
	 			$("#disIndex").hide();
	 		}else{
	 			$("#disIndex").show();
	 			$("#funInfo").html(info);
	 			$("h2").html(info);
	 		}
	 		$('#iframe1').attr('src',url);
	 	}
	 
	 
	 </script>
</head>
<body class="xw_body pace-done">
    <div id="wrapper">
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">

                        <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-circle" src="../manager/img/head.jpg" />
                             </span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="index.jsp#">
                                <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">${login.username}</strong>
                             </span>  <span class="text-muted text-xs block">${login.description} <b class="caret"></b></span> </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li><a href="edit_password.html">修改密码</a>
                                </li>
                                <li class="divider"></li>
                                <li><a href="/manageService/accountManage/logoutUser.do">安全退出</a>
                                </li>
                            </ul>
                        </div>
                        <div class="logo-element">
                            ShallWe
                        </div>

                    </li>
                    
                   
                    <li class="active">
                        <a href="#" onclick="clickLink('indexSub.jsp','主页')"><i class="fa fa-th-large"></i> <span class="nav-label">主页</span></a>
                    </li>
	                
	                <c:if test="${fn:contains(fnList,'all') || fn:contains(fnList,'statisticFn')}">
	                    <li >
	                        <a href="#" onclick="clickLink('chart.jsp','数据统计')"><i class="fa fa-signal"></i> <span class="nav-label">数据统计</span></a>
	                    </li>
	                </c:if>
	                
	                <c:if test="${fn:contains(fnList,'all') || fn:contains(fnList,'userFn')}">                   
	                    <li>
	                        <a href="#" onclick="clickLink('user_manager.jsp','用户管理')"><i class="fa fa-user"></i> <span class="nav-label">用户管理</span></a>
	                    </li>
                    </c:if>
                    
                    <c:if test="${fn:contains(fnList,'all') || fn:contains(fnList,'deviceFn')}">   
	                    <li >
	                        <a href="#" onclick="clickLink('device_manager.jsp','设备管理')"><i class="fa fa-video-camera"></i> <span class="nav-label">设备管理</span></a>
	                    </li>
                    </c:if>
                    
                    <c:if test="${fn:contains(fnList,'all') || fn:contains(fnList,'alarmFn')}"> 
	                    <li>
	                        <a href="#" onclick="clickLink('alarm_manager.jsp','报警管理')"><i class="fa fa-exclamation-triangle"></i> <span class="nav-label">报警管理</span></a>
	                    </li>
                    </c:if>
                    
                    <c:if test="${fn:contains(fnList,'all') || fn:contains(fnList,'bindFn')}"> 
	                    <li >
	                        <a href="#" onclick="clickLink('userdevice.jsp','绑定管理')"><i class="fa fa-lock"></i> <span class="nav-label">绑定管理</span></a>
	                    </li>
                    </c:if>
                    
                    <c:if test="${fn:contains(fnList,'all')}"> 
						<li >
	                        <a id="authorityManage" href="#"><i class="fa fa-cog fa-spin"></i> <span class="nav-label">权限管理</span></a>
	                        <ul id="authSub" class="nav nav-second-level">
	                            <li><a id="userManage" href="#" onclick="clickLink('sysuser_manager.jsp','用户管理')">用户管理</a> </li>
	                            <li><a id="roleManage" href="#" onclick="clickLink('../authorityManage/roleUI.do','角色管理')">角色管理</a> </li>
	                            <li><a id="functionManage" href="#" onclick="clickLink('authority_manager.jsp','功能管理')">功能管理</a> </li>
	                        </ul>
	                    </li>
                    </c:if>
                  
                  </ul>

            </div>
        </nav>

        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header">
                        <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#" title="切换布局"><i class="fa fa-arrows-h" style="font-size:20px"></i> </a>
                    </div>
                    <ul class="nav navbar-top-links navbar-right">
                    	<li>您好，欢迎使用小维后台数据管理系统！</li>
                        <li>
                            <span class="text-muted welcome-message"><a href="index.jsp" title="返回首页"><i class="fa fa-home"></i></a></span>
                        </li>
                        <li>
                            <a href="/manageService/accountManage/logoutUser.do" title="退出">
                                <i class="fa fa-sign-out"></i>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            
            <div class="row wrapper border-bottom white-bg page-heading" id="disIndex" style="display: none">
                <div class="col-sm-4">
                    <h2>设备管理</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="index.jsp">主页</a>
                        </li>
                        <li>
                            <strong id="funInfo">设备管理</strong>
                        </li>
                    </ol>
                </div>
            </div>
            
            <div class="wrapper wrapper-content animated fadeInUp">
                	<iframe id="iframe1" src="indexSub.jsp" width="100%" height="1100px"  scrolling="no" style="border: 0px solid black"></iframe>
            </div>
            
            
            <div class="footer">
            	<div class="pull-right">
                    By：<a href="http://www.cloudsee.net" target="_blank">小维事业部</a>
                </div>
                <div>
                    <strong>Copyright© 2011-2015</strong> 济南中维世纪科技有限公司 版权所有
                </div>
            </div>
        </div>
    </div>

    <script src="../manager/js/jquery-2.1.1.min.js"></script>
    <script src="../manager/js/bootstrap.min.js"></script>
    <script src="../manager/js/bootstrap.xw.min.js"></script> 
	<script src="../manager/js/jquery.dataTables.js"></script>
</body>
</html>