<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Pizza - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
.dropbtn {
  background-color: #fac564;
  color: black;
  padding: 5px;
  font-size: 14px;
  border: none;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
/*   padding: 12px 16px; */
  text-decoration: none;
  display: block;
}
.drop-a {
  color: black;
/*   padding: 12px 16px; */
background-color:#fac564;
  text-decoration: none;
  display: block;
}
.drop-a :hover{
  color: #fac564;
/*   padding: 12px 16px; */
background-color:black;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: black;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {
background-color: black; 
border: 1px solid #fac564;
color: #fac564;
}
</style>
    
	<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- jQuery AJAX에 필요한 부분 start -->
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
	<script type="text/javascript" src="${root}/js/ajaxsetup.js"></script>
	
  	<!-- jquery ajax에 필요한 부분 end-->
    <script type="text/javascript" src="${root}/js/bootstrap.min.js"></script>
    
    
    <!--  ================================================================================-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nothing+You+Could+Do" rel="stylesheet">

    <link rel="stylesheet" href="${root }/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${root }/css/animate.css">
    
    <link rel="stylesheet" href="${root }/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${root }/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${root }/css/magnific-popup.css">

    <link rel="stylesheet" href="${root }/css/aos.css">

    <link rel="stylesheet" href="${root }/css/ionicons.min.css">
    <link rel="stylesheet" href="${root }/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${root }/css/jquery.timepicker.css">
    <link rel="stylesheet" href="${root }/css/flaticon.css">
    <link rel="stylesheet" href="${root }/css/icomoon.css">
    <link rel="stylesheet" href="${root }/css/style.css">
    
    <!-- 실시간 검색어 순위 -->
    <script type="text/javascript">
		$("#a").ready(function(){
		// 	alert("호출");
		$.ajax({
		url: '${root}/find/rank', //경로
		type: 'POST',
		dataType: 'json', //파일 타입
		success : function(data){ //연결에 성공하였을때 작업할 내용
			console.log(data)
			var link = "${root}/recipe/list?col=title&word="
		// alert(entry.fstr);
		// 	alert(data[0].fstr);
		$('#b').append("<a href='"+link+data[0].fstr+"'>"+"　① "+data[0].fstr+"</a>");
		$('#b').append("<a href='"+link+data[1].fstr+"'>"+"　② "+data[1].fstr+"</a>");
		$('#b').append("<a href='"+link+data[2].fstr+"'>"+"　③ "+data[2].fstr+"</a>");
		$('#b').append("<a href='"+link+data[3].fstr+"'>"+"　④ "+data[3].fstr+"</a>");
		$('#b').append("<a href='"+link+data[4].fstr+"'>"+"　⑤ "+data[4].fstr+"</a>");
		$('#b').append("<a href='"+link+data[5].fstr+"'>"+"　⑥ "+data[5].fstr+"</a>");
		$('#b').append("<a href='"+link+data[6].fstr+"'>"+"　⑦ "+data[6].fstr+"</a>");
		$('#b').append("<a href='"+link+data[7].fstr+"'>"+"　⑧ "+data[7].fstr+"</a>");
		$('#b').append("<a href='"+link+data[8].fstr+"'>"+"　⑨ "+data[8].fstr+"</a>");
		$('#b').append("<a href='"+link+data[9].fstr+"'>"+"　⑩ "+data[9].fstr+"</a>");
		}
		});
		});
	</script>
    <!-- 실시간 검색어 순위 -->
  </head>
  <body>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	    	  <a class="navbar-brand" href="${root }"><span class="flaticon-pizza-1 mr-1"></span>JAVA<br><small>MUKJA</small></a>
		      
		      
		      <form class="form-list" action="${root }/recipe/list">
			<div style="width=460px; height=31px; left: 200px position:">
		      <input type="hidden" name="col" value="${'title'}">
				<input class="form-control-sm-6" type="text" name="word" value="${word2 }" placeholder="레시피 검색"
 		      	style=" border: 2px solid; border-color:#fac564;">

		      	<button type="submit" class="btn btn-primary btn-outline-white">검색</button>
		   	    
		      	<div class="dropdown">
				  <button id="a" type="button" class="btn btn-primary btn-outline-white">검색순위</button>
				  <div id="b" class="dropdown-content" align="left">
				  </div>
				</div>
		      </div>
		      </form>
		      
		      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
		        <span class="oi oi-menu"></span> Menu
		      </button>
	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item active"><a href="${root }" class="nav-link">HOME</a></li>
	          <li class="nav-item"><a href="${root }/recipe/list" class="nav-link">RECIPE</a></li>
	          <li class="nav-item"><a href="${root }/talk/list" class="nav-link">TALK</a></li>
	          <li class="nav-item"><a href="${root}/notice/list" class="nav-link">NOTICE</a></li>
	          <li class="nav-item"><a href="${root }/grade/list" class="nav-link">GRADE</a></li>
<%-- 	          <li class="nav-item"><a href="${root }/rank/list" class="nav-link">RANK</a></li> --%>
	   <!--   <ul class="navbar-nav ml-auto"> -->
	          <c:choose>
	          <c:when test="${empty sessionScope.id}">
	         <li class="nav-item active"><a class="nav-link" href="${root}/member/agreement">Sign Up</a></li>
	         <li class="nav-item active"><a class="nav-link" href="${root}/member/login">Login</a></li>
	         </c:when>
	          <c:otherwise>
	          <li class="nav-item active">
	          <a class="nav-link"
	          href="${root}/member/read">My Page</a></li>	       
	          <li class="nav-item active">
	          <a class="nav-link"
	          href="${root}/member/logout">Logout</a></li>
	          </c:otherwise>
	          </c:choose>
	          <c:if test="${(not empty sessionScope.id)&&(sessionScope.grade == 'A')}">
	          <li class="nav-item active"><a class="nav-link"
	          href="${root}/admin/list">회원목록</a></li>
	          <li class="nav-item active"><a class="nav-link"
	          href="${root}/find/list">검색관리</a></li>
	          </c:if>
	        </ul>
	      </div>
		  </div>
	  </nav>
</body>
</html>