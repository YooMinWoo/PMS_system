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
<script type="text/javascript">
	function goMyPage(id){
		location.href="${path}/myPage.do?id="+id
	}
	
</script>
</head>

<body style="overflow-x: hidden">
  <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
              <ul class="navbar-nav flex-row align-items-center ms-auto mx-5">
               <!-- alert -->
                <li class="nav-item navbar-dropdown dropdown-user dropdown mx-1">
                  <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
		           <i class="bx bx-bell bx-md"></i>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                      <a class="dropdown-item" href="#">
                        <i class="bx bx-user me-2"></i>
                        <span class="align-middle">내용</span>
                      </a>
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
                <span style="position:absolute; top:20px;left:4px; z-index: 3;font-size: 0.6rem;color:white;"> ${emp.ename}</span>
                  <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                   <div class="avatar avatar-online">
                      <svg>
					  <circle cx="20" cy="20" r="20" fill="#0054a6" />
					</svg>
                   </div>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                      <a class="dropdown-item" onclick="goMyPage('${emp.id}')">
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
                      <a class="dropdown-item" href="${path }/logout.do">
                        <i class="bx bx-power-off me-2"></i>
                        <input type="hidden" value="${emp.id}">
                        <span class="align-middle">Log Out</span>
                      </a>
                    </li>
                  </ul>
                </li>
                <!--/ User -->
              </ul>
            </div>
         
  </body>
</body>
</html>