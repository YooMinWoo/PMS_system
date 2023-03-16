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
<title>결재함</title>

<style>
.card.mb-4{
	padding-left: 3rem !important;
	padding-right: 3rem !important;
}
th{text-align:center !important;}
td{text-align:center;}
.btn{
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
    <script src="${path }/resources/sneatㄴ-1.0.0/assets/js/config.js"></script>
<script type="text/javascript">
	var msg = "${msg}"
	console.log(msg)
	$(document).ready(function(){
		$("#menu-item-project").addClass('active open');	
		$("#menu-item-project-myproject").addClass('active');
		if($("[name=isApprv]").val()=="y"){
			$("#finish").addClass('active');
		}else{
			$("#wait").addClass('active');
		}
		$("#wait").click(function(){
			$("[name=isApprv]").val("n")
			$("[name=text]").val("")
			$("[name=text]").val("")
			$("#allFrm").submit()	
		})
		$("#finish").click(function(){
			$("[name=isApprv]").val("y")
			$("[name=text]").val("")
			$("[name=text]").val("")
			$("#allFrm").submit()
		})
	
	});
	function goWork(no){
		location.href="${path}/workGanttDetail.do?no="+no
	}
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
           <jsp:include page="/workTop.jsp"></jsp:include>
			<hr class="mx-0">
           <div class="demo-inline-spacing mt-5">
           <div class="row">
           <div class="col-3">
           <div class="btn-group" role="group" aria-label="Basic example">
                <button type="button" id="wait" class="btn btn-outline-secondary">결재대기</button>
                <button type="button" id="finish" class="btn btn-outline-secondary">결재완료</button>
            </div>
          </div>
          <div class="col-5"> </div>
          <div class="col-4">
            <!-- 검색어 입력하는 곳 -->
          <form class="d-flex" id="allFrm" action="${path}/apprvList.do" method="post">
	          <div class="input-group">
	            <span class="input-group-text"><i class="tf-icons bx bx-search"></i></span>
	            <input type="text" name="text" value="${sch.text}" class="form-control" placeholder="업무명을 입력하세요">
	          </div>
	          <input type="hidden" name="curPage" value="${sch.curPage}"/>
	          <input type="hidden" name="isApprv" value="${sch.isApprv}">
	          <input type="hidden" name="prjno" value="${sch.prjno}">
	       </form>
	       <!-- /form 끝 -->
          </div>
          </div>
          <div class="tab-content px-0 mt-0">
          <!--  진행중 프로젝트 tab -->
            <div class="tab-pane fade show active" id="horizontal-home">
             <div class="table-responsive text-nowrap">
			  <table class="table card-table" style="overflow: hidden;">
			    <thead>
			      <tr>
			        <th>번호</th>
			        <th>업무명</th>
			        <th>담당자</th>
			        <th>시작일자</th>
			        <th>종료일자</th>
			        <th>진행률</th>
			      </tr>
			    </thead>
			    <tbody class="table-border-bottom-0">
		        <c:forEach var="g" items="${ganttInfo }">
		        <tr onclick="goWork(${g.id})">
		        <td>${g.cnt }</td>
		        <td>${g.text }</td><td>${g.owner }</td>
		        <td>${g.start_date }</td>
		        <td>
		       <!-- String 형태로 저장되어 있는 start_date를 날짜형태로 파싱 -->
		        <fmt:parseDate var="sdate" value="${g.start_date }" pattern="yyyy-MM-dd"/>
		        <!-- 날짜형태를 시간 숫자로 변형해서 duration(기간)을 더해줌 // -->
		        <c:set var="ddate" value="${sdate.time + ((g.duration) * 24 * 60 * 60 * 1000)}"/>
		        <%
		        // 숫자형태를 날짜형으로 로 변경함
				    Date date = new Date((Long) pageContext.getAttribute("ddate"));
				%>	
				<!-- 변경한 날짜형 데이터를 원하는 패턴으로 format 하여 출력 -->
				<fmt:formatDate value="<%=date%>" pattern="yyyy-MM-dd" />
		        </td>
		        <td><fmt:formatNumber value="${g.progress }" type="percent"></fmt:formatNumber></td>
		        </tr>
		        </c:forEach>
		      </tbody>
			  </table>
			</div>
            </div>
          </div>
        </div>
          <div class="d-flex justify-content-center">
          <!-- Basic Pagination --> 
          <nav id="pagination" aria-label="Page navigation">
            <ul class="pagination">
              <li class="page-item prev">
                <a class="page-link" href="javascript:goPage(${sch.startBlock-1});">
                	<i class="tf-icon bx bx-chevron-left"></i>
                </a>
              </li>
              <c:forEach var="cnt" begin="${sch.startBlock}" end="${sch.endBlock}">
             	 <li class="page-item ${sch.curPage==cnt?'active':''}">
    				<a class="page-link" href="javascript:goPage(${cnt});">${cnt}</a>
    			</li>
              </c:forEach>
              <li class="page-item next">
                <a class="page-link" href="javascript:goPage(${sch.endBlock+1});">
                	<i class="tf-icon bx bx-chevron-right"></i>
                </a>
              </li>
            </ul>
          </nav>
          <!--/ Basic Pagination -->
         
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