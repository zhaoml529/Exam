<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'statisticsPaper.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href='<c:url value="/css/default.css"/>' />
	<script type="text/javascript" src="js/jquery-1.10.2.min.js" charset="UTF-8"></script>
	<script type="text/javascript" src="js/highcharts.js"></script>
	<script type="text/javascript" src="js/exporting.js"></script>
	<script type="text/javascript">
		$(function () {
		    $('#container').highcharts({
		        chart: {
		            plotBackgroundColor: null,
		            plotBorderWidth: null,
		            plotShadow: false
		        },
		        title: {
		            text: '试卷试题类型统计'
		        },
		        tooltip: {
		    	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		        },
		        plotOptions: {
		            pie: {
		                allowPointSelect: true,
		                cursor: 'pointer',
		                dataLabels: {
		                    enabled: true,
		                    color: '#000000',
		                    connectorColor: '#000000',
		                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
		                },
		                showInLegend: true
		            }
		        },
		        series: [{
		            type: 'pie',
		            name: '试题所占百分比',
		            data: [
		            	{
		                    name: '选择题',
		                    y: ${choice},
		                    sliced: true,
		                    selected: true
		                },
		                ['填空题',   ${cloze}],
		                ['简答题',   ${short}],
		                ['综合题',   ${compre}]
		            ]
		        }]
		    });
		});
	</script>
	<script type="text/javascript">
	$(function () {
        var colors = Highcharts.getOptions().colors,
            categories = ['选择题', '填空题', '简答题', '综合题'],
            name = 'Browser brands',
            data = [{
                    y: ${choice},
                    color: colors[0],
                    drilldown: {
                        name: 'MSIE versions',
                        categories: ['简单', '中等', '困难'],
                        data: [${easyChoice}, ${normalChoice}, ${hardChoice}],
                        color: colors[0]
                    }
                }, {
                    y: ${cloze},
                    color: colors[1],
                    drilldown: {
                        name: 'Firefox versions',
                        categories: ['简单', '中等', '困难'],
                        data: [${easyCloze}, ${normalCloze}, ${hardCloze}],
                        color: colors[1]
                    }
                }, {
                    y: ${short},
                    color: colors[2],
                    drilldown: {
                        name: 'Chrome versions',
                        categories: ['简单', '中等', '困难'],
                        data: [${easyShort}, ${normalShort}, ${hardShort}],
                        color: colors[2]
                    }
                }, {
                    y: ${compre},
                    color: colors[3],
                    drilldown: {
                        name: 'Safari versions',
                        categories: ['简单', '中等', '困难'],
                        data: [${easyCompre}, ${normalCompre}, ${hardCompre}],
                        color: colors[3]
                    }
                }];
    
        // Build the data arrays
        var browserData = [];
        var versionsData = [];
        for (var i = 0; i < data.length; i++) {
    
            // add browser data
            browserData.push({
                name: categories[i],
                y: data[i].y,
                color: data[i].color
            });
    
            // add version data
            for (var j = 0; j < data[i].drilldown.data.length; j++) {
                var brightness = 0.2 - (j / data[i].drilldown.data.length) / 4 ;
                versionsData.push({
                    name: data[i].drilldown.categories[j],
                    y: data[i].drilldown.data[j],
                    color: Highcharts.Color(data[i].color).brighten(brightness).get()
                });
            }
        }
    
        // Create the chart
        $('#container1').highcharts({
            chart: {
                type: 'pie'
            },
            title: {
                text: '试题难度系数统计'
            },
            plotOptions: {
                pie: {
                	//allowPointSelect: true,
                    shadow: false,
                    center: ['50%', '50%']
                }
            },
            tooltip: {
        	    valueSuffix: '%'
            },
            series: [{
                name: '在试卷中的比例',
                data: browserData,
                size: '60%',
                dataLabels: {
                    formatter: function() {
                        return this.y > 1 ? this.point.name : null;
                    },
                    color: 'white',
                    distance: -40
                }
            }, {
                name: '占此题型的',
                data: versionsData,
                size: '80%',
                innerSize: '60%',
                dataLabels: {
                    formatter: function() {
                        // display only if larger than 1
                        return this.y >= 1 ? '<b>'+ this.point.name +':</b> '+ this.y +'%'  : null;
                    }
                }
            }]
        });
    });
	</script>
  </head>
  
  <body>
  <table cellSpacing=0 cellPadding=5 style="" width="100%" border=0 style=" margin-top:0px">
        <tr>
          <td class="manageHead">当前位置：试卷管理&nbsp;-&gt;试卷列表&nbsp;-&gt;试卷统计</td>
        </tr>
        <tr>
          <td height=2></td></tr>
    </table>
    <input type="button" value="返回" class="btn" onclick="javascript:history.go(-1)" style=" margin-bottom:10px;float: left">
  	<div style="display: inline-block;">
    <div id="container" style="width:500px; height:450px; float: left"></div>
    <div id="container1" style="width:500px; height:450px; float: left"></div>
	</div>
  </body>
</html>
