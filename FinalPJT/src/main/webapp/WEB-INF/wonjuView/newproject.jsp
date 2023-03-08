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
	padding-left: 15rem !important;
	padding-right: 15rem !important;
}
th{
	text-align: center !important;
}
tbody td{
	text-align: center;
	font-size: 0.8rem;
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
		$("#menu-item-project-newproject").addClass('active');	
		
		// 초기에 멤버 출력되도록 멤버 리스트 empAjax(empqstr)
		var empqstr ="keyword="+$("[name=keyword]").val()
		empAjax(empqstr)
		
		$("[name=keyword]").keyup(function(){
			if(event.keyCode==13){
				empqstr ="keyword="+$("[name=keyword]").val()
				empAjax(empqstr)
			}
		})
		
		// 등록 버튼
		$("#regBtn").click(function(){	
			// 멤버 초대 input의 갯수
			var inputlen=$("#plusMem").find("input.form-control").length
			var validCnt = 0;
			// 만들어진 input에 값이 없으면 테두리 빨간색으로 표시 validCnt증가
			// ==> 유효성에서 validCnt가 초기값인 0이 아니면 ajax 호출 불가
			for(let i=0;i<inputlen;i++){ 
				if($("#plusMem").find("input.form-control").eq(i).val()==''){
					$("#plusMem").find("input.form-control").eq(i).css('border-color','#ff3e1d');
					validCnt++;
				}else{
					$("#plusMem").find("input.form-control").eq(i).css('border-color','');
				}
			}

			// 날짜 비교를 위해 날짜형 데이터로 변환
			var regdte = new Date($("[name=regdte]").val())
			var deadline = new Date($("[name=deadline]").val())
			// form에 부트스트랩 유효성 클래스검사 추가
			 $("#insProFrm").addClass('was-validated')
			 $("#insPmFrm").addClass('was-validated')
			// 멤버 초대는 append로 만들어져서 선택자로 접근이 안되서 반복문 돌려서 따로 qstr을 만들어줌
			var ownersPartsQstr=""
			for(let i=0;i<inputlen/2;i++){
				ownersPartsQstr+="&owners="+$("#plusMem").find("input#owner").eq(i).val()
				+"&parts="+$("#plusMem").find("input#part").eq(i).val()
			}
			if($("[name=deptid]").val()!=null && $("[name=subject]").val()!=''&& validCnt==0
				&& $("[name=deadline]").val()!='' && regdte<deadline && $("[name=regdte]").val()!=''){
				// 유효성을 다 통과하면 qstr만들어서 ajax
				var regdteVal=$("[name=regdte]").val()
				var deptidVal=$("[name=deptid]").val()
				var subjectVal=$("[name=subject]").val()
				var deadlineVal=$("[name=deadline]").val()
				var openStatusVal=$("[name=openStatus]").val()
				var tlidVal=$("[name=tlid]").val()
				
				var qstr = "tlid="+tlidVal+"&deptid="+deptidVal+"&regdte="+regdteVal+"&subject="+subjectVal+"&deadline="
				+deadlineVal+"&openStatus="+openStatusVal+ownersPartsQstr
				
				console.log(qstr)
				insAjax(qstr)
			}else if(regdte<deadline){
				$("#deadCk").hide()
				$("[name=deadline]").css('border-color','');
			}else if(regdte>=deadline){
				$("#deadCk").show()
				$("[name=deadline]").css('border-color','#ff3e1d');
				$("#deadCk").text('종료일자는 시작일자보다 빠를수 없습니다')
			}
			
						
		})
		// input 추가
		$("#plusBtn").click(function(){
			$("#plusMem").append("<div class='col-6'><label for='part' "+
				"class='col-form-label'>파트</label><input class='form-control'"+
				"type='text' name='part' placeholder='담당파트 입력' id='part'></div>"+
				"<div class='col-6'><label for='owner' class='col-form-label'>"+
				"담당자이메일</label><input class='form-control' type='text' name='owner'"+
				"placeholder='담당자 이메일입력' id='owner'></div>")
		})

		// 이전 페이지로 이동
		$("#canBtn").click(function(){	
			//location.href="" // 내 프로젝트 페이지로 이동
		})

	});

   function insAjax(qstr){
	   $.ajax({
			url:"${path}/newProject.do",
			type:"post",
			data:qstr,
			dataType:"json",
			success:function(data){
				console.log(data.msg)
				console.log(data.prjno)
				if(data.msg=='등록성공'){
					if(confirm("새로운 프로젝트로 이동하시겠습니까?")){
						location.href="/projectMain.do?prjno="+data.prjno; // 만들어진 페이지로 이동 주소?prjno=prjno
					}else{
						location.reload()
					}
				}
			},
			error:function(err){
				console.log(err)
			}
		})
   }
   function empAjax(empqstr){
	   $.ajax({
		   url:"${path}/empInfoList.do",
			type:"post",
			data:empqstr,
			dataType:"json",
			success:function(data){
				console.log(data.sch)
				var addHTML=""
				$.each(data.empList,function(index,emp){
					addHTML+="<tr>"
					addHTML+="<td>"+emp.dname+"</td>"
					addHTML+="<td>"+emp.ename+"</td>"
					addHTML+="<td>"+emp.job+"</td>"
					addHTML+="<td>"+emp.id+"</td>"
					addHTML+="</tr>"
				})
				$("#empTab tbody").html(addHTML)

				 var pagination = $('#pagination ul.pagination');
				 pagination.empty(); // ajax 시작시 초기화
				  
				  // 이전 페이지로 이동하는 버튼
				  pagination.append($('<li class="page-item prev"></li><a class="page-link" href="javascript:goPage(' 
						    	+ (data.sch.startBlock - 1) + ');"><i class="tf-icon bx bx-chevron-left"></i></a>'));
				  // 페이지 번호를 생성하는 반복문
				  for (var i = 1; i <= data.sch.endBlock; i++) {
				    var pageLi = $('<li class="page-item"></li>');
				    var pageLink = $('<a class="page-link" href="javascript:goPage('+ i +');">' + i + '</a>');
				    if (i === data.sch.curPage) {
				      pageLi.addClass('active');
				    }
				    pageLi.append(pageLink);
				    pagination.append(pageLi);
				  }
				  // 다음 페이지로 이동하는 버튼
				  pagination.append($('<li class="page-item next"></li><a class="page-link" href="javascript:goPage(' 
						  + (data.sch.endBlock + 1) + ');"><i class="tf-icon bx bx-chevron-right"></i></a>'));

				
			},
			error:function(err){
				console.log(err)
			}
	   })
   }
   function goPage(cnt){
		$("[name=curPage]").val(cnt);
		empqstr ="keyword="+$("[name=keyword]").val()+"&curPage="+$("[name=curPage]").val()
		empAjax(empqstr)
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
 
           <h4 class="fw-bold py-3 mb-4">프로젝트 > <small class="text-muted">프로젝트 등록</small></h4>
           
           <div class="card mb-4 pb-3">
    
		      <h5 class="card-header pt-5 fw-bold">프로젝트 등록</h5>
		      <p class="text-muted mb-3 px-4" style="font-size: 0.5rem;">
                ※ 항목을 채우고 등록 버튼을 눌러 새로운 프로젝트를 시작해보세요.<br>
                ※ 새로 등록한 프로젝트는 내 프로젝트에서 확인할 수 있습니다.<br>
                ※ 전체 공개는 모두가 볼 수 있는 프로젝트이고, 멤버 공개는 초대된 멤버만 볼 수 있는 프로젝트입니다.<br>
              </p>
		      <div class="card-body">
		       <!-- 등록 form  -->
		      <form class="needs-validation" id="insProFrm">
		        <div class="mb-3 row">
		          <label for="html5-text-input" class="col-md-2 col-form-label">카테고리</label>
		          <div class="col-md-10">
			           <select id="html5-text-input" class="form-select" name="deptid" required="required">
			            <option selected disabled value>카테고리를 선택하세요</option>
			            <c:forEach var="dept" items="${deptCom}">
				    	<option value="${dept.deptid }">${dept.dname}</option>
				    	</c:forEach>
			          </select>
			          <div class="invalid-feedback">
					      카테고리를 선택해주세요
					  </div>
		          </div>
		        </div>
		        <div class="mb-3 row">
		          <label for="html5-search-input" class="col-md-2 col-form-label">프로젝트 명</label>
		          <div class="col-md-10">
		            <input class="form-control" type="text" name="subject" placeholder="프로젝트 이름을 입력하세요" id="html5-search-input" required="required">
		           	<div class="invalid-feedback">
					      프로젝트 명을 입력해주세요
					  </div>
		          </div>
		        </div>
		        <div class="mb-3 row">
		          <label for="html5-search-input" class="col-md-2 col-form-label">담당PM</label>
		          <div class="col-md-10">
		            <input class="form-control" type="text" value="김관리" placeholder="" id="html5-search-input" readonly="readonly">
		          	<input type="hidden" name="tlid" value="imadmin@gmail.com"><!-- 세션에 있는 pm 아이디 -->
		          </div>
		        </div>
		         <div class="mb-3 row">
		          <label for="startDate" class="col-md-2 col-form-label">시작 일자</label>
		          <div class="col-md-10"> 
		            <input class="form-control" name="regdte" id="startDate" type="date" value="" required="required">
		         	 <div class="invalid-feedback" id="regCk">
					    프로젝트 시작 일자를 입력해주세요
					  </div>
		          </div>
		        </div>
		         <div class="mb-3 row">
		          <label for="endDate" class="col-md-2 col-form-label">종료 일자</label>
		          <div class="col-md-10">
		            <input class="form-control validCk" name="deadline" type="date" value="" id="endDate" required="required">
		          	 <div class="invalid-feedback" id="deadCk">
					    프로젝트 종료 일자를 입력해주세요
					  </div>
		          </div>
		        </div>
		        <div class="mb-3 row">
		          <label for="html5-search-input" class="col-md-2 col-form-label">공개 여부</label>
		          <div class="col-md-10">
			          <div class="form-check form-check-inline">
			              <input class="form-check-input" type="radio" name="openStatus" id="inlineRadio1" value="0" checked="checked">
			              <label class="form-check-label" for="inlineRadio1">전체 공개</label>
			            </div>
		          	  <div class="form-check form-check-inline">
		                  <input class="form-check-input" type="radio" name="openStatus" id="inlineRadio2" value="1">
		                  <label class="form-check-label" for="inlineRadio2">멤버 공개</label>
		               </div>
		          </div>
		        </div>
		          <hr class="my-sm-5">
		        <h5 class="card-header pt-5 fw-bold">멤버 초대</h5> 
		        <p class="text-muted mb-3 px-4" style="font-size: 0.5rem;">
                ※ 부서명, 사원명으로 검색하여 프로젝트에 추가할 수 있습니다.<br>
              </p>
              	<div class="my-4 row">
              	<div class="col-6"> </div>
              	<div class="col-6"> 
              	 		<!-- 검색어 ajax로 넘기기 -->
			          <div class="input-group">
			            <span class="input-group-text"><i class="tf-icons bx bx-search"></i></span>
			            <input type="hidden" name="curPage" value="${sch.curPage }">
			            <input type="text" name="keyword" value="${sch.keyword }" class="form-control" placeholder="부서 또는 사원명으로 검색">
			          </div>
			  	
              	</div>
              	</div>
		        <div class="my-3 row">
		        <div class="table-responsive text-nowrap">
				    <table class="table table-striped" id="empTab">
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
				      </tbody>
				    </table>
				  </div>
		          <!-- Basic Pagination -->
		          <nav id="pagination" aria-label="Page navigation">
		      	  <ul class="pagination pagination-sm justify-content-end">
		            <!--   <li class="page-item prev">
		                <a id="pageStart"class="page-link" href="javascript:goPage(${sch.startBlock-1 });"><i class="tf-icon bx bx-chevron-left"></i></a>
		              </li>
		      		   <c:forEach var="cnt" begin="${sch.startBlock }" end="${sch.endBlock }"> 
					  <div id="pagepage">
					  <li id="pageLi" class="page-item"> 
					  <a id="pageCnt" class="page-link" href="javascript:goPage(${cnt });">${cnt }</a></li>
					  </div>
					   </c:forEach>
		              <li class="page-item next">
		                <a class="page-link" href="javascript:goPage(${sch.endBlock+1 });"><i class="tf-icon bx bx-chevron-right"></i></a>
		              </li> 
		              -->
		            </ul>
		          </nav>
		          <!--/ Basic Pagination -->
		   		
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
		        <div class="card-footer">
			        <div class="d-flex justify-content-center">
			        <button id="regBtn" type="button" class="btn btn-primary">등록</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			        <button id="canBtn" type="button" class="btn btn-secondary">취소</button>
			        </div>
		        </div>
		        </form>
		        <!-- form 끝 -->
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