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
		$("#back").click(function(){
			location.href="${path}/worklist.do"
		})
		$("#upt").click(function(){
			location.href="${path}/workUptFrm.do?no="+$("[name=workno]").val();	
		})
		$("#del").click(function(){
			if(confirm("삭제하시겠습니까?")){
				location.href="${path}/delWork.do?no="+$("[name=workno]").val();		
			}
		})
		$("#downFile").click(function(){
	  		if(confirm($(this).val()+"을 다운로드하시겠습니까?")){
	  			location.href="${path}/download.do?fname="+$(this).val()
	  		}
	  		
	  	})
	});
	var msg = "${msg}"
	if(msg=="삭제완료"){
		alert(msg+" 이전화면으로 이동합니다.");
		location.href = "${path}/worklist.do";
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
 
           <h4 class="fw-bold py-3 mb-4">프로젝트 > <small class="text-muted">업무 상세</small></h4>
           
           <div class="card mb-4 pb-3">
            <div class="row mt-3">
            	<div class="col-lg-6 col-sm12 text-lg-start text-sm-start">
             		<button type="button" class="btn" id="back">뒤로<!-- <img src="/resources/sneat-1.0.0/assets/img/etc/arrow-left.svg"> --></button>
             	</div>
             	<div class="col-lg-6 col-sm12 text-lg-end text-sm-end">
            		<button type="button" id="more" class="btn dropdown-toggle" 
            			data-bs-toggle="dropdown" aria-expanded="false">more<!-- <img src="/resources/sneat-1.0.0/assets/img/etc/more-horizontal.svg"> --></button>
            		<ul class="dropdown-menu">
				    <li><a class="dropdown-item" id="upt">수정</a></li>
				    <li><a class="dropdown-item" id="del">삭제</a></li>
				  </ul>
            	</div> 
           </div>
           <div class="demo-inline-spacing mt-1">
 			<form enctype="multipart/form-data" action="${path}/workIns.do" method="post">
                <div class="divs">
                <div class="mb-3" style="width:49%;">
                   <label class="form-label" for="basic-default-prj">프로젝트명</label>
                   <!-- 프로젝트명으로 수정필요 -->
                   <input type="text" name="prjno"
                   class="form-control-plaintext" id="basic-default-prj" value="1" disabled readonly />
                 </div>
                <div class="mb-3" style="width:49%;">
                  <label class="form-label" for="basic-default-subject">업무명</label>
                  <input name="subject" type="text" class="form-control-plaintext" id="basic-default-subject" value="${work.subject}"
                  disabled readonly/>
                  <input name="workno" type="hidden" value="${work.workno}"/>
                </div>
                </div>
                <div class="divs">
                 <div class="mb-3" style="width:32%;">
                   <label class="form-label" for="basic-default-id">작성자</label>
                   <!-- 작성자로 수정필요 -->
                   <input type="text" name="id"
                   class="form-control-plaintext" id="basic-default-id" value="monsta@gmail.com" disabled readonly />
                 </div>
                 <div class="mb-3" style="width:32%;">
                  <label class="form-label">등록일</label>
                  <input type="text" class="form-control-plaintext" name="regdte" value="${work.regdte}"
                  disabled readonly>
                  </div>
                  <div class="mb-3" style="width:32%;">
                  <label class="form-label">만기일</label>
                  <input type="text" class="form-control-plaintext" name="enddte" value="${work.enddte}"
                  disabled readonly>        
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
                    class="form-control-plaintext"
                    style="height: 300px;"
                    disabled readonly
                  >${work.cont}</textarea>
                </div>
                <div class="mb-3">
                 <label>첨부파일</label>
                 <input id="downFile"  value="${work.fno}" type="text" class="form-control" placeholder="첨부 입력" required>
                </div>
                <div class="mb-3">
                 <label for="formFile" class="form-label">${empty work.fname?'첨부 파일을 선택하세요':'수정시 선택'}</label>
                 <input type="file" name="report" class="custom-file-input" id="formFile" />
                </div>
                <script type="text/javascript">
					  $(".custom-file-input").on("change",function(){
				        	$(this).next(".custom-file-label").text($(this).val())
				        })  
				  </script>	
              </form>
          </div>
          <hr>
          	<div class="card-body">
          		<form id="frm02" method="post">
             		<input type="hidden" name="noticeno" value="${noticeDetail.noticeno }">
               		<input type="hidden" name="writer" value="${emp.id }">
              	<label for="repContent" class="form-label">답글 작성</label>
              	<div class="repList2">
                   <textarea class="form-control" name="content" id="repContent" rows="3" style="height:50px;"></textarea>
                   <button type="button" class="btn btn-secondary" id="regRepBtn">등록</button>
                  </div>
                  <hr>
                  <br><br>
                 </form>
          	</div>
          	 <c:forEach var="rep" items="${workrep}" varStatus="status">
               
                  <div class="repList">
                  "${rep.id}"
                  "${rep.regdte}"
                   <textarea name="content" id="reps" class="form-control-plaintext" rows="3" style="height:50px;" disabled readonly>${rep.cont } </textarea>


                  
                     </div>
                     <br>
 
               </c:forEach>
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