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
<title>업무</title>

<style>
.card.mb-4{
	padding-left: 3rem !important;
	padding-right: 3rem !important;
}
.divs{
	display: flex;
	justify-content: space-between;
}
.nav-item.nav-link{
	padding-right: 1rem !important;
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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
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
		$("#back").click(function(){
			location.href="${path}/workGanttDetail.do?no="+$("[name=ganttid]").val();
		})
		$("#upt").click(function(){
			if(confirm("등록 하시겠습니까?")){
				if($("[name=progress]").val()==""){
					alert("진행률을 입력하세요.")
					$("[name=progress]").focus()
					return
				}
				if($("[name=description]").val()==""){
					alert("내용을 입력하세요.")
					$("[name=description]").focus()
					return
				}
				$("[name=progress]").val($("[name=progress]").val()/100);
  				$("#frm01").submit();
			}
		})
		var id="${ganttDetail.id}"
		var prjno="${ganttDetail.prjno}"
		var projectName = "${projectInfo.subject}"
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
 
           
           
           <div class="card mb-4 pb-3">


           <div class="demo-inline-spacing mt-1">
 			<form enctype="multipart/form-data" id="frm01" action="${path}/workUpt.do" method="post">
                <div class="divs">
                <div class="mb-3" style="width:32%;">
                   <label class="form-label" for="basic-default-prj">프로젝트명</label>
                   <input type="text" name="prjname"
                   class="form-control" id="basic-default-prj" value="${projectInfo.subject}" disabled readonly />
                   <input type="hidden" name="tlid" value="${projectInfo.tlid}">  
                   <input type="hidden" name="prjno" value="${ganttDetail.prjno}">
                 </div>
                 <div class="mb-3" style="width:32%;">
                  <label class="form-label" for="basic-default-subject">상위 업무</label>
					<input type="text" name="subject" class="form-control" id="basic-default-subject" value="${parent.text}" disabled readonly>
                </div>
                <div class="mb-3" style="width:32%;">
                  <label class="form-label" for="basic-default-subject">업무명</label>
                  <input name="subject" type="text" class="form-control" id="basic-default-subject" value="${ganttDetail.text}"
                  disabled readonly/>
                  <input type="hidden" name="id" value="${ganttDetail.id}">
                </div>
                </div>
                <div class="divs">
                 <div class="mb-3" style="width:24%;">
                   <label class="form-label" for="basic-default-id">담당자</label>
                   <input type="text" name="owner"
                   class="form-control" id="basic-default-id" value="${ganttDetail.owner}" disabled readonly />
                   <input type="hidden" name="owner" value="${personInfo.id}"> 
                 </div>
                 <div class="mb-3" style="width:24%;">
                  <label class="form-label">시작일자</label>
                  <input type="text" class="form-control" name="regdte" value="${ganttDetail.start_date}"
                  disabled readonly>
                  </div>
                  <div class="mb-3" style="width:24%;">
                  <label class="form-label">종료일자</label>
                  <input type="text" class="form-control" name="enddte" value="${ganttDetail.end_date }"
                  disabled readonly>        
               	  </div>
               	  <div class="mb-3" style="width:24%;">
                  <label class="form-label">진행률</label>
                  <div class="input-group mb-3">
                  <input type="text" class="form-control" name="progress"
                  value="<fmt:formatNumber value='${ganttDetail.progress*100}' pattern="0"/>">
               	  </div>
               	  </div>
                </div>
                <div class="mb-3">
                  <label class="form-label" for="basic-default-cont">내용</label>
                  <textarea
                  	name="description"
                    id="basic-default-cont"
                    class="form-control"
                    style="height: 300px;"
                  >${ganttDetail.description}</textarea>
                </div>
          <div class="row mt-3">
	          <div class="col-lg-6 col-sm12 text-lg-start text-sm-start">
	          </div>
             <div class="col-lg-6 col-sm12 text-lg-end text-sm-end">
	         	<button class="btn btn-primary" id="upt">수정</button>
	         	&nbsp;&nbsp;
	         	<button class="btn btn-secondary" id="back">취소</button>
	        </div>
	        </div>
              </form>
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