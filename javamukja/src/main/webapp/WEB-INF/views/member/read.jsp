<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>Member Information</title>
<meta charset="utf-8">
<style type="text/css">

 table { 
 	border-collapse: ; 
 }
th {
	color: #fac564;
}

td {
	color: #ccc;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		var modal = '${msg}'; //Controller에서 가져온 데이터
		checkModal(modal); //modal생성

		//history back일때는 modal 안보여주는 코드 1
		history.replaceState({}, null, null);

		function checkModal(modal) { //modal 생성함수 선언
			if (history.state)
				return; //d코드2
			if ('${msg}') {
				$(".modal-body").html(modal);
				$("#myModal").modal("show");
			}
		}
	});

	function filedown() {
		var url = "${root}/download";
		url += "?dir=/member/storage";
		url += "&filename=${dto.fname}";

		location.href = url;
	}
	function del() {
		var url = "${root}/member/delete";
		url += "?id=${dto.id}";
		url += "&oldfile=${dto.fname}";
		location.href = url;
	}
	function update() {
		var url = "${root}/member/update";
		url += "?id=${dto.id}";
		location.href = url;
	}
	function listM() {
		var url = "${root}/admin/list";
		location.href = url;
	}
	function updatePw() {
		var url = "${root}/member/updatePw";
		url += "?id=${dto.id}";

		location.href = url;
	}
	function updateFile() {
		var url = "${root}/member/updateFile";
		url += "?id=${dto.id}";
		url += "&oldfile=${dto.fname}";

		location.href = url;
	}
	function gradeM() {
		var url = "${root}/member/updateGrade";
		url += "?id=${dto.id}";
		url += "&grade=${dto.grade}";

		location.href = url;
	}
</script>
</head>
<body>
	<div class="container col-sm-6">
		<br>
		<br>
		<h1 class="col-sm-offset-2 col-sm-10" style="color: #fac564;">
			"${dto.mname}" 's Information</h1>
		<table class="table table-bordered">
			<tr>
				<td rowspan="8" style="text-align: center"><img
					src="./storage/${dto.fname}" class="img-rounded" width="500px"
					height="320px"></td>
			</tr>
			<tr>
				<th>ID</th>
				<td>${dto.id}</td>
			</tr>
			<tr>
				<th>NAME</th>
				<td>${dto.getMname()}</td>
			</tr>
			<tr>
				<th>NICKNAME</th>
				<td>${dto.getNickname()}</td>
			</tr>
			<tr>
				<th>GRADE</th>
				<td>${dto.getGrade()}</td>
			</tr>
			<tr>
				<th>E-MAIL</th>
				<td>${dto.getEmail()}</td>
			</tr>
			<tr>
				<th>ZIPCODE</th>
				<td>${dto.getZipcode()}</td>
			</tr>
			<tr>
				<th>ADDRESS</th>
				<td>${dto.getAddress()}</td>
			</tr>
		</table>

		<div style="text-align: center">
			<button class="btn btn-primary p-2 px-xl-3 py-xl-2"
				onclick="update()">정보수정</button>
			<button class="btn btn-primary p-2 px-xl-3 py-xl-2" onclick="del()">회원탈퇴</button>
			<button class="btn btn-primary p-2 px-xl-3 py-xl-2"
				onclick="updateFile()">사진수정</button>
			<c:if test="${not empty dto.id && grade!='A'}">
				<button class="btn btn-primary p-2 px-xl-3 py-xl-2"
					onclick="updatePw()">패스워드 변경</button>
				<button class="btn btn-primary p-2 px-xl-3 py-xl-2"
					onclick="filedown()">사진저장</button>
				<button class="btn btn-primary p-2 px-xl-3 py-xl-2"
					onclick="history.back()">취소</button>
			</c:if>
			<c:if test="${not empty dto.id && grade=='A'}">
				<button class="btn btn-primary p-2 px-xl-3 py-xl-2"
					onclick="gradeM()">등업</button>
				<button class="btn btn-primary p-2 px-xl-3 py-xl-2"
					onclick="listM()">회원목록</button>
			</c:if>
		</div>
		<!-- modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content" style="border: 3px solid #fff;">
					<div class="modal-header" style="background-color: black">

						<h4 class="modal-title" style="color: #fac564">확인 메세지</h4>
					</div>
					<div class="modal-body" style="background-color: black">
						<p>This is a small modal.</p>
					</div>
					<div class="modal-footer" style="background-color: black">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
