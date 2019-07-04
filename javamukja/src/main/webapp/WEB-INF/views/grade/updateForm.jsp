<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html> 
<html> 
<head>
<meta charset="utf-8">
<title>게시판 수정</title>
<script type="text/javascript">
  function listM(){
    var url = "list";
    url += "?col=${param.col}";
    url += "&word=${param.word}";
    url += "&nowPage=${param.nowPage}";
    
    location.href=url;
  }
  
  window.onload=function(){
    CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
 };

  </script>
</head>
<body>
<div class="container">
<h2 class="col-sm-offset-2" style="color:#fac564">게시판 수정</h2>
<form class="form-horizontal" method="post" action="update">

<input type="hidden" name="gno" value="${dto.gno}">
<input type="hidden" name="col" value="${param.col}">
<input type="hidden" name="word" value="${param.word}">
<input type="hidden" name="nowPage" value="${param.nowPage}">

<div class="form-group">
<label class="control-label col-sm-2" for="id" style="color:#fac564">작성자</label>
<div class="col-sm-6">${id }
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" for="title" style="color:#fac564">제목</label>
<div class="col-sm-6">
<input type="text" class="form-control" required="required" id="title" name="title" 
value="${dto.title}"/>
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" for="content" style="color:#fac564">내용</label>
<div class="col-sm-6">
<textarea class="form-control" required="required" id="content" name="content" rows="10">${dto.content}</textarea>
</div>
</div>

<div class="form-group">
<div class="col-sm-offset-2 col-sm-10">
<button type="submit"id='addReplyBtn' class="btn btn-white btn-outline-white">수정</button>
<button type="reset" id='addReplyBtn' class="btn btn-white btn-outline-white">취소</button>
<button type="button"id='addReplyBtn' class="btn btn-white btn-outline-white" onclick="listM()">목록</button>
</div>
</div>
</form>
</div>
</body> 
</html> 