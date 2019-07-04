<%@ page contentType="text/html; charset=UTF-8" %> 
<%
String id = request.getParameter("id");
String oldfile = request.getParameter("grade");
%> 

<!DOCTYPE html> 
<html> 
<head>
  <title>사진수정</title>
  <meta charset="utf-8">
</head>
<body>
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10" style="color: #fac564;">회원 등업</h1>

<form class="form-horizontal"
action="updateGrade"
method="post"
>
<input type="hidden" name="id" value="${param.id}">


<div class="form-group">
  <label class="control-label col-sm-2" style="color:#fac564;">아이디</label>
  <div class="col-sm-3">${param.id}</div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="grade" style="color:#fac564;">등급</label>
				<div class="col-sm-3">
					<select name="grade" class="form-control">
					<option style="color: black;" value='A'>관리자</option>
					<option style="color: black;" value='C'>쉐프등급</option>
					<option style="color: black;" value='N' selected>일반등급</option>
					</select>
					</div>
				</div>

<div class="form-group">
         <div class="col-sm-offset-2 col-sm-5">
         <button class="btn btn-white btn-outline-white">수정</button>
         <button type="button" class="btn btn-white btn-outline-white"
         onclick="history.back()">취소</button>
         </div>
      </div>
</form>
</div>
</body> 
</html> 