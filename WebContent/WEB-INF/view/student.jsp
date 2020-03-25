<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="t" uri="http://www.nwnu.cn/common/"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>西北师范大学疫情上报系统</title>
	<link rel="stylesheet" href="plug-in/bootstrap-3.3.7-dist/css/bootstrap.css" />
</head>
<script type="text/javascript">
function saveStudent(){	
	alert($('#addStudentForm').serialize());
  $.post("insertStudent",$('#addStudentForm').serialize(),
  	function(data){
	  if(data=="OK"){
		  alert("信息修改成功！");
		  window.location.reload();
		  clearFormData();
	  }else{
		  alert("操作失败！");
	  }
  	}
  );
}
function updateStudent(id){	
	$.ajax({url: "getStudentById", 
		type:"get",
		data:{"id":id},
		success: function(data){
       		//数据回显
       		$("#addStudentForm #id").val(data.id);
       		$("#addStudentForm #clazzId").val(data.clazzId);
       		$("#addStudentForm #code").val(data.code);
       		$("#addStudentForm #name").val(data.name);
       		$("#addStudentForm #sex").val(data.sex);
       		$("#addStudentForm #identity").val(data.identity);
       		$("#addStudentForm #nation").val(data.nation);       		
    	}
	});
}
function clearFormData(){
	$("#addStudentForm #id").val("");
	$("#addStudentForm #clazzId").val("");
	$("#addStudentForm #code").val("");
	$("#addStudentForm #name").val("");
	$("#addStudentForm #sex").val("");
	$("#addStudentForm #identity").val("");
	$("#addStudentForm #nation").val("");
}
function clearQueryForm(){	
	$("#queryForm #clazzId").val("");
	$("#queryForm #code").val("");
	$("#queryForm #name").val("");
	$("#queryForm #identity").val("");
	$("#queryForm #sex").val("");	
	$("#queryForm #nation").val("");
}
function deleteStudent(id){	
	var r = confirm("你确定删除吗");
	if (r == true) {
		$.post("deleteStudent",{"id":id},
			  	function(data){
				  if(data=="OK"){
					  alert("删除学生疫情信息成功！");
					  window.location.reload();
				  }else{
					  alert("删除学生疫情信息失败！");
					  
				  }
			  	}
			  );
	} else {
	}
  
}
</script>

<body>
<div style="width: 100%;background: #fff;height: 88px;box-shadow: 1px 2px 6px #e1e1e1;z-index: 1;position: relative;">
	<div style="float: left;height: 88px;width: 460px;margin-left: 120px;">
		<p style="background:url(plug-in/system/images/login.jpg) no-repeat; width: 210px;height:88px;float: left;background-size:210px 86px; ">
				<a href=""></a>
		</p>
		<a style="width: 240px;display: block;height: 80px;float: right;">
				<img src="plug-in/system/images/font.png" style="height:80px;width:240px;" alt="">
		</a>
	</div>			
		<div style="float:right;padding-top:30px;padding-right:60px;">
			<span class="pull-right">
		 	您好！${user.name}
				<a href="logout">退出登录</a>
			</span>
		</div>
			
		
	</div>
<div class="alert alert-success alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>温馨提示：</strong> 您可以根据以下不同信息来搜索您需要查看的疫情信息
</div>




