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
.demo-inline-spacing{
	display: flex;
    justify-content: flex-end; 
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
		$("#sendBtn").click(function(){
			let regex = new RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}')
			var receiver = $("[name=receiver]").val()
			var result = regex.test(receiver)
			if(result==false){
				alert("수신자의 이메일 형식을 올바르게 입력하세요")
				return
			}	
			
			if($("[name=receiver]").val()==""){
				alert("수신자를 입력하세요")
				$("[name=receiver]").focus()
				return
			}
			if($("[name=title]").val()==""){
				alert("제목을 입력하세요")
				$("[name=title]").focus()
				return
			}
			if($("[name=content]").val()==""){
				alert("내용 입력하세요")
				$("[name=content]").focus()
				return
			}
			var titleLeng =  $("[name=title]").val().length
			var contentLeng =  $("[name=content]").val().length
			if(titleLeng>30){
				alert("제목은 30자 이내로 입력하세요")
				return
			}
			if(contentLeng>1000){
				alert("내용은 1000자 이내로 입력하세요")
				return 
			}
			
			$("form").submit()
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
 
           <h4 class="fw-bold py-3 mb-4">메일쓰기 > <small class="text-muted"> 전달하기</small></h4>
           
          
	          
               
                  <div class="card mb-4">
                    <div class="card-header d-flex justify-content-between align-items-center">
                      <h5 class="mb-0">superMail</h5>
                     
                    </div>
                    <div class="card-body">
                      <form class="form" enctype="multipart/form-data" action="${path }/reMail.do" method="post">
                        <div class="mb-3">
                          <label class="form-label" for="basic-default-receiver">수신자</label>
                          <input type="text" name="receiver" class="form-control" id="basic-default-receiver"
                           />
                        </div>
                        <div class="mb-3">
                          <label class="form-label" for="basic-default-title">제목</label>
                          <input type="text" name="title" class="form-control" id="basic-default-title"
                           value="FW:${reMail.title }" />
                        </div>
                    <div class="mb-3">
                          <label class="form-label" for="basic-default-sender">발신자</label>
                          <input type="text" name="sender" class="form-control" id="basic-default-sender" value="${emp.id }" readOnly/>
                        </div>
                        <div class="mb-3">
                          <label class="form-label" for="basic-default-content">내용</label>
                          <textarea
                          	name="content"
                            id="basic-default-content"
                            class="form-control"
                            rows="10">
                          	----Original Message----
                          	From : ${reMail.sender }
                          	To : ${reMail.receiver }
                          	Subject : ${reMail.title }
                          	Sent : ${reMail.sendDte }
                          	
                          	${reMail.content }

                          
                          </textarea>
                          
                        </div>
                        <div class="mb-3">
	                        <label for="formFile" class="form-label">첨부파일</label>
	                        <input class="form-control" type="text" id="formFile" name="fname" value="${fname }"/>
	                      </div>
                      </form>
                    </div>
                  </div>
               	 <div class="demo-inline-spacing">
 					<button id="sendBtn" class="btn btn-primary" type="button">보내기</button>
                </div>
              
          
            </div>
         	</div>
         	  <!-- /card -->
            </div>
            <!-- / Content -->
			  
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