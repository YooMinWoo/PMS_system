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
		

		if($("#risk_strategy").val()=="AVOIDANCE"){
			$("#strategy_description").text
			("심각한 위험의 경우 발생가능성을 원천적으로 제거하는 전략 ex) 프로젝트 중단, 사업 취소, 일정 연장, 자산매각, 설계변경 등 다른 대안을 선택하여 해당 위험이 실현되지 않도록 하는 것")
		}
		if($("#risk_strategy").val()=="TRANSFERENCE"){
			$("#strategy_description").text("위험조치에 대한 책임을 제3자에게 전가(Transference) 위험조치에 대한 책임을 넘기는 대신에 이에 상응하는 비 용 지불 ex) 보험가입, 워런티")
		}
		if($("#risk_strategy").val()=="MITIGATION"){
			$("#strategy_description").text("위험의 발생가능성이나 영향력을 감소시키는 전략 위험이 발생한 후에 영향력을 조치하는 것보다 효과적임 ex) 보안장비 추가, 테스트, Redundancy를 고려한 설계 등 화재진압 시스템, 방화벽 등을 통하여 위험 수준을 감소시 키는 것")
		}
		if($("#risk_strategy").val()=="ACCEPTANCE"){
			$("#strategy_description").text("비용 대비 효과를 고려하여 관련 위험을 그대로 수용하는 것 소극적 수용: 아무 조치를 취하지 않는 것 적극적 수용: 예비비 편성")
		}
		if($("#risk_strategy").val()=="EXPLOIT"){
			$("#strategy_description").text("기회가 확실히 일어날 수 있도록 함으로써, 특정 상위 리스크와 관련된 불확실성을 제거하는 것")
		}
		if($("#risk_strategy").val()=="SHARE"){
			$("#strategy_description").text("긍정적 리스크와 기회를 공유 ex) 회사 간 컨소시엄 구성, 조인트 벤처")
		}
		if($("#risk_strategy").val()=="ENHANCE"){
			$("#strategy_description").text("긍정적 영향을 미치는 리스크의 주요 원인을 식별하여 최대화함으로써 기회의 규모를 변경하는 것 ex) 보다 많은 자원 투입")
		}
		if($("#risk_strategy").val()=="ACCEPT"){
			$("#strategy_description").text("적극적으로 기회를 추구하는 활동을 수행하지 않음")
		}
	});
	function goPage(cnt){
		$("[name=curPage]").val(cnt);
		$("#form1").submit()
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
           		<div class="card-body">
           			<div class="input-form col-md-12 mx-auto">
				        <h4 class="text-primary">대응전략</h4>
				          <div class="row">
				            <div class="table-responsive">
				            <input type="button" id="risk_strategy" value="${strategy.risk_strategy }" class="btn btn-outline-primary">
				            <br/>
				            <br/>
				            <span class="text-success">설명</span><br/>
				            <span id="strategy_description"></span>
				            <form id="form1" class="d-flex"  method="post"> 			
								    <input type="hidden" name="curPage" value="${sch.curPage}"/>
								</form> 
				              <c:forEach var="care" items="${care}">
				              	<input type="hidden" value="${care.strategyno}">
   				                <div class="sol-content-header">
				                	<span class="text-info">${care.ename }</span>
				                	<span>${care.caredate }</span>
				                </div>
				              <div class="sol-content">
				                <input type="hidden" value="${care.careno }">
				                <span>${care.care_content }</span>      				       
				              </div>
				              </c:forEach>
				              <c:if test="${not empty care }">
				              <ul class="pagination  justify-content-end"> 
									<li class="page-item"><a class="page-link" 
										href="javascript:goPage(${sch.startBlock-1});">Previous</a></li>
								
									<c:forEach var="cnt" begin="${sch.startBlock}" 
											end="${sch.endBlock}">
								  		<li class="page-item ${sch.curPage==cnt?'active':''}">
								  		<a class="page-link" 
								  			href="javascript:goPage(${cnt});">${cnt}</a></li>
								  	</c:forEach>
								  	<li class="page-item"><a class="page-link" 
								  			href="javascript:goPage(${sch.endBlock+1});">Next</a></li>
								</ul>
				              </c:if>
				              
  								
							</div>
				          </div>  
 				          <div class="mb-3">
 				          <br/>
				          	<form method="post" id="form2" class="validation-form" novalidate>
				            	<label for="solution_content">의견</label>
				            	<input type="hidden" name="id" value="${emp.id }">
				            	<div class="sol_content_contain">
				            		<input name="care_content" type="text" class="form-control  ckValid" 
				            			id="care_content" placeholder="의견을 제시해주세요" required>
				            		<button id="insertBtn" class="btn btn-primary btn-lg btn-block" type="button">등록</button>
				            	</div>
				            	
						   	</form>
						   	<button id="goBack" class="btn btn-primary btn-lg btn-block" type="button">뒤로</button>
						  </div>
				          <div class="mb-4"></div>
				          
				         
				      </div>
           		</div>
         	</div>
         	  <!-- /card -->

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
    $("#goBack").click(function(){
		location.href="${path}/project_riskDetail.do?prjno="+${param.prjno}+"&riskno="+${strategy.riskno }
	});
    $("#insertBtn").click(function(){
    	var prjno="${param.prjno}"
    	var riskno="${param.riskno}"
		$("#form2").attr("action","${path}/insertCare.do?riskno="+riskno+"&prjno="+prjno+"&strategyno="+${strategy.strategyno});
	$("#form2").submit();
	})
    </script>
  </body>
</body>
</html>