<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="/ssi/ssi.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>게시판 수정</title>
<meta charset="utf-8">
</head>
<body>

	<div class="container">
		<h2 style="color:#fac564;">공지사항 수정</h2>
		<form class="form-horizontal" action="update" method="post">
			<input type="hidden" name="nno" value="${dto.nno}"> 
			<input type="hidden" name="col" value="${param.col}"> 
			<input type="hidden" name="word" value="${param.word}"> 
			<input type="hidden" name="nowPage" value="${param.nowPage}"> 
			<input type="hidden" name="id" value="${id }">

			<div class="form-group">
				<label style="color:#fac564;" for="title">제목</label>
				<div >
					<input type="text" name="title" id="title" class="form-control"
						value="${dto.title}">
				</div>
			</div>

			<div class="form-group">
				<label style="color:#fac564;" for="content">내용</label><br>
				<div>
				<select name="category" id="category">
					<option value="분류">분류</option>
					<option value="공지사항">공지사항</option>
					<option value="이벤트">이벤트</option>
				</select>
				</div>
				<div >
					<textarea rows="12" id="content" name="content"
						class="form-control">${dto.content}</textarea>
				</div>
			</div>

			<!-- 			<div class="form-group"> -->
			<!-- 				<label  for="passwd">비밀번호</label> -->
			<!-- 				<div class="col-sm-6"> -->
			<!-- 					<input type="password" name="passwd" id="passwd" -->
			<!-- 						class="form-control"> -->
			<!-- 				</div> -->
			<!-- 			</div> -->
			<div class="form-group">
				<div>
					<button type="submit" class="btn btn-white btn-outline-white">수정</button>
					<button type="reset" class="btn btn-white btn-outline-white">취소</button>
				</div>
			</div>


		</form>
	</div>
	
</body>
</html>
