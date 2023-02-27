<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	html, body {
			height: 100%;
			padding: 0px;
			margin: 0px;
			overflow: auto;
		}
		.weekend {
			background: #f4f7f4;
		}
</style>
<script src="${path }/resources/gantt/codebase/dhtmlxgantt.js"></script>
<link rel="stylesheet" href="${path }/resources/gantt/codebase/dhtmlxgantt.css">
<script src="${path }/resources/a00_com/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var prjno = 55;
		console.log(prjno)
		
		// 주말 
		gantt.templates.scale_cell_class = function (date) {
			if (date.getDay() == 0 || date.getDay() == 6) {
				return "weekend";
			}
		};
		gantt.templates.timeline_cell_class = function (item, date) {
			if (date.getDay() == 0 || date.getDay() == 6) {
				return "weekend"
			}
		};
		
		gantt.config.scales = [
			{unit: "month", step: 1, format: "%M"}, // 화면에 출력될 월
			{unit: "year", step: 1, format: "%Y"}, // 화면에 출력될 연도
			{unit: "day", format: "%M %d"}  // 화면에 출력될 일자
		];
		gantt.config.columns = [
			{name: "text", label: "업무명", width: 200, tree: true},
			{name: "start_date", label: "시작일자", align: "center", width: 60},
			{name: "duration", label: "기간", align: "center", width: 60},
			{name: "owner", label:"담당자", align:"center",width:60}, 
			{name: "add", label: "", width: 44}
			
		];
		gantt.config.date_format ="%Y-%m-%d" // 2023-02-02 형태로 json데이터 넣게 변경
		gantt.config.grid_width = 390; // 왼쪽 넓이
		gantt.config.date_grid = "%M %d"; //왼쪽 표기되는 날짜형식
		gantt.config.scale_height = 60;
		gantt.config.task_date="%Y-%m-%d"; // 업무 클릭시 나오는 날짜 형태
		gantt.config.link_attribute = "prjno"
		
		gantt.locale.labels.section_resources = "담당자";
		gantt.locale.labels.section_prjno = "프로젝트 번호";
		gantt.locale.labels.section_description = "업무내용";
		gantt.locale.labels.section_time = "진행기간";
		gantt.config.lightbox.sections = [
			{ name: "description", height: 38, map_to: "text", type: "textarea", focus: true },
			//{ name: "owner", type: "text", map_to: "owner" },
			{name: "resources", type: "textarea", height:33, map_to: "owner"},
			{name: "prjno", type: "hidden",map_to: "prjno"},
			{ name: "time", type: "duration", map_to: "auto" }
		]

		/*var tasks={
			data:[
				{id:1, text:"프로젝트", type:gantt.config.types.project, progress: 0.4, open: true},
				{id:2, text:"업무1", type:gantt.config.types.task,start_date:"2023-03-05",owner:"홍길동", duration:"8",parent:"1", progress: 0.4, open: true},
				{id:3, text:"업무1-1", type:gantt.config.types.task,start_date:"2023-03-07",owner:"홍설", duration:"10", parent:"2", progress: 0.4, open: true}
			]
			,
			links:[
				{id: 1, source: "1", target: "2", type: "1"},  //id는 구분자 , source는 연결 시작, target 연결 끝 type: 0 (끝에서 시작으로 연결)| 1(앞에서 앞으로 연결) | 2 끝에서 끝으로 연결
				{id: 2, source: "2", target: "3", type: "2"}
				
			]// 끝에서 끝 2, 끝에서 시작 0, 시작에서 끝 3, 시작에서 시작 1
		
		}*/
		
		
		//	 업무에 마우스 올리면 업무 내용 뜨게 처리
		gantt.plugins({ 
			tooltip: true
		});
		gantt.attachEvent("onGanttReady", function(){
			var tooltips = gantt.ext.tooltips;
			tooltips.tooltip.setViewport(gantt.$task_data);
		});

		// body에 있는 간트id, "시작일자","종료일자" month는 =1
		gantt.init("gantt_here", new Date(2023, 02, 01), new Date(2023, 05, 20));
		// 초기데이터 ajax 호출
		gantt.load("/showGantt.do?prjno="+prjno)
		
		//## 업무등록 이벤트
		gantt.attachEvent("onAfterTaskAdd", function(id,item){
		    console.log(id)
		    console.log(item)
		    var startDate = timeConvert(item.start_date)
			var qstr="text="+item.text+"&start_date="+startDate+"&progress="+item.progress+"&owner="
			+item.owner+"&parent="+item.parent+"&duration="+item.duration+"&prjno="+prjno+"&id="+item.id    	
		    callAjax("/insGantt.do",qstr)
		  
		});
	    //## 업무삭제 이벤트
		gantt.attachEvent("onAfterTaskDelete", function(id,item){
			console.log(id)
		    console.log(item)
		    var qstr="id="+id+"&parent="+item.parent
		    callAjax("/delGantt.do",qstr)
		});
		// ## 업무 변경시 수정 메서드
		gantt.attachEvent("onAfterTaskUpdate", function(id,item){
		    console.log(item) 
		    var startDate = timeConvert(item.start_date)
		    var qstr="text="+item.text+"&start_date="+startDate+"&progress="+item.progress+"&owner="
		    +item.owner+"&parent="+item.parent+"&duration="+item.duration+"&id="+item.id
		    callAjax("/uptGantt.do",qstr)
		});
		
		//## 링크 드래그했을 시 링크 생성 메서드
		gantt.attachEvent("onLinkCreated", function(link){
		    console.log(link)
		    var qstr="id="+link.id+"&source="+link.source+"&target="+link.target+"&type="+link.type+"&prjno="+prjno
		    callAjax("/insLink.do",qstr)
		    return true;
		});
		//## 링크 더블클릭시 링크 삭제 메서드
		gantt.attachEvent("onLinkDblClick", function(id,e){
			console.log(id)
		    var qstr="id="+id
		    callAjax("/delLink.do",qstr)
		    return true;
		});
		
	})	
		// 읽기전용으로 만들기
		// ganttReadonly()
		function ganttReadonly() {
				gantt.config.readonly = !gantt.config.readonly;
				gantt.init("gantt_here");
			}

		// 간트 날짜 형식 입력시 변경해주기
		function timeConvert(itemDate){
			 let offset = itemDate.getTimezoneOffset() * 60000; //ms단위라 60000곱해줌
			 let dateOffset = new Date(itemDate.getTime() - offset);
			 return dateOffset.toISOString().split("T")[0];	    
		}
		// 등록, 수정시 ajax
		function callAjax(url,qstr){
			 $.ajax({
			    	url:url,
			    	type:"post",
			    	data:qstr,
			    	dataType:"json",
			    	success:function(data){
			    		console.log(data)
			    	},
			    	error:function(err){
			    		console.log(err)
			    	}
			    })
		};
</script>
</head>

<body>
<div id="gantt_here" style='width:100%; height:100%;'></div>
</body>
</html>