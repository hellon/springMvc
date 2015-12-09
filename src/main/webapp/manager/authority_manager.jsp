<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <link href="../manager/css/bootstrap.min.css" rel="stylesheet">
    <link href="../manager/css/font-awesome.css" rel="stylesheet">
	<link href="../manager/css/dataTables.bootstrap.css" rel="stylesheet">
    <link href="../manager/css/animate.css" rel="stylesheet">
    <link href="../manager/css/style.css" rel="stylesheet">

</head>
<body style="background-color: #F1F1F1">
                        <div class="col-lg-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>功能管理</h5>
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
                                                    <th>功能ID</th>
                                                    <th>功能名称</th>
                                                    <th>功能描述</th>
                                                    <th>功能模块</th>
                                                    <th>添加时间</th>
                                                    <th>是否启用</th>
                                                </tr>
                                            </thead>
                                        </table>

                                </div>
                            </div>
                        </div>
            
            <div id="addForm" style="display:none;z-index:1001;background-color:white;width:500px;height:300px;border:1px solid grey;position:absolute;left:350px;top:250px;">
            	<a id="closeButton" style="position:absolute;left:454px;top:10px;" >关闭</a>
            	<table style="text-align:center;width:400px;height:300px;">
            	 <tr>
            	     <td>功能ID:</td>
            	     <td><input id="functionId"></input></td>
            	  </tr>
            	  <tr>
            	     <td>功能名称:</td>
            	     <td><input id="functionName"></input></td>
            	  </tr>
            	   <tr>
            	     <td>功能描述:</td>
            	     <td><input id="functionDesc"></input></td>
            	  </tr>
            	   <tr>
            	     <td>功能模块:</td>
            	     <td><input id="functionModel"></input></td>
            	  </tr>
            	   <tr>
            	     <td>是否启用:</td>
            	     <td><input id="used"></input></td>
            	  </tr>
            	   <tr>
            	     <td colspan="2">
	            	     <button id="editDevice" style="display:none">编辑</button>
	            	     <button id="addDevice" style="display:none">添加</button>
            	     </td>
            	  </tr>
            	</table>
            </div>   
            
            

    <script src="../manager/js/jquery-2.1.1.min.js"></script>
    <script src="../manager/js/bootstrap.min.js"></script>
    <script src="../manager/js/bootstrap.xw.min.js"></script> 
	<script src="../manager/js/jquery.dataTables.js"></script>
    <script>
    
    	function checkClick(ele){
			$("input[name='checkList']").attr("checked",false);
			ele.checked = true;
		}
			
        $(document).ready(function () {
			
			$('#closeButton').bind("click",function(){
				$("#addForm").hide();
				$("#addForm input").val('');
			});
			
			
			//修改系统功能信息
			$("#editDevice").click(function(){
				$("#addForm input").each(function(){
					trVal[this.id] = this.value;
				});
				
				for(var param in trVal){
					trVal["sf."+param] = trVal[param];
				}
				
				$.ajax({
					url:'${appPath}/authorityManage/functionEdit.do',
					data:trVal,
					type:'POST',
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
			
			//添加系统功能
			$("#addDevice").click(function(){
				var obj = {};
				$("#addForm input").each(function(){
					obj["sf."+this.id] = this.value;
				});
				$.ajax({
					url:'${appPath}/authorityManage/functionAdd.do',
					data:obj,
					success:function(data){
						if(data.draw == "1"){
							tableApi.ajax.reload();
							$("#addForm").hide();
							$("#addForm input").val('');
						}else{
							alert("添加系统功能失败，再来一次....");
						}
					}
				});
			});
			
            var table = $('.dataTables-example').dataTable({   
            		"processing": true, 
            		"serverSide": true, 
            		"ordering": false,
            		"ajax": "${appPath}/authorityManage/functionList.do",
            		"columns": [
            			{"data": "id",
			            "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
						                	$(nTd).html("<input type='checkbox' name='checkList' onclick='checkClick(this)' value='" + iRow + "'>");
						 				}
			            },
			            { "data": "functionId" },
			            { "data": "functionName" },
			            { "data": "functionDesc" },
			            { "data": "functionModel"},
			            { "data": "addTime",
			              "createdCell": function (td, cellData, rowData, row, col) {
			              		var cellDatas = cellData.split("T");
						       $(td).html(cellDatas[0]+" "+cellDatas[1]);
						    }
			             },
			             { "data": "used",
			              "createdCell": function (td, cellData, rowData, row, col) {
			              					if(cellData != 1){
			            						$(td).html("否");
			            					}else{
			            						$(td).html("是");
			            					}
						    }
			             }
			         ],
			         "dom": "<'row-fluid'<'span6 myBtnBox'><'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6 'p>>",
			         "initComplete": function (oSettings, json) {
				        $('<a href="#myModal" id="addFun" class="btn btn-primary" data-toggle="modal">新增</a>' + '&nbsp;'+'<a href="#" class="btn btn-primary" id="editFun">修改</a> ' + '&nbsp;&nbsp;&nbsp;&nbsp;').appendTo($('.myBtnBox'));
				        $("#editFun").click(_value);
				        $("#addFun").click(addUI);
				     }
            	});
            	
            	/**
		* 点击编辑后赋值
		* @private
		*/
		
		var tableApi= new $.fn.dataTable.Api('.dataTables-example');
		
		function _value() {
			$("#addDevice").hide();
			$("#editDevice").show();
			
			var inputEle = $("input[name='checkList']:checked");
			if(inputEle.length == 0){
				alert("请选择要修改的系统功能");
				return;
			}
			var index = inputEle.val();
			trVal = tableApi.rows(index).data()[0];
			
			for(var param in trVal){
				$("#"+param).val(trVal[param]);
			}
			$("#addForm").show();
		}
            
        function addUI(){
        	$("#addDevice").show();
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