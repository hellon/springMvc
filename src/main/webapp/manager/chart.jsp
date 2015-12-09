<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>数据统计</title>

    <link href="../manager/css/bootstrap.min.css" rel="stylesheet">
    <link href="../manager/css/font-awesome.css" rel="stylesheet">
	<link href="../manager/css/dataTables.bootstrap.css" rel="stylesheet">
    <link href="../manager/css/animate.css" rel="stylesheet">
    <link href="../manager/css/style.css" rel="stylesheet">

</head>


<body class="xw_body" style="background-color: #F1F1F1">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>本年度用户增长量</h5>
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
                                <div class="flot-chart">
                                    <div class="flot-chart-content" id="flot-bar-chart2"></div>
                                </div>
                                <div class="table-arr" title="查看全部">
                                    <div onclick="javascript:window.location.href='chart_1.html' ">
                                        <i class="fa fa-chevron-right"></i>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title" id="thisweekuser">
                                <h5>最近7天用户增长量</h5>
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

                                <div class="flot-chart">
                                    <div class="flot-chart-content" id="flot-line-chart1"></div>
                                </div>
                                <div class="table-arr" title="查看全部">
                                    <div>
                                        <i class="fa fa-chevron-right"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>最近5年设备出货量</h5>
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
                                <div class="flot-chart">
                                    <div class="flot-chart-content" id="flot-pie-chart"></div>
                                </div>
                                <div class="table-arr" title="查看全部">
                                    <div>
                                        <i class="fa fa-chevron-right"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title" id="thisyeardevice">
                                <h5></h5>
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

                                <div class="flot-chart">
                                    <div class="flot-chart-content" id="flot-bar-chart1"></div>
                                </div>
                                <div class="table-arr" title="查看全部">
                                    <div>
                                        <i class="fa fa-chevron-right"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

    <script src="../manager/js/jquery-2.1.1.min.js"></script>
    <script src="../manager/js/bootstrap.min.js"></script>
    <script src="../manager/js/bootstrap.xw.min.js"></script> 
	<script src="../manager/js/jquery.dataTables.js"></script>
    
    
    <!-- Flot -->
    <script src="../manager/js/flot/jquery.flot.js"></script>
    <script src="../manager/js/flot/jquery.flot.tooltip.min.js"></script>
    <script src="../manager/js/flot/jquery.flot.resize.js"></script>
    <script src="../manager/js/flot/jquery.flot.pie.js"></script><!--
    <script src="js/flot/flot-demo.js"></script>

    --><script>
        $(document).ready(function () {
			
			$(".table-arr").css({"height":"240px","line-height":"240px","top":"-4px"});
			
			/*$(".ibox-content").hover(function(){
				$(this).children(".flot-chart").animate({ width: "94%" });
				$(this).children(".table-arr").show().animate({ width: "60px" });
			},function(){
				$(this).children(".flot-chart").animate({ width: "100%" });
				$(this).children(".table-arr").animate({ width: "0" });
			});*/

		$.ajax({
        url:"/manageService/accountManage/weekuserChart.do",
        dataType:'JSON',
        success:function(data){
         	var barData =
           {
		        label: "bar",
		        data:data.list
	    	};
	    var barOptions = {
        series: {
            lines: {
                show: true,
                lineWidth: 2,
                fill: true,
                fillColor: {
                    colors: [{
                        opacity: 0.2
                    }, {
                        opacity: 0.2
                    }]
                }
            }
        },
        xaxis: {
            tickDecimals: 0,
            mode:"time"
        },
        colors: ["#1ab394"],
        grid: {
            color: "#999999",
            hoverable: true,
            clickable: true,
            tickColor: "#D4D4D4",
            borderWidth:0
        },
        legend: {
            show: false
        },
        tooltip: true,
        tooltipOpts: {
            content: "%x日, 新增用户 %y位"
        }
    };
          $.plot($("#flot-line-chart1"), [barData], barOptions);
          }
         });
		
		/*最近一周设备增长数*/
		$.ajax({
        url:"/manageService/accountManage/weekdeviceChart.do",
        dataType:'JSON',
        success:function(data){
         	var barData =
           {
		        label: "bar",
		        data:data.list
	    	};
	      var barOptions = {
        series: {
            bars: {
                show: true,
                barWidth: 0.9,
                barDirection: 'vertical',
                fill: true,
                fillColor: {
                    colors: [{
                        opacity: 0.8
                    }, {
                        opacity: 0.8
                    }]
                }
            }
        },
        xaxis: {
            tickDecimals: 0,
           /// mode:"time"
        },
        colors: ["#1ab394"],
        grid: {
            color: "#999999",
            hoverable: true,
            clickable: true,
            tickColor: "#D4D4D4",
            borderWidth:0
        },
        legend: {
            show: false
        },
        tooltip: true,
        tooltipOpts: {
            content: "%x月新增设备 %y台"
        }
    };
	      $("#thisyeardevice h5").text("本年度每月新增设备数");
          $.plot($("#flot-bar-chart1"), [barData], barOptions);
          }
         });
         
         /*本年度每月用户增长数*/
		$.ajax({
        url:"/manageService/accountManage/monthUserChart.do",
        dataType:'JSON',
        success:function(data){
         	var barData =
           {
		        label: "bar",
		        data:data.list
	    	};
	      var barOptions = {
        series: {
            bars: {
                show: true,
                barWidth: 0.9,
                barDirection: 'vertical',
                fill: true,
                fillColor: {
                    colors: [{
                        opacity: 0.8
                    }, {
                        opacity: 0.8
                    }]
                }
            }
        },
        xaxis: {
            tickDecimals: 0,
           /// mode:"time"
        },
        colors: ["#1ab394"],
        grid: {
            color: "#999999",
            hoverable: true,
            clickable: true,
            tickColor: "#D4D4D4",
            borderWidth:0
        },
        legend: {
            show: false
        },
        tooltip: true,
        tooltipOpts: {
            content: "%x月新增用户 %y位"
        }
    };
          $.plot($("#flot-bar-chart2"), [barData], barOptions);
          }
         });
         
         
         
        /*最近5年设备增长数*/
		$.ajax({
        url:"/manageService/accountManage/last5yearsdeviceChart.do",
        dataType:'JSON',
        success:function(data){
         	 var data = data.list_map;

    var plotObj = $.plot($("#flot-pie-chart"), data, {
        series: {
            pie: {
                show: true
            }
        },
        grid: {
            hoverable: true
        },
        tooltip: true,
        tooltipOpts: {
            content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
            shifts: {
                x: 20,
                y: 0
            },
            defaultTheme: false
        }
    });
          }
         });
         
         
         
         
        /*饼图*/ 
         $(function() {});
         
    
     
     $.ajax({
        url:"/manageService/accountManage/weekdeviceChart.do",
        dataType:'JSON',
        success:function(data){
    var barOptions = {
        series: {
            bars: {
                show: true,
                barWidth: 0.95,
                fill: true,
                fillColor: {
                    colors: [{
                        opacity: 0.8
                    }, {
                        opacity: 0.8
                    }]
                }
            }
        },
        xaxis: {
            tickDecimals: 0,
            mode:"number"
        },
        colors: ["#1ab394"],
        grid: {
            color: "#999999",
            hoverable: true,
            clickable: true,
            tickColor: "#D4D4D4",
            borderWidth:0
        },
        legend: {
            show: false
        },
        tooltip: true,
        tooltipOpts: {
            content: "x: %x, y: %y"
        }
    };
    var barData = {
        label: "bar",
        data: [
            [1, 340],
            [2, 250],
            [3, 190],
            [4, 340],
            [5, 320],
            [6, 440]
        ]
    };
    $.plot($("#flot-bar-chart"), [barData], barOptions);
          }
         });
         
        });
    </script>

</body>

</html>
