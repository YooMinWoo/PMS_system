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
	td{text-align:center;}
	tbody td{
		text-align: center;
		color:black !important;
	}
	th{
		font-size: 15px !important;
		font-weight: bolder !important;
		text-align: center !important;
		color:white !important;
	}
	.buttons{
		display: flex;
		justify-content: flex-end;
		gap: 20px;
		margin-top: 45px;
		margin-right:20px;
	}
	.content-top{
   		display: flex;
		justify-content: space-between;
   	}
   	.search{
   		width:20%;
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
		<%-- 
		
		--%>	
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
            		<div>
            			<h5 class="display-6 mb-0" style="font-weight:900">드라이브</h5>
            		</div>
            		<div class="card mb-4 pb-3">
	                <div class="buttons">
	            		<button name="" type="button" class="btn btn-primary">폴더생성</button>
		             	<button name="upload" type="button" class="btn btn-primary">파일업로드</button>
		             	<div style="display: none;">
		             		<input class="form-control" type="file" id="formFile">
		             	</div>
		             	
		             	<!-- 삭제 버튼은 상세조회에 만들까 생각중 -->
		             	<button name="" type="button" class="btn btn-danger">삭제</button>
		             	<button name="" type="button" class="btn btn-secondary">파일이동</button>
            		</div>
            		<table class="table">
           	  <col width="10%">
           	  <col width="10%">
           	  <col width="40%">
			  <col width="40%">
                    <thead class="table-dark">
	                      <tr>
	                        <th>No</th>
	                        <th>구분</th>
	                        <th>파일명</th>
	                        <th>업로드일자</th>
	                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                      <c:forEach var="dt" items="${driveList}">
	                      	<tr>	                      	
		                      	<td>${dt.cnt}</td>
		                      	<c:if test="${!dt.fname.contains('.') }">
		                      		<td>폴더</td>
		                      	</c:if>
		                      	<c:if test="${dt.fname.contains('.') }">
		                      		<td>파일</td>
		                      	</c:if>
		                        <td>${dt.fname}</td>
		                        <td>${dt.regdte}</td>
	                        </tr>
                      	</c:forEach>
                    </tbody>
                  </table>
           		</div>
            </div>
        </div>
            <script>
	            $(document).ready(function(){
	        		$("[name=upload]").click(function(){
	        			$("#formFile").click()
	        		})
	        	});
            </script>
            <!-- / Content -->

         

            <div class="content-backdrop fade"></div>
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