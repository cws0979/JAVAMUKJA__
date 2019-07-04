<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="/ssi/ssi.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>공지사항  목록</title>
<meta charset="utf-8">


<script type="text/javascript">
	$(document).ready(function() {
		var modal = '${msg}'; //Controller에서 가져온 데이터
		checkModal(modal); //modal생성

		//history back일때는 modal 안보여주는 코드 1
		history.replaceState({}, null, null);

		function checkModal(modal) { //modal 생성함수 선언
			if (history.state)
				return; //코드2
			if (modal) {
				$(".modal-body").html(modal);
				$("#myModal").modal("show");

			}
		}
	});

	function read(nno) {
		var url = "read";
		url += "?nno=" + nno; //java스크립트변수
		url += "&col=${col}"; //JSP변수
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";

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
		<h2 style="color:#fac564;">공지사항</h2>
		<form class="form-inline" action="./list">
			<div class="form-group">
			
				<select class="form-control" name="col">
					<option style="color:black;" value="id" <c:if test="${col=='id' }">selected</c:if>>성명</option>
					<option style="color:black;"  value="title" <c:if test="${col=='title' }">selected</c:if>>제목</option>
					
					<option style="color:black;"  value="title_content"
						<c:if test="${col=='title_content' }">selected</c:if>>제목+내용</option>
					<option style="color:black;"  value="total" <c:if test="${col=='total' }">selected</c:if>>전체출력</option>
				</select>
			</div>
			<div class="form-group">
				<input type="text" class="from-control" placeholder="Enter 검색어"
					name="word" value="${word}">
			</div>
			<button type="submit" class="btn btn-white btn-outline-white">검색</button>
			<c:if test="${ not empty id && grade=='A' }">
			<button type="button" class="btn btn-white btn-outline-white"
				onclick="createM()">등록</button>
				</c:if>
		</form>
		<table class="table table-striped">
			<thead>
				<tr>
					<th style="color:#fac564;">번호</th>
					<th style="color:#fac564;">제목</th>
					<th style="color:#fac564;">카테고리</th>
					<th style="color:#fac564;">작성자</th>
					<th style="color:#fac564;">조회수</th>

				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty list }">
						<tr>
							<td colspan="4">등록된 게시판이 없습니다.</td>
					</c:when>
					<c:otherwise>
						<c:forEach var="dto" items="${list}">

							<tr>
								<td>${dto.nno}</td>
								<td><a href="javascript:read('${dto.nno}')">${dto.title}</a></td>
								<td>${dto.category}</td>
								<td>${dto.id}</td>
								<td>${dto.viewcnt}</td>
							</tr>

						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<div>${paging}</div>
	</div>

	<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content" style="border: 3px solid #fff;">
					<div class="modal-header" style="background-color: black">

						<h4 class="modal-title" style="color: #fac564">확인 메세지</h4>
					</div>
					<div class="modal-body" style="background-color: black; color: white;">
						<p>This is a small modal.</p>
					</div>
					<div class="modal-footer" style="background-color: black">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<script src="${root }/js/jquery.min.js"></script>
	<script src="${root }/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="${root }/js/popper.min.js"></script>
	<script src="${root }/js/bootstrap.min.js"></script>
	<script src="${root }/js/jquery.easing.1.3.js"></script>
	<script src="${root }/js/jquery.waypoints.min.js"></script>
	<script src="${root }/js/jquery.stellar.min.js"></script>
	<script src="${root }/js/owl.carousel.min.js"></script>
	<script src="${root }/js/jquery.magnific-popup.min.js"></script>
	<script src="${root }/js/aos.js"></script>
	<script src="${root }/js/jquery.animateNumber.min.js"></script>
	<script src="${root }/js/bootstrap-datepicker.js"></script>
	<script src="${root }/js/jquery.timepicker.min.js"></script>
	<script src="${root }/js/scrollax.min.js"></script>
	<!-- 		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
	<%-- 		<script src="${root }/js/google-map.js"></script> --%>
	<script src="${root }/js/main.js"></script>
</body>
</html>
