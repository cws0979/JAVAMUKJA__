<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html> 
<html> 
<head>
<title>게시판 글 삭제</title>
<meta charset="utf-8">
<style type="text/css">
#red {
color: red;
}
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
<h2 class="col-sm-offset-2" style="color:#fac564">게시판 글 삭제</h2>

<c:choose>
	<c:when test="${flag}">
		<div class='well well-lg'>
		<br><br><br>답변이 등록되어있는 글은 삭제할 수 없습니다<br><br>
		<button class="btn btn-white btn-outline-white" onclick='history.back()'>다시시도</button>
		</div>
	</c:when>
	<c:otherwise>
	<!--  -->
	
<form class="form-horizontal" method="post" action="delete">
<input type="hidden" name="gno" value="${param.gno}">
<input type="hidden" name="col" value="${param.col}">
<input type="hidden" name="word" value="${param.word}">
<input type="hidden" name="nowPage" value="${param.nowPage}">
<!-- <div class="form-group"> -->
<!-- <label class="control-label col-sm-2" for="passwd">비밀번호</label> -->
<!-- <div class="col-sm-6"> -->
<!-- <input type="password" class="form-control" id="passwd" name="passwd" /> -->
<!-- </div> -->
<!-- </div> -->
<p id="red" class="col-sm-offset-2 col-sm-6">삭제하면 다시 복구할 수 없습니다. 그래도 삭제 하시겠습니까?</p>
<div class="form-group">
<div class="col-sm-offset-2 col-sm-10">
<button id='addReplyBtn' class="btn btn-white btn-outline-white">삭제</button>
<button type="reset" id='addReplyBtn' class="btn btn-white btn-outline-white">취소</button>
<button type="button" id='addReplyBtn' class="btn btn-white btn-outline-white" onclick="listM()">목록</button>
</div>
</div>
</form>
</c:otherwise>
</c:choose>
</div>
</body> 
</html> 