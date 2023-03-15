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
a.hover{
	color:blue;ss
}

</style>
<script src="${path }/resources/a00_com/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
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
		
		$("#delBtn").click(function(){
			 var chkArray = new Array()
		    $("input[name=chk]:checked").each(function() { 
		      var mailnoVal = $(this).val(); 
		      chkArray.push(mailnoVal);
		    });
		    if( chkArray.length < 1 ){
		      alert("메일을 선택하세요");
		      return;
		    }
			if(confirm("삭제하시겠습니까?")){
				alert("선택하신 메일이 삭제되었습니다.")
				location.href="${path}/delSendMail.do?mailno="+chkArrays
				
			}
			
		})
		$("#reSendBtn").click(function(){
			var mailLeng = $("input[name=chk]:checked").length
			if(mailLeng>1){
				alert("1개의 메일만 선택해주세요")
				return
			}
			if(mailLeng<1){
				alert("메일을 선택해주세요")
				return
			}
			for(var idx=0; idx<$("input[name=chk]:checkbox").length; idx++){
				if($("input[name=chk]:checkbox")[idx].checked==true){
					var mailno = $("input[name=chk]:checkbox")[idx].value
					location.href="${path}/reSendMail.do?mailno="+mailno
				}
			}
		})
		var cnt = 0 
		$("#allChk").click(function(){	
			$("input[name=chk]").prop("checked", true)
			cnt++
			if(cnt%2==0){
				$("input[name=chk]").prop("checked", false)
			}
		})
		
	})
	function goPage(cnt){
		$("[name=curPage]").val(cnt);
		var curPage=$("[name=curPage]").val()
		location.href="${path}/mySendMail.do?curPage="+curPage
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
 
           <h4 class="fw-bold py-3 mb-4">메일 > <small class="text-muted">보낸 메일함</small></h4>
           <div class="container">
           <div class="card mb-4 pb-3">
     
	           <div class="demo-inline-spacing">
	           <button id="allChk" type="button" class="btn rounded-pill btn-info">전체 선택</button>
	         	<button id="reSendBtn" type="button" class="btn rounded-pill btn-primary">전달</button>
	         	<button id="delBtn" type="button" class="btn rounded-pill btn-danger">삭제</button>
	         	</div>
	         	<div class="table-responsive text-nowrap">
	         	 <input type="hidden" name="curPage" value="${sch.curPage}"/>
                  <table class="table">
                  	 
                    <thead>
                      <tr>
                        <th></th>
                        <th style="text-align:center;">상태</th>
                        <th style="text-align:center;">받는 사람</th>
                        <th style="text-align:center;">제목</th>
                        <th style="text-align:center;">보낸 날짜</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                        <c:forEach var="mail" items="${mySendMail}">
                      <tr>
                        <td style="width:10px;"><i class="fab fa-angular fa-lg text-danger me-3"></i> 
                       	 <input type="checkbox" name="chk" value="${mail.mailno}"></td>
                       
                  		<c:if test="${mail.state=='0'}">
                  		 <td style="width:10px;">읽지않음</td>
                  		</c:if>
                  		<c:if test="${mail.state=='1'}">
                  		 <td style="width:10px;">읽음</td>
                  		</c:if>
                  		<td style="width:10px;">${mail.receiver }</td>
                  		
                  		 <td >
                  		<a style="color:#697a8d;" href="${path}/sendDetail.do?mailno=${mail.mailno}"> ${mail.title}</a> </td>
                        <td style="text-align:center;">
                         <fmt:formatDate pattern='yyyy-MM-dd' value="${mail.sendDte}"/> 
                        </td>
                      </tr>
                      </c:forEach>
			    	 
                    </tbody>
                  </table>
                </div>
                
                 <nav aria-label="Page navigation" style="display: flex; justify-content: center;">
                          <ul class="pagination">
                            <li class="page-item prev">
                              <a class="page-link" href="javascript:goPage(${sch.startBlock-1});"
                                ><i class="tf-icon bx bx-chevron-left"></i
                              ></a>
                            </li>
                            <c:forEach var="cnt" begin="${sch.startBlock}" 
								end="${sch.endBlock}">
								<li class="page-item ${sch.curPage==cnt?'active':''}">
								<a class="page-link" 
									href="javascript:goPage(${cnt});">${cnt}</a></li>
								</c:forEach>
                            <li class="page-item next">
                              <a class="page-link" href="javascript:goPage(${sch.endBlock+1});"
                                ><i class="tf-icon bx bx-chevron-right"></i
                              ></a>
                            </li>
                           
                          </ul>
                        </nav>
               </div>        
         	</div>
         	  <!-- /card -->
            </div>
            <!-- / Content -->
			  <!-- Modal -->
			 

           
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