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
input:read-only{
	background:white !important;
}
textarea:read-only{
	background:white !important;
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
		
		$("#toList").click(function(){
			location.href="${path}/workGanttList.do?prjno="+$("[name=prjno]").val();
		})
		$("#toApprv").click(function(){
			location.href="${path}/apprvList.do?prjno="+$("[name=prjno]").val();
		})
		$("#upt").click(function(){
			location.href="${path}/workUptFrm.do?no="+$("[name=ganttid]").val();	
		})
		$("#del").click(function(){
			if('${sessmem.id}' == '${projectInfo.tlid}'){
				if(confirm("삭제하시겠습니까?")){
					location.href="${path}/workDel.do?no="+$("[name=ganttid]").val();
				}
			}else{
				alert("권한이 없습니다. 해당 프로젝트 pm만 가능합니다.")
			}
		})
		$("#goUpper").click(function(){
			if($(this).val()==""){
				alert("등록된 상위 업무가 없습니다.")	
			}else{
				location.href="${path}/workGanttDetail.do?no="+$(this).val()
			}
		})
		$("#downFile").click(function(){
	  		if(confirm("다운로드하시겠습니까?")){
	  			location.href="${path}/downWorkFile.do?fno="+$(this).val()
	  		}
	  		
	  	})
	  	$("#regRep").click(function(){
	  		if(confirm("등록 하시겠습니까?")){
				if($("[name=repCont]").val()==""){
					alert("내용을 입력하세요.")
					$("[name=repCont]").focus()
					return
				}
				$("#frm02").submit();
			}
		})
	  	$("#uptProcess").click(function(){
	  		if(confirm("진행률을 저장하시겠습니까?")){
	  			$("[name=progress]").val($("[name=progress]").val()/100);
	  			$("#frmModal").submit();
	  		}
		})
		// 결재 요청
		$("#req").click(function(){
			if($("[name=prog]").val()=="100%"){
				location.href="${path}/reqApprove.do?no="+$("[name=ganttid]").val();	
			}else{
				alert("진행률이 100%가 아닙니다.")
			}
		})
		// 결재 승인
		$("#apprv").click(function(){
			location.href="${path}/rejApprove.do?no="+$("[name=ganttid]").val();
		})
		// 결재 반려
		$("#rej").click(function(){
			location.href="${path}/approve.do?no="+$("[name=ganttid]").val();
		})
		// 캘린더 저장
		var id="${ganttDetail.id}"
		var prjno="${ganttDetail.prjno}"
		var projectName = "${projectInfo.subject}"
		$("#callendarBtn").click(function(){
			let writer="${sessmem.id}" // 세션에 있는 아이디
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
	});
	var msg = "${msg}"
	if(msg=="삭제완료"){
		alert(msg+" 이전화면으로 이동합니다.");
		location.href = "${path}/workList.do";
	}
	function delRep(no,workno,id){
		if(id=="${sessmem.id}"){
			if(confirm("삭제하시겠습니까?")){
				location.href="${path}/workRepDel.do?no="+no;		
				location.href="${path}/workGanttDetail.do?no="+workno;		
			}
		}else{
			alert("작성자만 가능합니다.")
		}
	}
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
            <div class="row mt-3">
           </div>

           <div class="demo-inline-spacing mt-1">
 			<form enctype="multipart/form-data" action="${path}/workIns.do" method="post">
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
                  <div class="input-group mb-3">
					<input type="text" name="subject" class="form-control" id="basic-default-subject" value="${parent.text}" disabled readonly>
					<div class="input-group-prepend">
						<button class="btn btn-outline-secondary" type="button" id="goUpper" value="${parent.id}">
							<i class="bi bi-arrow-up-right"></i>
    					</button>
   					</div>
					</div> 
                </div>
                <div class="mb-3" style="width:32%;">
                  <label class="form-label" for="basic-default-subject">업무명</label>
                  <input name="subject" type="text" class="form-control" id="basic-default-subject" value="${ganttDetail.text}"
                  disabled readonly/>
                  <input type="hidden" name="ganttid" value="${ganttDetail.id}">
                </div>
                </div>
                <div class="divs">
                 <div class="mb-3" style="width:24%;">
                   <label class="form-label" for="basic-default-id">담당자</label>
                   <input type="text" name="id"
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
                  <input type="text" class="form-control" name="prog"
                  value="<fmt:formatNumber value='${ganttDetail.progress }' type='percent'/>">
               	  </div>
               	  </div>
                </div>
                <div class="mb-3">
                  <label class="form-label" for="basic-default-cont">내용</label>
                  <textarea
                  	name="cont"
                    id="basic-default-cont"
                    class="form-control"
                    style="height: 300px;"
                  >${ganttDetail.description}</textarea>
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