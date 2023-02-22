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
td, th{
	text-align: center;
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
		// $("#").addClass('active open');	
		// $("#").addClass('active');	
		// 메인 메뉴 아이디랑 하위 메뉴 아이디를 넣우세요.
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
 
           <h4 class="fw-bold py-3 mb-4">프로젝트 > <small class="text-muted">업무</small></h4>
           
           <div class="card mb-4 pb-3">
           <div class="demo-inline-spacing mt-5">
           <div class="row">
           <div class="col-3">
          <div class="list-group list-group-horizontal-md text-md-center">
            <a class="list-group-item list-group-item-action active" id="home-list-item" data-bs-toggle="list" href="#horizontal-home">진행중</a>
            <a class="list-group-item list-group-item-action" id="settings-list-item" data-bs-toggle="list" href="#horizontal-settings">종료</a>
          </div>
          </div>
          <div class="col-5"> </div>
          <div class="col-4">
            <!-- 검색어 입력하는 곳 -->
          <form class="d-flex" id="allFrm" action="${path }/allProject.do" method="get">
	          <div class="input-group">
	            <span class="input-group-text"><i class="tf-icons bx bx-search"></i></span>
	            <input type="text" name="keyword" value="${param.keyword }" class="form-control" placeholder="검색어를 입력하세요">
	          </div>
	       </form>
	       <!-- /form 끝 -->
          </div>
          </div>
          <div class="tab-content px-0 mt-0">
          <!--  진행중 프로젝트 tab -->
            <div class="tab-pane fade show active" id="horizontal-home">
             <div class="table-responsive text-nowrap">
			  <table class="table card-table" style="overflow: hidden;">
			  <col width="13%">
			  <col width="40%">
			  <col width="17%">
			  <col width="17%">
			  <col width="13%">
			    <thead>
			      <tr>
			        <th>번호</th>
			        <th>업무</th>
			        <th>등록일자</th>
			        <th>마감일자</th>
			        <th>작성자</th>
			        <th>진행상태</th>
			      </tr>
			    </thead>
			    <tbody class="table-border-bottom-0">
			      <c:forEach var="work" items="${worklist}">
			      <tr><td>${work.workno }</td><td>${work.subject }</td><td>${work.regdte }</td>
			      <td>${work.uptdte }</td><td>${work.id }</td><td>${work.state }</td></tr>
			      </c:forEach>
			    </tbody>
			  </table>
			</div>
            </div>
             <!--  /진행중 프로젝트 tab -->
              <!--  종료 프로젝트 tab -->
            <div class="tab-pane fade" id="horizontal-settings">
           <div class="table-responsive text-nowrap">
			  <table class="table card-table" style="overflow: hidden;">
			  <col width="13%">
			  <col width="40%">
			  <col width="17%">
			  <col width="17%">
			  <col width="13%">
			    <thead>
			      <tr>
			        <th>번호</th>
			        <th>업무</th>
			        <th>등록일자</th>
			        <th>마감일자</th>
			        <th>작성자</th>
			        <th>진행상태</th>
			      </tr>
			    </thead>
			    <tbody class="table-border-bottom-0">
			      <c:forEach var="work" items="${worklist}">
			      <tr><td>${work.workno }</td><td>${work.subject }</td><td>${work.regdte }</td>
			      <td>${work.enddte }</td><td>${work.id }</td><td>${work.state }</td></tr>
			      </c:forEach>
			    </tbody>
			  </table>
			</div>
           
            </div>
             <!--  /종료 프로젝트 tab -->
          </div>
        </div>
          <div class="d-flex justify-content-center">
          <!-- Basic Pagination -->
          <nav id="pagination" aria-label="Page navigation">
            <ul class="pagination">
              <li class="page-item prev">
                <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevron-left"></i></a>
              </li>
              <li class="page-item">
                <a class="page-link" href="javascript:void(0);">1</a>
              </li>
              <li class="page-item">
                <a class="page-link" href="javascript:void(0);">2</a>
              </li>
              <li class="page-item active">
                <a class="page-link" href="javascript:void(0);">3</a>
              </li>
              <li class="page-item next">
                <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevron-right"></i></a>
              </li>
            </ul>
          </nav>
          <!--/ Basic Pagination -->
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