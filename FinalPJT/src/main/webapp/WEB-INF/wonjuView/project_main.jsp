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
.nav-item.nav-link{
	padding-right: 1rem !important;
}
#gantt{
	height: 400px;
}
#ganttTab thead{
	background-color: #3db9d3;
	text-align: center;
	font-weight: bolder;
}
#ganttTab th{color:white !important;}
#ganttTab tbody td:first-child {
	text-align: left !important;
}
#ganttTab tbody td{
	text-align: center;
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
		var projectName="${projectInfo.subject}" // 모델데이터
		$("#subject").text(projectName)
		var prjno = "${projectInfo.prjno}"
		console.log(prjno)
		console.log(typeof prjno)
		
		// 모달창 input 추가
		$("#plusBtn").click(function(){
			$("#plusMem").append("<div class='col-6'><label for='part' "+
			"class='col-form-label'>파트</label><input class='form-control'"+
			"type='text' name='part' placeholder='담당파트 입력' id='part'></div>"+
			"<div class='col-6'><label for='owner' class='col-form-label'>"+
			"담당자이메일</label><input class='form-control' type='text' name='owner'"+
			"placeholder='담당자 이메일입력' id='owner'></div>")
		})
		
		// 모달창 등록버튼
		$("#regBtn").click(function(){	
			// 멤버 초대 input의 갯수
			var inputlen=$("#plusMem").find("input.form-control").length
			var validCnt = 0;
			// 만들어진 input에 값이 없으면 테두리 빨간색으로 표시 validCnt증가 ==> 유효성에서 validCnt가 초기값인 0이 아니면 ajax 호출 불가
			for(let i=0;i<inputlen;i++){ 
				if($("#plusMem").find("input.form-control").eq(i).val()==''){
					$("#plusMem").find("input.form-control").eq(i).css('border-color','#ff3e1d');
					validCnt++;
				}else{
					$("#plusMem").find("input.form-control").eq(i).css('border-color','');
				}
			}
			 $("#insPmFrm").addClass('was-validated')
			// 멤버 초대는 append로 만들어져서 선택자로 접근이 안되서 반복문 돌려서 따로 qstr을 만들어줌
			var ownersPartsQstr=""
			for(let i=0;i<inputlen/2;i++){
				ownersPartsQstr+="&owners="+$("#plusMem").find("input#owner").eq(i).val()
				+"&parts="+$("#plusMem").find("input#part").eq(i).val()
			}
			var qstr = "prjno="+prjno+ownersPartsQstr
			console.log(qstr)
			if(validCnt==0){
				$.ajax({
					url:"${path}/inviteProMem.do",
					type:"post",
					data:qstr,
					dataType:"json",
					success:function(data){
						console.log(data)
						if(data.msg=='등록성공'){
							alert("멤버 추가 되었습니다")
							location.reload()
						}
					},
					error:function(err){
						console.log(err)
					}
				})
			}else{
				alert("빈칸을 입력해주세요")
			}
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
 
         <!--   <h4 class="fw-bold py-3 mb-4">프로젝트 > <small class="text-muted">프로젝트 이름</small></h4> -->
           
           <div class="card mb-4 pb-3">
	           <div class="row">
		           <div class="col-8">
		           <h3 id="subject"class="fw-bold py-3 mt-4 pt-3">프로젝트 이름</h3>
		           </div>
		           <div class="col-4 py-3 mt-4 mb-4 d-flex justify-content-end">
		            <button type="button" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#inviteModal">멤버초대</button>&nbsp;&nbsp;&nbsp;
		            <button type="button" class="btn btn-sm btn-secondary">설정</button>
		           </div>
	           </div>
	<!-- 멤버 초대  모달창 -->
		<div class="modal fade" id="inviteModal" tabindex="-1" style="display: none;" aria-hidden="true">
          <div class="modal-dialog modal-dialog-scrollable" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title fw-bold" id="modalScrollableTitle">멤버 초대</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
          		<div class="my-4 row">
              	<div class="col-6"> </div>
              	<div class="col-6"> 
              	 		<!-- 검색어 ajax로 넘기기 -->
			          <div class="input-group">
			            <span class="input-group-text"><i class="tf-icons bx bx-search"></i></span>
			            <input type="text" name="keyword" value="${param.keyword }" class="form-control" placeholder="검색어를 입력하세요">
			          </div>
			  	
              	</div>
              	</div>
		        <div class="my-3 row">
			        <div class="table-responsive text-nowrap">
					    <table class="table table-striped">
					    <col width="20%">
					    <col width="20%">
					    <col width="20%">
					    <col width="40%">
					      <thead>
					        <tr>
					          <th>부서명</th>
					          <th>이름</th>
					          <th>직책</th>
					          <th>이메일</th>
					        </tr>
					      </thead>
					      <tbody class="table-border-bottom-0">
					        <tr>
					        <td>마케팅</td><td>홍길동</td><td>사원</td><td>wjekr@gmail.com</td>
					        </tr>
					        <tr>
					        <td>재무</td><td>홍설</td><td>사원</td><td>eeesr@gmail.com</td>
					        </tr>
					       
					      </tbody>
					    </table>
					  </div>
			          <!-- Basic Pagination -->
			          <nav id="pagination" aria-label="Page navigation">
			            <ul class="pagination pagination-sm justify-content-end">
			              <li class="page-item prev">
			                <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevron-left"></i></a>
			              </li>
			              <li class="page-item">
			                <a class="page-link" href="javascript:void(0);">1</a>
			              </li>
			              <li class="page-item">
			                <a class="page-link" href="javascript:void(0);">2</a>
			              </li>
			              <li class="page-item active">
			                <a class="page-link" href="javascript:void(0);">3</a>
			              </li>
			              <li class="page-item next">
			                <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevron-right"></i></a>
			              </li>
			            </ul>
			          </nav>
              	</div>
              	<form id="insPmFrm">
		          <div class="my-3 row" id="plusMem">
			          <div class="col-6">
			          <label for="part" class="col-form-label">파트</label>
			            <input class="form-control" type="text" name="part" placeholder="담당파트 입력" id="part">
			         </div>
			          <div class="col-6">
			          <label for="owner" class=" col-form-label">담당자이메일</label>
			            <input class="form-control" type="text" name="owner" placeholder="담당자 이메일입력" id="owner">
			         </div>
		          </div>
		    	</form>
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
		        <div class="nav navbar-nav me-auto d-flex flex-row">
		          <a class="nav-item nav-link active" href="javascript:void(0)">진행상황</a>
		          <a class="nav-item nav-link" >|</a>
		          <a class="nav-item nav-link" href="javascript:void(0)">업무</a>
		          <a class="nav-item nav-link">|</a>
		          <a class="nav-item nav-link" href="javascript:void(0)">드라이브</a>
		          <a class="nav-item nav-link">|</a>
		          <a class="nav-item nav-link" href="javascript:void(0)">리스크 관리</a>
		        </div>
				
				<hr class="mx-0">
	         
	          <div class="row my-3 px-sm-3">
	            <span><strong>마감 D-27&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;진행률 0%</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	             진행 0, 완료 0</span>
	          </div>
	          
			<div id="gantt" class="row my-3 px-sm-3">
			<div class="col my-3"><span><strong>담당 업무 등록</strong></span></div>
		    <jsp:include page="/gantt.jsp"></jsp:include>
		   </div>
		   
		    <div class="row my-3 px-sm-3 mt-5">
		    <div class="col my-3"><span><strong>담당 업무 확인</strong></span></div>
		    <table id="ganttTab" class="table table-hover">
		      <thead>
		        <tr>
		          <th>업무명</th>
		          <th>담당자</th>
		          <th>시작일자</th>
		          <th>종료일자</th>
		          <th>진행률</th>
		        </tr>
		      </thead>
		      <tbody class="table-border-bottom-0">
		        <c:forEach var="g" items="${ganttInfo }">
		        <tr>
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