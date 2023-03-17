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
		  
		$("#menu-item-mail").addClass('active open');	
		$("#menu-item-sendMail").addClass('active');
	      $("#readAll").click(function(){
	    	  $("input[name=chk]").prop("checked", true)
	    	  for(var idx=0; idx<$("input[name=chk]:checkbox").length; idx++){
					if($("input[name=chk]:checkbox")[idx].checked==true){
						var alertno = $("input[name=chk]:checkbox")[idx].value
						location.href="${path}/alertState.do?no="+alertno
					}
				}
	    	  location.reload()
	      })
	  
	    var reChk = false
	    $("#receiverChk").click(function(){
	    	var receiver = $("[name=receiver]").val()
	    	chkAjax(receiver)
	    
	    })
			 
		$("#sendBtn").click(function(){
			let regex = new RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}')
			var receiver = $("[name=receiver]").val()
			var result = regex.test(receiver)
			if(result==false){
				alert("수신자의 이메일 형식을 올바르게 입력하세요")
				return
			}	
			
			if(!reChk){
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
		
		function chkAjax(receiver){
	      	$.ajax({
	      		type:"post",
	      		url:"${path}/receiverChkAjax.do?receiver="+receiver,
	      		dataType:"json",
	      		success:function(data){
	      			alert(data.msg)
	      			reChk = true
	      			
	      		},
	      		error:function(err){
	      			console.log(err)
	      		}
	      	})
	      }
		
	});
	
	function alertState(no){
	      location.href="${path}/alertState.do?no="+no
	      location.reload()
	   }
    function alertDelete(no){
	   location.href="${path}/alertDelete.do?no="+no
	   location.reload()   
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
        <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
              <ul class="navbar-nav flex-row align-items-center ms-auto mx-5">
               <!-- alert -->
                <li class="nav-item navbar-dropdown dropdown-user dropdown mx-1">
                  <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                 <i class="bx bx-bell bx-md"></i>
                 <c:if test="${alertCount>0 }">
                <span class="badge badge-center rounded-pill bg-danger"
                   style="margin-left: -17px;">${alertCount }</span>
                   </c:if>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end">
                     <li>
                        <button style="margin-left: 300px; border:none;
                         background:white; color:#848484;" id="readAll">모두 읽음</button>
                     </li>
                     <li>
                      <div class="dropdown-divider"></div>
                    </li>  
                     <li>
                     <span class="dropdown-item" >
                       <span class="align-middle">알림</span>
                     </span>
                     </li>
                     
                    <li>
                     <div class="card-body" >
                     <c:if test="${alertCount==0 }">
                     	<span style="display: flex; justify-content: center; width: 330px;">알림 없음</span>
                     </c:if>
                        <c:forEach var="alert" items="${alertList }"> 
                       <div class="bs-toast toast fade show bg-${alert.style }" 
                       role="alert" aria-live="assertive" aria-atomic="true" style="margin-top:30px; margin-left:17x;">
                           <div class="toast-header">
                           <input type="checkbox" name="chk" style="display:none;" value="${alert.no }">
                             <i class="bx bx-bell me-2"></i>
                             <div class="me-auto fw-semibold">${alert.title }</div>
                             <small>${alert.state }</small>
                             <button type="button" onclick="alertDelete('${alert.no }')" 
                                class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                           </div>
                           
                           <div class="toast-body">
                             <a class="dropdown-item" href="${path }/${alert.url}">
                                <span style="color:white;" onclick="alertState('${alert.no }')">${alert.content }</span>
                             </a>
                           </div>
                       </div>
                      </c:forEach>
                       </div>
                    </li>
                   
                    
                  </ul>
                </li>
               <!-- /alert -->
                <!-- User -->
                <li class="nav-item navbar-dropdown dropdown-user dropdown mx-1"> 
                <span style="position:absolute; top:20px;left:4px; z-index: 3;font-size: 0.6rem;color:white;">${emp.ename }</span>
                  <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                   <div class="avatar avatar-online">
                      <svg>
                 <circle cx="20" cy="20" r="20" fill="#0054a6" />
               </svg>
                   </div>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                      <a class="dropdown-item" href="#">
                        <i class="bx bx-user me-2"></i>
                        <span class="align-middle">My Profile</span>
                      </a>
                    </li>
                    <!-- 
                    <li>
                      <div class="dropdown-divider"></div>
                    </li>
                     -->
                    <li>
                      <a class="dropdown-item" href="auth-login-basic.html">
                        <i class="bx bx-power-off me-2"></i>
                        <span class="align-middle">Log Out</span>
                      </a>
                    </li>
                  </ul>
                </li>
                <!--/ User -->
              </ul>
            </div>
          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->
            <div class="container-xxl flex-grow-1 container-p-y">
 
           <h4 class="fw-bold py-3 mb-4">메일 > <small class="text-muted"> 메일쓰기</small></h4>
                  <div class="card mb-4">
                    <div class="card-header d-flex justify-content-between align-items-center">
                      <h5 class="mb-0">superMail</h5>
                    </div>
                    <div class="card-body">
                      <form class="form" enctype="multipart/form-data" action="${path }/sendMail.do" method="post">
                        <div class="mb-3">
                          <label class="form-label" for="basic-default-receiver">수신자</label>
                         <div style="display: flex; gap:10px;">
		                <input  type="text" name="receiver" 
		                class="form-control" id="basic-default-receiver"/>
		                <button id="receiverChk" type="button" class="btn btn-primary" style="width:18%">수신자 확인</button>
		                </div>
                        </div>
                        <div class="mb-3">
                          <label class="form-label" for="basic-default-title">제목</label>
                          <input type="text" name="title" class="form-control" id="basic-default-title" placeholder="제목을 입력하세요" />
                        </div>
                    <div class="mb-3">
                          <label class="form-label" for="basic-default-sender">발신자</label>
                          <input type="text" name="sender" class="form-control" id="basic-default-sender" value="${emp.id }" readOnly/>
                        </div>
                        <div class="mb-3">
                          <label class="form-label" for="basic-default-content">내용</label>
                          <textarea
                          	name="content" id="basic-default-content" class="form-control" placeholder="내용을 입력하세요" rows="10"
                          ></textarea>
                        </div>
                        <div class="mb-3">
	                        <label for="formFile" class="form-label">첨부파일</label>
	                        <input class="form-control" type="file" id="formFile" name="report"/>
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