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
td{
	text-align:left;
	cursor: pointer;
}
tr{text-align:left;}
.risk-header{
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
/* 			if($(item).val()=="발생"){
				$(item).addClass('btn');
				$(item).addClass('btn-secondary');
			} */
			if($(item).val()=="해결"){
				$(item).addClass('btn');
				$(item).addClass('btn-primary');
			}else{
				$(item).addClass('btn');
				$(item).addClass('btn-secondary');
			}
		});	
		$("#applyBtn").click(function(){
			location.href = "${path}/project_riskForm.do?prjno="+${param.prjno};
		})
	});
	function goPage(cnt){
		$("[name=curPage]").val(cnt);
		$("form").submit()
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
			<div class="card-body">
						<div class="risk-header">
                          <h5 class="text-primary">리스크 관리</h5>
                          <input id="applyBtn" type="button" class="btn btn-primary" value="등록">	
						</div>
                          <div class="input-group">
							    <form id="frm01" class="d-flex"  method="post"> 			
								    <input type="hidden" name="curPage" value="${sch2.curPage}"/>
								    <input type="text" class="form-control rounded" placeholder="Search" 
							  aria-label="Search" aria-describedby="search-addon" name="schKeyword"
							  value="${param.schKeyword }" />
							  <button type="button" class="btn btn-outline-primary">search</button>
								</form> 

						  </div>	
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>리스크 이름</th>
                                            <th>심각도</th>
                                            <th>우선순위</th>
                                            <th>리스크 상태</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="risk" items="${list}">
                                    		<tr ondblclick="goDetail(${risk.riskno})" title="자세히보려면 더블클릭하세요">
                                    			<td>${risk.riskname}</td>
                                    			<td><input type="button" class="risklevel" value="${risk.risklevel}"></td>
                                    			<td>
                                    			<input type="button" class="riskpriority" value="${risk.riskpriority}">
                                    			</td>
                                    			<td>
                                    			<input type="button" class="riskstate" value="${risk.riskstate}" style="width: 86.6px;">
                                    			</td>
												<td>
                                    				<input type="hidden" value="${risk.riskno }" />
                                    				<input type="hidden" name="prjno" value="${risk.prjno}"/>
                                    			</td>
                                    		</tr>
                                    	</c:forEach>
                                    </tbody>
                                </table>
								<ul class="pagination  justify-content-end"> 
									<li class="page-item"><a class="page-link" 
										href="javascript:goPage(${sch2.startBlock-1});">Previous</a></li>
								
									<c:forEach var="cnt" begin="${sch2.startBlock}" 
											end="${sch2.endBlock}">
								  		<li class="page-item ${sch2.curPage==cnt?'active':''}">
								  		<a class="page-link" 
								  			href="javascript:goPage(${cnt});">${cnt}</a></li>
								  	</c:forEach>
								  	<li class="page-item"><a class="page-link" 
								  			href="javascript:goPage(${sch2.endBlock+1});">Next</a></li>
								</ul>
                                    <script>
                              		function goDetail(riskno){
                              			location.href="${path}/project_riskDetail.do?&riskno="+riskno+"&prjno="+${param.prjno}
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