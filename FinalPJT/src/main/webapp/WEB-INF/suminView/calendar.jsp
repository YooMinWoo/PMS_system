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

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      initialDate: '2023-02-01',
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
			addForm(info.event)
			ajaxFun("uptCalendar.do")
	  },
		// 시간일정 스크롤해서 시간 변경했을 때
	  eventResize:function(info){
			addForm(info.event)
			ajaxFun("uptCalendar.do")
	  },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
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
    margin:1px 65px 61px 228px;
  }

</style>
</head>

<body style="overflow-x: hidden">
   <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->

        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
          <div class="app-brand demo">
            <a href="index.html" class="app-brand-link">
              <span class="app-brand-logo demo">
                <svg
                  width="25"
                  viewBox="0 0 25 42"
                  version="1.1"
                  xmlns="http://www.w3.org/2000/svg"
                  xmlns:xlink="http://www.w3.org/1999/xlink"
                >
                  <defs>
                    <path
                      d="M13.7918663,0.358365126 L3.39788168,7.44174259 C0.566865006,9.69408886 -0.379795268,12.4788597 0.557900856,15.7960551 C0.68998853,16.2305145 1.09562888,17.7872135 3.12357076,19.2293357 C3.8146334,19.7207684 5.32369333,20.3834223 7.65075054,21.2172976 L7.59773219,21.2525164 L2.63468769,24.5493413 C0.445452254,26.3002124 0.0884951797,28.5083815 1.56381646,31.1738486 C2.83770406,32.8170431 5.20850219,33.2640127 7.09180128,32.5391577 C8.347334,32.0559211 11.4559176,30.0011079 16.4175519,26.3747182 C18.0338572,24.4997857 18.6973423,22.4544883 18.4080071,20.2388261 C17.963753,17.5346866 16.1776345,15.5799961 13.0496516,14.3747546 L10.9194936,13.4715819 L18.6192054,7.984237 L13.7918663,0.358365126 Z"
                      id="path-1"
                    ></path>
                    <path
                      d="M5.47320593,6.00457225 C4.05321814,8.216144 4.36334763,10.0722806 6.40359441,11.5729822 C8.61520715,12.571656 10.0999176,13.2171421 10.8577257,13.5094407 L15.5088241,14.433041 L18.6192054,7.984237 C15.5364148,3.11535317 13.9273018,0.573395879 13.7918663,0.358365126 C13.5790555,0.511491653 10.8061687,2.3935607 5.47320593,6.00457225 Z"
                      id="path-3"
                    ></path>
                    <path
                      d="M7.50063644,21.2294429 L12.3234468,23.3159332 C14.1688022,24.7579751 14.397098,26.4880487 13.008334,28.506154 C11.6195701,30.5242593 10.3099883,31.790241 9.07958868,32.3040991 C5.78142938,33.4346997 4.13234973,34 4.13234973,34 C4.13234973,34 2.75489982,33.0538207 2.37032616e-14,31.1614621 C-0.55822714,27.8186216 -0.55822714,26.0572515 -4.05231404e-15,25.8773518 C0.83734071,25.6075023 2.77988457,22.8248993 3.3049379,22.52991 C3.65497346,22.3332504 5.05353963,21.8997614 7.50063644,21.2294429 Z"
                      id="path-4"
                    ></path>
                    <path
                      d="M20.6,7.13333333 L25.6,13.8 C26.2627417,14.6836556 26.0836556,15.9372583 25.2,16.6 C24.8538077,16.8596443 24.4327404,17 24,17 L14,17 C12.8954305,17 12,16.1045695 12,15 C12,14.5672596 12.1403557,14.1461923 12.4,13.8 L17.4,7.13333333 C18.0627417,6.24967773 19.3163444,6.07059163 20.2,6.73333333 C20.3516113,6.84704183 20.4862915,6.981722 20.6,7.13333333 Z"
                      id="path-5"
                    ></path>
                  </defs>
                  <g id="g-app-brand" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                    <g id="Brand-Logo" transform="translate(-27.000000, -15.000000)">
                      <g id="Icon" transform="translate(27.000000, 15.000000)">
                        <g id="Mask" transform="translate(0.000000, 8.000000)">
                          <mask id="mask-2" fill="white">
                            <use xlink:href="#path-1"></use>
                          </mask>
                          <use fill="#0054a6" xlink:href="#path-1"></use>
                          <g id="Path-3" mask="url(#mask-2)">
                            <use fill="#0054a6" xlink:href="#path-3"></use>
                            <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-3"></use>
                          </g>
                          <g id="Path-4" mask="url(#mask-2)">
                            <use fill="#0054a6" xlink:href="#path-4"></use>
                            <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-4"></use>
                          </g>
                        </g>
                        <g
                          id="Triangle"
                          transform="translate(19.000000, 11.000000) rotate(-300.000000) translate(-19.000000, -11.000000) "
                        >
                          <use fill="#0054a6" xlink:href="#path-5"></use>
                          <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-5"></use>
                        </g>
                      </g>
                    </g>
                  </g>
                </svg>
              </span>
              <span class="app-brand-text demo menu-text fw-bolder ms-2">Super</span>
            </a>

            <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
              <i class="bx bx-chevron-left bx-sm align-middle"></i>
            </a>
          </div>

          <div class="menu-inner-shadow"></div>

          <ul class="menu-inner py-1">
            <!-- Dashboard -->
            <li class="menu-item">
              <a href="index.html" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                <div data-i18n="Analytics">Home</div>
              </a>
            </li>

            <!-- Layouts -->  <!-- 현재 열려있는 페이지는 <li class="menu-item active open"> 
            					하위 메뉴는    <li class="menu-item active">
            -->
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-user"></i>
                <div data-i18n="Layouts">나의 업무</div>
              </a>

              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="${path }/calList.do" class="menu-link">
                    <div data-i18n="Without menu">캘린더</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="layouts-without-navbar.html" class="menu-link">
                    <div data-i18n="Without navbar">to do list</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="layouts-container.html" class="menu-link">
                    <div data-i18n="Container">내 폴더</div>
                  </a>
                </li>
              </ul>
            </li>
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-envelope"></i>
                <div data-i18n="Account Settings">메일</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="pages-account-settings-account.html" class="menu-link">
                    <div data-i18n="Account">메일 쓰기</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="pages-account-settings-notifications.html" class="menu-link">
                    <div data-i18n="Notifications">받은 메일함</div>
                  </a>
                </li>
              </ul>
            </li>
               <li class="menu-header small text-uppercase"><span class="menu-header-text">work</span></li>
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Authentications">프로젝트</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="auth-login-basic.html" class="menu-link" target="_blank">
                    <div data-i18n="Basic">나의 프로젝트</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="auth-register-basic.html" class="menu-link" target="_blank">
                    <div data-i18n="Basic">프로젝트 생성</div>
                  </a>
                </li>
              </ul>
            </li>
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Misc">업무</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="pages-misc-error.html" class="menu-link">
                    <div data-i18n="Error">업무생성</div>
                  </a>
                </li>
              </ul>
            </li>
             <li class="menu-item">
              <a href="javascript:void(0)" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-file"></i>
                <div data-i18n="User interface">결재</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="ui-accordion.html" class="menu-link">
                    <div data-i18n="Accordion">결재함</div>
                  </a>
                </li>   
              </ul>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="ui-accordion.html" class="menu-link">
                    <div data-i18n="Accordion">결재 작성</div>
                  </a>
                </li>   
              </ul>
            </li>
            <!-- Components -->
            <li class="menu-header small text-uppercase"><span class="menu-header-text">utility</span></li>

            <!-- Extended components
      
             -->
            <li class="menu-item">
              <a href="*" class="menu-link">
                <i class="menu-icon tf-icons bx bx-archive"></i>
                <div data-i18n="Extended UI">드라이브</div>
              </a>
            </li>
            <li class="menu-item">
              <a href="*" class="menu-link">
                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                <div data-i18n="Extended UI">공지사항</div>
              </a>
            </li>
             <li class="menu-item">
              <a href="*" class="menu-link">
                <i class="menu-icon tf-icons bx bx-chat"></i>
                <div data-i18n="Extended UI">채팅</div>
              </a>
            </li>			
        

            <!-- Forms & Tables -->
            <li class="menu-header small text-uppercase"><span class="menu-header-text">manager</span></li>
            <!-- Forms -->
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-lock-open-alt"></i>
                <div data-i18n="Form Elements">관리자</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="forms-basic-inputs.html" class="menu-link">
                    <div data-i18n="Basic Inputs">조직도</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="forms-input-groups.html" class="menu-link">
                    <div data-i18n="Input groups">권한 설정</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="forms-input-groups.html" class="menu-link">
                    <div data-i18n="Input groups">입/퇴사관리</div>
                  </a>
                </li>
              </ul>
            </li>
         
        </aside>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
        
		  <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
              <ul class="navbar-nav flex-row align-items-center ms-auto" style="margin-right: 5px !important;">
                <!-- User -->
                <li class="nav-item navbar-dropdown dropdown-user dropdown"> <span style="position:absolute; top:20px;left:4px; z-index: 3;font-size: 0.6rem;color:white;">홍길동</span>
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
                    <li>
                      <a class="dropdown-item" href="#">
                        <i class="bx bx-cog me-2"></i>
                        <span class="align-middle">Settings</span>
                      </a>
                    </li>
                    <li>
                      <a class="dropdown-item" href="#">
                        <span class="d-flex align-items-center align-middle">
                          <i class="flex-shrink-0 bx bx-credit-card me-2"></i>
                          <span class="flex-grow-1 align-middle">Billing</span>
                          <span class="flex-shrink-0 badge badge-center rounded-pill bg-danger w-px-20 h-px-20">4</span>
                        </span>
                      </a>
                    </li>
                    <li>
                      <div class="dropdown-divider"></div>
                    </li>
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
      		   <div id='calendar'></div>
      		   <h2 data-bs-toggle="modal"
                          data-bs-target="#modalCenter"></h2>
			   <div class="modal fade" id="modalCenter" tabindex="-1" aria-hidden="true">
                          <div class="modal-dialog modal-dialog-centered" role="document">
                         
                            <div class="modal-content">
                            
                              <div class="modal-header">
                                <h5 class="modal-title" id="modalCenterTitle">일정등록</h5>
                                <button
                                  type="button"
                                  class="btn-close"
                                  data-bs-dismiss="modal"
                                  aria-label="Close"
                                ></button>
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
                                    <input type="text" id="start" class="form-control"/>
                                    <input type="hidden" name="start" class="form-control"/>
                                  </div>
                                  <div class="col mb-0">
                                    <label for="endWithTitle" class="form-label">종료일</label>
                                    <input type="text" id="end" class="form-control"/>
                                    <input type="hidden" name="end" class="form-control"/>
                                  </div>
                                </div>
                                  <div class="row g-2">
                                  <div class="col mb-0">
                                    <label for="wrtier" class="form-label">작성자</label>
                                    <input type="text" name="writer" class="form-control"/>
                                   
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
                                    <input type="color" value="#0099cc" id="backgroundColor" name="backgroundColor" class="form-control"/>
                                   
                                  </div>
                                  
                                </div>
                                <div class="row">
                                  <div class="col mb-3">
                                    <label for="content" class="form-label">내용</label>
                                    <textarea  rows="5" name="content" id="content" class="form-control" placeholder="내용을 입력하세요"></textarea>
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


          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
             
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