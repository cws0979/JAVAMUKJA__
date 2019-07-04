<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
 <script type="text/JavaScript">
   window.onload=function(){
     CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  };
 </script>
</head>
<body> 

<div class="container">
<h2 class="col-sm-offset-2 col-sm-10" style="color:#fac564">등업 게시글 생성</h2>
<form class="form-horizontal" 
      action="create"
      method="post"
      >
      
<input type="hidden" name="id" value="${id}">
<div class="form-group">
    <label class="control-label col-sm-2" for="id" style="color:#fac564">작성자</label>
    <div style="color:white;"class="col-sm-6">${id }
	</div>
  </div>
 
  <div class="form-group">
    <label class="control-label col-sm-2" for="title" style="color:#fac564;">제목</label>
    <div class="col-sm-6">
      <input type="text" name="title" id="title" required="required" class="form-control">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="content" style="color:#fac564">내용</label>
    <div class="col-sm-8">
    <textarea rows="10" cols="10" id="content" required="required" name="content" class="form-control"></textarea>
    </div>
  </div>
  
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button id='addReplyBtn' class="btn btn-white btn-outline-white">등록</button>
    <button type="reset" id='addReplyBtn' class="btn btn-white btn-outline-white">취소</button>
   </div>
 </div>
</form>
</div>
</body> 
</html> 