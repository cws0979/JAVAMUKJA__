<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<title>Talk</title>
<meta charset="utf-8">
<!-- <style> -->

<!-- .form-group { -->
<!-- 	color: #FFCD12; -->
<!-- } -->

<!-- .form-control { -->
	
<!-- } -->

<!-- .btn { -->
<!-- 	color: #000; -->
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
		<h2 style="color:#fac564">자유 게시글 등록</h2>

		<form class="form-horizontal" action="create" method="post"
			onsubmit="return incheck(this)" enctype="multipart/form-data">

				<input type="hidden" name="id" value="${id}">
<!-- 			<input class="col-sm-6" id="id" name="id" maxlength="30" type="hidden" -->
<%-- 				value="${dto.id }" tabindex="105" placeholder=""> --%>
				
			<div class="form-group">
				<label  for="title">Title</label>
				<div class="col-sm-6"
					style="border-right: #FFCD12 1px solid; border-left: #FFCD12 1px solid; border-top: #FFCD12 1px solid; border-bottom: #FFCD12 1px solid;">
					<textarea required="required" name="title" id="title" class="form-control"></textarea>
				</div>
			</div>

			<div class="form-group">
				<label  for="content">Content</label>
				<div class="col-sm-6"
					style="border-right: #FFCD12 1px solid; border-left: #FFCD12 1px solid; border-top: #FFCD12 1px solid; border-bottom: #FFCD12 1px solid;">
					<textarea required="required" rows="10" cols="10" id="content" name="content"
						class="form-control"></textarea>
				</div>
			</div>


			<div class="form-group">
				<label  for="fname">File</label>
				<div class="col-sm-5"
					style="border-right: #FFCD12 1px solid; border-left: #FFCD12 1px solid; border-top: #FFCD12 1px solid; border-bottom: #FFCD12 1px solid;">
					<input required="required" type="file" accept=".jpg,.gif,.png" name="fnameMF"
						id="fname" class="form-control">
				</div>
			</div>

			<div class="form-group">
				<label  for="hashtag">HashTag</label>
				<div class="col-sm-6"
					style="border-right: #FFCD12 1px solid; border-left: #FFCD12 1px solid; border-top: #FFCD12 1px solid; border-bottom: #FFCD12 1px solid;">
					<textarea required="required" name="hashtag" id="hashtag" class="form-control"></textarea>
				</div>
			</div>

			<div class="form-group">
				<label >Category</label>
				<div class="col-sm-5"
					style="border-right: #FFCD12 1px solid; border-left: #FFCD12 1px solid; border-top: #FFCD12 1px solid; border-bottom: #FFCD12 1px solid;">
					<select class="form-control" name="category">
						<option value="자유글" style="color: black;">자유글</option>
						<option value="요리글" style="color: black;">요리글</option>

					</select>
				</div>
			</div>
			<div class="form-group">
				<div>
					<button class="btn btn-white btn-outline-white">등록</button>
					<button type="reset" class="btn btn-white btn-outline-white">취소</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
