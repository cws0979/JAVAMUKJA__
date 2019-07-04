<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html> 
<html> 
<head>
  <title>회원가입</title>
  <meta charset="utf-8">
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script>
  function sample6_execDaumPostcode() {
  new daum.Postcode({
  oncomplete : function(data) {
  var addr = ''; // 주소 변수
  var extraAddr = ''; // 참고항목 변수

  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
       addr = data.roadAddress;
        } else { // 사용자가 지번 주소를 선택했을 경우(J)
          addr = data.jibunAddress;
        }

  if (data.userSelectedType === 'R') {
  if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
       extraAddr += data.bname;
          }
  if (data.buildingName !== '' && data.apartment === 'Y') {
     extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
                : data.buildingName);
          }
  if (extraAddr !== '') {
       extraAddr = ' (' + extraAddr + ')';
  }
        }
 document.getElementById('sample6_postcode').value = data.zonecode;
 document.getElementById("sample6_address").value = addr;
      }
    }).open();
  }
</script>
  <style type="text/css">
  #need{
  color: red;
  }
  #idcheck{
  color: red;
  }
  #emailcheck{
  color: red;
  }
  </style>
  <script type="text/javascript">
  function idCheck(id){
    if(id==""){
      alert("아이디를 입력해주세요.");
      document.frm.id.focus();
    }else{
      var url = "idCheck";
      var param = "id=" +id;
      $.get(
          url,
          param,
          function(data, textStatus){
            $("#idcheck").text(data);
     }
    );
   }
  }
  
  function emailCheck(email){
    if(email==""){
      alert("이메일을 입력해주세요.");
      document.frm.email.focus();
    }else{
      var url = "emailCheck";
      var param = "email=" +email;
      $.get(
          url,
          param,
          function(data, textStatus){
            $("#emailcheck").text(data);
     }
    );
   }
  }
  </script>
  <script type="text/javascript">
  function incheck(f){
    if(f.id.value==""){
      alert("아이디를 입력해주세요.");
      f.id.focus();
      return false;
    }
    if(f.passwd.value==""){
      alert("비밀번호를 입력해주세요.");
      f.passwd.focus();
      return false;
    }
    if(f.repasswd.value==""){
      alert("비밀번호 확인을 입력해주세요.");
      f.repasswd.focus();
      return false;
    }
    if(f.passwd.value!=f.repasswd.value){
      alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
      f.passwd.focus();
      return false;
    }
    if(f.mname.value==""){
      alert("이름을 입력해주세요.");
      f.mname.focus();
      return false;
    }
    if(f.email.value==""){
      alert("이메일을 입력해주세요.");
      f.email.focus();
      return false;
    }
  }
  </script>
</head>
<body>
<div class="container">
<h2 class="col-sm-offset-2 col-sm-10" style="color: #fac564;">회원가입</h2>
<label class="col-sm-offset-2 col-sm-10">( <span id="need">*</span> 필수입력사항)</label>

<form class="form-horizontal"
action="createProc"
method="post"
name="frm"
onsubmit="return incheck(this)"
enctype="multipart/form-data"
>

<br>
<div class="input-file">
<label for="upload" class="file-label"></label>
<input type="file" accept=".jpg,.gif,.png" name="fnameMF" id="fname"
class="btn btn-white btn-outline-white p-1 px-xl-1 py-xl-1"/>
</div>
<br>

<div class="form-group">
  <label class="control-label col-sm-6" for="id" style="color: #fac564;">
  <span id="need">*</span> 아이디</label>
  <div class="col-sm-6">
  <input type="text" name="id" id="id" class="form-control">
  </div>
  <button class="btn btn-white btn-outline-white p-1 px-xl-1 py-xl-1"
  type="button" 
  onclick="idCheck(document.frm.id.value)">ID중복확인</button>
  <div id="idcheck"></div>
</div>

<div class="form-group">
  <label class="control-label col-sm-6" for="nickname"
  style="color: #fac564;">닉네임</label>
  <div class="col-sm-6">
  <input type="text" name="nickname" id="nickname" class="form-control">
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-6" for="passwd" style="color: #fac564;">
  <span id="need">*</span> 비밀번호</label>
  <div class="col-sm-6">
  <input type="password" name="passwd" id="passwd" class="form-control">
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-6" for="repasswd" style="color: #fac564;">
  <span id="need">*</span> 비밀번호 확인</label>
  <div class="col-sm-6">
  <input type="password" name="repasswd" id="repasswd" class="form-control">
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-6" for="mname"
  style="color: #fac564;">성명</label>
  <div class="col-sm-6">
  <input type="text" name="mname" id="mname" class="form-control">
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-6" for="email" style="color: #fac564;">
  <span id="need">*</span> 이메일</label>
  <div class="col-sm-6">
  <input type="email" name="email" id="email" class="form-control">
  </div>
  <button class="btn btn-white btn-outline-white p-1 px-xl-1 py-xl-1"
  type="button"
  onclick="emailCheck(document.frm.email.value)">EMAIL중복확인</button>
  <div id="emailcheck"></div>
</div>

<div class="form-group">
  <label class="control-label col-sm-6" for="sample6_postcode"
  style="color: #fac564;">우편번호</label>
  <div class="col-sm-6">
  <input type="text" name="zipcode" id="sample6_postcode" class="form-control">
  </div>
  <button class="btn btn-white btn-outline-white p-1 px-xl-1 py-xl-1"
  type="button"
  onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
</div>

<div class="form-group">
  <label class="control-label col-sm-6" for="sample6_address"
  style="color: #fac564;">주소</label>
  <div class="col-sm-6">
  <input type="text" name="address" id="sample6_address" class="form-control">
</div>
</div>

<div class="form-group">
         <div class="col-sm-offset-2 col-sm-5">
         <button class="btn btn-white btn-outline-white">등록</button>
         <button type="reset" class="btn btn-white btn-outline-white"
         onclick="history.back()">취소</button>
         </div>
      </div>
</form>
</div>
</body> 
</html> 