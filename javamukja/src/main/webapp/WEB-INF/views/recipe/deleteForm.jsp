<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_recipe.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>레시피 삭제</title>
<meta charset="utf-8">
<style type="text/css">
#red {
	color: red;
}
</style>
</head>
<body>
	<div class="container">
		<form class="form-horizontal" method="post" action="delete">
			<input type="hidden" name="rno" value="${param.rno}"> <input
				type="hidden" name="col" value="${param.col}"> <input
				type="hidden" name="word" value="${param.word}"> <input
				type="hidden" name="nowPage" value="${param.nowPage}"> <input
				type="hidden" name="oldfile" value="${param.oldfile}">
			<p id="red" class="col-sm-offset-2 col-sm-6">삭제하면 복구할 수 없습니다.</p>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button class="btn btn-white btn-outline-white">삭제</button>
					<button type="reset" class="btn btn-white btn-outline-white">취소</button>
					<button type="button" class="btn btn-white btn-outline-white"
						onclick="location.href='./list'">목록</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
