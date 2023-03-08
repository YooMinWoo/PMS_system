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

		var id="${ganttDetail.id}"
		var prjno="${ganttDetail.prjno}"
		var projectName = "${projectInfo.subject}"
		var progress=parseInt("${ganttDetail.progress}"*100)
		$("[name=progressShow]").val(progress)
		// 저장 버튼
		$("#savBtn").click(function(){
			let inputProgress = $("[name=progressShow]").val()
			console.log(inputProgress)
			let check = /^(100|[1-9]?\d)$/;
			if (!check.test(inputProgress)) {
			    alert("입력 형식이 잘못되었습니다.")
			    focus($("[name=progressShow]"))
			}else{
				$("[name=progress]").val(inputProgress/100)
				var qstr="progress="+$("[name=progress]").val()+"&id="+id+"&description="+$("[name=description]").val()
				callAjax("${path}/uptProgress.do",qstr)
				
			}
		})
		// 취소버튼
		$("#canBtn").click(function(){
			location.href="${path}/projectMain.do?prjno="+prjno
		})
		// 캘린더 저장
		$("#callendarBtn").click(function(){
			let writer="monsta@gmail.com" // 세션에 있는 아이디
			let start="${ganttDetail.start_date}"
			let end = "${ganttDetail.end_date}"
			let textColor="#ffffff"
			let backgroundColor="#ffc300"
			let content = "${ganttDetail.description}"
			let title=projectName+"> ${ganttDetail.text}"
			
			var qstr="start="+start+"&end="+end+"&writer="+writer+"&textColor="+textColor+
				"&backgroundColor="+backgroundColor+"&allDay=1&content="+content+"&urllink="+"&title="+title
			console.log(qstr)
			callAjax("${path}/insertCalendar.do",qstr)		

		})
		
	})
	function callAjax(url,qstr){
		 $.ajax({
		    	url:url,
		    	type:"post",
		    	data:qstr,
		    	dataType:"json",
		    	success:function(data){
		    		alert("완료 되었습니다.")
		    		location.reload()
		    	},
		    	error:function(err){
		    		console.log(err)
		    	}
		    })
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
 
          
           <div class="card mb-4 pb-3">
	            <jsp:include page="/projectTop.jsp"></jsp:include>	
				<hr class="mx-0">
	        <div class="row my-3 px-sm-3 mt-5">
		    <div class="col my-3"><span><strong>상세 업무 내용</strong></span>
		    <p class="text-muted mt-2" style="font-size: 0.5rem;">
                ※ 진행률 수정시, 0 ~ 100사이의 정수형 숫자만 입력가능합니다
              </p>
		    </div>
		    </div> 
	        
	        <div class="mb-3 row px-sm-3">
		          <label for="html5-search-input" class="col-md-2 col-form-label">상위 업무</label>
		          <div class="col-md-6">
		            <input class="form-control" type="text" name="parentText" value="${ganttDetail.parentText}" id="html5-search-input" readonly>
		          </div>
		     </div>
		      <div class="mb-3 row px-sm-3">
		          <label for="html5-search-input" class="col-md-2 col-form-label">업무명</label>
		          <div class="col-md-6">
		            <input class="form-control" type="text" name="text" value="${ganttDetail.text}" id="html5-search-input" readonly>
		          </div>
		     </div>  
		      <div class="mb-3 row px-sm-3">
		          <label for="html5-search-input" class="col-md-2 col-form-label">담당자</label>
		          <div class="col-md-4">
		            <input class="form-control" type="text" name="owner" value="${ganttDetail.owner}" id="html5-search-input" readonly>
		          </div>
		          <label for="html5-search-input" class="col-md-2 col-form-label">진행률</label>
		          <div class="col-md-4 d-flex">
		          	<div>
		            <input class="form-control" type="text" name="progressShow" id="html5-search-input"></div>
		            <div class="mt-1"><span>%</span></div>
		            <input type="hidden" name="progress" value="${ganttDetail.progress}">
		          </div>
		     </div>
	          <div class="mb-3 row px-sm-3">
		          <label for="html5-search-input" class="col-md-2 col-form-label">시작일자</label>
		          <div class="col-md-4">
		            <input class="form-control" type="date" name="start_date" value="${ganttDetail.start_date}" id="html5-search-input" readonly>
		          </div>
		           <label for="html5-search-input" class="col-md-2 col-form-label">종료일자</label>
		          <div class="col-md-4">
		            <input class="form-control" type="date" name="end_date" value="${ganttDetail.end_date }" id="html5-search-input" readonly>
		          </div>
		     </div>
		     <div class="mb-3 row px-sm-3">
		          <label for="html5-search-input" class="col-md-2 col-form-label">업무내용</label>
		          <div class="col-md-12">
		            <textarea class="form-control" name="description" id="html5-search-input" rows="5">${ganttDetail.description}</textarea>
		          </div>
		     </div>    
			
			<div class="card-footer">
		        <div class="d-flex justify-content-center">
		        <button id="callendarBtn" type="button" class="btn btn-info">캘린더</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        <button id="savBtn" type="button" class="btn btn-primary">저장</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        <button id="canBtn" type="button" class="btn btn-secondary">취소</button>
		        </div>
		    </div>
			
          </div>
          <!-- card -->
          </div>
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