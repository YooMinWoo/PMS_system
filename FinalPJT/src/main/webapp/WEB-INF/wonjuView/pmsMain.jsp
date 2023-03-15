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
	.form-select.form-select-sm{
		display: inline-block !important;
		width: 40% !important;
		height: 50% !important;
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
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

    
<script type="text/javascript">
/*
--bs-blue: #007bff;
--bs-indigo: #6610f2;
--bs-purple: #696cff;
--bs-pink: #e83e8c;
--bs-red: #ff3e1d;
--bs-orange: #fd7e14;
--bs-yellow: #ffab00;
--bs-green: #71dd37;
--bs-teal: #20c997;
--bs-cyan: #03c3ec;
--bs-primary: #696cff;
--bs-secondary: #8592a3;
--bs-success: #71dd37;
--bs-info: #03c3ec;
--bs-warning: #ffab00;
--bs-danger: #ff3e1d;
--bs-light: #fcfdfd;
--bs-dark: #233446;	
*/ 
	$(document).ready(function(){
		$("#menu-item-home").addClass('active open');
	      
		$("[name=year]").change(function(){
			var month = $("[name=month]").val()
			var year = $(this).val()
			getData(year,month)
			
		})
		$("[name=month]").change(function(){
			var year = $("[name=year]").val()
			var month = $(this).val()
			getData(year,month)

		})

	
	})
	
	function optFun(cntsArr,dnameArr,avgsArr,subArr,comboTotArr,comboCntArr){
			var deptOption = {
					  chart: {
					    type: 'donut',
					    height: 300
					  },
					  colors:['#696cff', '#8592a3', '#71dd37','#03c3ec','#007bff','#e83e8c','#696cff','#71dd37'],
					  series: cntsArr,
					  labels: dnameArr,
					  legend: {
						    position: 'bottom'
						},
					 noData: {
			        	    text: '데이터가 없습니다'
			        	  }	
					}
			var progOption = {
		           series: [{
		           	  data:avgsArr
			        }],
			          chart: {  
			          type: 'bar',
			          height: 300
			        },
			        plotOptions: {
			          bar: {
			            borderRadius: 4,
			            horizontal: true,
			          }
			        },
			        dataLabels: {
			          enabled: false
			        },
			        fill:{
			        	colors:['#696cff']
			        },
			        xaxis: {
			          categories: subArr,
	
			        },
			        yaxis: {
			            max: 100, //100%가 최대값이도록 설정
			           
			        },
			        tooltip: {
			        	x:{
			        		show:false
			        	},
			        	 y: {
			        		 formatter: (value) => { return value+"%" },
			                 title: {
			                     formatter: (seriesName) => "진행률", 
			                 },
			             }
			        },
		          	noData: {
		        	    text: '데이터가 없습니다'
		        	}
		        	  
			  };
			 var comboOption = {
			          series: [{
			          name: '매출(백만원)',
			          type: 'column',
			          data: comboTotArr
			        }, {
			          name: '프로젝트 갯수',
			          type: 'line',
			          data: comboCntArr,
			        }],
			          chart: {
			          height: 350,
			          type: 'line',
			        },
			        colors:['#007bff', '#71dd37'], 
			        stroke: {
			          width: [0, 4]
			        },
			        dataLabels: {
			          enabled: true,
			          enabledOnSeries: [1]
			        },
			        yaxis: [{
			            title: {
			              text: '',
			            },
			          
			          }, {
			            opposite: true,
			            title: {
			              text: ''
			            }
			          }],
			        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
			        };
			var deptChart = new ApexCharts(document.querySelector("#deptChart"), deptOption);
			deptChart.render();				
			var progChart = new ApexCharts(document.querySelector("#progChart"), progOption);
			progChart.render();	
			var comboChart = new ApexCharts(document.querySelector("#comboChart"), comboOption);
	        comboChart.render();
		}	
		
	
  
	
	
	
	
	

	function getData(curYear,curMonth){
	
	if(curYear=='')  curYear=parseInt(new Date().toISOString().split("T")[0].split("-")[0])
	if(curMonth=='') curMonth= curMonth = parseInt(new Date().toISOString().split("T")[0].split("-")[1])
	console.log(typeof curYear)
	
	$("[name=year]").val(curYear).prop("selected", true); 
	$("[name=month]").val(curMonth).prop("selected", true); 
	
		let url="${path}/chartShow.do?year="+curYear+"&month="+curMonth
		fetch(url).then(function(response){
			return response.json()
		}).then(function(json){
			console.log(json)
		
			var avgsArr=[]; var subArr=[];
			var cntsArr=[]; var dnameArr=[];		
			var comboTotArr=[]; var comboCntArr=[];
			
				
			$.each(json.barC,function(index,b){
				console.log("###추가##")
				avgsArr.push(b.avgs)
				subArr.push([b.subject,"(~"+b.deadline+")"])
			})	
			$.each(json.donutC,function(index,d){
				cntsArr.push(d.cnts)
				dnameArr.push(d.dname)
			})	
			$.each(json.infoByMonth,function(index,im){
				comboTotArr.push(im.tot)
				comboCntArr.push(im.cnt)
			})	
			
			optFun(cntsArr,dnameArr,avgsArr,subArr,comboTotArr,comboCntArr)
			let totAmount = (json.totAmount.tot/100).toFixed(2)
			$("#totAmount").append(totAmount+"억")

		}).catch(function(err){
			console.log(err)
		})
	}

	
	
</script>
</head>
<!--  -->
<body onload="javascript:getData('','');" style="overflow-x: hidden">
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
            
            <div class="row">
            <div class="col-lg-8 mb-4 order-0">
            <!-- 뭐넣지 -->
		    <div class="card">
		      <div class="d-flex align-items-end row">
		        <div class="col-sm-7">
		          <div class="card-body">
		            <h5 class="card-title text-primary">축하합니다! 🎉</h5>
		            <p class="mb-4">You have done <span class="fw-bold">72%</span> more sales today. Check your new badge in your profile.</p>
		          </div>
		        </div>
		        <div class="col-sm-5 text-center text-sm-left">
		          <div class="card-body pb-0 px-0 px-md-4">
		            <img src="https://item.kakaocdn.net/do/039204d96618ee90c045a5ab348be979f604e7b0e6900f9ac53a43965300eb9a" height="140" alt="View Badge User">
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		  <!-- /뭐넣지 -->
		  <div class="col-lg-4 col-md-4 order-1">
		    <div class="row">
		      <div class="col-lg-6 col-md-12 col-6 mb-4">
		        <div class="card">
		          <div class="card-body">
		           
		            <span class="fw-semibold d-block mb-1">Profit</span>
		            <h3 class="card-title mb-2">$12,628</h3>
		            <small class="text-success fw-semibold"><i class="bx bx-up-arrow-alt"></i> +72.80%</small>
		          </div>
		        </div>
		      </div>
		      <div class="col-lg-6 col-md-12 col-6 mb-4">
		        <div class="card">
		          <div class="card-body">
		            <span>총 매출</span>
		            <h3 class="card-title text-nowrap mb-1" id="totAmount"></h3>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
            
 			<div class="col-12 mb-4 order-2">
	        <div class="card">
	        	<h5 class="card-header m-0 me-2 pb-3">2023 프로젝트</h5>
	           		<div id="comboChart"></div>
	         	 </div>
	        </div>
	        </div>
 			<div class="row">
 			<div class="col-12 col-lg-8 order-3 order-md-3 order-lg-2 mb-4">
	           <div class="card">
	           	<div class="row">
	           	<div class="col-8">
	           		<h5 class="card-header m-0 me-2 pb-3">프로젝트 진행률</h5>
	           	</div>
	           	
	           	<div class="col-4 d-flex justify-content-center">
			           <select id="year" name="year" class="form-select form-select-sm align-self-center">
			            <c:forEach begin="2022" end="2023" var="years">
			            <option>${years }</option>
			            </c:forEach>
			          </select>
			          <select id="month" name="month" class="form-select form-select-sm align-self-center">
			            <c:forEach begin="1" end="12" var="months">
			            <option>${months }</option>
			            </c:forEach>
			          </select>
	             </div>	              
	              

	           	</div>
	         	  <div id="progChart"></div>

	           </div>
	           </div>
          	
          	 
          	 <div class="col-12 col-lg-4 order-4 order-md-4">
	          	  <div class="card">
	          	  <h5 class="card-header m-0 me-2 pb-3">부서별 프로젝트</h5>
	           		<div id="deptChart"></div>
	         	 </div>
         	</div>
         	
         	
	        </div>
         	 
         	 
         	 </div>
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
</html>