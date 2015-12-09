<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>报警管理</title>

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
                                    <h5>报警管理</h5>
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
                                                	<th style="width:15px"><input type="checkbox" id='checkAll'></th>
                                                    <th>云视通号</th>
                                                    <th>报警类型</th>
                                                    <th>报警信息</th>
                                                    <th>报警时间</th>
                                                    <th>状态</th>
                                                    <th>截图地址</th>
                                                    <th>视频地址</th>
                                                </tr>
                                            </thead>
                                        </table>

                                </div>
                            </div>
                        </div>

                    </div>

    <script src="../manager/js/jquery-2.1.1.min.js"></script>
    <script src="../manager/js/bootstrap.min.js"></script>
    <script src="../manager/js/bootstrap.xw.min.js"></script>
	<script src="../manager/js/jquery.dataTables.js"></script>
    
    <script>
       $(document).ready(function() {
	      
           
	       $("#checkAll").bind("click", function () {
				var outc = this.checked;
				$("input[name='checkList']").each(function(){
					this.checked = outc;
				});
			});
			
			
              var table = $('.dataTables-example').dataTable({   
          		"processing": true, 
          		"serverSide": true, 
          		"ordering": false,
          		"ajax": "/manageService/alarmManage/alarmList.do",
          		"columns": [
          			{"data": "id",
	            "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
				                	$(nTd).html("<input type='checkbox' name='checkList' value='" + sData + "'>");
				 				}
	            },
	            
	            { "data": "deviceGuid" },
	            { "data": "alarmType" },
	            { "data": "alarmInfo" },
	            { "data": "alarmTime"},
	            { "data": "isread" },
	            { "data": "picturePath" },
	            { "data": "videoPath" }
	        ],
			"dom": "<'row-fluid'<'span6 myBtnBox'><'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6 'p>>",
	        "initComplete": function (oSettings, json) {
	            if('${fnList.contains("delAlarmInfo") || fnList.contains("all")}'=='true')
	            {
			        $('<a href="#" class="btn btn-danger" id="deleteFun">删除</a>' + '&nbsp;').appendTo($('.myBtnBox'));
			        $("#deleteFun").click(_deleteList);
	            }
		    }
          	});
          	
		var tableApi= new $.fn.dataTable.Api('.dataTables-example');
       
      /**
		* 批量删除
		* @private
		*/
		function _deleteList() {
			var str = '';
			$("input[name='checkList']:checked").each(function (i, o) {
			    str += $(this).val();
			    str += ",";
			});
			if (str.length > 0) {
			    str = str.substr(0, str.length - 1);
			    //alert(str);
			    $.ajax({
			    type: 'POST',
			    url: '/manageService/alarmManage/delAlarmInfo.do',
			    data:  {"id":str},
			    success: function (data) {
			        if(data.result==1)
			        {
			          alert("删除成功");
			          tableApi.ajax.reload(false);//更新
			          //window.location.reload();
			        }
			        else
			        {
			        	alert("删除失败！");
			        }		  
			       }
			     });
		
			
			} else {
			    alert("至少选择一条记录操作");
			}
			
		}
       
       table.on( 'draw.dt', function () {
		    var val = tableApi.rows()[0].length;
		    $(window.parent.document).find("iframe").attr("height",val*40+250);
		} );
       
   } );
    </script>

    

</body>

</html>