<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_recipe.jsp"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script type="text/JavaScript">
	window.onload = function() {
		CKEDITOR.replace('content'); // <TEXTAREA>태그 id 값
	};
</script>
<script type="text/JavaScript">
    // content: textarea name
	function inputcheck() {
		if (CKEDITOR.instances['content'].getData() == '') {
			window.alert('내용을 입력해 주세요.');
			CKEDITOR.instances['content'].focus();
			return false;
		}
	}
</script>
<meta charset="utf-8">
<title>레시피 수정</title>
</head>
<body>
	<div class="container">
		<form class="form-horizontal" method="post" action="update" enctype="multipart/form-data" name="frm" onsubmit="return inputcheck()">
		<input type="hidden" name="rno" id="rno" value="${dto.rno }">
			<input type="hidden" name="oldfile" value="${dto.fname}">
			<input type="hidden" name="col" value="${param.col}">
			<input type="hidden" name="word" value="${param.word}">
			<input type="hidden" name="nowPage" value="${param.nowPage}">
			<div class="cont_line">
				<p class="cont_tit4" style="color: #fac564">레시피 제목</p>
				<input  required="required" type="text" name="title" id="title" value="${dto.title}"
					class="form-control" placeholder="예) 소고기 미역국 끓이기"
					style="width: 610px;">
			</div>
			<br>
			<div class="cont_line">
				<p class="cont_tit4" style="color: #fac564">재료</p>
				<input  required="required" type="text" name="ingredient" id="ingredient" value="${dto.ingredient}"
					class="form-control" placeholder="예) 소고기 100g, 미역 15g"
					style="width: 610px;">
			</div>
			<br>
			<div class="cont_line pad_b_25" style="height: 100%; width: 100%;">
				<p class="cont_tit4" style="color: #fac564">요리방법</p>
				<p class="cont_tit4" style="width: 610px; color:#6c757d;">예) 다음의 양식을 지켜주세요<br>
&nbsp;&nbsp;1) 참기름을 두르고 소고기를 볶습니다 <br>
&nbsp;&nbsp;2) 미역을 넣고 계속 볶습니다 "</p>
				<textarea name="content" id="content" class="form-control step_cont">${dto.content}</textarea>
			</div>
			<br>
			<div class="cont_line">
				<p class="cont_tit4" style="color: #fac564">요리정보</p>
				분류 
				<select  required="required" name="category" id="category">
					<option value="" >분류</option>
					<option value="밑반찬" <c:if test="${dto.category=='밑반찬'}">
					selected
				</c:if>>밑반찬</option>
					<option value="메인반찬" <c:if test="${dto.category=='메인반찬'}">
					selected
				</c:if>>메인반찬</option>
					<option value="디저트" <c:if test="${dto.category=='디저트'}">
					selected
				</c:if>>디저트</option>
				</select>&nbsp; 인원 
				
				<select  required="required" name="portion" id="portion">
					<option value="" >인원</option>
					<option value="1인분" <c:if test="${dto.portion=='1인분'}">
					selected
				</c:if>>1인분</option>
					<option value="2인분" <c:if test="${dto.portion=='2인분'}">
					selected
				</c:if>>2인분</option>
					<option value="3인분" <c:if test="${dto.portion=='3인분'}">
					selected
				</c:if>>3인분</option>
					<option value="4인분" <c:if test="${dto.portion=='4인분'}">
					selected
				</c:if>>4인분</option>
					<option value="5인분" <c:if test="${dto.portion=='5인분'}">
					selected
				</c:if>>5인분</option>
					<option value="6인분이상" <c:if test="${dto.portion=='6인분이상'}">
					selected
				</c:if>>6인분이상</option>
				</select>&nbsp; 시간 
				
				<select  required="required" name="time" id="time">
					<option value="">시간</option>
					<option value="5분이내" <c:if test="${dto.time=='5분이내'}">
					selected
				</c:if>>5분이내</option>
					<option value="10분이내" <c:if test="${dto.time=='10분이내'}">
					selected
				</c:if>>10분이내</option>
					<option value="15분이내" <c:if test="${dto.time=='15분이내'}">
					selected
				</c:if>>15분이내</option>
					<option value="20분이내" <c:if test="${dto.time=='20분이내'}">
					selected
				</c:if>>20분이내</option>
					<option value="30분이내" <c:if test="${dto.time=='30분이내'}">
					selected
				</c:if>>30분이내</option>
					<option value="60분이내" <c:if test="${dto.time=='60분이내'}">
					selected
				</c:if>>60분이내</option>
					<option value="90분이내" <c:if test="${dto.time=='90분이내'}">
					selected
				</c:if>>90분이내</option>
					<option value="2시간이내" <c:if test="${dto.time=='2시간이내'}">
					selected
				</c:if>>2시간이내</option>
					<option value="2시간이상" <c:if test="${dto.time=='2시간이상'}">
					selected
				</c:if>>2시간이상</option>
				</select>
			</div><br>
				<div class="cont_line">
					<p class="cont_tit4" style="color: #fac564">썸네일</p>
					<input type="file" class="form-control" id="fname" name="fnameMF"
						accept=".jpg,.gif,.png"/>
				</div>
				<div class="cont_line">
					<p class="cont_tit4" style="color: #fac564">기존 썸네일</p>
					<div class="col-sm-6">
						<img class="img-rounded" width="200px" height="200px" src="./storage/${dto.fname}">
				</div>
			</div>
			<br>
			<input type="submit" class="btn btn-white btn-outline-white"
				value="수정"> 
			<input type="reset" onclick="history.back()" class="btn btn-white btn-outline-white" value="취소">
		</form>
	</div>
		<script src="${root }/js/jquery.min.js"></script>
		<script src="${root }/js/jquery-migrate-3.0.1.min.js"></script>
		<script src="${root }/js/popper.min.js"></script>
		<script src="${root }/js/bootstrap.min.js"></script>
		<script src="${root }/js/jquery.easing.1.3.js"></script>
		<script src="${root }/js/jquery.waypoints.min.js"></script>
		<script src="${root }/js/jquery.stellar.min.js"></script>
		<script src="${root }/js/owl.carousel.min.js"></script>
		<script src="${root }/js/jquery.magnific-popup.min.js"></script>
		<script src="${root }/js/aos.js"></script>
		<script src="${root }/js/jquery.animateNumber.min.js"></script>
		<script src="${root }/js/bootstrap-datepicker.js"></script>
		<script src="${root }/js/jquery.timepicker.min.js"></script>
		<script src="${root }/js/scrollax.min.js"></script>
<!-- 		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
<%-- 		<script src="${root }/js/google-map.js"></script> --%>
		<script src="${root }/js/main.js"></script>
	
</body>
</html>