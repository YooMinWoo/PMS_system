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
var idChkVal = $("#idChk").val;
var cellChkVal = $("#cellChk").val;
idChkVal = false;
cellChkVal = false;
	$(document).ready(function(){
		
		$("#menu-item-admin").addClass('active open');	
		$("#menu-item-admin-hr").addClass('active');
		$("[name=sename]").val("${sch.sename}");
		$("[name=dname]").val("${sch.dname}");
		$("[name=job]").val("${sch.job}");	
		var msg = "${msg}"
		
		if(msg!=""){
		    alert(msg)
		}
		if(msg=="계정생성 완료!" || msg=="사원삭제 완료!"){
		  	location.href = "${path}/getEmpList.do";
		}
		/*
		$("[name=cell]").keydown(function(){
			cellChkVal = false;
		})
		$("[name=id]").keydown(function(){
			idChkVal = false;
		})
		*/
		$("#regBtn").click(function(){
	         if($("[name=ename]").val()==""){
	            alert("사원명을 입력하세요.");
	            $("[name=ename]").focus();
	            return false;
	         }
	         
	         if($("[name=pass]").val()==""){
		         alert("비밀번호를 입력하세요.");
		         $("[name=pass]").focus();
		         return false;
		     }
	         if($("[name=pass]").val().length > 15){
		         alert("비밀번호는 15자리 이하이여야 합니다.");
		         $("[name=pass]").focus();
		         return false;
		     }
	    
	         if($("[name=deptid]").val()==""){
		         alert("소속부서를 선택하세요.");
		         $("[name=deptid]").focus();
		         return false;
		     }
	         
	         if(idChkVal == false || cellChkVal == false){
	            alert("중복확인 버튼을 눌러주세요.");
	            return false;
	         }else if(idChkVal == true && cellChkVal == true){
	            $("#frm02").submit();
	         }
	         
	      });
		$("#reset").click(function(){
			$("[name=ename]").val("")
			$("[name=id]").val("")
			$("[name=pass]").val("")
			$("[name=cell]").val("")
			$("[name=deptid]").val("")
			$("[name=id]").attr("readonly", false);
			$("[name=cell]").attr("readonly", false);
			idChkVal = false;
			cellChkVal = false
		})
	 
		
	});
	function goAuthSetting(id){
		location.href="${path}/authSetting.do?id="+id
	}	
	function goDelete(id){
		console.log("버튼누름")
		if(confirm(id+"의 계정을 삭제하시겠습니까?")){
			location.href="${path}/deleteEmp.do?id="+id
		}
	}
	function fn_idChk(){
		if(!idChkVal){
			var idReg = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			if(!idReg.test($("input[name=id]").val() )){
			    alert("이메일 형식이 올바르지 않습니다.");
			    $("input[name=id]").focus()
			    return;
			  }
		      console.log("버튼누름")
		      $.ajax({
		         url : "${path}/idChk.do",
		         type : "post",
		         data : "id="+$("[name=id]").val(),
		         dataType:"json",
		         success : function(data){
		            if(data.idCheck != null){
		               alert("중복된 이메일입니다.");
		            }else if(data.idCheck == null){
		            	idChkVal = true;
		               $("[name=id]").attr("readonly", "readonly");
		               alert("등록가능한 이메일입니다.");
		               console.log(idChkVal)
		            }
		         }
		      })
		   
	   }
	}
	function fn_cellChk(){
		if(!cellChkVal){
			var phoneReg = /^01([0|1|6|7|8|9]?-)?([0-9]{3,4}-)?([0-9]{4})$/;
			if(!phoneReg.test($("input[name=cell]").val() ) ) {
	            alert("휴대폰 번호를 확인해주세요(01x-xxxx-yyyy)");
	            $("input[name=cell]").focus()
	            return;
	        }
		      console.log("버튼누름")
		      $.ajax({
		         url : "${path}/cellChk.do",
		         type : "post",
		         data : "cell="+$("[name=cell]").val(),
		         dataType:"json",
		         success : function(data){
		        	 
		            if(data.cellCheck != null){
		               alert("중복된 핸드폰번호입니다.");
		            }else if(data.cellCheck == null){
		            	$("[name=cell]").attr("readonly", "readonly");
		               alert("등록가능한 핸드폰번호입니다.");
		               cellChkVal = true;
		               console.log(cellChkVal)
		            }
		         }
		      })
		}
		
		
	  }
	function goPage(cnt){
	      $("[name=curPage]").val(cnt);
	      $("#frm01").submit()
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
			<form id="frm01" method="get">
			    <input type="hidden" name="curPage" value="${sch.curPage}"/>
				<div style="margin-top:15px;" class="row text-center">
					<div class="col">
						<span style="font-size:18px;font-weight:bold;">사원명 </span>
						<input name="sename" value="${sch.sename}" type="text" class="form-control" placeholder="사원명 입력">
					</div>
					<div class="col">
						<span style="font-size:18px;font-weight:bold;">부서명 </span>
						<input name="dname" value="${sch.dname}" type="text" class="form-control" placeholder="부서명 입력">
					</div>
					<div class="col">
						<span style="font-size:18px;font-weight:bold;">직책명 </span>
						<select class="select2 form-select" name="job" id="job">
						    <option value="">직책선택</option>
						    <c:forEach var="job" items="${jobCom}">
						    <option>${job}</option>
						    </c:forEach>
						</select>
					</div>
				</div>
				<div style="margin-top:30px;margin-bottom:15px;" class="row text-center">
					<div class="col center">
						<button style="color:white;font-weight:bold;width:15%;height:50px;border-radius:5px;" type="submit" class="btn btn-primary">검색</button>
                   		<button style="color:white;font-weight:bold;width:15%;height:50px;border-radius:5px;" data-bs-toggle="modal" data-bs-target="#insertModal" type="button" class="btn btn-primary">신규 계정 생성</button>
					</div>
				</div>
			</form>
			</div>
	</div>
           	<div style="font-size:20px;font-weight:bold;" class="table-responsive text-nowrap">

                <br>
                  <table class="table">
                    <thead>
                      <tr style="background-color:#646EFF;">
                        <th style="font-size:20px;font-weight:bold;text-align:center;color:white;">사원명</th>
                        <th style="font-size:20px;font-weight:bold;text-align:center;color:white;">소속부서</th>
                        <th style="font-size:20px;font-weight:bold;text-align:center;color:white;">직책</th>
                        <th style="font-size:20px;font-weight:bold;text-align:center;color:white;">입사일</th>
                        <th style="font-size:20px;font-weight:bold;text-align:center;color:white;">이메일</th>
                        <th style="font-size:20px;font-weight:bold;text-align:center;color:white;">전화번호</th>
                        <th style="font-size:20px;font-weight:bold;text-align:center;color:white;">설정</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                    <c:forEach var="ed" items="${elist}">
                      <tr>
                        <td>
                          ${ed.ename}
                        </td>
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i>${ed.dname}팀</td>               
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i>${ed.job}</td>               
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i>${ed.hiredate}</td>               
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i>${ed.id}</td>               
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i>${ed.cell}</td>               
                        <td>
                           <button onclick="goAuthSetting('${ed.id}')" type="button" class="btn btn-primary">설정</button>
                           <button onclick="goDelete('${ed.id}')" type="button" class="btn btn-primary">삭제</button>
                        </td>
                      </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
                 <div style="display:flex; justify-content:center;" class="demo-inline-spacing">
              <nav aria-label="Page navigation">
                 <ul class="pagination pagination-lg">
                    <li class="page-item prev">
                       <a class="page-link" href="javascript:goPage(${sch.startBlock-1});"
                                ><i class="tf-icon bx bx-chevrons-left"></i
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
                                ><i class="tf-icon bx bx-chevrons-right"></i
                              ></a>
                       </li>
                    </ul>
                 </nav>
               </div>
              
              </div><br>
           
         	</div>
         	  <!-- /card -->
            </div>
            <!-- / Content -->
			<div class="modal fade" id="insertModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	           <div class="modal-dialog modal-dialog-centered" role="document">
	             <div class="modal-content">
	               <div class="modal-header">
	                 <h5 class="modal-title" id="exampleModalLabel3">계정생성 > <small class="text-muted">새로운 사원의 정보 입력</small></h5>
	                 <button
	                 	id="reset"
	                     type="button"
	                     class="btn-close"
	                     data-bs-dismiss="modal"
	                     aria-label="Close"
	                    ></button>
	               </div>
	               <div class="modal-body">
	               <form id="frm02" class="form" action="${path}/mailSenderNewEmp.do" method="post">
	               		<div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-ename">사원명</label>
                          <div class="col-sm-10">
                          	<input
	                          type="text"
	                          name="ename"
	                          id="basic-default-name"
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
	                          id="basic-default-name"
	                          class="form-control"
	                          placeholder="이메일을 입력하세요"
	                        />
	                       </div>
	                       <div style="display:inline-block">
	                         <button class="btn btn-primary" type="button" id="idChk" onclick="fn_idChk()">중복확인</button>
                           </div>
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-pass">비밀번호</label>
                          <div class="col-sm-10">
                          	<input
	                          type="text"
	                          name="pass"
	                          id="basic-default-name"
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
	                          id="basic-default-name"
	                          class="form-control"
	                          placeholder="010-xxxx-yyyy"
	                        />
	                      </div>
	                      <div style="display:inline-block">
	                        <button class="btn btn-primary" type="button" id="cellChk" onclick="fn_cellChk()" >중복확인</button>	                        
                          </div>
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-deptid">소속부서</label>
                          <div class="col-sm-10">
                          	<select class="select2 form-select" name="deptid" id="deptid">
						    	<option value="">소속부서선택</option>
						    	<c:forEach var="pd" items="${getParentDeptCom}">
						    	<option value="${pd.key}">${pd.val}</option>
						    	</c:forEach>
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