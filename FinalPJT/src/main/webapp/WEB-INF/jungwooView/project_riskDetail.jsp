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
.card.mb-4{
	padding-left: 3rem !important;
	padding-right: 3rem !important;
}
.sol-content{
	background-color:#f5f5f9;
	border-radius: 0.375rem;
	padding-left:1%;
	padding-top:1%;
	padding-bottom:1%;
	border: 1px solid #d9dee3;
	align-items: center;
	position: relative;
	height:auto;
}
.sol-content-header{
	display: flex;
	justify-content: space-between;
}
.sol_content_contain{
	display: flex;
	gap:1%;
}
#insertBtn{
	font-size: 12px;
	width: 80px
}
.nav-item.nav-link{
	padding-right: 1rem !important;
}

</style>
<script src="${path }/resources/a00_com/jquery.min.js"></script>
<link rel="icon" type="image/x-icon" href="${path }/resources/sneat-1.0.0/assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="${path }/resources/sneat-1.0.0/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="${path }/resources/sneat-1.0.0/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="${path }/resources/sneat-1.0.0/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="${path }/resources/sneat-1.0.0/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="${path }/resources/sneat-1.0.0/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="${path }/resources/sneat-1.0.0/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="${path }/resources/sneat-1.0.0/assets/js/config.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		console.log($("[name=risklevel]").val())
		$("#uptBtn2").click(function(){			
			if(confirm("수정 하시겠습니까?")){
				$("option").attr("disabled", false)
				$("#form1").attr("action","${path}/project_riskUpdate.do?prjno="+${param.prjno});
				$("#form1").submit();
			}
		})
		$("#delBtn").click(function(){			
			if(confirm("삭제 하시겠습니까?")){
				$("option").attr("disabled", false)
				$("#form1").attr("action","${path}/project_riskDelete.do?prjno="+${param.prjno});
				$("#form1").submit();
			}
		})
		$("#goMain").click(function(){
			location.href="${path}/project_pagingRisk.do?prjno="+${param.prjno}	
		});
		var ename="${emp.ename}"
		console.log(ename)
 		if(${emp.auth!=2}){
			$("[name=risklevel]").attr('readonly',true)
			$("[name=riskpriority]").attr('readonly',true)
			$("[name=riskmoniter]").attr('readonly',true)
			$("[name=riskstate]").attr('readonly',true)
			if($("[name=riskmoniter]").val()==ename){
				$("[name=risklevel]").attr('readonly',false)
				$("[name=riskpriority]").attr('readonly',false)
				$("[name=riskstate]").attr('readonly',false)
			}
		}
		$("#riskmoniter").click(function(){
			if(${emp.auth!=2}){
				alert("pm만 가능")
			}
		})
		$("#risklevel, #riskpriority, #riskstate").click(function(){
			if($("[name=riskmoniter]").val()!=ename && ${emp.auth!=2}){
				alert("pm과 담당자만 가능")
			}
		})
		if($("[name=riskmoniter]").val()!=""){
			console.log($("[name=riskstate]").val())
			
		}
		$("[name=riskmoniter]").keyup(function(e){
			if(e.keyCode == 13){
				$("[name=riskstate]").val("PM확인")
			}
		})
		$("#insertBtn").click(function(){
			$("#form2").attr("action","${path}/insertSol.do?prjno="+${param.prjno}+"&riskno="+${param.riskno});
			$("#form2").submit();
		})
		console.log($("#risk_strategy").val())
		if($("#risk_strategy").val()!=undefined){
			$("#applyBtn").css("display", "none")
		}
	});
	function goPage(cnt){
		$("[name=curPage]").val(cnt);
		$("#form3").submit()
	}	
</script>
</head>

