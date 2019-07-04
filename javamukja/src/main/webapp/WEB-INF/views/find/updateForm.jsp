<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html> 
<html> 
<head>
<meta charset="utf-8">
<title>검색어 수정</title>
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
<h1 class="col-sm-offset-2" style="color:#fac564">검색어 수정</h1>
<form class="form-horizontal" method="post" action="update">

<input type="hidden" name="fno" value="${dto.fno}">
<input type="hidden" name="col" value="${param.col}">
<input type="hidden" name="word" value="${param.word}">
<input type="hidden" name="nowPage" value="${param.nowPage}">

<div class="form-group">
<label class="control-label col-sm-2" for="fstr" style="color:#fac564">검색어</label>
<div class="col-sm-6">
<input type="text" class="form-control" required="required" id="fstr" name="fstr" 
value="${dto.fstr}"/>
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" for="fcnt" style="color:#fac564">검색횟수</label>
<div class="col-sm-6">
<input type="text" class="form-control" required="required" id="fcnt" name="fcnt" 
value="${dto.fcnt}"/>
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