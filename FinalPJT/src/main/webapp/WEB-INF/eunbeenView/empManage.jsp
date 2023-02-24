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
<title>사원 관리</title>

<style>
.card.mb-4{
	padding-left: 3rem !important;
	padding-right: 3rem !important;
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
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		// $("#").addClass('active open');	
		// $("#").addClass('active');	
		// 메인 메뉴 아이디랑 하위 메뉴 아이디를 넣우세요.
		$("[name=ename]").val("${sch.ename}");
		$("[name=dname]").val("${sch.dname}");
		$("[name=hiredate]").val("${sch.hiredate}");	
		
	});
	function delEmp(){
		location.href="${path}/.do"
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
 
           <h4 class="fw-bold py-3 mb-4">사원조회 및 검색</h4>
           
           <div class="card mb-4 pb-3"><br>
           <div class="row">
			<div class="col" style="border-left:none;border-right:none;">
			<form id="frm01" method="post">
				<div style="margin-top:15px;" class="row text-center">
					<div class="col">
						<span style="font-size:18px;font-weight:bold;">사원명 </span>
						<input name="ename" value="${sch.ename}" type="text" class="form-control" placeholder="사원명 입력">
					</div>
					<div class="col">
						<span style="font-size:18px;font-weight:bold;">부서명 </span>
						<input name="dname" value="${sch.dname}" type="text" class="form-control" placeholder="부서명 입력">
					</div>
					<div class="col">
						<span style="font-size:18px;font-weight:bold;">입사일 </span>
						<input name="hiredate" value="${sch.hiredate}" type="date" class="form-control">
					</div>
				</div>
				<div style="margin-top:30px;margin-bottom:15px;" class="row text-center">
					<div class="col center">
						<button style="color:white;font-weight:bold;width:15%;height:50px;border-radius:5px;" type="submit" class="btn btn-primary">검색</button>
                   		<button style="color:white;font-weight:bold;width:15%;height:50px;border-radius:5px;" data-bs-toggle="modal" data-bs-target="#largeModal" type="button" class="btn btn-primary">신규 계정 생성</button>
					</div>
				</div>
			</form>
			</div>
	</div>
           	<div style="font-size:20px;font-weight:bold;" class="table-responsive text-nowrap">
                <form id="frm01">
                </form>
                <br>
                  <table class="table">
                    <thead>
                      <tr>
                        <th style="font-size:20px;font-weight:bold;text-align:center;">사원명</th>
                        <th style="font-size:20px;font-weight:bold;text-align:center;">소속부서</th>
                        <th style="font-size:20px;font-weight:bold;text-align:center;">입사일</th>
                        <th style="font-size:20px;font-weight:bold;text-align:center;">이메일</th>
                        <th style="font-size:20px;font-weight:bold;text-align:center;">전화번호</th>
                        <th style="font-size:20px;font-weight:bold;text-align:center;">설정</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                    <c:forEach var="ed" items="${elist}">
                      <tr>
                        <td>
                          ${ed.ename}
                        </td>
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i>${ed.dname}팀</td>               
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i>${ed.hiredate}</td>               
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i>${ed.id}</td>               
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i>${ed.cell}</td>               
                        <td>
                           <button type="button" class="btn btn-primary">설정</button>
                           <button onclick="goDelete('${ed.ename}')" type="button" class="btn btn-primary">삭제</button>
                        </td>
                      </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
              
              </div><br>
           
         	</div>
         	  <!-- /card -->
            </div>
            <!-- / Content -->
			<div class="modal fade" id="largeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	           <div class="modal-dialog modal-dialog-centered" role="document">
	             <div class="modal-content">
	               <div class="modal-header">
	                 <h5 class="modal-title" id="exampleModalLabel3">계정생성 > <small class="text-muted">새로운 사원의 정보 입력</small></h5>
	                 <button
	                     type="button"
	                     class="btn-close"
	                     data-bs-dismiss="modal"
	                     aria-label="Close"
	                    ></button>
	               </div>
	               <div class="modal-body">
	               <form id="frm02" class="form" action="${path}/insertEmp.do" method="post">
	               		<div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-ename">사원명</label>
                          <div class="col-sm-10">
                          	<input
	                          type="text"
	                          name="ename"
	                          id="basic-default-name ename"
	                          class="form-control"
	                          placeholder="사원명을 입력하세요"
	                        />
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-id">이메일</label>
                          <div style="text-align:center;" class="col-sm-10">
                          <div style="float:left;display:inline-block">
                          	<input
	                          type="text"
	                          name="id"
	                          id="basic-default-name id"
	                          class="form-control"
	                          placeholder="이메일을 입력하세요"
	                        />
	                       </div>
	                       <div style="display:inline-block">
	                         <button class="btn btn-primary emailChk" type="button" id="emailChk" onclick="" value="N">중복확인</button>
                           </div>
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-pass">비밀번호</label>
                          <div class="col-sm-10">
                          	<input
	                          type="text"
	                          name="pass"
	                          id="basic-default-name pass"
	                          class="form-control"
	                          placeholder="비밀번호를 입력하세요"
	                        />
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-cell">핸드폰번호</label>
                          <div style="text-align:center;" class="col-sm-10">
                          <div style="float:left;display:inline-block">
                          	<input
	                          type="text"
	                          name="cell"
	                          id="basic-default-name cell"
	                          class="form-control"
	                          placeholder="핸드폰번호를 입력하세요"
	                        />
	                      </div>
	                      <div style="display:inline-block">
	                        <button class="btn btn-primary cellChk" type="button" id="cellChk" onclick="" value="N">중복확인</button>	                        
                          </div>
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-deptid">소속부서</label>
                          <div class="col-sm-10">
                          	<select name="deptid" id="deptid" class="select2 form-select">
						    	<option value="">소속부서선택</option>
						    </select>
                          </div>
                        </div>
	         	        <button style="margin-right:220px" id="regBtn" type="button" class="btn btn-primary">등록</button>
	                </form> 
	               </div>
	             </div>
	           </div>
             
            </div>
	

           
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