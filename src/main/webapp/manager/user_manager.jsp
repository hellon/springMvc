<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>

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
                                    <h5>用户管理</h5>
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
                                                    <th>用户id</th>
                                                    <th>邮箱</th>
                                                    <th>手机号</th>
                                                    <th>昵称</th>
                                                    <th>注册时间</th>
                                                    <th>最后上线时间</th>
                                                    <th>推送开关</th>
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
            	     <td>用户userid:</td>
            	     <td><input id="userid" disabled="true"></input></td>
            	  </tr>
            	  <tr>
            	     <td>手机号:</td>
            	     <td><input id="phone" disabled="true"></input></td>
            	  </tr>
            	   <tr>
            	     <td>邮箱:</td>
            	     <td><input id="mail" disabled="true"></input></td>
            	  </tr>
            	   <tr >
            	     <td>密码:</td>
            	     <td><input id="password" type="password" ></input></td>
            	  </tr>
            	   <tr>
            	     <td colspan="2">
	            	     <button id="editUser" >编辑</button>
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
			});
			
			
			
			$("#editUser").click(function(){
				$("#addForm input").each(function(){
					trVal[this.id] = this.value;
				});
				
				$.ajax({
					url:'/manageService/accountManage/editUser.do',
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
			
            var table = $('.dataTables-example').dataTable({   
            		"processing": true, 
            		"serverSide": true, 
            		"ordering": false,
            		"ajax": "/manageService/accountManage/accountList.do",
            		
            		"columns": [
            			{"data": "id",
			            "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
						                	$(nTd).html("<input type='checkbox' name='checkList' onclick='checkClick(this)' value='" + iRow + "'>");
						 				}
			            },
			            { "data": "userid" },
			            { "data": "mail" },
			            { "data": "phone" },
			            { "data": "nickName" },
			            { "data": "registerTime",
			              "createdCell": function (td, cellData, rowData, row, col) {
			            	   if(cellData==null || cellData=="")
			            	   {
						         $(td).html("");
			            	   }
			            	   else
			            	   {
			            		   var cellDatas = cellData.split("T");
						           $(td).html(cellDatas[0]+" "+cellDatas[1]);
			            	   }
			              		
						    }
			            },
			            { "data": "lastLoginTime",
			              "createdCell": function (td, cellData, rowData, row, col) {
			            	//alert(cellData);
			            	 if(cellData==null || cellData=="")
			            	   {
						         $(td).html("");
			            	   }
			            	   else
			            	   {
			            		   var cellDatas = cellData.split("T");
						           $(td).html(cellDatas[0]+" "+cellDatas[1]);
			            	   }
						    }
			             },
			            //{ "data": "password" },
			            { "data": "push" ,
			              "createdCell": function (td, cellData, rowData, row, col) {
			            	   if(cellData=="0")
			            	   {
						          $(td).html("开");
			            	   }
			            	   else
			            	   {
						          $(td).html("关");
			            	   }
			              		
						    }
			            }
			         ],
			         "dom": "<'row-fluid'<'span6 myBtnBox'><'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6 'p>>",
			         "initComplete": function (oSettings, json) {
					       if('${fnList.contains("editUser") || fnList.contains("all")}'=='true')
					       {
				        	  $('<a href="#" class="btn btn-primary" id="editFun">修改</a> ' + '&nbsp;').appendTo($('.myBtnBox'));
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
			var inputEle = $("input[name='checkList']:checked");
			if(inputEle.length == 0){
				alert("请选择要修改的用户");
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
         table.on( 'draw.dt', function () {
		    var val = tableApi.rows()[0].length;
		    $(window.parent.document).find("iframe").attr("height",val*40+250);
		} );   	
   });
    
    
    </script>

    

</body>

</html>