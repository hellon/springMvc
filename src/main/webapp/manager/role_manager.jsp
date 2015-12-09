<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link href="../manager/css/bootstrap.min.css" rel="stylesheet">
    <link href="../manager/css/font-awesome.css" rel="stylesheet">
	<link href="../manager/css/dataTables.bootstrap.css" rel="stylesheet">
    <link href="../manager/css/animate.css" rel="stylesheet">
    <link href="../manager/css/style.css" rel="stylesheet">

	<style type="text/css">
		#roleFuncInfo{
			display:none;
			z-index:1001;
			background-color:white;
			width:500px;
			height:304px;
			border:1px solid grey;
			position:absolute;
			left:350px;
			top:180px;
			overflow-y:auto;
			text-align:center;
		}
		
		.datatr{
		    height:35px;
		}
		
		#titleDiv{
		  z-index:1003;
		  position:fixed;
		  left:350px;
		  top:180px;
		  width:500px;
		  height:30px;
		  text-align:center;
		  font-size:20px;
		  /*#3497DB;*/
		  background-color:#3497DB;
		  border:0px solid red;
		  color:white;
		}
		
		#bottomDiv{
		  z-index:1004;
		  position:fixed;
		  left:352px;
		  top:452px;
		  width:495px;
		  height:30px;
		  text-align:center;
		  font-size:18px;
		  /*#3497DB;*/
		  background-color:white;
		  border:0px solid red;
		  color:white;
		}
		
		#roleModifyId{
		   position:absolute;
		   left:240px;
		   top:0px;
		   background-color:#3497db;
		   color:white;
		   border:1px solid #3497db;
		}
		
		#closeButton_a{
		  z-index:1003;
		  position:fixed;
		  left:810px;
		  top:210px;
		  height:30px;
		}
		
		#funcTable{
		    color:black;
		    position:absolute;
		    left:50px;
		    top:50px;
		    text-align:center;
		    width:420px;
		    height:30px;
		    border:1px solid grey;
		    font-size:16px;
		    background-color:#F5F5F6;
		}
		
		#datatable{
		   text-align:center;
		}
		
		#infoId table{
			position:absolute;
		    left:50px;
		    top:80px;
		    width:420px;
		    border:1px solid grey;
		}
		
		
		#rnid{
			position: fixed;height:50px;width:420px;background-color: #3399FF;margin-left:auto;margin-right:auto;
		}
		#rnid th,#rnid td{
			text-align:center;
		}
		
		#roleNameDis{
			font-size:24px
		}
	</style>
	<script type="text/javascript">
	
		function modify(){
			var ids = "";
			var inputs = $("#roleFuncInfo input:checked");
			inputs.each(function(){
				ids += this.value + ",";
			})
			
			if(ids!=""){
				var fids = ids.substring(0,ids.length-1);
				var modifyRoleId = $("#modifyRoleId").val();
				$.ajax({
						url:'${appPath}/authorityManage/roleFunctionsModify.do',
						data:{fids:fids,roleId:modifyRoleId},
						success:function(data){
							if(data.draw == "1"){
								alert("修改成功....");
								$("#roleFuncInfo").hide();
							}else{
								alert("修改失败，再来一次....");
							}
						}
				});
			}else{
				alert('请选择一个功能');
			}
			
			
		}
	
	</script>
