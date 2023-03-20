<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
		$("#insertBtn").click(function(){		
			console.log("11"+"${projectInfo.subject}")
			if(confirm("등록하시겠습니까?")){
				if($("#riskname").val()=="" || $("#risklevel").val()=="" ||
						$("#riskpriority").val()==""){
						if($("#riskname").val()=="" )alert("리스크 이름을 입력해주세요")
						if($("#risklevel").val()=="" )alert("리스크 심각도를 선택해주세요")
						if($("#riskpriority").val()=="" )alert("리스크 우선순위를 선택해주세요")
				}else{
					$("form").attr("action","${path}/project_insertRisk.do");
					$("form").submit();
				}

			}
		})
		$("#goMain").click(function(){
			location.href="${path}/project_pagingRisk.do?prjno="+${param.prjno}	
		});
		$("#selLan").val("${param.lang}")
		$("#selLan").change(function(){
			if($(this).val()!=""){
				$("[name=lang]").val($(this).val())
				console.log($("[name=lang]").val($(this).val()))
				$("form").submit();
			}
		});		
	});
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
           
           <h4 class="fw-bold py-3 mb-4"><spring:message code="project"/> > <small class="text-muted"><spring:message code="riskmanage"/></small></h4>
		  	
		  	<select class="form-control" id="selLan">
		  		<option value=""><spring:message code="chlang"/></option>
		  		<option value="ko"><spring:message code="ko"/></option>
		  		<option value="en"><spring:message code="en"/></option>
		  	</select>
           <div class="card mb-4 pb-3">
           		<div class="card-body">
           			<div class="input-form col-md-12 mx-auto">
				        <h4 class="text-primary"><spring:message code="riskregistration"/></h4>
				        <form method="post" class="validation-form" novalidate> 
				        <input type="hidden" name="lang" value=""/>
				          <div class="mb-3">
				            <label for="riskname"><spring:message code="riskname"/></label>
				            <input name="riskname"
				            type="text" class="form-control  ckValid" 
				            id="riskname" placeholder="<spring:message code="writetitle"/>" required>
						  </div>
				          <div class="row">      
					          <div class="col-md-6 mb-3">
					            <label for="risklevel"><spring:message code="risklevel"/></label>
					            <select class="form-control" name="risklevel" id="risklevel" required>
					            	<option value="" selected><spring:message code="choption"/></option>
					            	<option value="긴급"><spring:message code="emergency"/></option>
					            	<option value="보통"><spring:message code="common"/></option>
					            	<option value="낮음"><spring:message code="low"/></option>
					            </select>
					          </div> 
					          <div class="col-md-6 mb-3">
					            <label for="riskpriority"><spring:message code="riskpriority"/></label>
					            <select class="form-control" name="riskpriority" id="riskpriority" required>
					            	<option value="" selected><spring:message code="choption"/></option>
					            	<option value="1">1</option>
					            	<option value="2">2</option>
					            	<option value="3">3</option>
					            </select>
					          </div> 	          
				          </div> 
				          <div class="row">
				            <div class="col-md-6 mb-3">
				              <label for="riskmoniter" ><spring:message code="riskmoniter"/> </label>
				              <input type="text" name="riskmoniter"  class="form-control"
				              id="riskmoniter" placeholder="<spring:message code="writemoniter"/>">
				            </div>
				            <div class="col-md-6 mb-3">
				              <label for="riskstate" ><spring:message code="riskstate"/></label>
					            <select class="form-control" name="riskstate" id="riskstate" required>
					            	<option value="" selected><spring:message code="choption"/></option>
					            	<option value="발생" selected><spring:message code="generation"/></option>
					            	<option value="PM확인"><spring:message code="checkpm"/></option>
					            	<option value="처리중"><spring:message code="progress"/></option>
					            	<option value="해결"><spring:message code="solve"/></option>
					            </select>
				            </div>
				          </div>    
  				          
							<input type="hidden" id="id"  name="id" value="${emp.id}">
				          <div class="mb-4"></div>
				          <button id="insertBtn" class="btn btn-warning btn-lg btn-block" type="button"><spring:message code="regist"/></button>
				          <button id="goMain" class="btn btn-info   btn-lg btn-block" type="button"><spring:message code="main"/></button>
				        </form>
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
  </body>
</body>
</html>