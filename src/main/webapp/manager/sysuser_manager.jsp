<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>系统用户管理</title>

    <link href="../manager/css/bootstrap.min.css" rel="stylesheet">
    <link href="../manager/css/font-awesome.css" rel="stylesheet">
	<link href="../manager/css/dataTables.bootstrap.css" rel="stylesheet">
    <link href="../manager/css/animate.css" rel="stylesheet">
    <link href="../manager/css/style.css" rel="stylesheet">
    <style>
       .roletrhead{width:200px;background-color:#F5F5F6;height:30px;font-size:16px;}
       .roletr{width:200px;background-color:white;height:30px;}
       #showRole,#editRoleTable{position:absolute;left:50px;top:85px;text-align:center;width:300px;border:1px solid grey;}
       #usernameSpan1,#usernameSpan2{position:absolute;left:20px;top:50px;font-size:15px;font-weight:bold;}
       #title_view1,#title_view2{z-index:1002;position:fixed;left:350px;top:100px;width:400px;height:30px;text-align:center;background-color:#3497db;font-size:20px;font-weight:bold;color:white;}
       #addRole,#EditRole{position:absolute;left:350px;top:100px;overflow-x:hidden;display:none;z-index:1001;background-color:white;width:400px;height:350px;border:1px solid grey;}
       #closeButton1,#closeButton2{z-index:1002;position:fixed;left:700px;top:145px;}
       #bottomdiv{border:0px solid green;z-index:1002;position:fixed;left:351px;top:400px;width:398px;height:48px;text-align:center;background-color:white;font-size:20px;font-weight:bold;color:white;}
       #modifyRole_button{position:absolute;left:170px;top:10px;background-color:#3497db;color:white;border:1px solid #3497db;}
    </style>
</head>

<body class="xw_body pace-done" style="background-color:#f1f1f1;">
      <div class="col-lg-12">
          <div class="ibox float-e-margins">
              <div class="ibox-title">
                  <h5>系统用户管理</h5>
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
                                  <th>用户名</th>
                                  <th>添加时间</th>
                                  <th>是否激活</th>
                                  <th>描述</th>
                                  <th>角色管理</th>
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
            	     <td>用户名:</td>
            	     <td><input id="username" readonly="readonly"></input></td>
            	  </tr>
            	  <tr>
            	     <td>密码:</td>
            	     <td><input id="password" ></input></td>
            	  </tr>
            	   <tr>
            	     <td>激活状态:</td>
            	     <td>
            	        <input id="active"  type="radio" name="used" value="1" />激活
            	        <input id="close"   type="radio" name="used" value="0" />关闭
            	     </td>
            	  </tr>
            	   <tr>
            	     <td colspan="2">
	            	     <button id="editUser" >编辑</button>
	            	     <button id="addUser"  >添加</button>
            	     </td>
            	  </tr>
            	</table>
            </div>   
            
            <!-- 显示角色管理 -->
            <div id="addRole" style="">
            <div id="title_view1">查看用户角色</div>
           	<span id="usernameSpan1" ></span>
           	<a id="closeButton1" style="" >关闭</a>
           	<table id="showRole"  >
           	  <tr class="roletrhead">
           	     <td>角色名</td>
           	     <td>角色介绍</td>
           	  </tr>
           	</table>
            </div> 
            
            <!-- 编辑角色 -->
            <div id="EditRole" style="">
	            <div id="title_view2">编辑用户角色</div>
	           	<span id="usernameSpan2" ></span>
	           	<a id="closeButton2" style="" >关闭</a>
	           	<table id="editRoleTable" >
	           	  <tr class="roletrhead">
	           	     <td>选择</td>
	           	     <td>角色名</td>
	           	     <td>角色介绍</td>
	           	  </tr>
	           	</table>
            	
            	<div id='bottomdiv'>
            	   <button id="modifyRole_button" onclick='modifyRole()'>保存</button>
            	 </div>
            </div>    
            <input id="sysuserid" style="display:none;"/>

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
			
            var table = $('.dataTables-example').dataTable({   
            		"processing": true, 
            		"serverSide": true, 
            		"ordering": false,
            		"ajax": "/manageService/sysuserManage/userList.do",
            		
            		"columns": [
            			{"data": "id",
			            "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
						                	$(nTd).html("<input type='checkbox' name='checkList' onclick='checkClick(this)' value='" + iRow + "'>");
						 				}
			            },
			            { "data": "username" },
			            { "data": "addtime",
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
			            { "data": "used" ,
			              "createdCell": function (td, cellData, rowData, row, col) {
			            	   if(cellData=="1")
			            	   {
						          $(td).html("已激活");
			            	   }
			            	   else
			            	   {
						          $(td).html("未激活");
			            	   }
			              		
						    }
			            },
			            { "data": "description" } ,
			            {"data": "id",
			             "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
						                	$(nTd).html("<a id='viewRole' onclick=showRole("+sData+",'"+oData.username+"') >查看</a>|" +
						                	            " <a id='editShowRole' onclick=editShowRole("+sData+",'"+oData.username+"') >编辑</a>");
						 				}
			            }
			         ],
			         "dom": "<'row-fluid'<'span6 myBtnBox'><'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6 'p>>",
			         "initComplete": function (oSettings, json) {
				       // $('<a href="#" class="btn btn-primary" id="editFun">修改</a> ' + '&nbsp;').appendTo($('.myBtnBox'));
				       // $("#editFun").click(_value);
				        $('<a href="#" id="addFun" class="btn btn-primary" data-toggle="modal">新增</a>' + '&nbsp;'+'<a href="#" class="btn btn-primary" id="editFun">修改</a> ' + '&nbsp;&nbsp;&nbsp;&nbsp;').appendTo($('.myBtnBox'));
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
			
			if(trVal["used"]==1)
			{
				$("#active").attr('checked',true);
			}
			else
			{
				$("#close").attr('checked',true);
			}
			
			$("#addForm").show();
			$("#addUser").hide();
			$("#editUser").show();
		
		}
		
		/*************************************
         * 添加用户
         * *************************************/
		$("#addUser").click(function(){
			var obj = {};
			$("#addForm input").each(function(){
				obj["user."+this.id] = this.value;
			});
			
			obj["user.used"] = $('input[name="used"]:checked').val();
			
			$.ajax({
				url:'/manageService/sysuserManage/addUser.do',
				data:obj,
				success:function(data){
					if(data.draw == "1"){
						tableApi.ajax.reload();
						$("#addForm").hide();
						$("#existInfo").hide();
						$("#addForm input").val('');
						//$(window.parent.document).find("iframe").attr('src','sysuser_addrole.jsp');
					}else if(data.draw == "2"){
						alert("用户已存在！请使用其他用户名O(∩_∩)O");
					}else{
						alert("添加用户失败，再来一次....");
					}
				}
			});
		});
			
		function addUI(){
			$("#addForm input[name!='used']").val('');
        	$("#editUser").hide();
        	$("#addUser").show();
        	$("#username").attr("readonly",false);
        	$("#close").attr('checked',true);
			$("#addForm").show();
        } 
		
		table.on( 'draw.dt', function () {
			 //   console.log(tableApi.rows()[0].length);
			    var val = tableApi.rows()[0].length;
			    $(window.parent.document).find("iframe").attr("height",val*40+350);
		} );
		
		
		 /*************************************
         * 修改用户
         * *************************************/
      	$("#editUser").click(function(){
			//alert(123456);
			$("#addForm input").each(function(){
				trVal[this.id] = this.value;
			});
			
			trVal['used'] = $('#addForm input[name="used"]:checked ').val();
			//alert(trVal['used'] );
			//return;
			$.ajax({
				url:'/manageService/sysuserManage/editUser.do',
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
		        
            	
        });
        
        //获取用户角色
        function showRole(id,username)
        {
        	//alert(id);
        	$('#addRole').show();
            $('#usernameSpan1').html("用户名："+username);
            $.ajax({
	          url:'/manageService/sysuserManage/sysuserRole.do',
	          data:{sysuserid:id},
	          type:'POST',
	          success:function(result){
	              if(typeof(result)=="string")
		          {
		                result = eval("("+result+")");
		          }
	           
	          	 var data = result.roledata;
				 for(var i = 0;i<data.length;i++){
					  var rowDatas = data[i];
					  var trEle = $("<tr class='roletr'></tr>");
					  trEle.append("<td>"+rowDatas.roleName+"</td>");
					  trEle.append("<td>"+rowDatas.roleDesc+"</td>");
					  $("#showRole").append(trEle);
	             }
				 }});
        	
        	
        }
        
        
        //点击编辑按钮后显示用户角色
        function editShowRole(id,username)
        {
        	//alert(id);
        	$('#EditRole').show();
        	//存储sysuserid
            $('#sysuserid').val(id);
        	 $('#usernameSpan2').html("用户名："+username);
            $.ajax({
	          url:'/manageService/sysuserManage/editshowRole.do',
	          data:{sysuserid:id},
	          type:'POST',
	          success:function(result){
	              if(typeof(result)=="string")
		          {
		                result = eval("("+result+")");
		          }
	           
	          	 var data = result.roledata;
				 for(var i = 0;i<data.length;i++){
					  var rowDatas = data[i];
					  var trEle = $("<tr class='roletr'></tr>");
					  trEle.append("<td><input type='checkbox' value='"+rowDatas.roleId+"' checked='checked' /></td>");
					  trEle.append("<td>"+rowDatas.roleName+"</td>");
					  trEle.append("<td>"+rowDatas.roleDesc+"</td>");
					  $("#editRoleTable").append(trEle);
					  $('#roleIdArr').val($('#roleIdArr').val()+rowDatas.roleId+",");
					 // alert($('#roleIdArr').val());
	             }
				 
				 //return;
				 data = result.roledataOuter;
				 for(var i = 0;i<data.length;i++){
					  var rowDatas = data[i];
					  var trEle = $("<tr class='roletr'></tr>");
					  trEle.append("<td><input type='checkbox' value='"+rowDatas.roleId+"' /></td>");
					  trEle.append("<td>"+rowDatas.roleName+"</td>");
					  trEle.append("<td>"+rowDatas.roleDesc+"</td>");
					  $("#editRoleTable").append(trEle);
	             }
				 // alert($('#roleIdArr').val());
				 }});
        	
        }
        
        //给用户修改不同的角色
        function modifyRole()
        {
        	//$('#EditRole').show();
        	var roleIdArr="";
            $(":checkbox:checked","#editRoleTable").each(function(){ 
			   roleIdArr = roleIdArr+$(this).val()+",";
			});
            
           // alert(roleIdArr);
            if(roleIdArr=="")
            {
            	alert("必须选择至少一个角色哦~");
            	return;
            }
            
            roleIdArr=roleIdArr.substr(0,roleIdArr.length-1);
            
            $.ajax({
	          url:'/manageService/sysuserManage/modifyRole.do',
	          data:{sysuserid: $('#sysuserid').val(),roleIdArr:roleIdArr},
	          type:'POST',
	          success:function(result){
	              if(result.draw == "1")
	              {
	            	  alert("修改成功");
	            	  $('#EditRole').hide();
	            	  //把table清空
	            	  $("#editRoleTable").html("<tr class='roletrhead'><td>选择</td><td>角色名</td><td>角色介绍</td> </tr>");
	              }
	              else
	              {
	            	   alert("修改失败，再来一次。。");
	              }
				 }});
        }
        
        
        	$("#closeButton1").click(function(){
        		$('#addRole').hide();
        		$("#showRole").html("<tr class='roletrhead'><td>角色名</td><td>角色介绍</td> </tr>");
        	});
    
    
          $("#closeButton2").click(function(){
        		$('#EditRole').hide();
        		$("#editRoleTable").html("<tr class='roletrhead'><td>选择</td><td>角色名</td><td>角色介绍</td> </tr>");
        	});
    
    </script>

    

</body>

</html>