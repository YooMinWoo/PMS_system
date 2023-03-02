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
		
	});
	
	function alertState(no){
		location.href="${path}/alertState.do?no="+no
		location.reload()
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

        <!-- Layout container
       
         -->
        <div class="layout-page">
       
         <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
              <ul class="navbar-nav flex-row align-items-center ms-auto mx-5">
               <!-- alert -->
                <li class="nav-item navbar-dropdown dropdown-user dropdown mx-1">
                  <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
		           <i class="bx bx-bell bx-md"></i>
		           <c:if test="${alertCount>0 }">
		          <span class="badge badge-center rounded-pill bg-danger"
		          	style="margin-left: -17px;">${alertCount }</span>
		          	</c:if>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end">
                  	<li>
                        <span id="readAll" style="display: flex;
    						justify-content: flex-end;"	>모두 읽음</span>
                     </li>
                     <li>
                      <div class="dropdown-divider"></div>
                    </li>  
                 	 <li>
                     <span class="dropdown-item" >
                       <span class="align-middle">알림</span>
                     </span>
                     </li>
                     
                    <li>
                     <div class="card-body" >
                        <c:forEach var="alert" items="${alertList }"> 
		           		<div class="bs-toast toast fade show bg-${alert.style }" 
		           		role="alert" aria-live="assertive" aria-atomic="true" style="margin-top:30px; margin-left:17x;">
	                        <div class="toast-header">
	                          <i class="bx bx-bell me-2"></i>
	                          <div class="me-auto fw-semibold">${alert.title }</div>
	                          <small>${alert.state }</small>
	                          <button type="button" onclick="alertState('${alert.no }')" 
	                          	class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
	                        </div>
	                        
	                        <div class="toast-body">
	                          <a class="dropdown-item" href=" ${path }/${alert.url}">
	                         	 <span style="color:white;" onclick="alertState('${alert.no }')">${alert.content }</span>
	                          </a>
	                        </div>
	                    </div>
                      </c:forEach>
                       </div>
                    </li>
                   
                    
                  </ul>
                </li>
               <!-- /alert -->
                <!-- User -->
                <li class="nav-item navbar-dropdown dropdown-user dropdown mx-1"> 
                <span style="position:absolute; top:20px;left:4px; z-index: 3;font-size: 0.6rem;color:white;">홍길동</span>
                  <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                   <div class="avatar avatar-online">
                      <svg>
					  <circle cx="20" cy="20" r="20" fill="#0054a6" />
					</svg>
                   </div>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                      <a class="dropdown-item" href="#">
                        <i class="bx bx-user me-2"></i>
                        <span class="align-middle">My Profile</span>
                      </a>
                    </li>
                    <!-- 
                    <li>
                      <div class="dropdown-divider"></div>
                    </li>
                     -->
                    <li>
                      <a class="dropdown-item" href="auth-login-basic.html">
                        <i class="bx bx-power-off me-2"></i>
                        <span class="align-middle">Log Out</span>
                      </a>
                    </li>
                  </ul>
                </li>
                <!--/ User -->
              </ul>
            </div>
	
          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->
			
            <div class="container-xxl flex-grow-1 container-p-y">
 
           <h4 class="fw-bold py-3 mb-4">나의 업무 > <small class="text-muted">알림</small></h4>
           
           <div class="card mb-4 pb-3">
           	<c:forEach var="alert" items="${alertList }">
           		<div class="bs-toast toast fade show bg-${alert.style }" 
           		role="alert" aria-live="assertive" aria-atomic="true" style="margin-top:30px; margin-left:475px;">
                        <div class="toast-header">
                          <i class="bx bx-bell me-2"></i>
                          <div class="me-auto fw-semibold">${alert.title }</div>
                          <small>${alert.state }</small>
                          <button type="button" id="close" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                        </div>
                        <div class="toast-body">
                         ${alert.content }
                        </div>
                      </div>
                      </c:forEach>
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