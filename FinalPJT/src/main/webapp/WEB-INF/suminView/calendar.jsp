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
	td{text-align:center;}
</style>
<script src="${path }/resources/a00_com/jquery.min.js"></script>

<script src='${path}/a00_com/dist/index.global.js'></script>

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
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var toDay = new Date().toISOString().split("T")[0];
   
    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      initialDate: toDay,
     // navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      select: function(arg) {
    	  $("h2").click();
    	  $("form")[0].reset()
    	  $("#modalCenterTitle").text("일정등록")
    	  $("#regBtn").show()
          $("#uptBtn").hide()
          $("#delBtn").hide()
          $("[name=start]").val(arg.start.toISOString())
          $("#start").val(arg.start.toLocaleString())
          $("[name=end]").val(arg.end.toISOString())
          $("#end").val(arg.end.toLocaleString())
          $("[name=allDay]").val(arg.allDay?1:0)
          $("#allDay").val(""+arg.allDay)
      },
      eventClick: function(arg) {
    	  $("h2").click();
    	  $("#modalCenterTitle").text("일정상세")
    	  $("#regBtn").hide()
    	  $("#uptBtn").show()
    	  $("#delBtn").show()
    	  
    	  detailForm(arg.event)
      },
      eventDrop:function(info){
    	  detailForm(info.event)
		  calAjax("updateCalendar.do")
	  },
		// 시간일정 스크롤해서 시간 변경했을 때
	  eventResize:function(info){ 
		  detailForm(info.event)
			calAjax("updateCalendar.do")     
			
	  },
      editable: true,
      dayMaxEvents: true, 
      events:function(info,successCallback,failureCallback){
    	  $.ajax({
    		  type:"post",
    		  url:"${path}/calListAjax.do",
    		  dataType:"json",
    		  success:function(data){
    			  successCallback(data.calList)
    		  },
    		  error:function(err){
    			  console.log(err)
    		  }
    	  })
      }
    });

    calendar.render();
    
    $("#allDay").change(function(){
   		$("[name=allDay]").val($(this).val()=='true'?1:0)
   	})
   	
    $("#regBtn").click(function(){
        if($("[name=title]").val()==""){
           alert("일정을 입력하세요")
           $("[name=title]").focus()
           return;
        }
        calAjax("insertCalendar.do")
     })
     
     $("#uptBtn").click(function(){
    	 if(confirm("수정하시겠습니까?")){
    		 calAjax("updateCalendar.do")
    	 }
     })
      $("#delBtn").click(function(){
    	 if(confirm("삭제하시겠습니까?")){
    		 calAjax("deleteCalendar.do")
    	 }
     })
     $("[name=urllink]").dblclick(function(){
 		if(confirm("페이지 이동하시겠습니까?")){
 			window.open($(this).val())
 			
 		}
 	})		
 	
 	$("#getProSch").click(function(){
 		location.href="${path}/getProSch.do"
 		
 	})
 	
     
  });
 
   	function calAjax(url){
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
   	function detailForm(event){
   		// 일정 상세 화면
   		$("form")[0].reset()
   		$("[name=id]").val(event.id)
   		$("[name=title]").val(event.title)
   		$("[name=start]").val(event.start.toISOString())
        $("#start").val(event.start.toLocaleString())
        $("[name=writer]").val(event.extendedProps.writer)
        $("[name=content]").val(event.extendedProps.content)
        $("[name=textColor]").val(event.textColor)
        $("[name=backgroundColor]").val(event.backgroundColor)
        
        if(event.end==null){
           $("[name=end]").val(event.start.toISOString())
           $("#end").val(event.start.toLocaleString())
        }else{
           $("[name=end]").val(event.end.toISOString())
           $("#end").val(event.end.toLocaleString())
        }
   		$("[name=allDay]").val(event.allDay?1:0)
   		$("#allDay").val(""+event.allDay)      
   		$("[name=urllink]").val(event.extendedProps.urllink)
   	}
   	function alertState(no){
		location.href="${path}/alertState01.do?no="+no
		location.reload()
	}
   	
   	
</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 44px 139px 68px 149px;
  }

</style>
</head>

