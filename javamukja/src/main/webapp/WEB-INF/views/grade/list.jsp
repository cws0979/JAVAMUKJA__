<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>
<!DOCTYPE html> 
<html> 
<head>
  <title>등업 게시글 목록</title>
  <meta charset="utf-8">
  <script type="text/javascript">
      function read(gno){
        var url = "read";
        url += "?gno="+gno;      //javascript 변수
        
        url += "&col=${col}";   //jsp 변수 (스크립틀릿)
        url += "&word=${word}";
        url += "&nowPage=${nowPage}";
        
        location.href=url;
      }
      
      $(document).ready(function(){
    	  var modal = '${msg}'; //Controller에서 가져온 데이터
    	  checkModal(modal); //modal생성
    	   
    	  //history back일때는 modal 안보여주는 코드 1
    	  history.replaceState({},null,null);
    	   
    	  function checkModal(modal){ //modal 생성함수 선언
    	       if(history.state) 
    	    	   return; //코드2
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
    <h2 style="color:#fac564">등업 게시판</h2>
    <form class="form-inline" action="./list">
      <div class="form-group">
        <select class="form-control" name="col" style="color:black;">
          <option value="id" style="color:black;"
          <c:if test="${col='id' }">selected</c:if>
          >작성자</option>
          <option value="title" style="color:black;"
          <c:if test="${col='title' }">selected</c:if>
          >제목</option>
          <option value="content" style="color:black;"
          <c:if test="${col='content' }">selected</c:if>
          >내용</option>
          <option value="title_content" style="color:black;"
          <c:if test="${col='title_content' }">selected</c:if>
          >제목+내용</option>
          <option value="total" style="color:black;"
          <c:if test="${col='total' }">selected</c:if>
          >전체출력</option>
        </select>
      </div>
      <div class="form-group">
        <input type="text" class="form-control" placeholder="Enter 검색어" 
        name="word" value="${word }">
      </div>
      <button type="submit" class="btn btn-white btn-outline-white">검색</button>
      <br><br>
      <c:if test="${not empty id}">
      <button type="button" class="btn btn-white btn-outline-white" style="margin-left: 3px;" onclick="location.href='create'">등록</button>
      </c:if>
    </form>
     <table class = "table table-striped">
        <thead>
          <tr>
          <th style="color:#fac564">번호</th>
          <th style="color:#fac564">제목</th>
          <th style="color:#fac564">작성자</th>
          </tr>
          </thead>
          <tbody style="color:white;">
          
<c:choose>
	<c:when test="${empty list }">
		 <tr><td colspan ="4">등록된 게시글이 없습니다.</td>
	</c:when>
	<c:otherwise>
		<c:forEach var="dto" items="${list }">
		<tr>
	  	 <td>${dto.gno}</td>
	  	  <td>
	<c:set var="gradecount" value="${util:gradecount(dto.gno,grinter) }"/>
	<a href="javascript:read('${dto.gno }')">${dto.title}</a>
			 <c:if test="${gradecount == 0 }">
			 <span class="badge" style="background-color:#82d26d; color:#fff">심사중</span>
<%-- 			 	<span class="badge" style="background-color:#fac564; color:#fff">${gradecount}</span> --%>
		      </c:if>
		      <c:if test="${gradecount > 0 }">
		      <span class="badge" style="background-color:#65a2e4; color:#fff">등업완료</span>
		      </c:if>
	 </td>
	 <td>${dto.id}</td>
	 <tr>
		</c:forEach>
	</c:otherwise>
</c:choose> 
          </tbody>
     </table>
      <div>
         ${paging}
      </div>
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
<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
</div>
</div>
</div>
</div>
</body> 
</html> 