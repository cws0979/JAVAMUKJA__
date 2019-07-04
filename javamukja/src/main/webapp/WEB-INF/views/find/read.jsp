<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<style>
.list-group-item {
  position: relative;
  display: block;
  padding: 0.75rem 1.25rem;
  margin-bottom: 5px;
  background-color: black;
  border: 2px solid #fac564; }
.panel-body{
color: white;
}
</style>

<script>
	function listM() {
		var url = "list";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";

		location.href = url;
	}

	function update() {
		var url = "update";
		url += "?fno=${dto.fno}";

		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";

		location.href = url;
	}

	function del() {
		var url = "delete";
		url += "?fno=${dto.fno}";

		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";

		location.href = url;
	}
</script>
<title>검색어 조회</title>
</head>
<body>
	<div class="container col-sm-5">
	
		<h1 style="color:#fac564">검색어 조회</h1>
		
		<div class="form-group" style="border:1px solid; border-color:#fac564">
			<label class="control-label col-sm-4" for="fstr"
				style="color: #fac564">검색어</label>
			<div class="col-sm-5">${dto.fstr}</div>
		</div>
		
		<div class="form-group" style="border:1px solid; border-color:#fac564">
			<label class="control-label col-sm-4" for="fstr"
				style="color: #fac564">번호</label>
			<div class="col-sm-5">${dto.fno}</div>
		</div>
		
		<div class="form-group" style="border:1px solid; border-color:#fac564">
			<label class="control-label col-sm-4" for="fstr"
				style="color: #fac564">검색횟수</label>
			<div class="col-sm-5">${dto.fcnt}</div>
		</div>
		<!-- 		<table class="table table-bordered"> -->
<!-- 			<tr> -->
<!-- 				<th style="color:#fac564">번호</th> -->
<%-- 				<td>${dto.fno}</td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th style="color:#fac564">검색어</th> -->
<%-- 				<td>${dto.fstr}</td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th style="color:#fac564">검색횟수</th> -->
<%-- 				<td>${dto.fcnt}</td> --%>
<!-- 			</tr> -->
<!-- 		</table> -->
			
		<div align=center>
			<c:if test="${(not empty sessionScope.id)&&(sessionScope.grade == 'A')}">			
			<button type="button" class="btn btn-white btn-outline-white" onclick="update();">수정</button>
			<button type="button" class="btn btn-white btn-outline-white" onclick="del();">삭제</button>
			<button type="button" class="btn btn-white btn-outline-white" onclick="listM()">목록</button>
			</c:if>
		</div>
		</div>
</body>
</html>
