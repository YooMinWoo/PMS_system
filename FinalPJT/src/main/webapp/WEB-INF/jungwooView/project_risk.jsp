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
td{text-align:left;}
tr{text-align:left;}
	.risk-content{
	    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 0 solid #d9dee3;
    border-radius: 0.5rem;
	}
	hr{
	background-color:#697A8D;
	height: 1;	
	}
	
ul,li {
  list-style: none;
}

.tg-list {
  text-align: center;
  display: flex;
  align-items: center;
}
.tgl {
  display: none;
}
.tgl, .tgl:after, .tgl:before, .tgl *, .tgl *:after, .tgl *:before, .tgl + .tgl-btn {
  box-sizing: border-box;
}
.tgl::selection, .tgl:after::selection, .tgl:before::selection, .tgl *::selection, .tgl *:after::selection, .tgl *:before::selection, .tgl + .tgl-btn::selection {
  background: none;
}
.tgl + .tgl-btn {
  outline: 0;
  display: block;
  width: 4em;
  height: 2em;
  position: relative;
  cursor: pointer;
  user-select: none;
}
.tgl + .tgl-btn:after, .tgl + .tgl-btn:before {
  position: relative;
  display: block;
  content: "";
  width: 50%;
  height: 100%;
}
.tgl + .tgl-btn:after {
  left: 0;
}
.tgl + .tgl-btn:before {
  display: none;
}
.tgl:checked + .tgl-btn:after {
  left: 50%;
}

.tgl-light + .tgl-btn {
  background: #f0f0f0;
  border-radius: 2em;
  padding: 2px;
  transition: all 0.4s ease;
}
.tgl-light + .tgl-btn:after {
  border-radius: 50%;
  background: #fff;
  transition: all 0.2s ease;
}
.tgl-light:checked + .tgl-btn {
  background: #9FD6AE;
}
	.tgl-flip + .tgl-btn {
  padding: 2px;
  transition: all 0.2s ease;
  font-family: sans-serif;
  perspective: 100px;
}
.tgl-flip + .tgl-btn:after, .tgl-flip + .tgl-btn:before {
  display: inline-block;
  transition: all 0.4s ease;
  width: 100%;
  text-align: center;
  position: absolute;
  line-height: 2em;
  font-weight: bold;
  color: #fff;
  position: absolute;
  top: 0;
  left: 0;
  backface-visibility: hidden;
  border-radius: 4px;
}
.tgl-flip + .tgl-btn:after {
  content: attr(data-tg-on);
  background: #02C66F;
  transform: rotateY(-180deg);
}
.tgl-flip + .tgl-btn:before {
  background: #ff3e1d;
  content: attr(data-tg-off);
}
.tgl-flip + .tgl-btn:active:before {
  transform: rotateY(-20deg);
}
.tgl-flip:checked + .tgl-btn:before {
  transform: rotateY(180deg);
}
.tgl-flip:checked + .tgl-btn:after {
  transform: rotateY(0);
  left: 0;
  background: #7FC6A6;
}
.tgl-flip:checked + .tgl-btn:active:after {
  transform: rotateY(20deg);
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

  		$(".risklevel").each(function(index, item){
			console.log($(item).val());
			if($(item).val()=="긴급"){
				$(item).addClass('btn');
				$(item).addClass('btn-danger');
			}
			if($(item).val()=="보통"){
				$(item).addClass('btn');
				$(item).addClass('btn-warning');
			}
			if($(item).val()=="낮음"){
				$(item).addClass('btn');
				$(item).addClass('btn-success');
			}
		});
  		$(".riskpriority").each(function(index, item){
			console.log($(item).val());
			if($(item).val()=="1"){
				$(item).addClass('btn');
				$(item).addClass('btn-danger');
			}
			if($(item).val()=="2"){
				$(item).addClass('btn');
				$(item).addClass('btn-warning');
			}
			if($(item).val()=="3"){
				$(item).addClass('btn');
				$(item).addClass('btn-success');
			}
		});	
  		$(".riskstate").each(function(index, item){
			console.log($(item).val());
			if($(item).val()=="대기"){
				$(item).addClass('btn');
				$(item).addClass('btn-secondary');
			}
			if($(item).val()=="승인"){
				$(item).addClass('btn');
				$(item).addClass('btn-primary');
			}
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
                          <h5 class="card-title text-primary">리스크 관리</h5>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>리스크 이름</th>
                                            <th>리스크 번호</th>
                                            <th>심각도</th>
                                            <th>우선순위</th>
                                            <th>PM승인</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="risk" items="${list}">
                                    		<tr ondblclick="goDetail(${risk.riskno})">
                                    			<td>${risk.riskno}</td>
                                    			<td>${risk.riskname}</td>
                                    			<td><input type="button" class="risklevel" value="${risk.risklevel}"></td>
                                    			<td>
                                    			<input type="button" class="riskpriority" value="${risk.riskpriority}">
                                    			</td>
                                    			<td>
                                    			<input type="button" class="riskstate" value="${risk.riskstate}">
                                    			</td>
                                    		</tr>
                                    	</c:forEach>
                                    </tbody>
                                </table>
                                    <script>
                              		function goDetail(riskno){
                              			location.href="${path}/project_riskDetail.do?riskno="+riskno
                              		}
                                    </script>
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