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
<!-- 
th{
	font-size: 15px !important;
	font-weight: bolder !important;
	text-align: center !important;
	color:white !important;
}
tbody td{
	text-align: center;
	color:black !important;
}
.tableTop{
	display: flex;
    justify-content: flex-end;
    gap:15px;
    padding-bottom:10px;
}
.checkboxs{
	visibility:hidden
}
#delBtn{
	display:none;
}
.input-group{
	width:30% !important;
}
tbody tr{
	cursor:pointer;
}
.card.mb-4{
	padding-left: 3rem !important;
	padding-right: 3rem !important;
}
.schDiv{
	display: flex;
    justify-content: flex-end;
    padding-top: 20px;
    padding-bottom: 10px;
}
-->
</style>

<script src="${path }/resources/a00_com/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
		
		$("#menu-item-notice").addClass('active open');
		if("${noticeSch.deptid}"!="") $("#cateId").text("${noticeSch.deptid}")
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
		           	<h4 class="fw-bold py-3 mb-4">공지사항</h4>
		           	
	           <div class="card mb-4 pb-3">
	           <form id="frm01" action="/FinalPJT/goNotice.do">
	           <div class="schDiv">
			           <div class="input-group input-group-merge">
			              <span class="input-group-text" id="basic-addon-search31"><i class="bx bx-search"></i></span>
			              <input type="text" class="form-control" placeholder="Search..."
			                aria-label="Search..." aria-describedby="basic-addon-search31"
			                style="border-right: 1px solid #d9dee3;
    								border-radius: 0.375rem;"
			                name="schInfo" value="${param.schInfo }"/>
			              <input type="hidden" name="deptid" value="${noticeSch.deptid}">
			            </div>
		            </div>
		            <input type="hidden" name="curPage" value="${noticeSch.curPage}"/>
		        </form>
		     
			       <div class="tableTop">
			       	<c:if test="${emp.auth == 0 }">
			           <button type="button" class="btn btn-danger" id="delBtn">삭제</button>
			           <button type="button" class="btn btn-primary" id="regBtn">공지사항 등록</button>
			           <button type="button" class="btn btn-secondary" id="check">선택</button>
			        </c:if>
			           <div class="btn-group">
                      <button
                        type="button"
                        class="btn btn-outline-secondary dropdown-toggle"
                        data-bs-toggle="dropdown"
                        aria-expanded="false"
                        id = "cateId"
                      >
                      전체
                      </button>
                      <ul class="dropdown-menu">
                      	<li><a class="dropdown-item" onclick="category(this)">전체</a></li>
                      	<li><a class="dropdown-item" onclick="category(this)">사내공지</a></li>
                      	<c:forEach var="dept" items="${depts }">
                      		<li><a class="dropdown-item" onclick="category(this)">${dept.val }</a></li>
                      	</c:forEach>
                      </ul>
                    </div>
		           </div>
	          <form id="frm03" action="/FinalPJT/delNotice.do">
           <table class="table">
           	  <col width="3%">
           	  <col width="4%">
			  <col width="20%">
			  <col width="13%">
			  <col width="10%">
			  <col width="20%">
			  <col width="20%">
			  <col width="10%">
                    <thead class="table-dark">
	                      <tr>
	                      	<th><input name="th" type="checkbox" class="checkboxs" id="cbx_chkAll"></th>
	                        <th>No</th>
	                        <th>제목</th>
	                        <th>작성자</th>
	                        <th>조회수</th>
	                        <th>작성일자</th>
	                        <th>수정일자</th>
	                        <th>카테고리</th>
	                      </tr>
                    </thead>
                    
                    <tbody class="table-border-bottom-0">
                      <c:forEach var="nt" items="${noticeList}">
	                      	<tr>
	                      		<td><input name="noticeno" type="checkbox" class="checkbox checkboxs" 
	                      				value="${nt.noticeno }"></td>		                      	
		                      	<td>${nt.cnt}</td>
		                        <td>${nt.title}</td>
		                        <td>${nt.ename}</td>
		                        <td>${nt.viewcnt}</td>
		                        <td>${nt.regdte}</td>
		                        <td>${nt.uptdte}</td>
		                        <td>${nt.deptid}</td>
	                        </tr>
                      	</c:forEach>
                    </tbody>
                  </table>
                  </form>
                  <c:if test="${noticeSch.startBlock>0 }">
                  <nav aria-label="Page navigation" style="padding-top: 30px">
                          <ul class="pagination justify-content-center">
                            <li class="page-item prev">
                              <a class="page-link" href="javascript:goPage(${noticeSch.startBlock-1});"
                                ><i class="tf-icon bx bx-chevrons-left"></i
                              ></a>
                            </li>
                            
                            <c:forEach var="cnt" begin="${noticeSch.startBlock}" end="${noticeSch.endBlock}">
	                            <li class="page-item ${noticeSch.curPage==cnt?'active':''}">
	                              <a class="page-link" href="javascript:goPage(${cnt});">${cnt}</a>
	                            </li>
	                        </c:forEach>
	                        
                            <li class="page-item next">
                              <a class="page-link" href="javascript:goPage(${noticeSch.endBlock+1});"
                                ><i class="tf-icon bx bx-chevrons-right"></i
                              ></a>
                            </li>
                          </ul>
                        </nav>
                        </c:if>
                 </div>
                 <script>
                  
                  	function goPage(cnt){
						$("[name=curPage]").val(cnt);
						$("#frm01").submit()
					}
                  	
                 // 선택 클릭시 체크박스 나타나고 사라지고 기능
                	var cntt = 0;
                	$("#check").click(function(){
                		cntt++;
                		if(cntt%2==0) {
                			$(".checkboxs").css({"visibility":"hidden"})
                			$("#delBtn").hide()
                		}
                		else {
                			$(".checkboxs").css({"visibility":"visible"})
                			$("#delBtn").show()
                		}
                	})
                	
                	// 전체 체크박스 클릭 기능
                	$("#cbx_chkAll").click(function() {
						if($("#cbx_chkAll").is(":checked")) $(".checkbox").prop("checked", true);
						else $(".checkbox").prop("checked", false);
					});
					
					$(".checkbox").click(function() {
						var total = $(".checkbox").length;
						var checked = $(".checkbox:checked").length;
					
						if(total != checked) $("#cbx_chkAll").prop("checked", false);
						else $("#cbx_chkAll").prop("checked", true); 
					});
					
					$("#delBtn").click(function(){
						var checked = $(".checkbox:checked").length;
						if(checked==0) alert("하나 이상 체크하여야 삭제가 가능합니다.")
						else{
							$("#frm03").submit()
						}
					})
					
					$("[name=schInfo]").keydown(function(e){
						if(e.keyCode==13){
							$("[name=curPage]").val(0)
							$("#frm01").submit()
						}
					})
					
					$("#regBtn").click(function(){
						if(confirm("등록 화면으로 이동하시겠습니까?")){
							location.href="/FinalPJT/goCreateNotice.do"
						}
					})
					$("tbody tr td:nth-child(n+2)").click(function(){
						var parm = $(this).parent().children().first().children("input").val()
						$('body').append("<div style='display: none'>"
			                  	+"<form method='post' id='frm02'>"
			                  	+"	<input name='noticeno'>"
			                  	+"</form></div>");
						$("[name=noticeno]").val(parm)
						$("#frm02").attr("action","/FinalPJT/goNoticeDetail.do")
						$("#frm02").submit()
					})
					
					function category(msg){
						$("#cateId").text($(msg).text())
						$("[name=deptid]").val($(msg).text())
						
					}
					
					
				</script>
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