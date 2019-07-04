<%@ page contentType="text/html; charset=UTF-8" %>  
<%@ include file="/ssi/ssi.jsp"%>
<!DOCTYPE html> 
<html> 
<head>
  <title>비밀번호 변경</title>
  <meta charset="utf-8">
  <script type="text/javascript">
  function inCheck(f){
    if(f.passwd.value==""){
      alert("패스워드를 입력하세요");
      f.passwd.focus();
      return false;
    }
    if(f.repasswd.value==""){
      alert("패스워드 확인을 입력하세요");
      f.passwd.focus();
      return false;
    }
    if(f.passwd.value!=f.repasswd.value){
      alert("패스워드가 일치하지 않습니다. 다시 입력해주세요.");
      f.repasswd.value="";
      f.passwd.focus();
      return false;
    }
  }
  </script>
</head>
<body>
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10" color="#fac564";>비밀번호 변경</h1>

<form class="form-horizontal"
action="updatePw"
method="post"
onsubmit="return inCheck(this)">

<input type="hidden" name="id" value="${param.id}">

<div class="form-group">
  <label class="control-label col-sm-4" for="passwd" style=" color:#fac564;">비밀번호</label>
  <div class="col-sm-6">
  <input type="password" name="passwd" id="passwd" class="form-control">
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-4" for="repasswd" style=" color:#fac564;">비밀번호 확인</label>
  <div class="col-sm-6">
  <input type="password" name="repasswd" id="repasswd" class="form-control">
  </div>
</div>

<div class="form-group">
         <div class="col-sm-offset-2 col-sm-5">
         <button class="btn btn-white btn-outline-white">변경</button>
         <button type="button" class="btn btn-white btn-outline-white"
          onclick="history.back()">취소</button>
         </div>
      </div>
</form>
</div>
</body> 
</html> 