</head>
<body style="background-color: #F1F1F1">
                        <div class="col-lg-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>角色管理</h5>
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
                                                    <th>添加时间</th>
                                                    <th>添加者</th>
                                                    <th>是否管理员角色</th>
                                                    <th>角色操作</th>
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
	            	     <td>角色ID:</td>
	            	     <td><input id="roleId"></input></td>
	            	  </tr>
	            	  <tr>
	            	     <td>角色名称:</td>
	            	     <td><input id="roleName"></input></td>
	            	  </tr>
	            	   <tr>
	            	     <td>角色描述:</td>
	            	     <td><input id="roleDesc"></input></td>
	            	  </tr>
	            	   <tr>
	            	     <td>是否管理员:</td>
	            	     <td><input id="adminFlag"></input></td>
	            	  </tr>
	            	   <tr>
	            	     <td colspan="2">
		            	     <button id="editDevice" >编辑</button>
		            	     <button id="addDevice">添加</button>
	            	     </td>
	            	  </tr>
	            	</table>
            </div>  
             
            <div id="roleFuncInfo">
                <div id="titleDiv">
                   <span id="roleNameDis"></span>
                </div>
                <a id="closeButton_a">关闭</a>
                <table id="funcTable" >
		            	 <tr>
		            	 	<td>选择</td>
	                    	<td>功能ID</td>
	                        <td>功能描述</td>
	                     </tr>
	            </table>
            	
            	<div id="infoId"  >
            		<table id="datatable">
	                     <c:forEach items="${sfList}" var="sf">
		                     <tr class="datatr" id="${sf.functionId}">
			            	 	<td ><input type="checkbox" value="${sf.functionId}"  disabled="disabled"/></td>
		                    	<td >${sf.functionId}</td>
		                        <td >${sf.functionName}</td>
		                     </tr>
	                     </c:forEach>
		                     <tr style="display:none" >
				            	 	<td colspan="3">
				            	 		<input type="hidden" id="modifyRoleId" name="modifyRoleId"/>
				            	 	</td>
			                 </tr>
	            	</table>
	            </div>
	            <div id="bottomDiv">
	            	<input id="roleModifyId" type="button" value="修改" onclick="modify()"/>
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
		
		function roleFunctions(id,roleName){
			$("#roleFuncInfo input").prop('checked',false).prop('disabled',true);
			$("#roleModifyId,#bottomDiv").hide();
			$("#roleNameDis").html(roleName);
			//$("#roleFuncInfo tr").css("background-color","white");
			$.ajax({
					url:'${appPath}/authorityManage/roleFunctions.do',
					data:{roleId:id},
					success:function(data){
						var trs = $("#roleFuncInfo tr");
						var list = data.sfList;
						for(var i=0;i<list.length;i++){
							for(var j=0;j<trs.length;j++){
								if(list[i].functionId == trs[j].id){
									$(trs[j]).find('input')[0].checked = true;
									//$(trs[j]).css("background-color","gray");
									break;
								}
							}
						}
					}
			});
		
			$("#roleFuncInfo").show();
		}
		
		
		function roleFunctionsModify(id,roleName){
			$("#roleModifyId,#bottomDiv").show();
			$("#roleFuncInfo input").prop('checked',false).prop('disabled',false);
			$("#roleNameDis").html(roleName);
			//$("#roleFuncInfo tr").css("background-color","white");
			$.ajax({
					url:'${appPath}/authorityManage/roleFunctions.do',
					data:{roleId:id},
					success:function(data){
						var trs = $("#roleFuncInfo tr");
						var list = data.sfList;
						for(var i=0;i<list.length;i++){
							for(var j=0;j<trs.length;j++){
								if(list[i].functionId == trs[j].id){
									$(trs[j]).find('input')[0].checked = true;
									//$(trs[j]).css("background-color","gray");
									break;
								}
							}
						}
					}
			});
		
			$("#roleFuncInfo").show();
			$("#roleModifyId").show();
			$("#modifyRoleId").val(id);
		}
		
        $(document).ready(function () {
			
			$('#closeButton').bind("click",function(){
				$("#addForm").hide();
				$("#addForm input").val('');
			});
			
			$('#roleFuncInfo  a').bind("click",function(){
				$("#roleFuncInfo").hide();
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
					type:'GET',
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
			            { "data": "adminFlag",
			              "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
			            					if(oData.adminFlag != 1){
			            						$(nTd).html("否");
			            					}else{
			            						$(nTd).html("是");
			            					}
						 				}
			            },
			            {"data": "roleId",
			            "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
			            					if(oData.adminFlag != 1){
			            						$(nTd).html("<a href='#' onclick=roleFunctions('"+sData+"','"+oData.roleName+"')>查看</a> | <a href='#' onclick=roleFunctionsModify('"+sData+"','"+oData.roleName+"')>编辑</a>");
			            					}else{
			            						$(nTd).html("");
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
     });

    </script>
</body>
</html>