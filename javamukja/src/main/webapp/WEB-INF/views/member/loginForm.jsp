<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/ssi/ssi.jsp" %>  

<!DOCTYPE html> 
<html> 
<head>
  <title>Login</title>
  <meta charset="utf-8">
<script type="text/javascript">
function searchId(){
	var url = "searchIdForm";
	
	wr = window.open(url,"아이디찾기","width=500,height=500");
	wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2);
}

function searchPw(){
	var url = "searchPwForm";
	
	wr = window.open(url,"비밀번호찾기","width=500,height=500");
	wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2);
}

</script>
</head>
<body>
<div class="container">
<h2 class="col-sm-offset-2 col-sm-10" style="color:#fac564;">LOGIN</h2>

<form class="form-horizontal"
action="${root}/member/login"
method="post">

  <input type="hidden" name="rurl" value="${param.rurl}">
  <input type="hidden" name="nowPage" value="${param.nowPage}">
  <input type="hidden" name="nPage" value="${param.nPage}">
  <input type="hidden" name="col" value="${param.col}">
  <input type="hidden" name="word" value="${param.word}">
  <input type="hidden" name="gno" value="${param.gno}">
  <input type="hidden" name="rno" value="${param.rno}">
  <input type="hidden" name="nno" value="${param.nno}">
  <input type="hidden" name="tno" value="${param.tno}">


<div class="form-group">
  <label class="control-label col-sm-2" for="id" style="color:#fac564;">ID</label>
  <div class="col-sm-3">
  <input type="text" name="id" id="id" class="form-control"
  required="required" value='${c_id_val}'>
  
  <c:choose>
  <c:when test="${c_id=='Y'}">
  <input type='checkbox' name='c_id' value='Y' checked='checked'> ID저장
  </c:when>
  <c:otherwise>
  <input type='checkbox' name='c_id' value='Y'> ID저장
  </c:otherwise>
  </c:choose>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="passwd" style="color:#fac564;">PASSWORD</label>
  <div class="col-sm-3">
  <input type="password" name="passwd" id="passwd" class="form-control" required="required">
  </div>
</div>

<div class="form-group">
         <div class="col-sm col-sm-10">
         <button type="submit" class="btn btn-white btn-outline-white">로그인</button>
         <button class="btn btn-white btn-outline-white"
         type="button" onclick="location.href='${root}/member/agreement'">회원가입</button>
         <button class="btn btn-white btn-outline-white" 
         type="button" onclick="searchId()">아이디찾기</button>
         <button class="btn btn-white btn-outline-white"
         type="button" onclick="searchPw()">비밀번호찾기</button>
         </div>
      </div>
</form>
</div>
</body> 
</html> 