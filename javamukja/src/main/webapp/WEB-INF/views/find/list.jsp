<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>검색어 목록</title>
<meta charset="UTF-8">
<script type="text/javascript">
function read(fno){
    var url = "read";
    url += "?fno="+fno;      //javascript 변수
    
    url += "&col=${col}";   //jsp 변수 (스크립틀릿)
    url += "&word=${word}";
    url += "&nowPage=${nowPage}";
    
    location.href=url;
  }
function record(){
    var url = "list2.json";
    
    wr = window.open(url,"검색기록","width=500,height=500");
	wr.moveTo((window.screen.width-400)/2,(window.screen.height-500)/2);
  }
  
function record2(){
    var url = "list2";
    
    wr = window.open(url,"검색기록","width=500,height=500");
	wr.moveTo((window.screen.width-400)/2,(window.screen.height-500)/2);
  }
  
function DelAll(){
    var url = "deleteAll";
    
    wr = window.open(url,"검색기록 삭제","width=500,height=500");
	wr.moveTo((window.screen.width-800)/2,(window.screen.height-800)/2);
  }
  
  
  
  $(document).ready(function(){
	  var modal = '${msg}'; //Controller에서 가져온 데이터
	  checkModal(modal); //modal생성
	   
	  //history back일때는 modal 안보여주는 코드 1
	  history.replaceState({},null,null);
	   
	  function checkModal(modal){ //modal 생성함수 선언
	       if(history.state) 
	    	   return; //코드2
	       if(modal){
	           $(".modal-body").html(modal);
	           $("#myModal").modal("show");
	       }
	     }
	  });
// ..
  
  $(document).ready(function() {
  $("#button1").on('click', function(e) {
    var url = "${root}/find/list2";
    $.ajax({
      type: "GET",
      dataType: 'json',
      url: url,
      success: function(result) {
        DownloadJsonData(result, "NewFile", true);
      },
      error: function(result) {
        alert('Error ');
      }
    });
  });

  function DownloadJsonData(JSONData, FileTitle, ShowLabel) {
    //If JSONData is not an object then JSON.parse will parse the JSON string in an Object
    var arrData = typeof JSONData != 'object' ? JSON.parse(JSONData) : JSONData;
    var CSV = '';
    //This condition will generate the Label/Header
    if (ShowLabel) {
      var row = "";
      //This loop will extract the label from 1st index of on array
      for (var index in arrData[0]) {
        //Now convert each value to string and comma-seprated
        row += index + ',';
      }
      row = row.slice(0, -1);
      //append Label row with line break
      CSV += row + '\r\n';
    }
    //1st loop is to extract each row
    for (var i = 0; i < arrData.length; i++) {
      var row = "";
      //2nd loop will extract each column and convert it in string comma-seprated
      for (var index in arrData[i]) {
        row += '"' + arrData[i][index] + '",';
      }
      row.slice(0, row.length - 1);
      //add a line break after each row
      CSV += row + '\r\n';
    }
    if (CSV == '') {
      alert("Invalid data");
      return;
    }
    //Generate a file name
    var filename = "검색어DB　" + (new Date().toLocaleString());
    var blob = new Blob([CSV], {
      type: "text/csv;charset=UTF-8;"
    });
    if (navigator.msSaveBlob) { // IE 10+
      navigator.msSaveBlob(blob, filename);
    } else {
      var link = document.createElement("a");
      if (link.download !== undefined) { // feature detection
        // Browsers that support HTML5 download attribute
        var url = URL.createObjectURL(blob);
        link.setAttribute("href", url);
        link.style = "visibility:hidden";
        link.download = filename + ".csv";
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
      }
    }
  }
})

  
  
  
  
</script>
</head>
<body>
	<div class="container">
	<h2 style="color:#fac564">검색어 목록</h2>
		<br>
		<form class="form-inline" action="./list">
			<div class="form-group">
			<select class="form-control" name="col">
					<option value="fstr" style="color: black;"
						<c:if test="${col='fstr' }">selected</c:if>
						>검색어</option>
					<option value="fno" style="color: black;"
						<c:if test="${col='fno' }">selected</c:if>
						>번호</option>
					<option value="total" style="color: black;"
						<c:if test="${col='total' }">selected</c:if>
						>전체출력</option>
				</select>
				<input type="text" class="form-control" placeholder="Enter 검색어"
					name="word" value="${word }">
			</div>
			<br><br>
			<button type="submit"
				class="btn btn-white btn-outline-white">검색</button>
		</form>
		
		
<!-- 		<h2 style="color:#fac564">검색어 목록</h2> -->
<!-- 		<br> -->
<!-- 		<form class="form-inline" action="./list"> -->
<!-- 			<div class="form-group" style="border: 1px solid white"> -->
<!-- 				<select class="form-control" name="col"> -->
<!-- 					<option value="fno" style="color: black;" -->
<%-- 						<c:if test="${col='fno' }">selected</c:if> --%>
<!-- 						>번호</option> -->
<!-- 					<option value="fstr" style="color: black;" -->
<%-- 						<c:if test="${col='fstr' }">selected</c:if> --%>
<!-- 						>검색어</option> -->
<!-- 					<option value="total" style="color: black;" -->
<%-- 						<c:if test="${col='total' }">selected</c:if> --%>
<!-- 						>전체출력</option> -->
<!-- 				</select> -->
<!-- 			</div> -->
<!-- 			<br> -->
<!-- 			<div class="form-group" style="border: 1px solid white"> -->
<!-- 				<input type="text" class="form-control" placeholder="Enter 검색어" -->
<%-- 					name="word" value="${word }"> --%>
<!-- 			</div> -->
<!-- 			<br><br> -->
<!-- 			<button type="submit" -->
<!-- 				class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3" -->
<!-- 				style="color:#fac564" -->
<%-- 				onclick="javascript:fstrCheck('${word}}')">검색</button> --%>
<!-- 		</form> -->

		<table class="table table-striped" style="color:white;">
			<thead>
				<tr>
					<th style="color:#fac564">순위</th>
					<th style="color:#fac564">검색번호</th>
					<th style="color:#fac564">검색어</th>
					<th style="color:#fac564">검색횟수</th>
					
				</tr>
			</thead>
			<tbody>

				<c:choose>
					<c:when test="${empty list }">
						<tr>
							<td colspan="4">등록된 게시글이 없습니다.</td>
					</c:when>
					<c:otherwise>
						<c:forEach var="dto" items="${list }">
							<tr>
							<c:set var="count" value="${count+1}"/>
								<td>${count}</td>
								<td>${dto.fno}</td>
								<td>
								<a href="javascript:read('${dto.fno }')">${dto.fstr}</a></td>
								<td>${dto.fcnt}</td>
							<tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
<!-- Json ☞ csv convert		https://konklone.io/json/ -->
			 <c:if test="${(not empty sessionScope.id)&&(sessionScope.grade == 'A')}">
		<button id="button1"
		class="btn btn-white btn-outline-white">DB 저장(CSV)</button>
		<button onclick="DelAll()"
		class="btn btn-white btn-outline-white">DB 초기화</button>


		</c:if>
		<div>
<%-- 			${paging} --%>
		</div>
	</div>
</body>
</html>