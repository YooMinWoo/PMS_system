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
#invBtn, #uptBtn{
display: none;
}

</style>
<script src="${path }/resources/a00_com/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	var projectName="${projectInfo.subject}" // 모델데이터
	$("#subject").text(projectName)
	var prjno = "${projectInfo.prjno}"
	
	var deadline = "${projectInfo.deadline}"
	var deadlineDate = new Date(deadline.split("-")[0],deadline.split("-")[1]-1,deadline.split("-")[2])
	var today = new Date()
	console.log(deadlineDate)
	
	var minustime = deadlineDate.getTime()-today.getTime() // 시간으로 변환해서 연산(초단위)
	var minusdate = Math.ceil(minustime / (1000 * 3600 * 24));  // 시간을 날짜로 변환(올림처리)
	
	if(minusdate>=0){
		$("#subject").append(" (D-"+minusdate+")")
	}else{
		$("#subject").append(" (종료)")
	}
	
	var sessId = "${sessionScope.emp.id}"
	var pmId = "${projectInfo.tlid}"
	if(sessId==pmId){
		$("#invBtn").css('display','inline-block')
		$("#uptBtn").css('display','inline-block')
	}
	
	// 수정 화면으로 이동
	$("#uptBtn").click(function(){
		location.href="${path}/uptProject.do?prjno="+prjno
	}) 
	
	//멤버 확인 버튼 클릭시
	$("#memBtn").click(function(){
		let url="${path}/memList.do?prjno="+prjno
		fetch(url).then(function(response){
			console.log(response)
			return response.json()
		}).then(function(json){			
			let meminfo = json.memList
			let listHTML = ""
			for(let i=0;i<meminfo.length;i++){
				listHTML+="<tr><td>"+meminfo[i].dname+"</td><td>"+meminfo[i].job+"</td><td>"+
				meminfo[i].part+"</td><td>"+meminfo[i].ename+"</td></tr>"
			}
			$("#memberListTab tbody").html(listHTML)
			
		}).catch(function(err){
			console.log(err)
		})
	})
	
	// 모달창 input 추가
	$("#plusBtn").click(function(){
		$("#plusMem").append("<div class='col-6'><label for='part' "+
		"class='col-form-label'>파트</label><input class='form-control'"+
		"type='text' name='part' placeholder='담당파트 입력' id='part'></div>"+
		"<div class='col-6'><label for='owner' class='col-form-label'>"+
		"담당자이메일</label><input class='form-control' type='text' name='owner'"+
		"placeholder='담당자 이메일입력' id='owner'></div>")
	})
	// input 삭제
	$("#minusBtn").click(function(){
		let childLen = $("#plusMem").children().length
		if(childLen>2){
			$("#plusMem").children().last().remove();
			$("#plusMem").children().last().remove();
		}else{
			alert("기본 입력창은 삭제할 수 없습니다")
		}
	})

	// 새로 등록할 멤버가 이미 등록된 멤버인지 확인하기 위해 기존 멤버 아이디를 배열로 가져오기
	var memlist=[]
	let url="${path}/memList.do?prjno="+prjno
	fetch(url).then(function(response){
		return response.json()
	}).then(function(json){
		// 기존 멤버 아이디만 배열에 넣기
		$.each(json.memList,function(index,mlist){
			memlist.push(mlist.id)
		})
	}).catch(function(err){
		console.log(err)
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
		// 생성된input 에서 아이디인 이메일만 반복문을 통해 가져와서 
		// inArray(value,arr) 해당 값이 배열에 있으면 위치를 리턴 없으면 -1 리턴
		// inArray를 통해 이미 등록된 아이디인지 확인하여 리턴값이 -1이 아니면(이미 등록된 사람이면) 테두리 붉은색 표시
		// validCnt 를 -1로 해서 alert 창에 이미 등록된 담당자가 있다는 문구 띄우기
		for(let i=0;i<inputlen;i+=2){
			if($.inArray($("#plusMem").find("input.form-control").eq(i+1).val(), memlist) !== -1){
				validCnt=-1
				$("#plusMem").find("input.form-control").eq(i+1).css('border-color','#ff3e1d')
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
		if(validCnt==-1){
			alert("이미 등록된 담당자가 있습니다")
		}else if(validCnt>0){
			alert("빈칸을 입력해주세요")
		}else{
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
		}
	})
	
	// 초기에 멤버 출력되도록 멤버 리스트 empAjax(empqstr)
	var empqstr ="keyword="+$("[name=keyword]").val()
	empAjax(empqstr)
	
	$("[name=keyword]").keyup(function(){
		if(event.keyCode==13){
			empqstr ="keyword="+$("[name=keyword]").val()
			empAjax(empqstr)
		}
	})

	
});
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
				 pagination.append($('<li class="page-item prev"></li><a class="page-link" href="javascript:goPage(' 
						  + (data.sch.startBlock - 1) + ');"><i class="tf-icon bx bx-chevron-left"></i></a>'));
				  for (var i = data.sch.startBlock; i <= data.sch.endBlock; i++) {
				    var pageLi = $('<li class="page-item"></li>');
				    var pageLink = $('<a class="page-link" href="javascript:goPage('+ i +');">' + i + '</a>');
				    if (i === data.sch.curPage) {
				      pageLi.addClass('active');
				    }
				    pageLi.append(pageLink);
				    pagination.append(pageLi);
				  }
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
  // 결재함 이동 권한처리
  function goApprv(prjno){
		if("${emp.id}"!="${projectInfo.tlid}"){
			alert("프로젝트 리더만 이용이 가능합니다.")
		}else{
			location.href="${path}/apprvList.do?prjno="+prjno;
		}
	}

