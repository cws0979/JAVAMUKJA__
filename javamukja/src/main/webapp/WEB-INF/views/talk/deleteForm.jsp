<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html> 
<html> 
<head>
<title>게시판 글 삭제</title>
<meta charset="utf-8">
 
<style type="text/css">
#red {
color: #red;
}
/*   .btn {
	display: inline-block;
	border-radius: 10px;
	margin:3px;
	width: 70px;
	height: 35px;
	border: none;
	background: #FFCD12;
	position: relative;
	overflow: hidden; &: before { content : '';
	background: darken(#1abc9c, 10%);

	transform: translate($ s * -100, $ s * -40) rotate(130deg);
	transition: all 700ms ease;
}
 */

</style>
<script type="text/javascript">
  function listM(){
    var url = "list";
    url += "?col=${param.col}";
    url += "&word=${param.word}";
    url += "&nowPage=${param.nowPage}";
    
    location.href=url;
  }
  </script>
</head>
<body>
<div class="container">
<h2 style="color:#fac564;">자유 게시글 삭제</h2>

<form class="form-horizontal" action="delete" method="post">

<input type="hidden" name="tno" value="${param.tno}">
<input type="hidden" name="col" value="${param.col}">
<input type="hidden" name="word" value="${param.word}">
<input type="hidden" name="nowPage" value="${param.nowPage}">
 

 <p id="red" class="col-sm-offset-2 col-sm-6">삭제하면 복구할 수 없습니다.</p>
 
<div class="form-group">
	<div>
		<button type="submit" class="btn btn-white btn-outline-white">삭제</button>
		<button type="button" class="btn btn-white btn-outline-white" onclick="history.back()">취소</button>
	</div>
</div>
 
</form>
</div>
</body> 
</html> 