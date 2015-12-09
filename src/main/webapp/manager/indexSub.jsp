<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title>首页</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
	<script type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>
	
</head>

<body class="xw_body pace-done" style="background-color: #F1F1F1">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <span class="label label-success pull-right">今年</span>
                                <h5>用户总数</h5>
                            </div>
                            <div class="ibox-content" id="useryear">
                                <h1  class="no-margins text-success"></h1>
                                <div class="stat-percent font-bold text-success"><span></span> <i class="fa fa-level-up"></i>
                                </div>
                                <small>位</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <span class="label label-info pull-right">本月</span>
                                <h5>新增用户数</h5>
                            </div>
                            <div class="ibox-content" id="usermonth">
                                <h1 class="no-margins text-info"></h1>
                                <div class="stat-percent font-bold text-info"><span></span> <i class="fa fa-level-up"></i>
                                </div>
                                <small>位</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <span class="label label-primary pull-right">今年</span>
                                <h5>设备总量</h5>
                            </div>
                            <div class="ibox-content" id="deviceyear">
                                <h1 class="no-margins text-navy"></h1>
                                <div class="stat-percent font-bold text-navy"><span></span> <i class="fa fa-level-up"></i>
                                </div>
                                <small>台</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <span class="label label-danger pull-right">本月</span>
                                <h5>新增设备数</h5>
                            </div>
                            <div class="ibox-content" id="devicemonth">
                                <h1 class="no-margins text-danger"></h1>
                                <div class="stat-percent font-bold text-danger"><span></span> <i class="fa fa-level-down"></i>
                                </div>
                                <small>台</small>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>用户统计</h5>
                                <div class="pull-right">
                                    <div class="btn-group ">
                                    	日期选择：<input type="text" id="wdate" class="Wdate" style="border:0px solid red" name="startTime" >
                                    </div>
                                </div>
                            </div>
                            <div class="ibox-content">
                                <div class="row">
                                    <div class="col-lg-9">
                                        <div class="flot-chart">
                                            <div class="flot-chart-content" id="flot-dashboard-chart"></div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <ul class="stat-list">
                                            <li>
                                                <h2 class="no-margins" id="currentYear">2,431,346</h2>
                                                <small>本年用户总数</small>
                                                <div class="stat-percent">
                                                </div>
                                                <div class="progress progress-mini">
                                                    <div style="width: 48%;" class="progress-bar"></div>
                                                </div>
                                            </li>
                                            <li>
                                                <h2 class="no-margins " id="currentMonth">4,422</h2>
                                                <small>本月新增用户数</small>
                                                <div class="stat-percent">
                                                </div>
                                                <div class="progress progress-mini">
                                                    <div style="width: 60%;" class="progress-bar"></div>
                                                </div>
                                            </li>
                                            <li>
                                                <h2 class="no-margins " id="rate">9,180</h2>
                                                <small>本月新增用户增长率</small>
                                                <div class="stat-percent">
                                                </div>
                                                <div class="progress progress-mini">
                                                    <div style="width: 22%;" class="progress-bar"></div>
                                                </div>
                                            </li>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                
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
                                    <div class="table-responsive">
                                        <table class="table table-striped" >
                                            <thead>
                                                <tr>
                                                    <th>用户id</th>
                                                    <th>邮箱</th>
                                                    <th>手机号</th>
                                                    <th>昵称</th>
                                                    <th>注册时间</th>
                                                    <th>最后上线时间</th>
                                                    <th>密码</th>
                                                    <th>推送开关</th>
                                                </tr>
                                                <tbody id="userinfo">
                                            </tbody>
                                            </thead>
                                        </table>
                                    </div>
                                    <c:if test="${fn:contains(fnList,'all') || fn:contains(fnList,'userFn')}">  
	                                    <div class="table-arr" title="查看全部">
	                                    	<div onclick="javascript:window.location.href='user_manager.jsp' ">
	                                        	<i class="fa fa-chevron-right"></i>
	                                        </div>
	                                    </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div id="tooltip" style="display:block;position:absolute;top:0;left:0;border:1px solid #fdd;background-color: #fee"></div>
                    <div class="row">

                        <div class="col-lg-7">
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
                                    <div class="table-responsive">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>云视通号</th>
                                                    <th>设备类型</th>
                                                    <th>用户名</th>
                                                    <th>密码</th>
                                                    <th>注册时间</th>
                                                    <th>设备版本</th>
                                                </tr>
                                            </thead>
                                            <tbody id="deviceTbody">
                                            </tbody>
                                        </table>
                                    </div>
                                    <c:if test="${fn:contains(fnList,'all') || fn:contains(fnList,'deviceFn')}">  
	                                    <div class="table-arr" title="查看全部">
	                                    	<div onclick="javascript:window.location.href='device_manager.jsp' ">
	                                        	<i class="fa fa-chevron-right"></i>
	                                        </div>
	                                    </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-lg-5">
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
                                    <div class="table-responsive">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>云视通号</th>
                                                    <th>报警类型</th>
                                                    <th>报警信息</th>
                                                    <th>报警时间</th>
                                                </tr>
                                            </thead>
                                            <tbody id="alarminfo">

                                            </tbody>
                                        </table>
                                    </div>
                                    <c:if test="${fn:contains(fnList,'all') || fn:contains(fnList,'alarmFn')}">  
										<div class="table-arr" title="查看全部">
	                                    	<div onclick="javascript:window.location.href='alarm_manager.jsp' ">
	                                        	<i class="fa fa-chevron-right"></i>
	                                        </div>
	                                    </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>

                    </div>
    <script src="js/jquery-2.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap.xw.min.js"></script>

    <script src="js/flot/jquery.flot.js"></script>
    <script src="js/flot/jquery.easypiechart.js"></script>
    <script src="../manager/js/jquery.dataTables.js"></script>
    
    <script>
    
        /**
		 * @param totalUser
		 * @param totalDevice
		 * @param dayUser
		 * @param dayDevice
		 * @param monthDevice
		 * @param monthUser
		 * @param yearDevice
		 * @param yearUser
		 * @param yearUserAscRate
		 * @param yearDeviceAscRate
		 * @param monthUserAscRate
		 * @param monthDeviceAscRate
	     */
	$(document).ready(function () {
	       
		  $.ajax({
          url:'/manageService/accountManage/addNum.do',
          data:{},
          type:'POST',
          success:function(result){
              if(typeof(result)=="string")
	          {
	                result = eval("("+result+")");
	          }
	          var totalUser = result.dt.totalUser;
	          var totalDevice = result.dt.totalDevice;
			  var dayUser = result.dt.dayUser;
			  var dayDevice = result.dt.dayDevice;
			  var monthDevice = result.dt.monthDevice;
			  var monthUser = result.dt.monthUser;
			  var yearDevice = result.dt.yearDevice;
			  var yearUser = result.dt.yearUser;
			  var yearUserAscRate = result.dt.yearUserAscRate;
			  var yearDeviceAscRate = result.dt.yearDeviceAscRate;
			  var monthUserAscRate = result.dt.monthUserAscRate;
			  var monthDeviceAscRate = result.dt.monthDeviceAscRate;
	          var dayUserAscRate = result.dt.dayUserAscRate;
			  var dayDeviceAscRate = result.dt.dayDeviceAscRate;
	          //年用户，年增长率
	          $("#useryear h1").text(yearUser);
              if(yearUserAscRate>0)
              {
              	 $("#useryear div").html("<span>"+yearUserAscRate+"%</span> <i class='fa fa-level-up'>");
              }
              else
              {
                 $("#useryear div").html("<span>"+yearUserAscRate*(-1)+"%</span> <i class='fa fa-level-down'>");
              }
              
              //月用户，月增长率
              $("#usermonth h1").text(monthUser);
              if(monthUserAscRate>0)
              {
              	 $("#usermonth div").html("<span>"+monthUserAscRate+"%</span> <i class='fa fa-level-up'>");
              }
              else
              {
                 $("#usermonth div").html("<span>"+monthUserAscRate*(-1)+"%</span> <i class='fa fa-level-down'>");
              }
              
               //年设备，年增长率
              $("#deviceyear h1").text(yearDevice);
              
             
              
              if(yearDeviceAscRate>0)
              {
              	 $("#deviceyear div").html("<span>"+yearDeviceAscRate+"%</span> <i class='fa fa-level-up'>");
              }
              else
              {
                 $("#deviceyear div").html("<span>"+yearDeviceAscRate*(-1)+"%</span> <i class='fa fa-level-down'>");
              }
              
              //月用户，月增长率
              $("#devicemonth h1").text(monthDevice);
              if(monthDeviceAscRate>0)
              {
              	 $("#devicemonth div").html("<span>"+monthDeviceAscRate+"%</span> <i class='fa fa-level-up'>");
              }
              else
              {
                 $("#devicemonth div").html("<span>"+monthDeviceAscRate*(-1)+"%</span> <i class='fa fa-level-down'>");
              }
              
              
          }
        });
			
			$(".ibox-content").hover(function(){
				$(this).children(".table-responsive").animate({ width: "96%" });
				$(this).children(".table-arr").show().animate({ width: "60px" });
			},function(){
				$(this).children(".table-responsive").animate({ width: "100%" });
				$(this).children(".table-arr").animate({ width: "0" });
			});
			
            $('.chart').easyPieChart({
                barColor: '#f8ac59',
                scaleLength: 5,
                lineWidth: 4,
                size: 80
            });

            $('.chart2').easyPieChart({
                barColor: '#0E9AEF',
                scaleLength: 5,
                lineWidth: 4,
                size: 80
            });

            var data2 = [];


            var dataset = [
               		{
                    label: "新增用户数",
                    data: data2,
                    yaxis: 2,
                    color: "#1AB394",
                    lines: {
                        lineWidth: 1,
                        show: true,
                        fill: true,
                        fillColor: {
                            colors: [{
                                opacity: 0.2
                            }, {
                                opacity: 0.2
                            }]
                        }
                    },
                    splines: {
                        show: false,
                        tension: 0.6,
                        lineWidth: 1,
                        fill: 0.1
                    },
                }
            ];


            var options = {
                xaxis: {
                    mode: "time",
                    tickSize: [1, "day"],
                    tickLength: 0,
                    axisLabel: "Date",
                    axisLabelUseCanvas: true,
                    axisLabelFontSizePixels: 12,
                    axisLabelFontFamily: 'Arial',
                    axisLabelPadding: 10,
                    color: "#838383",
                    tickDecimals: 0
                },
                yaxes: [{
                        position: "left",
                        max: 1070,
                        color: "#838383",
                        axisLabelUseCanvas: true,
                        axisLabelFontSizePixels: 12,
                        axisLabelFontFamily: 'Arial',
                        axisLabelPadding: 3
                },{
                        position: "right",
                        clolor: "#838383",
                        axisLabelUseCanvas: true,
                        axisLabelFontSizePixels: 12,
                        axisLabelFontFamily: ' Arial',
                        axisLabelPadding: 67
                }
                ],
                legend: {
                    noColumns: 1,
                    labelBoxBorderColor: "#000000",
                    position: "nw"
                },
                grid: {
                    hoverable: true,
                    borderWidth: 0,
                    color: '#838383'
                }
            };

            function gd(year, month, day) {
                return new Date(year, month - 1, day).getTime();
            }


			var plot = $.plot($("#flot-dashboard-chart"), dataset, options);
			
			$("#flot-dashboard-chart").bind("plothover", function (event, pos, item) {
						if (item) {
							var x = item.datapoint[0].toFixed(2),
								y = item.datapoint[1].toFixed(2);
								
								var date = new Date(Math.floor(x));
								var day = date.getDate();
								var strs = item.series.label.split(" ");
							$("#tooltip").html(strs[0]+"-"+day + strs[1]+ Math.floor(y) + "位")
								.css({top: item.pageY - 80, left: item.pageX -220})
								.fadeIn(200);
						} else {
							$("#tooltip").hide();
						}
			});
			
			
			
			function update(checkDate){//日期改变后更新数据函数
				$.ajax({
					url:"/manageService/accountManage/userChart.do",
					dataType:'JSON',
					data:checkDate,
					success:function(data){
						dataset[0].data = data.list;
						dataset[0].label = data.returnMap['qdate']+' 新增用户数';
						$.plot($("#flot-dashboard-chart"), dataset, options);
						
						//data.returnMap
						var obj = data.returnMap;
						for(var p in obj){
							$("#"+p).html(obj[p]);
						}
					}
				});
			}
			
			
			
			
			function cFunc(){//日期控件绑定改变后操作的函数
				var mon = $dp.cal.newdate.M;
				if(mon<10){
					mon = "0"+mon;
				}
				var datatime = $dp.cal.newdate.y + "-" +mon;
				update({datatime:datatime});
			}
			
			$("#wdate").on('click',function(){//向日期标签绑定单击事件
				var day = new Date();
				var dayStr = day.getFullYear()+"-" + (day.getMonth()+1);
				WdatePicker({ychanged:cFunc,Mchanged:cFunc,maxDate:dayStr});
			});
			
			function setWdateVal(){//设置默认日期
				var day = new Date();
				var dayStr = day.getFullYear()+"-" + (day.getMonth()+1);
				$("#wdate").val(dayStr);
			}
			
			setWdateVal();
			update();
			
			
			function getDeviceLsit(){//获取设备列表
				$.ajax({
					url:'/manageService/deviceManage/listData.do',
					data:{start:0,length:5,draw:1},
					success:function(d){
						var data = d.data;
						for(var i = 0;i<data.length;i++){
							var rowDatas = data[i];
							var trEle = $("<tr></tr>");
							trEle.append("<td>"+rowDatas.deviceGuid+"</td>");
							trEle.append("<td>"+rowDatas.deviceType+"</td>");
							trEle.append("<td>"+rowDatas.deviceUsername+"</td>");
							trEle.append("<td>"+rowDatas.devicePassword+"</td>");
							trEle.append("<td>"+rowDatas.registerTime.replace("T"," ")+"</td>");
							trEle.append("<td>"+rowDatas.deviceVersion+"</td>");
							$("#deviceTbody").append(trEle);
						}
					}
				});
			}
			
			function getUserList()
			{
			      $.ajax({
		          url:'/manageService/accountManage/accountListOld.do',
		          data:{length:5,start:0,draw:1},
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
					  for(var j = 0;j<8;j++){
					    var celldata=rowDatas[j]==null?'':rowDatas[j];
					    trEle.append("<td>"+celldata+"</td>");
					  }
					  $("#userinfo").append(trEle);
		              
		        }}});
			}
			
			function getAlarmList()
			{
			      $.ajax({
		          url:'/manageService/alarmManage/alarmListOld.do',
		          data:{length:5,start:0,draw:1},
		          type:'POST',
		          success:function(result){
		              if(typeof(result)=="string")
			          {
			                result = eval("("+result+")");
			          }
		           
		          	 var data = result.dataOld;
					 for(var i = 0;i<data.length;i++){
					  var rowDatas = data[i];
					  var trEle = $("<tr></tr>");
					  for(var j = 0;j<4;j++){
					    var celldata=rowDatas[j]==null?'':rowDatas[j];
					    trEle.append("<td>"+celldata+"</td>");
					  }
					  $("#alarminfo").append(trEle);
              
        }}});
			}
            
            getDeviceLsit();
			getUserList();
			getAlarmList();
        });
    </script>

</body>

</html>