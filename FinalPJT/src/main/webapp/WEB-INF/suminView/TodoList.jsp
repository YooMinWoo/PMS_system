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
		var vm = new Vue({
			el:".container",
			data:{todo:"",todoList:[]},
			methods:{
				schKeyup:function(){
					if(event.keyCode==13){
						this.fetchList(); 
					}
				},
				fetchList:function(){
					this.todoList = [] 
					var url="${path}/todoListAjax.do?todo="+this.todo
					var vm = this; 
					fetch(url).then(function(response){
						return response.json()
					}).then(function(json){
						vm.todoList = json.todoList
						console.log(json.todoList)
					}).catch(function(err){
						console.log(err)
					})
				}
			}
		});	
		$("#search").click()

		
		$("#addBtn").click(function(){
			$("h2").click()
			$("#modalTitle").text("할 일 등록")
			$("#regBtn").show()
			$("#mUptBtn").hide()
		})
		
		$("#regBtn").click(function(){
			if($("[name=todo]").val()==""){
				alert("할 일을 입력하세요")
				$("[name=todo]").focus()
				return
			}
			todoAjax("insTodo.do")
		})
		
		$("#comBtn").click(function(){
			var todoLeng = $("input[name=chk]:checked").length
			if(todoLeng<1){
				alert("할 일을 선택해주세요")
				return
			}
			if(confirm("완료처리하시겠습니까?")){
				for(var idx=0; idx<$("input[name=chk]:checkbox").length; idx++){
					if($("input[name=chk]:checkbox")[idx].checked==true){
						var tno = $("input[name=chk]:checkbox")[idx].value
						stateAjax(tno)
					}
				}
				alert("완료처리가 되었습니다.")
			}
			
		})
		$("#delBtn").click(function(){
			var todoLeng = $("input[name=chk]:checked").length
			if(todoLeng<1){
				alert("할 일을 선택해주세요")
				return
			}
			if(confirm("삭제하시겠습니까?")){
				for(var idx=0; idx<$("input[name=chk]:checkbox").length; idx++){
					if($("input[name=chk]:checkbox")[idx].checked==true){
						var tno = $("input[name=chk]:checkbox")[idx].value
						delAjax(tno)
					}
				}
				alert("삭제 되었습니다.")
			}
		})
		$("#uptBtn").click(function(){
			var todoLeng = $("input[name=chk]:checked").length
			if(todoLeng<1){
				alert("할 일을 선택해주세요")
				return
			}
			if(todoLeng>1){
				alert("1개만 선택해주세요")
				return
			}
			for(var idx=0; idx<$("input[name=chk]:checkbox").length; idx++){
				if($("input[name=chk]:checkbox")[idx].checked==true){
					
					var tno = $("input[name=chk]:checkbox")[idx].value
					$("h2").click()
					$("#regBtn").hide()
					$("#mUptBtn").show()
					$("#modalTitle").text("할 일 수정")
					$("form")[0].reset()
					var todo = $("#"+tno).text()
					$("[name=todo]").val(todo)
					$("[name=tno]").val(tno)
					
				}
			}
		})
		
		$("#mUptBtn").click(function(){
			todoAjax("uptTodo.do")
		})
			
		
		
	});
	function todoAjax(url){
		$.ajax({
			type:"post",
			url:"${path}/"+url,
			data:$("form").serialize(),
			dataType:"json",
			success:function(data){
				alert(data.msg)
				location.reload()
			},
			error:function(err){
				console.log(err)
			}
		})
	}
	function stateAjax(tno){
		$.ajax({
			type:"post",
			url:"${path}/uptStateTodo.do?tno="+tno,
			dataType:"json",
			success:function(data){
				//alert(data.msg)
				location.reload()
			},
			error:function(err){
				console.log(err)
			}
		})
	}
	function delAjax(tno){
		$.ajax({
			type:"post",
			url:"${path}/delTodo.do?tno="+tno,
			dataType:"json",
			success:function(data){
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
 
           <h4 class="fw-bold py-3 mb-4">나의 업무 > <small class="text-muted">To do list</small></h4>
            <div class="container">
           <div class="card mb-4 pb-3">
           <form id="frm01" class="form-inline"  method="post">
           		<div class="demo-inline-spacing">
			    <input v-model="todo" @keyup="schKeyup" class="form-control mr-sm-2" 
			    	placeholder="제목입력" style="width:330px;"/>
			   
			    <button @click="fetchList" class="btn btn-primary" type="button" id="search">Search</button>
			    </div>
			</form>
	           <div class="demo-inline-spacing">
	         	<button id="addBtn" type="button" class="btn rounded-pill btn-primary">추가</button>
	         	<button id="comBtn" type="button" class="btn rounded-pill btn-success">완료</button>
	         	<button id="uptBtn" type="button" class="btn rounded-pill btn-info">수정</button>
	         	<button id="delBtn" type="button" class="btn rounded-pill btn-danger">삭제</button>
	         	</div>
	         	
	         	<div class="table-responsive text-nowrap">
                  <table class="table">
                    <thead>
                      <tr>
                        <th></th>
                        <th>to do</th>
                        <th>status</th>
                        <th>date</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                   <tr v-for="todo in todoList">
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i> 
                       	 <input type="checkbox" name="chk" :value="todo.tno"></td>
                        <td :id="todo.tno">{{todo.todo}}</td>
                  		 <td v-if="todo.state=='1'">완료</td>
                         <td v-else>미완료</td>
                        <td> 
                          {{todo.regdte}}
                        </td>
                      </tr>
                     
                    </tbody>
                  </table>
                </div>
                </div>
         	</div>
         	  <!-- /card -->
            </div>
            <!-- / Content -->
			  <!-- Modal -->
			   <h2 data-bs-toggle="modal"
                          data-bs-target="#modalCenter"></h2>
                        <div class="modal fade" id="modalCenter" tabindex="-1" aria-hidden="true">
                          <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                              <div class="modal-header">
                                <h5 class="modal-title" id="modalTitle">Modal title</h5>
                                <button
                                  type="button"
                                  class="btn-close"
                                  data-bs-dismiss="modal"
                                  aria-label="Close"
                                ></button>
                              </div>
                               <form class="form">
                              <div class="modal-body">
                              <input type="hidden" value="" name="tno" id="tno">
                                <div class="row">
                                  <div class="col mb-3">
                                    <label for="todoWithTitle" class="form-label">할 일</label>
                                    <input	type="text" name="todo" id="todo" class="form-control" />
                                  </div>
                                </div>
                                <div class="row g-2">
                                  <div class="col mb-0">
                                   
                                    <input type="hidden"  name="id" id="id" class="form-control" value="${emp.id }"/>
                                  </div>
                                </div>
                              </div>
                              </form>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                                  닫기
                                </button>
                                <button id="regBtn" type="button" class="btn btn-primary">등록</button>
                                <button id="mUptBtn" type="button" class="btn btn-primary">수정</button>
                              </div>
                            </div>
                          </div>
                        </div>
	

           
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