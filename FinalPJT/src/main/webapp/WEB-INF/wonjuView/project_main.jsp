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
.nav-item.nav-link{
	padding-right: 1rem !important;
}
#gantt{
	height: 400px;
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
		$("#menu-item-project").addClass('active open');	
		$("#menu-item-project-myproject").addClass('active');	
		var prjno=55

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
 
         <!--   <h4 class="fw-bold py-3 mb-4">프로젝트 > <small class="text-muted">프로젝트 이름</small></h4> -->
           
           <div class="card mb-4 pb-3">
	           <div class="row">
		           <div class="col-8">
		           <h3 class="fw-bold py-3 mt-4 pt-3">프로젝트 이름</h3>
		           </div>
		           <div class="col-4 py-3 mt-4 mb-4 d-flex justify-content-end">
		            <button type="button" class="btn btn-sm btn-primary">멤버초대</button>&nbsp;&nbsp;&nbsp;
		            <button type="button" class="btn btn-sm btn-secondary">설정</button>
		           </div>
	           </div>

		        <div class="nav navbar-nav me-auto d-flex flex-row">
		          <a class="nav-item nav-link active" href="javascript:void(0)">진행상황</a>
		          <a class="nav-item nav-link" >|</a>
		          <a class="nav-item nav-link" href="javascript:void(0)">업무</a>
		          <a class="nav-item nav-link">|</a>
		          <a class="nav-item nav-link" href="javascript:void(0)">드라이브</a>
		          <a class="nav-item nav-link">|</a>
		          <a class="nav-item nav-link" href="javascript:void(0)">리스크 관리</a>
		        </div>
				
				<hr class="mx-0">
	         
	          <div class="row my-3 px-sm-3">
	            <span><strong>마감 D-27&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;진행률 0%</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	             진행 0, 완료 0</span>
	          </div>
	          
			<div id="gantt" class="row my-3 px-sm-3">
		    <jsp:include page="/gantt.jsp"></jsp:include>
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