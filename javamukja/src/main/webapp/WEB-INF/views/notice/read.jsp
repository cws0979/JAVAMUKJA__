<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="/ssi/ssi.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>NOTICE</title>
<meta charset="utf-8">

<script type="text/javascript">
	function listM() {
		var url = "list";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";

		location.href = url;
	}

	function updateM() {
		var url = "${root}/admin/update";
		url += "?nno=${dto.nno}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";

		// ?뒤는 파라메터 값   -> 무언가 입력하고 싶을 때, 작성한다.
		location.href = url;

	}

	function deleteM() {
		var url = "${root}/admin/delete";
		url += "?nno=${dto.nno}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		// ?뒤는 파라메터 값   -> 무언가 입력하고 싶을 때, 작성한다.
		location.href = url;
	}
	function createM() {
		var url = "${root}/admin/create";
		url += "?nno=${dto.nno}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		// ?뒤는 파라메터 값   -> 무언가 입력하고 싶을 때, 작성한다.
		location.href = url;
	}
</script>
</head>
<body>


	<div class="container">
		<h2 style="color:#fac564;">공지사항 조회</h2>
		<div class="panel panel-default" style="border-color: white; border-width: 3px;" >

			<div class="panel-heading" style="color: #fac564;">작성자</div>
			<div class="panel-body" style="color: #fff;">${dto.id}</div><br>

			<div class="panel-heading" style="color: #fac564;">제목</div>
			<div class="panel-body" style="color: #fff;">${dto.title}</div><br>


			<div class="panel-heading" style="color: #fac564;">내용</div>
			<div class="panel-body" style="color: #fff;">${dto.content}</div><br>


			<div class="panel-heading" style="color: #fac564;">조회수</div>
			<div class="panel-body" style="color: #fff;">${dto.viewcnt}</div><br>


			<div class="panel-heading" style="color: #fac564;">날짜</div>
			<div class="panel-body" style="color: #fff;">${dto.rdate}</div><br>

			<c:if test="${ not empty id && grade=='A' }">
				<button class="btn btn-white btn-outline-white" type="button"
					onclick="createM()">등록</button>
				<button class="btn btn-white btn-outline-white" type="button"
					onclick="updateM()">수정</button>
				<button class="btn btn-white btn-outline-white" type="button"
					onclick="deleteM()">삭제</button>
			</c:if>
			<button class="btn btn-white btn-outline-white" type="button"
				onclick="listM()">목록</button>
			<!-- 			<button class="btn" type="button" onclick="replyM()">답변</button> -->
		</div>
	</div>

</body>

</html>
