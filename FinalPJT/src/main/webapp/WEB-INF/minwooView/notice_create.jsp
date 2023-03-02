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

-->
.card{
	width: 80%;
    margin: 0px auto;
}
.btns{
	display: flex;
	justify-content: flex-end;
	gap:20px;
}
.divs{
	display: flex;
	justify-content: space-between;
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
		$("#clBtn").click(function(){
			if(confirm("조회 화면으로 이동하시겠습니까?")){
				location.href="/FinalPJT/goNotice.do"
			}
		})
		$("#regBtn").click(function(){
			if(confirm("등록 하시겠습니까?")){
				console.log("제목 : "+$("[name=title]").val())
				console.log("작성자 : "+$("[name=writer]").val())
				console.log("내용 : "+$("[name=content]").val())
				console.log("카테고리 : "+$("[name=deptid]").val())
				if($("[name=title]").val()==""){
					alert("제목을 입력하세요.")
					$("[name=title]").focus()
					return
				}
				if($("[name=deptid]").val()=="X"){
					alert("카테고리를 선택해주세요.")
					return
				}
				if($("[name=content]").val()==""){
					alert("내용을 입력하세요.")
					$("[name=content]").focus()
					return
				}
				if($("[name=content]").val().length>500){
					alert("500자 이하로 입력하세요!")
					$("[name=content]").focus()
					return
				}
				$("form").submit();
			}
		})
		/*
		$("[name=report]").on("change",function(){
      		$(this).next("[name=report]").text($(this).val())
      	})
      	*/
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
 
           
           
	           
		       <h4 class="fw-bold py-3 mb-4">공지사항 > <small class="text-muted">등록</small></h4>
	           <div class="card">
           			<div class="card-body">
                      <form enctype="multipart/form-data" action="/FinalPJT/insertFN.do" method="post">
                        <div class="mb-3">
                          <label class="form-label" for="basic-default-title">제목</label>
                          <input name="title" type="text" class="form-control" id="basic-default-title" placeholder="제목을 입력하세요." />
                        </div>
                        <div class="divs">
	                        <div class="mb-3" style="width:45%;">
	                          <label class="form-label" for="basic-default-writer">작성자</label>
	                          <input type="text" name="writer"
	                          class="form-control" id="basic-default-writer" value="홍길동" readonly />
	                        </div>
	                        <div class="mb-3" style="width:45%;">
		                        <label for="deptid" class="form-label">카테고리 선택</label>
		                        <select name="deptid" id="deptid" class="form-select">
		                          <option value="X">카테고리 선택</option>
		                          <option>개발</option>
		                        </select>
		                      </div>
                        </div>
                        <div class="mb-3">
                          <label class="form-label" for="basic-default-message">내용</label>
                          <textarea
                          	name="content"
                            id="basic-default-message"
                            class="form-control"
                            placeholder="내용을 입력하세요"
                            style="height: 300px;"
                          ></textarea>
                        </div>
                        <div class="mb-3">
	                        <label for="formFile" class="form-label">파일첨부</label>
	                        <input type="file" name="report" class="form-control" id="formFile" />
                        </div>
                        <div class="btns">
                        	<button type="button" class="btn btn-primary" id="regBtn">등록</button>
                        	<button type="button" class="btn btn-secondary" id="clBtn">취소</button>
                        </div>
                      </form>
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