</script>
</head>

<body>
 		<div class="row">
           <div class="col-8">
           <h3 id="subject"class="fw-bold py-3 mt-4 pt-3">프로젝트 이름</h3>
           </div>
           <div class="col-4 py-3 mt-4 mb-4 d-flex justify-content-end">
            <button type="button" id="memBtn" class="btn btn-sm btn-primary" data-bs-toggle="modal"
             data-bs-target="#memberModal">멤버확인</button>&nbsp;&nbsp;&nbsp;
            <button type="button" id="invBtn" class="btn btn-sm btn-success" data-bs-toggle="modal" 
            data-bs-target="#inviteModal">멤버초대</button>&nbsp;&nbsp;&nbsp;
            <button type="button" id="uptBtn" class="btn btn-sm btn-secondary">설정</button>
           </div>
          </div>

        <div class="nav navbar-nav me-auto d-flex flex-row">
          <a class="nav-item nav-link active" href="${path}/projectMain.do?prjno=${projectInfo.prjno}">진행상황</a>
          <a class="nav-item nav-link" >|</a>
          <a class="nav-item nav-link" href="${path}/workGanttList.do?prjno=${projectInfo.prjno}">업무</a>
          <a class="nav-item nav-link">|</a>
          <a class="nav-item nav-link" onclick="goApprv(${projectInfo.prjno})">결재함</a>
          <a class="nav-item nav-link">|</a>
          <a class="nav-item nav-link" href="${path}/project_pagingRisk.do?prjno=${projectInfo.prjno}">리스크 관리</a>
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
			         <button id="plusBtn" type="button" class="btn btn-sm btn-info">추가</button>&nbsp;&nbsp;
			         <button id="minusBtn" type="button" class="btn btn-sm btn-danger">제거</button>
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
	<!-- 멤버 확인 모달창 -->
	<div class="modal fade" id="memberModal" tabindex="-1" style="display: none;" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel2">프로젝트 멤버</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <div class="row">
                  <div class="my-3 row">
		        <div class="table-responsive text-nowrap">
				    <table class="table table-striped" id="memberListTab">
				    <col width="25%">
				    <col width="25%">
				    <col width="25%">
				    <col width="25%">
				      <thead>
				        <tr>
				          <th>부서명</th>
				          <th>직책</th>
				          <th>담당파트</th>
				          <th>이름</th>
				        </tr>
				      </thead>
				      <tbody class="table-border-bottom-0">
				      
				      </tbody>
				    </table>
				  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        </div>
	<!--/멤버 확인 모달창  -->

</body>
</html>