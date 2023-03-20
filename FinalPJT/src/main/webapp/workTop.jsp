<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.nav-item.nav-link{
	padding-right: 1rem !important;
}
</style>
<script src="${path }/resources/a00_com/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var projectName="${projectInfo.subject}" // 모델데이터
	$("#subject").text(projectName)
	var prjno = "${projectInfo.prjno}"
	
	var deadline = "${projectInfo.deadline}"
	var deadlineDate = new Date(deadline.split("-")[0],deadline.split("-")[1]-1,deadline.split("-")[2])
	var today = new Date()
	
	var minustime = deadlineDate.getTime()-today.getTime() // 시간으로 변환해서 연산(초단위)
	var minusdate = Math.ceil(minustime / (1000 * 3600 * 24));  // 시간을 날짜로 변환(올림처리)
	
	if(minusdate>=0){
		$("#subject").append(" (D-"+minusdate+")")
	}else{
		$("#subject").append(" (종료)")
	}
	
});
function goApprv(prjno){
	if("${emp.id}"!="${projectInfo.tlid}"){
		alert("프로젝트 리더만 이용이 가능합니다.")
	}else{
		location.href="${path}/apprvList.do?prjno="+prjno;
	}
}

</script>
</head>

<body>
 		<div class="row">
           <div class="col-8">
           <h3 id="subject"class="fw-bold py-3 mt-4 pt-3">프로젝트 이름</h3>
           </div>
          </div>
        <div class="nav navbar-nav me-auto d-flex flex-row">
          <a class="nav-item nav-link active" href="${path}/projectMain.do?prjno=${projectInfo.prjno}">진행상황</a>
          <a class="nav-item nav-link" >|</a>
          <a class="nav-item nav-link" href="${path}/workGanttList.do?prjno=${projectInfo.prjno}">업무</a>
          <a class="nav-item nav-link">|</a>
          <a class="nav-item nav-link" onclick="goApprv(${projectInfo.prjno})" >결재함</a>
          <a class="nav-item nav-link">|</a>
          <a class="nav-item nav-link" href="${path}/project_pagingRisk.do?prjno=${projectInfo.prjno}">리스크 관리</a>
        </div>
</body>
</html>