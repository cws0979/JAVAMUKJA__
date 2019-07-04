<%@ page contentType="text/html; charset=UTF-8" %> 

<!DOCTYPE html> 
<html> 
<head>
  <title>ID 및 EMAIL 중복확인</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
  
<script type="text/javascript">
$(document).ready(function(){
 var modal = '${msg}'; //Controller에서 가져온 데이터
 checkModal(modal); //modal생성
 
 //history back일때는 modal 안보여주는 코드 1
  history.replaceState({},null,null);
 
 function checkModal(modal){ //modal 생성함수 선언
     if(history.state) return; //d코드2
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
<!-- modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">알림 메세지!</h4>
        </div>
        <div class="modal-body">
          <p>This is a small modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="history.back()">Close</button>
        </div>
      </div>
    </div>
</div>
</div>
</body>
</html> 