<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/ssi/ssi.jsp" %>


<!DOCTYPE html> 
<html> 
<head>
  <title>List</title>
  <meta charset="utf-8">
<!--   <style> -->


<!--   .btn { -->
<!-- 	display: inline-block; -->
<!-- 	border-radius: 10px; -->
<!-- 	margin:3px; -->
<!-- 	width: 70px; -->
<!-- 	height: 35px; -->
<!-- 	border: none; -->
<!-- 	background: #FFCD12; -->
<!-- 	position: relative; -->
<!-- 	overflow: hidden; &: before { content : ''; -->
<!-- 	background: darken(#1abc9c, 10%); -->

<!-- 	transform: translate($ s * -100, $ s * -40) rotate(130deg); -->
<!-- 	transition: all 700ms ease; -->
<!-- } -->

  
  
<!--   </style> -->
  <script type="text/javascript">
  

  $(document).ready(function(){
	  var modal ='${msg}';
	  checkModal(modal);

	  history.replaceState({},null,null);

	  function checkModal(modal){
		  if(history.state) return;
		  if(modal){
			$(".modal-body").html(modal);
		    $("#myModal").modal("show");
		  }
	  }
  });

     function read(tno){
       var url = "read";
       url += "?tno="+tno;      
       url += "&col=${col}";
       url += "&word=${word}";
       url += "&nowPage=${nowPage}";
       
       location.href=url;
     }
  
  </script>

</head>
<body>
<div class="container">
   <h2 style="color:#fac564">자유 게시판</h2>
  <form class="form-inline" action="${root}/talk/list">
  <div class="form-group" style="color:white;">
  <select class="form-control" name="col" >
  <option value="title" style="color:black;"
  <c:if test="${col=='title'}">selected</c:if>
    >제목</option>
    <option value="hashtag" style="color:black;"
  <c:if test="${col=='hashtag'}">selected</c:if>
  >해쉬태그</option>
  <option value="id" style="color:black;"
 <c:if test="${col=='id'}">selected</c:if>
  >작성자</option>
  <option value="total" style="color:black;"
  <c:if test="${col=='total'}">selected</c:if>
  >전체출력</option>
  </select>
  </div>
  <div class="form-group">
  <input type="text" class="form-control" style="color:white;" placeholder="Enter검색어"
  name="word" value="${word}">
  </div>
  <button class="btn btn-white btn-outline-white">검색</button>&nbsp;
  <c:if test="${not empty id && (grade=='A' || grade=='C' ||grade=='N')}">
				<button type="button" class="btn btn-white btn-outline-white"
					onclick="location.href='create'">등록</button>
			</c:if>
  </form>
  <br>
		<table class="table table-bordered" style="color:#FFCD12;">
			<tr>
			
				<th style="text-align: center; color:#FFCD12;">ID</th>
				<th style="text-align: center; color:#FFCD12;">TITLE</th>
				<th style="text-align: center; color:#FFCD12;">Category</th>
				<th style="text-align: center; color:#FFCD12;">DATE</th>
				<th style="text-align: center; color:#FFCD12;">VIEW</th>
			</tr>
			
		<c:forEach var="dto" items="${list }">
  
  
			<tr>
				
				<td style="vertical-align: middle; text-align: center; color:white;">${dto.id}</td>
				<td style="vertical-align: middle; text-align: center; color:white;"><a href="javascript:read('${dto.tno}')" >${dto.title}</a></td>
				<td style="vertical-align: middle; text-align: center; color:white;">${dto.category}</td>
				<td style="vertical-align: middle; text-align: center; color:white;">${dto.rdate}</td>
				<td style="vertical-align: middle; text-align: center; color:white;">${dto.viewcnt}</td>
			
			</tr>
	</c:forEach>
		</table>
		${paging}
	</div>
	
	 <!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
<div class="modal-dialog modal-sm">
<div class="modal-content" style="border: 3px solid #fff;">
<div class="modal-header" style="background-color:black">
 
<h4 class="modal-title" style="color:#fac564">확인 메세지</h4>
</div>
<div class="modal-body" style="background-color:black">
<p>This is a small modal.</p>
</div>
<div class="modal-footer" style="background-color:black">
<button type="button" class="btn btn-white btn-outline-white" data-dismiss="modal">Close</button>
</div>
</div>
</div>
</div>