<div class="panel panel-default">
    <div class="panel-body">
    <form action="student" method="get" id="queryForm" name="queryForm" class="form-inline"> 
        学院：<select name="clazzId" id="clazzId" class="form-control" >
        	  <option value="">请选择</option>
				<c:forEach var="item" items="${clazzList}">
					<option value="${item.id}"<c:if test="${item.id==student.clazzId}">selected="selected"</c:if>>${item.name}</option>
				</c:forEach>									
			</select>
			身份：<select name="identity" class="form-control" id="identity">
        		<option value="">请选择</option>
				<c:forEach var="item" items="${identityList}">
					<option value="${item.itemCode}" <c:if test="${item.itemCode==student.identity}">selected="selected"</c:if>>${item.itemName}</option>
				</c:forEach>			
			   </select>	
    	<div class="input-group input-group-sm">
  		<span class="input-group-addon" id="sizing-addon3">学号：</span>
  		<input type="text"  name="code" class="form-control" id="code"  value="${student.code}" />
		</div>
        <div class="input-group input-group-sm">
  		<span class="input-group-addon" id="sizing-addon3">姓名：</span>
  		<input type="text" style="width:145px;" name="name" class="form-control" id="name"  value="${student.name}" />
		</div>
         是否今天从外地返校：<select name="sex" class="form-control" id="sex">
        		<option value="">请选择</option>
				<c:forEach var="item" items="${sexList}">
					<option value="${item.itemCode}" <c:if test="${item.itemCode==student.sex}">selected="selected"</c:if>>${item.itemName}</option>
				</c:forEach>			
			   </select>
        体温是否正常：<select name="nation" class="form-control" id="nation">
        		<option value="">请选择</option>
				<c:forEach var="item" items="${nationList}">
					<option value="${item.itemCode}" <c:if test="${item.itemCode==student.nation}">selected="selected"</c:if>>${item.itemName}</option>
				</c:forEach>	
			   </select>
		<a id="export" style="margin-top:15px;" class="btn btn-info btn-sm pull-right" type="button">导出</a>
		<button style="margin-top:15px;" class="btn btn-danger btn-sm pull-right" type="button" onclick="clearQueryForm()">清除</button>
		<button style="margin-top:15px;" class="btn btn-primary btn-sm pull-right" type="submit">查询</button>
		</form>
    </div>
</div>

<!-- 按钮触发模态框 -->
  <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#addStudent">添加</button>
<!-- 模态框（Modal） -->
<div class="modal fade" id="addStudent" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">疫情上报</h4>
            </div>
            <div class="modal-body">
            <form action="" method="post" onsubmit="return false" id="addStudentForm">
            <input id="id" name="id" type="hidden" value="" />
			       		<div class="form-group">
			       			<label for="">学院</label>
			       			<select name="clazzId" id="clazzId">
								<c:forEach var="item" items="${clazzList}">
									<option value="${item.id}">${item.name}</option>
								</c:forEach>								
								</select>
			       		</div>
			       		<div class="form-group">
			       			<label for="">身份</label>
			       			<select name="identity" class="form-control" id="identity">
			       				<c:forEach var="item" items="${identityList}">
			       					<option value="${item.itemCode}">${item.itemName}</option>
			       				</c:forEach>
			       			</select>
			       		</div>
			       		<div class="form-group">
			       			<label for="">学号/工号</label>
			       			<input type="text" name="code" class="form-control" id="code">
			       		</div>
			       		<div class="form-group">
			       			<label for="">姓名</label>
			       			<input type="text" name="name" class="form-control" id="name">
			       		</div>
			       		<div class="form-group">
			       			<label for="">是否今天从外地返校</label>
			       			<select name="sex" class="form-control" id="sex">
			       				<c:forEach var="item" items="${sexList}">
			       					<option value="${item.itemCode}">${item.itemName}</option>
			       				</c:forEach>
			       			</select>		
			       		</div>
			       		
			       		<div class="form-group">
			       			<label for="">体温是否正常</label>
			       			<select name="nation" class="form-control" id="nation">
			       				<c:forEach var="item" items="${nationList}">
			       					<option value="${item.itemCode}">${item.itemName}</option>
			       				</c:forEach>
			       			</select>
			       		</div>
			       		<div class="form-group">
			       			<input value="提交" class="btn btn-success" onclick="saveStudent()">
			       			<input type="reset" value="重置" class="btn btn-danger">
			       		</div>
			       	</form>
            </div>
        </div>
    </div>
</div>





<div class="cont">
	<table class="table"  id="tableExcel">
	    <thead>
	        <tr>
	        	<th>学院</th>
	        	<th>身份</th>
	            <th>学号</th>
	            <th>姓名</th>
	            <th>是否今天从外地返校</th>
	            <th>体温是否正常</th>
	            <th>上报日期</th>
	            <th>学院负责老师</th>
	            <th>学院电话</th>
	            <th>操作</th>
	        </tr>
	    </thead>
	    <tbody>
	    	<c:forEach items="${page.rows}" var="student">
		        <tr class="active">
		            <td>${student.clazzName}</td>
		            <td>${student.identity}</td>
		            <td>${student.code}</td>
		            <td>${student.name}</td>
		            <td>${student.sex}</td>
		            <td>${student.nation}</td>
		            <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${student.createDate}" /></td>
		            <td>${student.clazzTeacher}</td>
		            <td>${student.clazzPhone}</td>
		            <td>
		            	<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#addStudent" onclick="updateStudent(${student.id})">修改</button>
						<button type="button" class="btn btn-danger" onclick="deleteStudent(${student.id})">删除</button>
		            </td>
		        </tr>
	       </c:forEach>
	    </tbody>
	</table>
	
	<t:page url="student" />
