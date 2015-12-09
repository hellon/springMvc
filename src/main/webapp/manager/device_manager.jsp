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

</head>
<body class="xw_body pace-done" style="background-color: #F1F1F1">
                	<div class="row">
                        <div class="col-lg-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>设备管理</h5>
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
                                                	<th style="width:15px">选择</th>
                                                    <th>云视通号</th>
                                                    <th>设备类型</th>
                                                    <th>用户名</th>
                                                    <th>密码</th>
                                                    <th>注册时间</th>
                                                    <th>设备版本</th>
                                                    <th>通道数</th>
                                                    <th>是否在线</th>
                                                </tr>
                                            </thead>
                                        </table>

                                </div>
                            </div>
                        </div>
                    </div>
            
            <div id="addForm" style="display:none;z-index:1001;background-color:white;width:500px;height:300px;border:1px solid grey;position:absolute;left:350px;top:250px;">
            	<a id="closeButton" style="position:absolute;left:454px;top:10px;" >关闭</a>
            	<table style="text-align:center;width:400px;height:300px;">
            	 <tr>
            	     <td>云视通号:</td>
            	     <td><input id="deviceGuid" readonly="readonly"></input></td> <label id="existInfo" style="position: absolute;left:350px;top:10px;color: red;display:none">设备已存在</label>
            	  </tr>
            	  <tr>
            	     <td>用  户  名:</td>
            	     <td><input id="deviceUsername"></input></td>
            	  </tr>
            	   <tr>
            	     <td>密 &nbsp;&nbsp;&nbsp;&nbsp;码:</td>
            	     <td><input id="devicePassword"></input></td>
            	  </tr>
            	   <tr>
            	     <td>设备版本:</td>
            	     <td><input id="deviceVersion"></input></td>
            	  </tr>
            	   <tr>
            	     <td>设备类型:</td>
            	     <td><input id="deviceType"></input></td>
            	  </tr>
            	  <tr>
            	     <td>通 道 数:</td>
            	     <td><input id="deviceChannel"></input></td>
            	  </tr>
            	   <tr>
            	     <td colspan="2">
	            	     <button id="editDevice" >编辑</button>
	            	     <button id="addDevice" disabled="disabled">添加</button>
            	     </td>
            	  </tr>
            	</table>
            </div>   

    <script src="../manager/js/jquery-2.1.1.min.js"></script>
    <script src="../manager/js/bootstrap.min.js"></script>
    <script src="../manager/js/bootstrap.xw.min.js"></script> 
	<script src="../manager/js/jquery.dataTables.js"></script>
    <script>
    	var isExist = 0;//设备是否存在
    
    	function checkClick(ele){
			$("input[name='checkList']").attr("checked",false);
			ele.checked = true;
		}
			
        $(document).ready(function () {
			
			$('#closeButton').bind("click",function(){
				$("#addForm").hide();
				$("#addForm input").val('');
			});
			
			$("#deviceGuid").bind('blur',function(){
				var val = this.value;
				$.ajax({
					url:'/manageService/deviceManage/IsDeviceExist.do',
					data:{deviceGuid:val},
					success:function(data){
						if(data.draw == "1"){
							isExist == "1"
							$("#existInfo").show();
							$("#addDevice").attr('disabled',true);
							
						}else{
							isExist == "0"
							$("#existInfo").hide();
							$("#addDevice").attr('disabled',false);
						}
					}
				});
			});
			
			$("#deviceGuid").bind('focus',function(){
				$("#existInfo").hide();
				//$("#addDevice").attr('disabled',false);
			});
			
			//修改设备信息
			$("#editDevice").click(function(){
				$("#addForm input").each(function(){
					trVal[this.id] = this.value;
				});
				
				$.ajax({
					url:'/manageService/deviceManage/editDevice.do',
					data:trVal,
					success:function(data){
						if(data.draw == "1"){
							tableApi.ajax.reload();
							$("#addForm").hide();
						}else{
							alert("修改失败，再来一次....");
						}
					}
				});
			});
			
			//添加设备信息
			$("#addDevice").click(function(){
			
				if(isExist == "1"){
					alert("设备已经存在");
					return;
				}
				var obj = {};
				$("#addForm input").each(function(){
					obj[this.id] = this.value;
				});
				$.ajax({
					url:'/manageService/deviceManage/addDevice.do',
					data:obj,
					success:function(data){
						if(data.draw == "1"){
							tableApi.ajax.reload();
							$("#addForm").hide();
							$("#existInfo").hide();
							$("#addForm input").val('');
							
						}else{
							alert("添加设备失败，再来一次....");
						}
					}
				});
			});
			
            var table = $('.dataTables-example').dataTable({   
            		"processing": true, 
            		"serverSide": true, 
            		"ordering": false,
            		"ajax": "/manageService/deviceManage/listData.do",
            		"columns": [
            			{"data": "id",
			            "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
						                	$(nTd).html("<input type='checkbox' name='checkList' onclick='checkClick(this)' value='" + iRow + "'>");
						 				}
			            },
			            { "data": "deviceGuid" },
			            { "data": "deviceType" },
			            { "data": "deviceUsername" },
			            { "data": "devicePassword",
			              "defaultContent":"123456" },
			            { "data": "registerTime",
			              "createdCell": function (td, cellData, rowData, row, col) {
			              		var cellDatas = cellData.split("T");
						       $(td).html(cellDatas[0]+" "+cellDatas[1]);
						    }
			             },
			            { "data": "deviceVersion" },
			            { "data": "deviceChannel" },
			            { "data": "isOnline" }
			         ],
			         "dom": "<'row-fluid'<'span6 myBtnBox'><'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6 'p>>",
			         "initComplete": function (oSettings, json) {
			            
			             //var role='${fnList.contains("all")}';
			             //alert(typeof(role));
				        if('${fnList.contains("addDevice") || fnList.contains("all")}'=='true')
				        {
					        $('<a href="#myModal" id="addFun" class="btn btn-primary" data-toggle="modal">新增</a>'+'&nbsp;&nbsp;&nbsp;').appendTo($('.myBtnBox'));
					        $("#addFun").click(addUI);
				        }
				        if('${fnList.contains("editDevice") || fnList.contains("all")}'=='true')
				        {
				            $('<a href="#" class="btn btn-primary" id="editFun" style="margin-left:10px;">修改</a> &nbsp;&nbsp;&nbsp;&nbsp;').appendTo($('.myBtnBox'));
				            $("#editFun").click(_value);
				        }
				       
				       
				     }
            	});
            	
            	/**
		* 点击编辑后赋值
		* @private
		*/
		
		var tableApi= new $.fn.dataTable.Api('.dataTables-example');
		
		function _value() {
			$("#addDevice").hide();
			var inputEle = $("input[name='checkList']:checked");
			if(inputEle.length == 0){
				alert("请选择要修改的设备");
				return;
			}
			var index = inputEle.val();
			trVal = tableApi.rows(index).data()[0];
			
			for(var param in trVal){
				$("#"+param).val(trVal[param]);
			}
			//tableApi.ajax.reload();//更新
			
			$("#addForm").show();
			//console.log(tableApi);
		
		}
            
        function addUI(){
        	$("#editDevice").hide();
        	$("#existInfo").hide();
        	$("#deviceGuid").attr("readonly",false);
			$("#addForm").show();
        }   
         table.on( 'draw.dt', function () {
		    var val = tableApi.rows()[0].length;
		    $(window.parent.document).find("iframe").attr("height",val*40+250);
		} );	
  });

    </script>
</body>
</html>