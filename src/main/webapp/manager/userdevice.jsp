<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>绑定管理</title>

    <link href="../manager/css/bootstrap.min.css" rel="stylesheet">
    <link href="../manager/css/font-awesome.css" rel="stylesheet">
	<link href="../manager/css/dataTables.bootstrap.css" rel="stylesheet">
    <link href="../manager/css/animate.css" rel="stylesheet">
    <link href="../manager/css/style.css" rel="stylesheet">

</head>

<body class="xw_body pace-done" style="background-color: #F1F1F1">

            <div style="margin-top:20px;margin-left:20px;">
                 <strong> 云视通号：</strong><input id="deviceGuid_post" /> <button id="search1" >搜索</button>
            </div>
            
            <div class="wrapper wrapper-content animated fadeInUp">
               
                
                	<div class="row">

                        <div class="col-lg-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>绑定管理</h5>
                                    <div class="ibox-tools">
                                        <a class="collapse-link">
                                            <i class="fa fa-chevron-up"></i>
                                        </a>
                                        <a class="close-link">
                                            <i class="fa fa-times"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="ibox-content clearfix">                                   
                                        
                                        <table class="table table-striped table-bordered table-hover dataTables-example">
                                            <thead>
                                                <tr>
                                                    <th>用户</th>
                                                    <th>云视通号</th>
                                                    <th>绑定时间</th>
                                                    <th>昵称</th>
                                                    <th>操作</th>
                                                </tr>
                                            </thead>
                                             <tr id="userdeviceinfo">
                                                  <td id="account">1</td>
                                                  <td id="deviceGuid">2</td>
                                                  <td id="addtime">3</td>
                                                  <td id="nickname">4</td>
                                                  <td id="operate"><button id='releaseBind' >解绑</button></td>
                                               </tr>
                                        </table>

                                </div>
                            </div>
                        </div>

                    </div>

            </div>
</body>

</html>
    <script src="../manager/js/jquery-2.1.1.min.js"></script>
    <script src="../manager/js/bootstrap.min.js"></script>
    <script src="../manager/js/bootstrap.xw.min.js"></script>
	<script src="../manager/js/jquery.dataTables.js"></script>
    <script>
       $(document).ready(function () {
        $('#userdeviceinfo').hide();
       function getUserDeviceInfo()
       {
    	   
    	  $('#userdeviceinfo').hide();
    	  $('#userdeviceinfo td[id!="operate"]').html("");
			$.ajax({
				url:'/manageService/UserDeviceManage/findUserDevice.do',
				data:{deviceGuid:$("#deviceGuid_post").val()},
				success:function(d){
					var data = d.data;
					if(data.size==1)
					{
						
						for(var aa in data)
						{
							//alert('#'+aa);
							$('#'+aa).html(data[aa]);
						}
						 $('#userdeviceinfo').show();
					}
					if(data.size==0)
					{
						alert("该设备没有被绑定过哦！");
					}
				  }
					
				});
			}
       function releaseBind()
       {
			$.ajax({
				url:'/manageService/UserDeviceManage/releaseBind.do',
				data:{deviceGuid:$("#deviceGuid_post").val()},
				success:function(d){
					var data = d.data;
					if(data.result==1)
					{
						alert("设备"+$("#deviceGuid").val()+"解绑成功!");
						$('#userdeviceinfo').hide();
						$('#userdeviceinfo td').html("");
					}
					else
					{
						alert("设备"+$("#deviceGuid").val()+"解绑失败!请重新操作");
					}
				  }
					
				});
			}
        
       
       $("#releaseBind").click(releaseBind);
       $("#search1").click(getUserDeviceInfo);
       
       
       });
       
       
    </script>

    

