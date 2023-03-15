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

-->
.btns{
	display: flex;
	justify-content: flex-end;
	gap:20px;
}
.divs{
	display: flex;
	justify-content: space-between;
}
.card.mb-4{
	padding-left: 3rem !important;
	padding-right: 3rem !important;
}
input:read-only{
	background:white !important;
}
textarea:read-only{
	background:white !important;
}
.repList2{
	display: flex;
}
.repList{
	display: flex;
    align-items: baseline;
}
#regRepBtn{
	height:50px;
	width:8.5%;
}
.offBtn{
	display: flex;
    gap: 20px;
    justify-content: flex-end;
}
.repList3{
	display:flex;
	flex-direction: column;
	gap:4px;
}
.btns{
	border: none;
    background: inherit;
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
console.log(${noticeDetail.report})
	$(document).ready(function(){
		$("#menu-item-notice").addClass('active open');
		$(".offBtn").hide()
		var authTF = ${emp.auth==0}
		if(!authTF){ // 권한이 admin이 아니라면
			$("#frm01 input").attr("readonly","readonly")
			$("#frm01 textarea").attr("readonly","readonly")
		}
		$("#reps").attr("readonly","readonly")
		$("#backBtn").click(function(){
			if(confirm("조회 화면으로 이동하시겠습니까?")){
				location.href="/FinalPJT/goNotice.do"
			}
		})
		$("#uptBtn").click(function(){
			if(confirm("수정하시겠습니까?")){
				$("#frm01").attr({
					action:"/FinalPJT/uptNotice.do",
					enctype:"multipart/form-data"
				})
				$("#frm01").submit()
			}
		})
		$("#delBtn").click(function(){
			if(confirm("삭제하시겠습니까?")){
				$("#frm01").attr("action","/FinalPJT/delNotice.do")
				$("#frm01").submit()
			}
		})
		$("#fileUptBtn").click(function(){
			if(confirm("파일을 수정하시겠습니까?")){
				$("#formFile").click()
			}
		})
		$("#downloadBtn").click(function(){
			if(confirm("다운로드 하시겠습니까?")){
				if("${noticeDetail.fname}"){
					location.href="/FinalPJT/download.do?fname=${noticeDetail.fname}&path=${noticeDetail.path}"
				}
				else {
					alert("다운로드할 파일이 없습니다.")
					return
				}
			}
		})
		$("#formFile").change(function(){
			if($("#formFile").val()==""){
				$("#formFile2").val("선택된 파일이 없습니다.")
			}else{
				$("#formFile2").val($('#formFile').val().split("\\")[2])
			}
		})
		$("#regRepBtn").click(function(){
			if($("#repContent").length>150){
				alert("150자 이하로 입력해주세요")
				$("#repContent").focus()
				return
			}
			if($("#repContent").val()==""){
				alert("댓글을 입력해주세요.")
				$("#repContent").focus()
				return
			}
			$("#frm02").attr("action","/FinalPJT/insertNoticeRep.do")
			$("#frm02").submit()
		})
	});
	
	function repUptBtn(idx){
		
		if($("#repForm"+idx).find("[name=content]").val().length>150){
			alert("150자 이하로 입력해주세요")
			$("#repForm"+idx).find("[name=content]").focus()
			return
		}
		if($("#repForm"+idx).find("[name=content]").val()==""){
			alert("댓글을 입력해주세요.")
			$("#repForm"+idx).find("[name=content]").focus()
			return
		}
		$("#repForm"+idx).attr("action","/FinalPJT/updateNoticeRep.do")
		$("#repForm"+idx).submit()
	}
	
	function repDelBtn(idx){
		location.href="/FinalPJT/deleteNoticeRep.do?noticeno=${noticeDetail.noticeno }&repno="+idx
	}
	
	
	function RepBtnClick(idx){
		$(".canBtn").click()
		$("#repId"+idx).find(".onBtn").hide()
		
		$("#repId"+idx).find(".offBtn").show()
		$("#repId"+idx).find(".offBtn").attr("display","flex")
		$("#repId"+idx).find("textarea").attr("readonly",false)
		$("#repId"+idx).find("textarea").focus()
	}
	function offBtnClick(idx){
		var beforeUpt = $("#beforeUpt"+idx).val()
		$("#repId"+idx).find(".offBtn").hide()
		$("#repId"+idx).find(".onBtn").show()
		$("#repId"+idx).find("textarea").attr("readonly",true)
		$("#repId"+idx).find("textarea").val(beforeUpt)
	}
	function goPage(cnt){
		$("[name=curPage]").val(cnt);
		location.href="/FinalPJT/goNoticeDetail.do?noticeno=${param.noticeno }&curPage="+$('[name=curPage]').val()
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
 
           
           
	           
		       <h4 class="fw-bold py-3 mb-4">공지사항 > <small class="text-muted">상세화면</small></h4>
	           <div class="card mb-4 pb-3">
           			<div class="card-body">
                      <form method="post" id="frm01">
                      	<input type="hidden" name="noticeno" value="${noticeDetail.noticeno }">
                      	<input type="hidden" name="path" value="${noticeDetail.path }">
                      	<input type="hidden" name="curPage" value="${noticeRepSch.curPage }">
                      	<input type="hidden" name="fno" value="${noticeDetail.fno }">
                      	<input type="hidden" name="bfFname" value="${noticeDetail.fname }">
                      	<input type="hidden" name="bfPath" value="${noticeDetail.path }">
                        <div class="mb-3">
                          <label class="form-label" for="basic-default-title">제목</label>
                          <input name="title" type="text" class="form-control" 
                          	id="basic-default-title" value="${noticeDetail.title}"/>
                        </div>
                        <div class="divs">
	                        <div class="mb-3" style="width:45%">
	                          <label class="form-label" for="basic-default-writer">작성자</label>
	                          <input type="hidden" name="writer" value="${emp.id }">
	                          <input type="text"
	                          class="form-control" id="basic-default-writer" value="${noticeDetail.ename }" readonly />
	                        </div>
	                        <div class="mb-3" style="width:45%">
	                          <label class="form-label" for="basic-default-cnt">조회수</label>
	                          <input type="text" name="cnt"
	                          class="form-control" id="basic-default-cnt" value="${noticeDetail.viewcnt }" readonly />
	                        </div>
                        </div>
                        <div class="divs">
	                        <div class="mb-3" style="width:45%">
	                          <label class="form-label" for="basic-default-regDte">작성일자</label>
	                          <input type="text"
	                          class="form-control" name="regdte" id="basic-default-regDte" value="${noticeDetail.regdte }" readonly />
	                        </div>
	                        <div class="mb-3" style="width:45%">
	                          <label class="form-label" for="basic-default-uptDte">수정일자</label>
	                          <input type="text"
	                          class="form-control" id="basic-default-uptDte" value="${noticeDetail.uptdte }" readonly />
	                        </div>
                        </div>
                        <div class="mb-3">
                          <label class="form-label" for="basic-default-message">내용</label>
                          <textarea id="basic-default-message" class="form-control"
                            name="content" style="height: 300px;">${noticeDetail.content }</textarea>
                        </div>
                        <div class="mb-3" style="display:none;">
	                        <label for="formFile" class="form-label">파일첨부</label>
	                        <input name="report" class="form-control" type="file" id="formFile" />
                        </div>
                        <div class="mb-3">
	                        <label class="form-label">파일명</label>
	                        <input class="form-control" type="text" id="formFile2" readonly
	                        value="${not empty noticeDetail.fname?
	                        	noticeDetail.fname
	                        	:'등록된 파일이 없습니다' }"/>
                        </div>
                        <script>
                        </script>
                        
                        <div class="btns">
                        	<c:if test="${emp.auth == 0 }">
	                        	<button type="button" class="btn btn-primary" id="uptBtn">수정</button>
	                        	<button type="button" class="btn btn-danger" id="delBtn">삭제</button>
	                        	<button type="button" class="btn btn-primary" id="fileUptBtn">파일 수정하기</button>
                        	</c:if>
                        	<button type="button" class="btn btn-primary" id="downloadBtn">파일 다운로드</button>
                        	<button type="button" class="btn btn-secondary" id="backBtn">조회화면 이동</button>
                        </div>
                      </form>
                    </div>
                    <hr>
                    <div class="card-body">
                    	<h6>댓글 &nbsp;&nbsp;&nbsp;${noticeRepSch.count }개</h6>
                    	<form id="frm02" method="post">
                    		<input type="hidden" name="noticeno" value="${noticeDetail.noticeno }">
                      		<input type="hidden" name="writer" value="${emp.id }">
	                    	<label for="repContent" class="form-label">댓글 작성</label>
	                    	<div class="repList2">
		                        <textarea class="form-control" name="content" id="repContent" rows="3" style="height:50px;"></textarea>
		                        <button type="button" class="btn btn-primary" id="regRepBtn">작성</button>
	                        </div>
	                        <hr>
	                        <br><br>
                        </form>
                        <c:forEach var="rep" items="${noticeRep}" varStatus="status">
                        	<form id="repForm${rep.repno }">
                        		<input type="hidden" name="noticeno" value="${noticeDetail.noticeno }">
                        		<input type="hidden" name="repno" value="${rep.repno}">
	                        	<label class="form-label">${rep.ename } (등록일자 : ${rep.regdte }
	                        	 / 수정일자 : ${rep.uptdte })</label>
	                        <div class="repList3" id="repId${rep.repno }">
	                        	<div class="offBtn">
	                        		<button class="btns" type="button" onclick="repUptBtn(${rep.repno })">수정</button>
	                        		<button class="btns canBtn" id="canBtn" type="button" onclick="offBtnClick(${rep.repno })">
	                        		취소</button>
	                        	</div>
	                        	<div class="repList">
			                        <textarea name="content" id="reps" class="form-control" rows="3" style="height:50px;" 
			                        readonly>${rep.content } </textarea>
			                        <input type="hidden" id="beforeUpt${rep.repno }" value="${rep.content }">
			                        <c:if test="${emp.id == rep.writer }">
			                        	<div class="demo-inline-spacing">
					                        <div class="btn-group">
					                          <button
					                            type="button" 
					                            class="btn btn-primary btn-icon rounded-pill dropdown-toggle hide-arrow onBtn"
					                            data-bs-toggle="dropdown"aria-expanded="false">
					                            <i class="bx bx-dots-vertical-rounded"></i>
					                          </button>
					                          <ul class="dropdown-menu dropdown-menu-end">
					                            <li><button type="button" class="dropdown-item RepBtn" 
					                            onclick="RepBtnClick(${rep.repno })">수정</button></li>
					                            <li><button type="button" class="dropdown-item delRepBtn" 
					                            onclick="repDelBtn(${rep.repno})">삭제</button></li>
					                          </ul>
					                        </div>
					                      </div>
			                        </c:if>
		                        </div>
	                        </div>
	                        <br>
	                        </form>
                        </c:forEach>
                        <br>
                        <c:if test="${noticeRepSch.startBlock>0 }">
                  <nav aria-label="Page navigation" style="padding-top: 30px">
                          <ul class="pagination justify-content-center">
                            <li class="page-item prev">
                              <a class="page-link" href="javascript:goPage(${noticeRepSch.startBlock-1});"
                                ><i class="tf-icon bx bx-chevrons-left"></i
                              ></a>
                            </li>
                            
                            <c:forEach var="cnt" begin="${noticeRepSch.startBlock}" end="${noticeRepSch.endBlock}">
	                            <li class="page-item ${noticeRepSch.curPage==cnt?'active':''}">
	                              <a class="page-link" href="javascript:goPage(${cnt});">${cnt}</a>
	                            </li>
	                        </c:forEach>
	                        
                            <li class="page-item next">
                              <a class="page-link" href="javascript:goPage(${noticeRepSch.endBlock+1});"
                                ><i class="tf-icon bx bx-chevrons-right"></i
                              ></a>
                            </li>
                          </ul>
                        </nav>
                        </c:if>
                    </div>
                    
                 </div>
                 <script>
		                        
                    	
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