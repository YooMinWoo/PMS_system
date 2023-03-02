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
		$("#uptBtn").click(function(){			
			if(confirm("수정하시겠습니까?")){
				$("form").attr("action","${path}/project_riskUpdate.do");
				$("form").submit();
			}
		})
		$("#goMain").click(function(){
			location.href="${path}/project_riskList.do"			
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
 
           <h4 class="fw-bold py-3 mb-4">프로젝트 > <small class="text-muted">리스크 관리</small></h4>
           
           <div class="card mb-4 pb-3">
           		<div class="card-body">
           			<div class="input-form col-md-12 mx-auto">
				        <h4 class="mb-3">리스크 상세</h4>
				        <form method="post" class="validation-form" novalidate>
				          <div class="row">
				            <div class="col-md-6 mb-3">
				              <label for="riskno">리스크번호</label>
				              <input type="text" name="riskno" class="form-control" id="riskno" 
				              		value="${risk.riskno}" readonly required>
				              <div class="invalid-feedback">
				                입력해주세요.
				              </div>
				            </div>
				          </div>  
				          <div class="mb-3">
				            <label for="subject">제목</label>
				            <input name="riskname" value="${risk.riskname}" type="text" class="form-control  ckValid" id="riskname" placeholder="제목 입력" required>
				            <div class="invalid-feedback">
				              제목을 입력해주세요.
					           </div>
						  </div>
				          <div class="row">      
					          <div class="col-md-6 mb-3">
					            <label for="risklevel">긴급도</label>
					            <input type="text" name="risklevel"  	
					            	 value="${risk.risklevel}"  class="form-control ckValid" id="risklevel" placeholder="작성자를 입력" required>
					            <div class="invalid-feedback">
					              작성자를 입력해주세요.
					            </div>
					          </div> 
					          <div class="col-md-6 mb-3">
					            <label for="riskpriority">우선도</label>
					            <input type="text" name="riskpriority"
					            	 value="${risk.riskpriority}"  class="form-control ckValid" id="riskpriority"  required>
					            <div class="invalid-feedback">
					              입력해주세요.
					            </div>
					          </div> 	          
				          </div> 
				          <div class="row">
				            <div class="col-md-6 mb-3">
				              <label for="riskmoniter" >모니터링 </label>
				              <input type="text" name="riskmoniter"  class="form-control" 
				              		value="${risk.riskmoniter }" id="riskmoniter" >
				              <div class="invalid-feedback">
				                입력해주세요.
				              </div>
				            </div>
				            <div class="col-md-6 mb-3">
				              <label for="riskstate" >리스크상태</label>
				              <input type="text" name="riskstate"  class="form-control" 
				              		value="${risk.riskstate }" id="riskstate" >
				              <div class="invalid-feedback">
				                입력해주세요.
				              </div>
				            </div>
				          </div> 
				        
<%-- 				          <div class="mb-3">
				            <label for="content">내용</label>
				            <textarea name="content"  class="form-control  ckValid" id="content" placeholder="내용 입력" required rows="5" >${board.content}</textarea>
				            <div class="invalid-feedback">
				              내용를 입력해주세요.
				            </div>
				          </div>  --%>     
				          
				          <div class="mb-4"></div>
				          <button id="uptBtn" class="btn btn-warning btn-lg btn-block" type="button">리스크 수정</button>
				          <button id="goMain" class="btn btn-info   btn-lg btn-block" type="button">조회 화면</button>
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