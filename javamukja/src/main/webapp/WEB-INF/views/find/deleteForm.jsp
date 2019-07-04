<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html> 
<html> 
<head>
<title>검색어 삭제</title>
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
<h1 class="col-sm-offset-2" style="color:#fac564">검색어 삭제</h1>
	
<form class="form-horizontal" method="post" action="delete">
<input type="hidden" name="fno" value="${param.fno}">
<input type="hidden" name="col" value="${param.col}">
<input type="hidden" name="word" value="${param.word}">
<input type="hidden" name="nowPage" value="${param.nowPage}">

<p id="red" class="col-sm-offset-2 col-sm-6">삭제하면 다시 복구할 수 없습니다. 그래도 삭제 하시겠습니까?</p>

<div class="form-group">
<div class="col-sm-offset-2 col-sm-10">
<button class="btn btn-white btn-outline-white">삭제</button>
<button type="button" class="btn btn-white btn-outline-white" onclick="listM()">목록</button>
</div>
</div>
</form>
</div>
</body> 
</html> 