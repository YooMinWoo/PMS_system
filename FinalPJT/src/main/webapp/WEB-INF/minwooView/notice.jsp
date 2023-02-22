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
<!-- 
th{
	font-size: 15px !important;
	font-weight: bolder !important;
	text-align: center !important;
	color:white !important;
}
tbody td{
	text-align: center;
	color:black !important;
}
.input-group{
	width:30% !important;
}
tbody tr{
	cursor:pointer;
}
.card.mb-4{
	padding-left: 3rem !important;
	padding-right: 3rem !important;
}
.schDiv{
	display: flex;
    justify-content: flex-end;
    padding-top: 20px;
    padding-bottom: 10px;
}
-->
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
		$("[name=schInfo]").keydown(function(e){
			if(e.keyCode==13){
				if($("[name=schInfo]").val().length<=1) alert("2자 이상 입력하세요.")
				else alert("검색한 내용 : "+$("[name=schInfo]").val())
			}
		})
		$("tbody tr").click(function(){
			location.href="/FinalPJT/goNoticeDetail.do"
		})
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
 
           <h4 class="fw-bold py-3 mb-4">공지사항</h4>
           <div class="card mb-4 pb-3">
           <form>
           		<div class="schDiv">
		           <div class="input-group input-group-merge">
		              <span class="input-group-text" id="basic-addon-search31"><i class="bx bx-search"></i></span>
		              <input
		                type="text"
		                class="form-control"
		                placeholder="Search..."
		                aria-label="Search..."
		                aria-describedby="basic-addon-search31"
		                value=""
		                name="schInfo"
		              />
		            </div>
            	</div>
            </form>
           <table class="table">
           	<col width="7%">
			  <col width="20%">
			  <col width="13%">
			  <col width="10%">
			  <col width="20%">
			  <col width="20%">
			  <col width="10%">
                    <thead class="table-dark">
	                      <tr>
	                        <th>No</th>
	                        <th>제목</th>
	                        <th>작성자</th>
	                        <th>조회수</th>
	                        <th>작성일자</th>
	                        <th>수정일자</th>
	                        <th>카테고리</th>
	                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                      
                      	<c:forEach var="nt" items="${noticeList}">
	                      	<tr>
		                      	<td>${nt.rownum}</td>
		                        <td>${nt.title}</td>
		                        <td>${nt.writer}</td>
		                        <td>${nt.viewcnt}</td>
		                        <td>${nt.regdte}</td>
		                        <td>${nt.uptdte}</td>
		                        <td>${nt.deptid}</td>
	                        </tr>
                      	</c:forEach>
                        
                      
                    </tbody>
                  </table>
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