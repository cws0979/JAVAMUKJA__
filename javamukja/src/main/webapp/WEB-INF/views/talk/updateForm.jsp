<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>


<!DOCTYPE html>
<html>
<head>
<title>Talk Update</title>
<meta charset="utf-8">
<!-- <style> -->
<!-- .form-group { -->
<!-- 	color: #FFCD12; -->
<!-- } -->

<!-- .form-control { -->
	
<!-- } -->

<!-- .btn { -->
<!-- 	display: inline-block; -->
<!-- 	border-radius: 10px; -->
<!-- 	margin: auto; -->
<!-- 	width: 100px; -->
<!-- 	height: 50px; -->
<!-- 	border: none; -->
<!-- 	background: #FFCD12; -->
<!-- 	position: relative; -->
<!-- 	overflow: hidden; &: before { content : ''; -->
<!-- 	background: darken(#1abc9c, 10%); -->
<!-- 	width: 100px; -->
<!-- 	height: 50px; -->
<!-- 	position: absolute; -->
<!-- 	transform: translate($ s * -100, $ s * -40) rotate(130deg); -->
<!-- 	transition: all 700ms ease; -->
<!-- } -->

<!-- & -->
<!-- :after { -->
<!-- 	content: attr(data-word); -->
<!-- 	color: white; -->
<!-- 	font-size: 2em; -->
<!-- 	position: relative; -->
<!-- 	z-index: 100; -->
<!-- 	transition: all 200ms ease; -->
<!-- 	font-weight: 200; -->
<!-- } -->

<!-- & -->
<!-- :hover { &:after { font-size:2.2em; -->
	
<!-- } -->

<!-- & -->
<!-- :before { -->
<!-- 	transform: translate($ s * -20, $ s * -40) rotate(130deg); -->
<!-- } -->
<!-- } -->
<!-- } -->
<!-- </style> -->

</head>

<body>
	<div class="container">
		<h2 style="color:#fac564;">자유 게시글 수정</h2>

		<form class="form-horizontal" action="update" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="id" value="${id}"> 
			<input type="hidden" name="tno" value="${dto.tno }"> 
			<input type="hidden" name="col" value="${param.col }"> 
			<input type="hidden" name="word" value="${param.word}">
			<input type="hidden" name="nowPage" value="${param.nowPage}">
			<div class="form-group">
				<label  for="fname">New File</label>
				<div class="col-sm-5">
					<input type="file" accept=".jpg,.gif,.png" name="fnameMF"
						id="fname" class="form-control" required="required" value="${param.oldfile }">
				</div>
			</div>
			<div class="form-group">
				<label  for="title">Title</label>
				<div class="col-sm-6"
					style="border-right: #FFCD12 1px solid; border-left: #FFCD12 1px solid; border-top: #FFCD12 1px solid; border-bottom: #FFCD12 1px solid;">
					<textarea name="title" id="title" class="form-control">${dto.title }</textarea>
				</div>
			</div>

			<div class="form-group">
				<label  for="content">Content</label>
				<div class="col-sm-6"
					style="border-right: #FFCD12 1px solid; border-left: #FFCD12 1px solid; border-top: #FFCD12 1px solid; border-bottom: #FFCD12 1px solid;">
					<textarea rows="10" cols="10" id="content" name="content"
						class="form-control">${dto.content }</textarea>
				</div>
			</div>

			<div class="form-group">
				<label  for="hashtag">HashTag</label>
				<div class="col-sm-6"
					style="border-right: #FFCD12 1px solid; border-left: #FFCD12 1px solid; border-top: #FFCD12 1px solid; border-bottom: #FFCD12 1px solid;">
					<textarea name="hashtag" id="hashtag" class="form-control" name="hashtag">${dto.hashtag }</textarea>
				</div>
			</div>

			<div class="form-group">
				<label >Category</label>
				<div class="col-sm-5"
					style="border-right: #FFCD12 1px solid; border-left: #FFCD12 1px solid; border-top: #FFCD12 1px solid; border-bottom: #FFCD12 1px solid;">
					<select class="form-control" id="category" name="category">
						<option value="자유글" style="color: black;">자유글</option>
						<option value="요리글" style="color: black;">요리글</option>
					</select>
				</div>
			</div>

		<div class="form-group">
         <button class="btn btn-white btn-outline-white">등록</button>
         <button type="reset" class="btn btn-white btn-outline-white">취소</button>
      </div>
		</form>
	</div>
</body>
</html>