</div>
<br>
	
	
	<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
    <div id="mainChart" style="width: 600px;height:440px;float:left;"></div>
    <div id="main" style="width: 600px;height:200px;float:right;background-color:#cccccc;"></div>
    <div id="main2" style="width: 600px;height:220px;float:right;background-color:#cccccc;margin-top:20px;"></div>
</body>


<script src="plug-in/jquery-3.3.1/jquery-3.3.1.min.js"></script>
<script src="plug-in/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<script src="plug-in/system/js/echarts.min.js"></script>


<script>
//导出数据
$("#export").click(function () {
    tableToExcel();
})

var tableToExcel = (function () {
    var uri = 'data:application/vnd.ms-excel;base64,'
    , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><meta charset="UTF-8"><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
    , base64 = function (s) { return window.btoa(unescape(encodeURIComponent(s))) }
    , format = function (s, c) { return s.replace(/{(\w+)}/g, function (m, p) { return c[p]; }) };
    return function () {
        //根据ID获取table表格HTML
        var table = document.getElementById("tableExcel");
        var ctx = { worksheet: 'Worksheet', table: table.innerHTML };
        document.getElementById("export").href = uri + base64(format(template, ctx));
        document.getElementById("export").download = '学生疫情表.xls';
    }
})()
</script>
<script>
//使用ajax加载数据
$.ajax({
    method: 'post',
    url: '${pageContext.request.contextPath}/pie',
    dataType: 'json',
    success: function (data) {//data格式
        initChat(data);
    }
});

function initChat(data) {
    var myChart = echarts.init(document.getElementById('mainChart'));
    option = {
        backgroundColor: '#cccccc',
        color: ["#D53A35", "#296294"],
        title: {
            text: '各学院疫情上报情况',
            subtext: '数据纯属虚构',
            x: 'center'
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: formatData(data).xAxData
        },
        series: [{
            name: '各学院人数',
            type: 'pie',
            radius: '55%',
            center: ['50%', '60%'],
            color: ['#ffff00', '#ff00ff','#CEB21C','#0F0F08','#D61517','#2C15C9','#71D6FF','#95989D','#1FB258','#83986F','#98A712','#986421','#DE4B4B'],
            data: formatData(data).serData,
            itemStyle: {
                emphasis: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        }]
    };
    myChart.setOption(option, true);
};

function formatData(data) {
    var xAxData = [];
    var serData = [];

    for (var i = 0; i < data.length; i++) {
        xAxData.push(data[i].name || "");
        serData.push({
            name: data[i].name,
            value: data[i].value || 0
        });
    }

    return {
        xAxData: xAxData,
        serData: serData
    };
};
</script>
<script>
	var myChart = echarts.init(document.getElementById('main'));
	// 指定图表的配置项和数据
    myChart.setOption({
    	title: {
            text: '老师学生上报情况',
            subtext: '数据纯属虚构'
        },
            series : [
                {
                	color: ['#ff0000','#749f83', ],
                    name: '老师学生上报情况',
                    type: 'pie',    // 设置图表类型为饼图
                    radius: '55%',  // 饼图的半径，外半径为可视区尺寸（容器高宽中较小一项）的 55% 长度。
                    data:[          // 数据数组，name 为数据项名称，value 为数据项值
                        {value:24, name:'老师'},
                        {value:50, name:'学生'}
                    ]
                }
            ]
        })
</script>
<script>
	var myChart = echarts.init(document.getElementById('main2'));
	// 指定图表的配置项和数据
    var option = {
        title: {
            text: '疫情防控情况',
            subtext: '纯属虚构'
        },
        tooltip: {
            
        },
        legend: {
            data: ['否', '是']
        },
        xAxis: {
        	  data: ["是否今天从外地返校", "体温是否正常"]
        }  ,
        yAxis: {},
        series: [
            {
                name: '否',
                type: 'bar',
                data: [36,20],
            },
            {
                name: '是',
                type: 'bar',
                data: [38,54],
            }
        ]
    };
 // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
</html>
