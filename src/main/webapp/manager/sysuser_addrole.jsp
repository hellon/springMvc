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
<body style="background-color: #F1F1F1">
                        <div class="col-lg-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>用户添加角色</h5>
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
                                                    <th>角色ID</th>
                                                    <th>角色名称</th>
                                                    <th>角色描述</th>
                                                </tr>
                                            </thead>
                                        </table>

                                </div>
                            </div>
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
					trVal["sr."+param] = trVal[param];
				}
				
				$.ajax({
					url:'${appPath}/authorityManage/roleEdit.do',
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
					obj["sr."+this.id] = this.value;
				});
				$.ajax({
					url:'${appPath}/authorityManage/roleAdd.do',
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
            		"ajax": "${appPath}/authorityManage/roleList.do",
            		"columns": [
            			{"data": "id",
			            "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
						                	$(nTd).html("<input type='checkbox' name='checkList' onclick='checkClick(this)' value='" + iRow + "'>");
						 				}
			            },
			            { "data": "roleId" },
			            { "data": "roleName" },
			            { "data": "roleDesc" },
			            { "data": "addTime",
			              "createdCell": function (td, cellData, rowData, row, col) {
			              		var cellDatas = cellData.split("T");
						       $(td).html(cellDatas[0]+" "+cellDatas[1]);
						    }
			             },
			            { "data": "addUser"},
			            { "data": "adminFlag"}
			         ],
			         "dom": "<'row-fluid'<'span6 myBtnBox'><'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6 'p>>"
			         /*"initComplete": function (oSettings, json) {
				        $('<a href="#myModal" id="addFun" class="btn btn-primary" data-toggle="modal">新增</a>' + '&nbsp;'+'<a href="#" class="btn btn-primary" id="editFun">修改</a> ' + '&nbsp;&nbsp;&nbsp;&nbsp;').appendTo($('.myBtnBox'));
				        $("#editFun").click(_value);
				        $("#addFun").click(addUI);
				     }*/
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
        	$("#editDevice").hide();
        	$("#existInfo").hide();
        	$("#deviceGuid").attr("readonly",false);
			$("#addForm").show();
        }   
         	
		table.on( 'draw.dt', function () {
		    var val = tableApi.rows()[0].length;
		    if(val<10)
		    val=10;
		    $(window.parent.document).find("iframe").attr("height",val*40+250);
		} );
		
		
		function getUserRole()
		{
		      $.ajax({
	          url:'/manageService/accountManage/sysuser_Role',
	          data:{},
	          type:'POST',
	          success:function(result){
	              if(typeof(result)=="string")
		          {
		                result = eval("("+result+")");
		          }
	           
	          	 var data = result.data;
				 for(var i = 0;i<data.length;i++){
				  var rowDatas = data[i];
				  var trEle = $("<tr></tr>");
				  for(var j = 0;j<3;j++){
				    var celldata=rowDatas[j]==null?'':rowDatas[j];
				    trEle.append("<td>"+celldata+"</td>");
				  }
				  $("#userinfo").append(trEle);
	              
	        }}});
		}
		
     });

    </script>
</body>
</html>