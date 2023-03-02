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
<title>조직도 관리</title>

<style>
   td{text-align:center;}
   select{
      width:500px;
      height:40px;
      font-size:20px;
      border-radius:5px;
      border:2px solid;
   }
   .card.mb-4{
      padding-left: 3rem !important;
      padding-right: 3rem !important;
   }
   .idChk{
      display:flex;
   }
   #dnameChk{
      width:120px;
   }
   .deptidChkCla{
      display:flex;
   }
   #deptidChk{
      width:120px;
   }
</style>
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
	$("#menu-item-admin").addClass('active open');	
	$("#menu-item-admin-organization").addClass('active');
      var msg = "${msg}"
      if(msg!=""){
         alert(msg)
      }
      if(msg=="부서추가!" || msg=="삭제완료!"){
  		location.href = "${path}/superDeptList.do";
  	
  	  }
      $("#regBtn").click(function(){
         if($("#dname").val()==""){
            alert("부서명을 입력하세요.");
            $("#dname").focus();
            return false;
         }
         
         var dnameChkVal = $("#dnameChk").val();
         if(dnameChkVal == "N" ){
            alert("중복확인 버튼을 눌러주세요.");
            return false;
         }else if(dnameChkVal == "Y"){
            $("#frm02").submit();
         }
         
      });
 
   });
   function goDelete(deptid){
	   console.log("버튼누름")
	   if(confirm("부서를 삭제하시겠습니까?")){
	   		location.href="${path}/deleteDept.do?deptid="+deptid
	   }
	}
   function fn_dnameChk(){
      console.log("버튼누름")
      $.ajax({
         url : "${path}/dnameChk.do",
         type : "post",
         data : "dname="+$("#dname").val(),
         dataType:"json",
         success : function(data){
            if(data.dnameCheck != null){
               alert("중복된 부서명입니다.");
            }else if(data.dnameCheck == null){
               $("#dnameChk").attr("value", "Y");
               alert("등록가능한 부서명입니다.");
            }
         }
      })
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
            <br><br><br>
            <div class="row">
              <div style="float:left;">
               <h4 class="fw-bold py-3 mb-4">조직도 관리 > <small class="text-muted">부서를 추가하고, 삭제할 수 있습니다</small></h4>
              </div>
            </div><br>
             <!-- Basic Bootstrap Table -->
              <div class="card mb-4 pb-3">
              <br>
                  <div style="float:;">
                   <button style="width:15%;height:40px;font-size:20px;" data-bs-toggle="modal" data-bs-target="#largeModal" type="button" class="btn btn-primary">부서 추가</button>
               </div>
                <div style="font-size:20px;font-weight:bold;" class="table-responsive text-nowrap">
                <form id="frm01">
                   <input type="hidden" name="curPage" value="${sch.curPage}"/>
                </form>
                <br>
                  <table class="table">
                    <thead>
                      <tr>
                        <th style="font-size:20px;font-weight:bold;text-align:center;">부서코드</th>
                        <th style="font-size:20px;font-weight:bold;text-align:center;">부서명</th>
                        <th style="font-size:20px;font-weight:bold;text-align:center;">설정</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                      <c:forEach var="superdept" items="${list}">
                      <tr>
                        <td>
                          <c:if test="${superdept.level>1}">      
                         <c:forEach begin="2" end="${superdept.level}">
                         &nbsp;&nbsp;&nbsp;ㄴ
                      </c:forEach>  
                     </c:if>
                          ${superdept.deptid}
                        </td>
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>${superdept.dname}팀</strong></td>               
                        <td>
                           <button onclick="goDelete('${superdept.deptid}')" type="button" class="btn btn-primary">삭제</button>
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
              <br><br>
              <!--/ Basic Bootstrap Table -->
           <div class="modal fade" id="largeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
           <div class="modal-dialog modal-dialog-centered" role="document">
             <div class="modal-content">
               <div class="modal-header">
                 <h5 class="modal-title" id="exampleModalLabel3">부서추가</h5>
                 <button
                     type="button"
                     class="btn-close"
                     data-bs-dismiss="modal"
                     aria-label="Close"
                    ></button>
               </div>
               <div class="modal-body">
               <form id="frm02" class="form" action="${path}/insertDept.do" method="post">
                 <div class="row">
                      <div class="col mb-3">
                       <label for="nameWithTitle" class="form-label">부서명</label>
                       <div class="idChk">
                        <input
                          type="text"
                          name="dname"
                          id="dname"
                          class="form-control"
                          placeholder="부서명을 입력하세요"
                        />
                        <button class="btn btn-primary dnameChk" type="button" id="dnameChk" onclick="fn_dnameChk()" value="N">중복확인</button>
                       </div>
                      </div>
                     </div>
                 <div class="row">
                  <div class="col">
                  <label for="nameWithTitle" class="form-label">상위부서명</label>
                     <select class="select2 form-select" name="parentDept" id="parentDept">
				    	<option value="">상위부서선택</option>
				    	<option value="">상위부서없음</option>
				    	<c:forEach var="pd" items="${getParentDeptCom}">
				    	<option value="${pd.key}">${pd.val}</option>
				    	</c:forEach>
				    </select>
                  </div>
                 </div>
                 <br>
                 
         	        <button style="margin-right:220px" id="regBtn" type="button" class="btn btn-primary">등록</button>
                </form> 
               </div>
             </div>
           </div>
         </div>
             
            </div>
            <!-- / Content -->

            <div class="content-backdrop fade"></div>
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