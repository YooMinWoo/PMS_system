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
		
		$("#regBtn").click(function(){	
			var regdte = new Date($("[name=regdte]").val())
			var deadline = new Date($("[name=deadline]").val())
			/* console.log($("[name=deptid]").val())
			console.log($("[name=subject]").val())
			console.log($("[name=deadline]").val())
			console.log(regdte<deadline)
			 */
			 $("form").addClass('was-validated')
			if($("[name=deptid]").val()!=null && $("[name=subject]").val()!='' 
				&& $("[name=deadline]").val()!='' && regdte<deadline){
				insAjax()
			}else if(regdte<deadline){
				$("#deadCk").hide()
				$("[name=deadline]").css('border-color','');
			}else if(regdte>=deadline){
				$("#deadCk").show()
				$("[name=deadline]").css('border-color','#ff3e1d');
				$("#deadCk").text('종료일자는 시작일자보다 빠를수 없습니다')
			}
			
						
		})
		$("#canBtn").click(function(){
			location.href="" // 내 프로젝트 페이지로 이동
		})
		
		
		
	});

   function insAjax(){
	   $.ajax({
			url:"${path}/newProject.do",
			type:"post",
			data:$("form").serialize(),
			dataType:"json",
			success:function(data){
				console.log(data.msg)
				console.log(data.prjno)
				console.log(data)
				if(data.msg=='등록성공'){
					if(confirm("새로운 프로젝트로 이동하시겠습니까?")){
						location.href=""; // 만들어진 페이지로 이동 주소?prjno=prjno
					}else{
						location.reload()
					}
				}
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
 
           <h4 class="fw-bold py-3 mb-4">프로젝트 > <small class="text-muted">새로운 프로젝트</small></h4>
           
           <div class="card mb-4 pb-3">
    
		      <h5 class="card-header pt-5 fw-bold">프로젝트 등록</h5>
		      <p class="text-muted mb-3 px-4" style="font-size: 0.5rem;">
                ※ 항목을 채우고 등록 버튼을 눌러 새로운 프로젝트를 시작해보세요.<br>
                ※ 새로 등록한 프로젝트는 내 프로젝트에서 확인할 수 있습니다.<br>
                ※ 전체 공개는 모두가 볼 수 있는 프로젝트이고, 멤버 공개는 초대된 멤버만 볼 수 있는 프로젝트입니다.<br>
              </p>
		      <div class="card-body">
		       <!-- 등록 form  -->
		      <form class="needs-validation">
		        <div class="mb-3 row">
		          <label for="html5-text-input" class="col-md-2 col-form-label">카테고리</label>
		          <div class="col-md-10">
			           <select id="html5-text-input" class="form-select" name="deptid" required="required">
			            <option selected disabled value>카테고리를 선택하세요</option>
			            <option value="10">IT</option>
			            <option value="20">마케팅</option>
			            <option value="30">영업</option>
			          </select>
			          <div class="invalid-feedback">
					      카테고리를 선택해주세요
					  </div>
		          </div>
		        </div>
		        <div class="mb-3 row">
		          <label for="html5-search-input" class="col-md-2 col-form-label">프로젝트 명</label>
		          <div class="col-md-10">
		            <input class="form-control" type="text" name="subject" placeholder="프로젝트 이름을 입력하세요" id="html5-search-input" required="required">
		           	<div class="invalid-feedback">
					      프로젝트 명을 입력해주세요
					  </div>
		          </div>
		        </div>
		        <div class="mb-3 row">
		          <label for="html5-search-input" class="col-md-2 col-form-label">담당PM</label>
		          <div class="col-md-10">
		            <input class="form-control" type="text" value="김관리" placeholder="" id="html5-search-input" readonly="readonly">
		          	<input type="hidden" name="tlid" value="admin1@gmail.com"><!-- 세션에 있는 pm 아이디 -->
		          </div>
		        </div>
		         <div class="mb-3 row">
		          <label for="startDate" class="col-md-2 col-form-label">시작 일자</label>
		          <div class="col-md-10"> 
		            <input class="form-control" name="regdte" id="startDate" type="date" value="" readonly="readonly">
		          </div>
		        </div>
		         <div class="mb-3 row">
		          <label for="html5-search-input" class="col-md-2 col-form-label">종료 일자</label>
		          <div class="col-md-10">
		            <input class="form-control validCk" name="deadline" type="date" value="" placeholder="프로젝트 종료 일자를 입력하세요" id="html5-search-input" required="required">
		          	 <div class="invalid-feedback" id="deadCk">
					    프로젝트 종료 일자를 입력해주세요
					  </div>
		          </div>
		        </div>
		        <div class="mb-3 row">
		          <label for="html5-search-input" class="col-md-2 col-form-label">공개 여부</label>
		          <div class="col-md-10">
			          <div class="form-check form-check-inline">
			              <input class="form-check-input" type="radio" name="openStatus" id="inlineRadio1" value="0" checked="checked">
			              <label class="form-check-label" for="inlineRadio1">전체 공개</label>
			            </div>
		          	  <div class="form-check form-check-inline">
		                  <input class="form-check-input" type="radio" name="openStatus" id="inlineRadio2" value="1">
		                  <label class="form-check-label" for="inlineRadio2">멤버 공개</label>
		               </div>
		          </div>
		        </div>
		        <div class="card-footer">
			        <div class="d-flex justify-content-center">
			        <button id="regBtn" type="button" class="btn btn-primary">등록</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			        <button id="canBtn" type="button" class="btn btn-secondary">취소</button>
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