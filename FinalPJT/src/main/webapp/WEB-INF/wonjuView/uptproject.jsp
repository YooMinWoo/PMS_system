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
	padding-left: 15rem !important;
	padding-right: 15rem !important;
}
th{
	text-align: center !important;
}
tbody td{
	text-align: center;
	font-size: 0.8rem;
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
		$("#startDate").val(new Date().toISOString().substring(0, 10))
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
 
           <h4 class="fw-bold py-3 mb-4">프로젝트 > <small class="text-muted">프로젝트 설정</small></h4>
           
           <div class="card mb-4 pb-3">
    
		      <h5 class="card-header pt-5 fw-bold">프로젝트 설정</h5>
		      <p class="text-muted mb-3 px-4" style="font-size: 0.5rem;">
		      	※ 프로젝트 상세 내용을 변경할 수 있습니다.<br>
                ※ 전체 공개는 모두가 볼 수 있는 프로젝트이고, 멤버 공개는 초대된 멤버만 볼 수 있는 프로젝트입니다.
              </p>
		      <div class="card-body">
		       <!-- 등록 form  -->
		      <form>
		        <div class="mb-3 row">
		          <label for="html5-text-input" class="col-md-2 col-form-label">카테고리</label>
		          <div class="col-md-10">
			           <select id="html5-text-input" class="form-select">
			            <option>카테고리를 선택하세요</option>
			            <option value="1">One</option>
			            <option value="2">Two</option>
			            <option value="3">Three</option>
			          </select>
		          </div>
		        </div>
		        <div class="mb-3 row">
		          <label for="html5-search-input" class="col-md-2 col-form-label">프로젝트 명</label>
		          <div class="col-md-10">
		            <input class="form-control" type="text" value="" placeholder="프로젝트 이름을 입력하세요" id="html5-search-input">
		          </div>
		        </div>
		        <div class="mb-3 row">
		          <label for="html5-search-input" class="col-md-2 col-form-label">관리자</label>
		          <div class="col-md-10">
		            <input class="form-control" type="text" value="" placeholder="세션에 있는 pm의 이름" id="html5-search-input" readonly="readonly">
		          </div>
		        </div>
		         <div class="mb-3 row">
		          <label for="html5-search-input" class="col-md-2 col-form-label">시작 일자</label>
		          <div class="col-md-10">
		            <input class="form-control" id="startDate" type="date" value="" placeholder="프로젝트 생성을 한 오늘 날짜" id="html5-search-input" readonly="readonly">
		          </div>
		        </div>
		         <div class="mb-3 row">
		          <label for="html5-search-input" class="col-md-2 col-form-label">종료 일자</label>
		          <div class="col-md-10">
		            <input class="form-control" type="date" value="" placeholder="프로젝트 종료 일자를 입력하세요" id="html5-search-input">
		          </div>
		        </div>
		        <div class="mb-3 row">
		          <label for="html5-search-input" class="col-md-2 col-form-label">공개 여부</label>
		          <div class="col-md-10">
			          <div class="form-check form-check-inline">
			              <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1" checked="checked">
			              <label class="form-check-label" for="inlineRadio1">전체 공개</label>
			            </div>
		          	  <div class="form-check form-check-inline">
		                  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
		                  <label class="form-check-label" for="inlineRadio2">멤버 공개</label>
		               </div>
		          </div>
		        </div>
		        <hr class="my-sm-5">
		        <h5 class="card-header pt-5 fw-bold">참여 멤버</h5> 
		        <p class="text-muted mb-3 px-4" style="font-size: 0.5rem;">
                ※ 상태를 통해 초대 응답을 확인할 수 있습니다.<br>
              </p>
		        <div class="mb-3 row">
		        <div class="table-responsive text-nowrap">
				    <table class="table table-striped">
				    <col width="15%">
				    <col width="15%">
				    <col width="55%">
				    <col width="15%">
				      <thead>
				        <tr>
				          <th>부서명</th>
				          <th>이름</th>
				          <th>이메일</th>
				          <th>상태</th>
				        </tr>
				      </thead>
				      <tbody class="table-border-bottom-0">
				        <tr>
				        <td>마케팅</td><td>홍길동</td><td>wjekr@gmail.com</td><td>초대중</td>
				        </tr>
				        <tr>
				        <td>재무</td><td>홍설</td><td>eeesr@gmail.com</td><td>참여</td>
				        </tr>
				       
				      </tbody>
				    </table>
				  </div>
		        </div>
		        <div class="card-footer">
			        <div class="d-flex justify-content-center">
			        <button type="button" class="btn btn-primary">확인</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			        <button type="button" class="btn btn-secondary">취소</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			        <button type="button" class="btn btn-danger">삭제</button>
			        </div>
		        </div>
		        </form>
		        <!-- form 끝 -->
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