<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="/ssi/ssi.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<script type="text/JavaScript">
	function listM() {
		var url = "${root}/notice/list";
		location.href = url;
	}
</script>

</head>
<body>

	<div class="container">

		<h2 style="color:#fac564;">공지사항 등록</h2>
		<form class="form-horizontal" action="create" method="post">

			<input type="hidden" name="id" value="${id }">
			<div class="form-group">
				<label  for="title"
					style="color: #fac564;">제목</label>
				<div>
					<input required="required" type="text" name="title" id="title"
						class="form-control">
				</div>
			</div>

			<div class="form-group">
				<label style="color: #fac564;">내용</label>
				<div>
					<select name="category" id="category" required="required">
						<option value="">분류</option>
						<option value="공지사항">공지사항</option>
						<option value="이벤트">이벤트</option>
					</select><br>
				</div>
				<div>
					<textarea name="content" id="content" class="form-control" rows="12"></textarea>
				</div>
			</div>


			<div class="form-group">
				<div >
					<button type="submit" class="btn btn-white btn-outline-white">등록</button>
					<button class="btn btn-white btn-outline-white" type="button"
						onclick="listM()">취소</button>
				</div>
			</div>
		</form>
	</div>

</body>
</html>