<body style="overflow-x: hidden">
<!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->
	<jsp:include page="/mainMenubar.jsp"></jsp:include>
        <!-- / Menu -->

        <!-- Layout container
       
         -->
        <div class="layout-page">
       
         <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
              <ul class="navbar-nav flex-row align-items-center ms-auto mx-5">
               <!-- alert -->
                <li class="nav-item navbar-dropdown dropdown-user dropdown mx-1">
                  <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
		           <i class="bx bx-bell bx-md"></i>
		           <c:if test="${alertCount>0 }">
		          <span class="badge badge-center rounded-pill bg-danger"
		          	style="margin-left: -17px;">${alertCount }</span>
		          	</c:if>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                    <i class="bx bx-star"></i>
                       <span class="align-middle">알림</span>
                        <c:forEach var="alert" items="${alertList }">
                  
	                       <div class="card-body">
	                       
	                       <a class="dropdown-item" href="${path }/${alert.url}">
		                        <div class="alert alert-${alert.style }" role="alert">
		                        <span onclick="alertState('${alert.no }')">${alert.title }/${alert.content }</span>
		                        </div>
	                       </a>
	                      </div>
                      </c:forEach>
                    </li>
                    <li>
                      <div class="dropdown-divider"></div>
                    </li>  
                    <li>
                      <a class="dropdown-item" href="auth-login-basic.html">
                        <i class="bx bx-power-off me-2"></i>
                        <span class="align-middle">내용</span>
                      </a>
                    </li>
                  </ul>
                </li>
               <!-- /alert -->
                <!-- User -->
                <li class="nav-item navbar-dropdown dropdown-user dropdown mx-1"> 
                <span style="position:absolute; top:20px;left:4px; z-index: 3;font-size: 0.6rem;color:white;">${emp.ename }</span>
                  <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                   <div class="avatar avatar-online">
                      <svg>
					  <circle cx="20" cy="20" r="20" fill="#0054a6" />
					</svg>
                   </div>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                      <a class="dropdown-item" href="#">
                        <i class="bx bx-user me-2"></i>
                        <span class="align-middle">My Profile</span>
                      </a>
                    </li>
                    <!-- 
                    <li>
                      <div class="dropdown-divider"></div>
                    </li>
                     -->
                    <li>
                      <a class="dropdown-item" href="auth-login-basic.html">
                        <i class="bx bx-power-off me-2"></i>
                        <span class="align-middle">Log Out</span>
                      </a>
                    </li>
                  </ul>
                </li>
                <!--/ User -->
              </ul>
            </div>
	
          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->
            <div class="container-xxl flex-grow-1 container-p-y">
 
           <h4 class="fw-bold py-3 mb-4">나의 업무 > <small class="text-muted">캘린더</small></h4>
        
           <div class="card mb-4 pb-3">
            <div class="demo-inline-spacing" style="display: flex; justify-content: flex-end;">
	           <button id="getProSch" type="button" class="btn btn-primary">프로젝트 일정 가져오기</button>
	       </div>
           	 <div id='calendar'></div>
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
      		   <h2 data-bs-toggle="modal"
                          data-bs-target="#modalCenter"></h2>
			   <div class="modal fade" id="modalCenter" tabindex="-1" aria-hidden="true">
                          <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                              <div class="modal-header">
                                <h5 class="modal-title" id="modalCenterTitle">타이틀</h5>
                                <button
                                  type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                              </div>
                              <div class="modal-body">
                               <form class="form">
                                <input type="hidden" name="id" value="0" />
                                <div class="row">
                                  <div class="col mb-3">
                                    <label for="nameWithTitle" class="form-label">일정명</label>
                                    <input type="text" id="title" name="title" class="form-control" placeholder="일정명"/>
                                  </div>
                                </div>
                                <div class="row g-2">
                                  <div class="col mb-0">
                                    <label for="startWithTitle" class="form-label">시작일</label>
                                    <input type="text" id="start" class="form-control" readOnly/>
                                    <input type="hidden" name="start" class="form-control"/>
                                  </div>
                                  <div class="col mb-0">
                                    <label for="endWithTitle" class="form-label">종료일</label>
                                    <input type="text" id="end" class="form-control" readOnly/>
                                    <input type="hidden" name="end" class="form-control"/>
                                  </div>
                                </div>
                                  <div class="row g-2">
                                  <div class="col mb-0">
                                    <label for="wrtier" class="form-label">작성자</label>
                                    <input type="text" name="writer" class="form-control" value="${emp.id }" readOnly/>
                                  </div>
                                  <div class="col mb-0">
                                    <label for="allday" class="form-label">종일여부</label>
                                     <select id="allDay" class="form-control" >
						                  <option value="true">종일</option>
						                  <option value="false">시간</option>
						             </select>
						              <input type="hidden" name="allDay"/>
                                  </div>
                                </div>
                                 <div class="row g-2">
                                  <div class="col mb-0">
                                    <label for="textColor" class="form-label">글자색상</label>
                                    <input type="color" value="#ccffff" id="textColor" name="textColor" class="form-control"/>
                                  </div>
                                  <div class="col mb-0">
                                    <label for="backgroundColor" class="form-label">배경색상</label>
                                    <input type="color" value="#0099cc" id="backgroundColor" 
                                    name="backgroundColor" class="form-control"/>
                                  </div>      
                                </div>
                                <div class="row">
                                  <div class="col mb-3">
                                    <label for="content" class="form-label">내용</label>
                                    <textarea  rows="5" name="content" id="content" 
                                    class="form-control" placeholder="내용을 입력하세요"></textarea>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col mb-3">
                                    <label for="url" class="form-label">링크</label>
                                   <input type="url" name="urllink" id="url" class="form-control"/>
                                  </div>
                                </div>
                              </div>
                              </form>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                                  닫기
                                </button>
                                <button id="regBtn" type="button" class="btn btn-primary">등록</button>
                                <button id="uptBtn" type="button" class="btn btn-primary">수정</button>
                                <button id="delBtn" type="button" class="btn btn-primary">삭제</button>
                              </div>
                            </div>
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