<body style="overflow-x: hidden">
   <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->
	<jsp:include page="/mainMenubar.jsp"></jsp:include>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
        <jsp:include page="/mainTop.jsp"></jsp:include>
		  

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->
			
            <div class="container-xxl flex-grow-1 container-p-y">

           
           <div class="card mb-4 pb-3">
           <jsp:include page="/projectTop.jsp"></jsp:include>
			<hr class="mx-0">
           		<div class="card-body">
           			<div class="input-form col-md-12 mx-auto">
				        <h4 class="text-primary">리스크 상세</h4>
				        <form method="post" id="form1" class="validation-form" novalidate>
				          <div class="row">
				            <div class="col-md-6 mb-3">
				              <label for="riskno">리스크번호</label>
				              <input type="text" name="riskno" class="form-control" id="riskno" 
				              		value="${risk.riskno}" readonly required>
				              <div class="invalid-feedback">
				                입력해주세요.
				              </div>
				            </div>
				          </div>  
				          <div class="mb-3">
				            <label for="subject">제목</label>
				            <input name="riskname" value="${risk.riskname}" type="text" class="form-control  ckValid" id="riskname" placeholder="제목 입력" required>
				            <div class="invalid-feedback">
				              제목을 입력해주세요.
					           </div>
						  </div>
				          <div class="row">      
					          <div class="col-md-6 mb-3">
					            <label for="risklevel">심각도</label>
					            <select class="form-control" name="risklevel" id="risklevel" required>
					            	<option selected disabled value="${risk.risklevel}">${risk.risklevel}</option>
					            	<option disabled="disabled">--------------------------------------------------------------------------------------</option>
					            	<option value="긴급">긴급</option>
					            	<option value="보통">보통</option>
					            	<option value="낮음">낮음</option>
					            </select>
					          </div> 
					          <div class="col-md-6 mb-3">
					            <label for="riskpriority">우선도</label>
					            <select class="form-control" name="riskpriority" id="riskpriority" required>
					            	<option selected disabled value="${risk.riskpriority}">${risk.riskpriority}</option>
					            	<option disabled="disabled">--------------------------------------------------------------------------------------</option>
					            	<option value="1">1</option>
					            	<option value="2">2</option>
					            	<option value="3">3</option>
					            </select>
					          </div> 	          
				          </div> 
				          <div class="row">
				            <div class="col-md-6 mb-3">
				              <label for="riskmoniter" >모니터링 </label>
				              <input type="text" name="riskmoniter"  class="form-control" 
				              		value="${risk.riskmoniter }" id="riskmoniter" >
				            </div>
				            <div class="col-md-6 mb-3">
				              <label for="riskstate" >리스크 상태</label>
					            <select class="form-control" name="riskstate" id="riskstate" required>
					            	<option value="발생" selected disabled value="${risk.riskstate }">${risk.riskstate }</option>
					            	<option disabled="disabled">--------------------------------------------------------------------------------------</option>
					            	<option value="발생">발생</option>
					            	<option value="PM확인">PM확인</option>
					            	<option value="처리중">처리중</option>
					            	<option value="해결">해결</option>
					            </select>
				            </div>
				          </div> 
				          <div class="mb-4"></div>
				          <button id="uptBtn2" class="btn btn-warning btn-lg btn-block" type="button">리스크 수정</button>
				          <button id="delBtn" class="btn btn-danger   btn-lg btn-block" type="button">리스크 삭제</button>
				          <button id="goMain" class="btn btn-info   btn-lg btn-block" type="button">조회 화면</button>
				        </form>
				      </div>
           		</div>
         	</div>
         	  <!-- /card -->
			<div class="card mb-4 pb-3">
           		<div class="card-body">
           			<div class="input-form col-md-12 mx-auto">
				        <h4 class="text-primary">방안제시</h4>
				          <div class="row">
				            <div class="table-responsive">
				            <form id="form3" class="d-flex"  method="post"> 			
								    <input type="hidden" name="curPage" value="${sch2.curPage}"/>
								</form> 
				              <input type="hidden" value="${risk.riskno}">
				              <c:forEach var="sol" items="${sol}">
   				                <div class="sol-content-header">
				                	<span class="text-info">${sol.ename }</span>
				                	<span>${sol.solregdate }</span>
				                </div>
				              <div class="sol-content">
				                <input type="hidden" value="${sol.solno }">
				                <span>${sol.solution_content }</span>      				       
				              </div>
				              </c:forEach>
				              <c:if test="${not empty sol }">
				              <ul class="pagination  justify-content-end"> 
									<li class="page-item"><a class="page-link" 
										href="javascript:goPage(${sch2.startBlock-1});">Previous</a></li>
								
									<c:forEach var="cnt" begin="${sch2.startBlock}" 
											end="${sch2.endBlock}">
								  		<li class="page-item ${sch2.curPage==cnt?'active':''}">
								  		<a class="page-link" 
								  			href="javascript:goPage(${cnt});">${cnt}</a></li>
								  	</c:forEach>
								  	<li class="page-item"><a class="page-link" 
								  			href="javascript:goPage(${sch2.endBlock+1});">Next</a></li>
								</ul>
				              </c:if>
				              
  								
							</div>
				          </div>  
				          <div class="mb-3">
				          	<form method="post" id="form2" class="validation-form" novalidate>
				            	<label for="solution_content">의견</label>
				            	<input type="hidden" name="id" value="${emp.id }">
				            	<div class="sol_content_contain">
				            		<input name="solution_content" type="text" class="form-control  ckValid" 
				            			id="solution_content" placeholder="의견을 제시해주세요" required>
				            		<button id="insertBtn" class="btn btn-primary btn-lg btn-block" type="button">등록</button>
				            	</div>
				            	
						   	</form>
						  </div>
				          <div class="mb-4"></div>
				          
				         
				      </div>
           		</div>
         	</div>
         	<div class="card mb-4 pb-3">
           		<div class="card-body">
           			<div class="input-form col-md-12 mx-auto">
				        <h4 class="text-primary ">대응전략</h4>
				        <div style="display:flex; justify-content: flex-end;">
				        	<input id="applyBtn" type="button" class="btn btn-primary" value="등록">
				        </div>
				        <c:if test="${not empty strategy }">
				        <div style="display:flex; justify-content: space-between;">
				        		<input type="button" id="risk_strategy" value="${strategy.risk_strategy }" class="btn btn-outline-primary">
				        		
				        	</div>
				        </c:if>

				        	
				        	
							<br/><span>자세히 보기</span>
				    </div>
           		</div>
         	</div>
            </div>
            <!-- / Content -->

	

           
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
   
 

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="${path }/resources/sneat-1.0.0/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="${path }/resources/sneat-1.0.0/assets/vendor/libs/popper/popper.js"></script>
    <script src="${path }/resources/sneat-1.0.0/assets/vendor/js/bootstrap.js"></script>
    <script src="${path }/resources/sneat-1.0.0/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="${path }/resources/sneat-1.0.0/assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->

    <!-- Main JS -->
    <script src="${path }/resources/sneat-1.0.0/assets/js/main.js"></script>

    <!-- Page JS -->

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    <script type="text/javascript">
    $("#applyBtn").click(function(){
		location.href = "${path}/strategyForm.do?riskno="+${param.riskno}+"&prjno="+${param.prjno}
	})
	$("#risk_strategy").click(function(){
		location.href="${path}/pagingCare.do?riskno="+${param.riskno}+"&prjno="+${param.prjno}+"&strategyno="+${strategy.strategyno}
	})
    </script>
  </body>
</body>
</html>