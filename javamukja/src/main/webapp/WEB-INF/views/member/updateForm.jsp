<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>정보수정</title>
<meta charset="utf-8">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style type="text/css">
#need {
	color: red;
}

.need {
	color: red;
}
</style>
<script type="text/javascript">
  function sample6_execDaumPostcode() {
  new daum.Postcode({
  oncomplete : function(data) {
  //d 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 //d 각 주소의 노출 규칙에 따라 주소를 조합한다.
 //d 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
  var addr = ''; // 주소 변수
  var extraAddr = ''; // 참고항목 변수

 //d 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
       addr = data.roadAddress;
        } else { // 사용자가 지번 주소를 선택했을 경우(J)
          addr = data.jibunAddress;
        }

 //d 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
  if (data.userSelectedType === 'R') {
 //d 법정동명이 있을 경우 추가한다. (법정리는 제외)
 //d 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
  if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
       extraAddr += data.bname;
          }
 //d 건물명이 있고, 공동주택일 경우 추가한다.
  if (data.buildingName !== '' && data.apartment === 'Y') {
     extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
                : data.buildingName);
          }
 //d 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
  if (extraAddr !== '') {
       extraAddr = ' (' + extraAddr + ')';
  }
        }
 //d 우편번호와 주소 정보를 해당 필드에 넣는다.
 document.getElementById('sample6_postcode').value = data.zonecode;
 document.getElementById("sample6_address").value = addr;
 //d 커서를 상세주소 필드로 이동한다.
 document.getElementById("sample6_detailAddress").focus();
      }
    }).open();
  }
</script>
<script type="text/javascript">
  function emailCheck(email){
      var url = "emailCheck";
	  var param = "email=" +email;
	  $.get(
	          url,
	          param,
	          function(data, textStatus){
	            $("#emailcheck").text(data);
	     });
  }
 
  function nickCheck(nickname){
      var url = "nickCheck";
	  var param = "nickname=" +nickname;
	  $.get(
	          url,
	          param,
	          function(data, textStatus){
	            $("#nickcheck").text(data);
	     });
  }
  
  </script>
<script type="text/javascript">
    if(f.email.value==""){
      alert("이메일을 입력해주세요.");
      f.email.focus();
      return false;
    }
    if(f.nickname.value==""){
        alert("닉네임을 입력해주세요.");
        f.nickname.focus();
        return false;
      }
    if(f.job.selectedIndex==0){
      alert("직업을 선택해주세요.");
      f.job.focus();
      return false;
    }
  }
 }
  </script>
</head>
<body>
	<div class="container">
		<h1 class="col-sm-offset-2 col-sm-10" style="color: #fac564;">정보수정</h1>

		<form class="form-horizontal" action="update" method="post" name="frm"
			onsubmit="return incheck(this)">

			<input type="hidden" name="id" value="${dto.id}" /> <input
				type="hidden" name="xemail" value="${dto.email}" />

			<div class="form-group">
				<label class="control-label col-sm-2" style="color: #fac564;">아이디</label>
				<div class="col-sm-3">${dto.id}</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" style="color: #fac564;">성명</label>
				<div class="col-sm-3">${dto.mname}</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" style="color: #fac564;">닉네임</label>
				<div class="col-sm-12">
					<input type="text" name="nickname" id="nickname"
						class="form-control" value="${dto.nickname }" required="required">
				</div>
				<button class="btn col-sm-2" type="button"
					onclick="nickCheck(this.form.nickname.value)">닉네임변경</button>
				<div id="nickcheck" class="need"></div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-6" style="color: #fac564;">이메일</label>
				<div class="col-sm-12">
					<input type="email" name="email" id="email" class="form-control"
						value="${dto.email}" required="required">
				</div>
				<button class="btn col-sm-2" type="button"
					onclick="emailCheck(this.form.email.value)">EMAIL변경</button>
				<div id="emailcheck" class="need"></div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-4" for="sample6_postcode"
					style="color: #fac564;">우편번호</label>
				<div class="col-sm-3">
					<input type="text" name="zipcode" id="sample6_postcode"
						class="form-control" value="${dto.zipcode}">
				</div>
				<button class="btn col-sm-2" type="button"
					onclick="sample6_execDaumPostcode()">주소검색</button>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="sample6_address"
					style="color: #fac564;">주소</label>
				<div class="col-sm-6">
					<input type="text" name="address" id="sample6_address"
						class="form-control" value="${dto.address}">
				</div>
			</div>
			<div class="form-group">
				<button class="btn btn-white btn-outline-white">수정</button>
				<button type="button" class="btn btn-white btn-outline-white"
					onclick='location.href=history.back()'>취소</button>
			</div>
		</form>
	</div>
</body>
</html>
