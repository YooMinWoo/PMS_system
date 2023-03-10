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
<title>업무 등록</title>

<style>
.card.mb-4{
	padding-left: 3rem !important;
	padding-right: 3rem !important;
}
.divs{
	display: flex;
	justify-content: space-between;
}
.btns{
	display: flex;
	justify-content: flex-end;
	gap:20px;
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
		$("#clBtn").click(function(){
			if(confirm("업무페이지로 이동하시겠습니까?")){
				location.href="${path}/workList.do"
			}
		})
		$("#regBtn").click(function(){
			if(confirm("등록 하시겠습니까?")){
				if($("[name=subject]").val()==""){
					alert("제목을 입력하세요.")
					$("[name=subject]").focus()
					return
				}
				if($("[name=reg]").val()==""){
					alert("등록일을 입력하세요.")
					$("[name=reg]").focus()
					return
				}
				if($("[name=end]").val()==""){
					alert("만기일을 입력하세요.")
					$("[name=end]").focus()
					return
				}
				if($("[name=cont]").val()==""){
					alert("내용을 입력하세요.")
					$("[name=cont]").focus()
					return
				}
				$("form").submit();
				alert("등록완료")
				//location.href="${path}/worklist.do"
			}
		})
		$(".custom-file-input").on("change",function(){
        	$(this).next(".custom-file-label").text($(this).val())
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
 
           <h4 class="fw-bold py-3 mb-4">프로젝트 > <small class="text-muted">업무 등록</small></h4>
           
           <div class="card mb-4 pb-3">
           <div class="demo-inline-spacing mt-5">
 			<form enctype="multipart/form-data" action="${path}/workIns.do" method="post">
                <div class="divs">
                <div class="mb-3" style="width:49%;">
                   <label class="form-label" for="basic-default-prj">프로젝트명</label>
                   <!-- 프로젝트명으로 수정필요 -->
                   <input type="text" name="prjno"
                   class="form-control" id="basic-default-prj" value="23" readonly />
                 </div>
                <div class="mb-3" style="width:49%;">
                  <label class="form-label" for="basic-default-subject">업무명</label>
                  <input name="subject" type="text" class="form-control" id="basic-default-subject" placeholder="업무명을 입력하세요." />
                </div>
                </div>
                <div class="divs">
                 <div class="mb-3" style="width:32%;">
                   <label class="form-label" for="basic-default-id">작성자</label>
                   <!-- 작성자로 수정필요 -->
                   <input type="text" name="id"
                   class="form-control" id="basic-default-id" value="monsta@gmail.com" readonly />
                 </div>
                 <div class="mb-3" style="width:32%;">
                  <label class="form-label">등록일</label>
                  <input type="date" class="form-control" name="regdte">
                  </div>
                  <div class="mb-3" style="width:32%;">
                  <label class="form-label">만기일</label>
                  <input type="date" class="form-control" name="enddte">        
                </div>
                </div>
                <!-- 
                <div class="divs">
                <div class="mb-3" style="width:49%;">
                   <label class="form-label" for="basic-default-writer">담당자</label>
                   <input type="text" name="writer"
                   class="form-control" id="basic-default-writer" />
                 </div>
                <div class="mb-3" style="width:49%;">
                  <label class="form-label" for="basic-default-title">참조</label>
                  <input name="title" type="text" class="form-control" id="basic-default-title"/>
                </div>
                </div>
                 -->
                <div class="mb-3">
                  <label class="form-label" for="basic-default-cont">내용</label>
                  <textarea
                  	name="cont"
                    id="basic-default-cont"
                    class="form-control"
                    placeholder="내용을 입력하세요"
                    style="height: 300px;"
                  ></textarea>
                </div>
                <div class="mb-3">
                 <label for="formFile" class="custom-file-label">파일첨부</label>
                 <input type="file" name="report" class="form-control" id="formFile" />
                </div>
                <div class="btns">
                	<button type="button" class="btn btn-primary" id="regBtn">등록</button>
                	<button type="button" class="btn btn-secondary" id="clBtn">취소</button>
                </div>
              </form>
          </div>
          </div>
          <div class="tab-content px-0 mt-0">

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