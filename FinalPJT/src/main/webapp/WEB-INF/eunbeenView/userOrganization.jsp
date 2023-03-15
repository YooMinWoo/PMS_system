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
<title>조직도</title>

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
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#menu-item-organization").addClass('active');
		$("[name=sename]").val("${ch.sename}");
		$("[name=dname]").val("${ch.dname}");
		
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
 
           <h4 class="fw-bold py-3 mb-4">조직도</h4>
           
           <div class="card mb-4 pb-3"><br>
           <div class="row">
			<div class="col" style="border-left:none;border-right:none;">
			<form id="frm01" method="post">
			<input type="hidden" name="curPage" value="${sch.curPage }">
				<div style="margin-top:15px;" class="row text-center">
					<div class="col">
						<span style="font-size:18px;font-weight:bold;">사원명 </span>
						<input name="sename" value="${ch.sename}" type="text" class="form-control" placeholder="사원명 입력">
					</div>
					<div class="col">
						<span style="font-size:18px;font-weight:bold;">부서명 </span>
						<input name="dname" value="${ch.dname}" type="text" class="form-control" placeholder="부서명 입력">
					</div>
				</div>
				<div style="margin-top:30px;margin-bottom:15px;" class="row text-center">
					<div class="col center">
						<button style="color:white;font-weight:bold;width:15%;height:50px;border-radius:5px;" type="submit" class="btn btn-primary">검색</button>
					</div>
				</div>
			</form>
			</div>
	</div>
           	<div style="font-size:20px;font-weight:bold;" class="table-responsive text-nowrap">
                <br>
                  <table class="table">
                    <thead>
                      <tr style="background-color:#646EFF;">
                        <th style="font-size:20px;font-weight:bold;text-align:center;color:white;">사원명</th>
                        <th style="font-size:20px;font-weight:bold;text-align:center;color:white;">직책</th>
                        <th style="font-size:20px;font-weight:bold;text-align:center;color:white;">소속부서</th>
                        <th style="font-size:20px;font-weight:bold;text-align:center;color:white;">이메일</th>
                        <th style="font-size:20px;font-weight:bold;text-align:center;color:white;">전화번호</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                    <c:forEach var="ed" items="${ulist}">
                      <tr>
                        <td style="text-align:center;">
                          ${ed.ename}
                        </td>
                        <td style="text-align:center;"><i class="fab fa-angular fa-lg text-danger me-3"></i>${ed.job}</td>      
                        <td style="text-align:center;"><i class="fab fa-angular fa-lg text-danger me-3"></i>${ed.dname}팀</td>                
                        <td style="text-align:center;"><i class="fab fa-angular fa-lg text-danger me-3"></i>${ed.id}</td>               
                        <td style="text-align:center;"><i class="fab fa-angular fa-lg text-danger me-3"></i>${ed.cell}</td>      
                      </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div><br>
           
         	</div>
         	  <!-- /card -->
            </div>
            <!-- / Content -->
	

           
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
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