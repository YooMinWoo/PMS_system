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
th{font-size: 0.9rem !important;font-weight: bolder !important;text-align: center !important;}
tbody td:nth-child(2){
	text-align: left !important;
}
tbody td{
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
		$("#menu-item-project").addClass('active open');	
		$("#menu-item-project-myproject").addClass('active');
		
		
		$("[name=keyword]").keyup(function(){
			if(event.keyCode==13){
				$("#myFrm").submit()
			}
		})
		$("#now-pro").click(function(){
			$("[name=isCon]").val("Y")
			$("[name=keyword]").val("")
			$("#myFrm").submit()
		})
		$("#fin-pro").click(function(){
			$("[name=isCon]").val("N")
			$("[name=keyword]").val("")
			$("#myFrm").submit()
		})
		
		$("#newBtn").click(function(){
			location.href="${path}/newProjectShow.do"
		})

	});
	function goProjectMain(prjno){
		location.href="${path}/projectMain.do?prjno="+prjno
	}
	function goPage(cnt){
		$("[name=curPage]").val(cnt);
		$("#myFrm").submit()
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
 
           <h4 class="fw-bold py-3 mb-4">프로젝트 > <small class="text-muted">내 프로젝트</small></h4>
           
           <div class="card mb-4 pb-3">
           <div class="demo-inline-spacing mt-5">
           <div class="row">
           <div class="col-3">
           	 <div class="btn-group" role="group" aria-label="Basic example">
              <button type="button" id="now-pro" class="btn btn-outline-secondary">진행중</button>
              <button type="button" id="fin-pro" class="btn btn-outline-secondary">종료</button>
             </div>
          </div>
          <div class="col-5"> </div>
          <div class="col-4">
          
          
          <!-- 검색어 입력하는 곳 -->
          <form class="d-flex" id="myFrm" action="${path }/myProject.do" method="post">
	          <div class="input-group">
	            <span class="input-group-text"><i class="tf-icons bx bx-search"></i></span>
	            <input type="hidden" name="isCon" value="${sch.isCon }">
	            <input type="hidden" name="curPage" value="${sch.curPage }">
	            <input type="text" name="keyword" value="${sch.keyword }" class="form-control" placeholder="검색어를 입력하세요">
	          </div>
	       </form>
	       <!-- /form 끝 -->
          </div>
          </div>
          <div class="d-flex justify-content-end">
          <button type="button" id="newBtn" class="btn btn-info"><small>새 프로젝트</small></button>
          </div>
          <div class="tab-content px-0 mt-0">
          <!--  프로젝트table -->
			  <table class="table card-table table-hover" style="overflow: hidden;">
			  <col width="13%">
			  <col width="35%">
			  <col width="10%">
			  <col width="15%">
			  <col width="27%">
			    <thead>
			      <tr>
			        <th>카테고리</th>
			        <th>프로젝트</th>
			        <th>멤버수</th>
			        <th>담당 파트</th>
			        <th>관리</th>
			      </tr>
			    </thead>
			    <tbody class="table-border-bottom-0">
			      <c:forEach var="myp" items="${list}">
			      <tr ondblclick="goProjectMain(${myp.prjno})">
			      <td>${myp.dname }</td><td>${myp.subject }</td><td>${myp.cnt }</td><td>${myp.part }</td>
			       <td>
			       <button type="button" class="btn btn-sm btn-secondary">나가기</button>
			       <button type="button" class="btn btn-sm btn-primary">설정</button>
			       </td>
			       </tr>
			      </c:forEach>
			    </tbody>
			  </table>
             <!--  / 프로젝트 table -->
           
          </div>
        </div>
          <div class="d-flex justify-content-center">
          <!-- Basic Pagination -->
          <nav id="pagination" aria-label="Page navigation">
            <ul class="pagination">
              <li class="page-item prev">
                <a class="page-link" href="javascript:goPage(${sch.startBlock-1 });"><i class="tf-icon bx bx-chevron-left"></i></a>
              </li>
               <c:forEach var="cnt" begin="${sch.startBlock }" end="${sch.endBlock }">
			  <li class="page-item ${sch.curPage==cnt?'active':'' }">
			  <a class="page-link" href="javascript:goPage(${cnt });">${cnt }</a></li>
			  </c:forEach>
              <li class="page-item next">
                <a class="page-link" href="javascript:goPage(${sch.endBlock+1 });"><i class="tf-icon bx bx-chevron-right"></i></a>
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