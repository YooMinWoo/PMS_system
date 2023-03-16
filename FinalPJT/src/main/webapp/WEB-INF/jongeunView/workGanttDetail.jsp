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
			location.href="${path}/workUptFrm.do?no="+$("[name=workno]").val();	
		})
		$("#del").click(function(){
			if(confirm("삭제하시겠습니까?")){
				location.href="${path}/workDel.do?no="+$("[name=workno]").val();
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
		// 결재 요청
		$("#req").click(function(){
			location.href="${path}/reqApprove.do?no="+$("[name=ganttid]").val();
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
			let writer="monsta@gmail.com" // 세션에 있는 아이디
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
		// 추가 담당자 초대
		var id1="${projectInfo.tlid}"
		var id2="${personInfo.id}"
		$("#memBtn").click(function(){
			let url="${path}/prjMemList.do?prjno="+prjno+"&id1="+id1+"&id2="+id2
			console.log(url)
			fetch(url).then(function(response){
				console.log(response)
				return response.json()
			}).then(function(json){			
				let meminfo = json.memList
				let listHTML = ""
				for(let i=0;i<meminfo.length;i++){
					listHTML+="<tr><td><input type='checkbox'></td><td>"+meminfo[i].dname+"</td><td>"+meminfo[i].job+"</td><td>"+
					meminfo[i].part+"</td><td>"+meminfo[i].ename+"</td></tr>"
				}
				$("#memberListTab tbody").html(listHTML)	
			}).catch(function(err){
				console.log(err)
			})
		})
	});
	var msg = "${msg}"
	if(msg=="삭제완료"){
		alert(msg+" 이전화면으로 이동합니다.");
		location.href = "${path}/workList.do";
	}
	function delRep(no,workno){
		if(confirm("삭제하시겠습니까?")){
			location.href="${path}/workRepDel.do?no="+no;		
			location.href="${path}/workGanttDetail.do?no="+workno;		
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
            	<div class="col-lg-6 col-sm12 text-lg-start text-sm-start">
             		<button type="button" class="btn" id="toList">
             			<i class="bi bi-list-ul" title="업무리스트로 이동"></i>
             		</button>
             		<c:if test="${sessmem.id eq projectInfo.tlid}">
             		<button type="button" class="btn" id="toApprv">
             			<i class="bi bi-pencil-square" title="결재함으로 이동"></i>
             		</button>
             		</c:if>
             	</div>
             	<div class="col-lg-6 col-sm12 text-lg-end text-sm-end">
             	<c:if test="${ganttDetail.state==0 && sessmem.id eq personInfo.id}">
             		<button class="btn btn-primary" id="req">결재 요청</button>
             	</c:if>
             	<c:if test="${ganttDetail.state==1}"> 
             		<c:choose>
	             		<c:when test="${ganttDetail.apprv==1}">
		             		<span>결재완료</span>
	             		</c:when>
	             		<c:when test="${sessmem.id eq projectInfo.tlid}">
	             			<button class="btn btn-primary" id="rej">결재 승인</button>
	             			<button class="btn btn-danger" id="apprv">결재 반려</button>
	             		</c:when>
		             	<c:otherwise>
		             		<span>결재진행중...</span>
		             	</c:otherwise> 	
	             	</c:choose>
             	</c:if>
             	<c:if test="${ganttDetail.state==0 && sessmem.id eq personInfo.id}">
            		<button type="button" id="more" class="btn"	data-bs-toggle="dropdown"
            			aria-expanded="false">
            			<i class="bi bi-three-dots"></i>
            		</button>
            		<ul class="dropdown-menu">
				    <li><a class="dropdown-item" id="callendarBtn">캘린더 추가</a></li>
				    <li><a class="dropdown-item" id="memBtn" data-bs-toggle="modal" data-bs-target="#inviteModal">추가 담당자 초대</a></li>
				    <!-- 
				    <li><a class="dropdown-item" id="upt">수정</a></li>
				    <li><a class="dropdown-item" id="del">삭제</a></li>
				     -->
				  </ul>
				  </c:if>
            	</div> 
           </div>
            <!-- 멤버 초대  모달창 -->
		<div class="modal fade" id="inviteModal" tabindex="-1" style="display: none;" aria-hidden="true">
          <div class="modal-dialog modal-dialog-scrollable" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title fw-bold" id="modalScrollableTitle">추가 담당자 초대</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
          		<div class="my-4 row">
              	<div class="col-6"> </div>
              	<div class="col-6"> 	
              	</div>
              	</div>
		        <div class="my-3 row">
			      <div class="table-responsive text-nowrap">
				    <table class="table table-striped" id="memberListTab">
				    <col width="25%">
				    <col width="25%">
				    <col width="25%">
				    <col width="25%">
				      <thead>
				        <tr>
				          <th><input type="checkbox"></th>
				          <th>부서명</th>
				          <th>직책</th>
				          <th>담당파트</th>
				          <th>이름</th>
				        </tr>
				      </thead>
				      <tbody class="table-border-bottom-0">
				      </tbody>
				    </table>
				  </div>
			          <!-- Basic Pagination -->
		          <nav id="pagination" aria-label="Page navigation">
		            <ul class="pagination pagination-sm justify-content-end">
		            </ul>
		          </nav>
              	</div>      
		         <div class="my-3 row">
		         	<div class="col-10"> </div>
			         <div class="col-2 d-flex justify-content-end">
			         <button id="plusBtn" type="button" class="btn btn-sm btn-info">추가</button>
			         </div>
		         </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">닫기</button>
                <button id="regBtn" type="button" class="btn btn-primary">저장</button>
              </div>
            </div>
          </div>
        </div>
	<!-- /멤버 초대  모달창 -->
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
                  <input type="text" class="form-control" name="progress"
                  value="<fmt:formatNumber value='${ganttDetail.progress }' type='percent'/>"
                  disabled readonly>     
               	  </div>
                </div>
                <div class="mb-3">
                  <label class="form-label" for="basic-default-cont">내용</label>
                  <textarea
                  	name="cont"
                    id="basic-default-cont"
                    class="form-control"
                    style="height: 300px;"
                    disabled readonly
                  >${ganttDetail.description}</textarea>
                </div>
                <!-- 
                <div class="mb-3">
                 <label>첨부파일</label>
                 <input id="downFile"  value="${work.fno}" type="text" class="form-control" placeholder="첨부 입력" required>
                </div>
                <div class="mb-3">
                 <label for="formFile" class="form-label">${empty work.fname?'첨부 파일을 선택하세요':'수정시 선택'}</label>
                 <input type="file" name="report" class="custom-file-input" id="formFile" />
                </div>
                <script type="text/javascript">
					  $(".custom-file-input").on("change",function(){
				        	$(this).next(".custom-file-label").text($(this).val())
				        })  
				  </script>
				-->	
              </form>
          </div>
          <!-- 답글 입력부분 -->
          <hr>
          <c:if test="${ganttDetail.state!=1}">
          	<div class="card-body">
          		<form id="frm02" method="post" action="${path}/workRepIns.do" enctype="multipart/form-data">
               		<input type="hidden" name="id" value="${sessmem.id}">
               		<input type="hidden" name="workno" value="${ganttDetail.id}">
              	<label for="repContent" class="form-label">답글 작성</label>
              	<div class="repList2">
                <textarea class="form-control" name="cont" id="repContent"
                   	rows="3" style="height:100px;"></textarea>
                <div class="mb-3">
                 <label for="formFile" class="custom-file-label">파일첨부</label>
                 <input type="file" name="report" class="form-control" id="formFile" />
                </div>
                   <button type="button" class="btn btn-secondary" id="regRep">등록</button>
                </div>
                </form>
              </div>
              <hr>
          </c:if>
            <!-- 답글 출력부분 -->
          	<div class="card-body">
          	 <c:forEach var="rep" items="${workrep}" varStatus="status">	
              <div class="repList">
              	<input type="hidden" name="no" value="${rep.no }">
                <label class="form-label">${rep.id } (${rep.regdte })</label>
                <button type="button" class="btn" id="delRep" 
                	onclick="delRep(${rep.no},${rep.workno})">
                	<i class="bi bi-x"></i></button>     
                <textarea id="reps" class="form-control" 
                	rows="3" style="height:80px;" disabled readonly>${rep.cont}
                </textarea>
                <c:if test="${fileInfo[status.index].fname != null}">
                 <div class="input-group mb-3">
    				<div class="input-group-prepend">
    					<button class="btn btn-outline-secondary" type="button" id="downFile" value="${fileInfo[status.index].fno}">
    						<i class="bi bi-download"></i>
    					</button>
    				</div>
    				<input type="text" class="form-control" value="${fileInfo[status.index].fname}" aria-describedby="basic-addon1" disabled readonly>
  				</div>  
                </c:if>
              </div>
              <br>
             </c:forEach>
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