<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>



<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기</title>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <!-- jquery ajax에 필요한 부분 start -->
    <script type="text/javascript"
    src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
    <script type="text/javascript"
    src="<%=request.getContextPath()%>/js/ajaxsetup.js"></script>
  <!--jquery ajax에 필요한 부분 end  -->

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
<script src="${pageContext.request.contextPath}/js/ajaxsetup.js"></script>
<style>
.btn-primary {
    color: black;
    background-color: #fac564;
    border-color: #fac564;
}
.btn-primary:hover {
    color: #fac564;
    background-color: black;
    border-color: #fac564;
}
</style>
</head>
<body style="background-color:black;">
	<div class="container">
			<form class="form-horizontal" method="post" name="frm" action="deleteAll" align="center">
	
		<h2 class="col-sm-offset-2 col-sm-4" style="color: #ff0000">정말로 삭제 하시겠습니까? <br>다시 되돌릴 수 없습니다.</h2>
					<br><br>
					<div align="center">
					<button type="submit" class="btn btn-primary p-2 px-xl-3 py-xl-2">삭제</button>
					<button type="button" class="btn btn-primary p-2 px-xl-3 py-xl-2"
					 onClick='self.close()'>닫기</button>
					 </div>
					 </form>
				</div>
			</div>
		</form>
		<div id="idfind"></div>
	</div>
</body>
</html>