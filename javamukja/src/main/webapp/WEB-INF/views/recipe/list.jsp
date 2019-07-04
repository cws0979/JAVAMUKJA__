<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_recipe.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script>
	function readR(rno) {
		var url = "read"

		url += "?rno=" + rno;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";

		location.href = url;
	}

	 $(document).ready(function(){
		  var modal = '${msg}';	// controller에서 가져온 데이터
		  checkModal(modal);		// modal 생성
		  
		  // history back일때는 modal 안보여주는 코드 1
		  history.replaceState({},null,null);
		  
		  function checkModal(modal){	// modal 생성함수 선언
			  if(history.state)
				  return;				// 코드2
			  if(modal){
				$(".modal-body").html(modal);
			  	$("#myModal").modal("show");
			  }
		  }
	  });
</script>
</head>
<body>
	<div class="container">
		<form class="form-inline" action="./list">
			<div class="form-group">
				<select class="form-control" name="col">
					<option value="title" style="color: black;"
						<c:if test="${col=='title'}">
						selected
					</c:if>>제목</option>
					<option value="content" style="color: black;"
						<c:if test="${col=='content'}">
						selected
					</c:if>>내용</option>
					<option value="title_content" style="color: black;"
						<c:if test="${col=='title_content'}">
						selected
					</c:if>>제목+내용</option>
					<option value="id" style="color: black;"
						<c:if test="${col=='id'}">
						selected
					</c:if>>아이디</option>
					<option value="total" style="color: black;"
						<c:if test="${col=='total'}">
						selected
					</c:if>>전체출력</option>
				</select>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Enter 검색어"
					name="word" value="${word}">
			</div>
			<button type="submit" class="btn btn-white btn-outline-white">검색</button>
			&nbsp;
			<c:if test="${not empty id && (grade=='A' || grade=='C')}">
				<button type="button" class="btn btn-white btn-outline-white"
					onclick="location.href='create'">등록</button>
			</c:if>
		</form>
		<br>
		<div class="container-wrap">
			<div class="row no-gutters d-flex">
				<c:forEach var="dto" items="${list}">
					<div class="col-lg-4 d-flex ftco-animate">
						<div class="services-wrap d-flex">
							<a href="javascript:readR('${dto.rno}')" class="img"
								style="background-image: url('./storage/${dto.fname}')"></a>
							<div class="text p-4">
								<p>${dto.title }</p>
								<h3>by ${dto.id }</h3>
								<p class="price">
									<span>${dto.rdate }</span><br> <span>♡ ${dto.rcnt }</span>
									<a class="ml-2 btn btn-white btn-outline-white"
										href="javascript:readR('${dto.rno}')">Read</a>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<br>
			<div>${paging}</div>
		</div>
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content" style="border: 3px solid #fff;">
					<div class="modal-header" style="background-color: black">

						<h4 class="modal-title" style="color: #fac564">확인 메세지</h4>
					</div>
					<div class="modal-body" style="background-color: black; color: white;">
						<p>This is a small modal.</p>
					</div>
					<div class="modal-footer" style="background-color: black">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
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
