<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>Talk Read</title>
<meta charset="utf-8">
<style type="text/css">
.curImg {
	margin-right: 0;
	border-style: solid;
	border-width: 3px;
	border-color: red;
}

.td_padding {
	padding: 5px 5px;
}

/* .btn {
	font-weight: bold;
	display: inline-block;
	border-radius: 10px;
	margin: 1px;
	width: 70px;
	height: 35px;
	border: none;
	background: #FFCD12;
	position: relative;
	overflow: hidden; &: before { content : '';
	background: darken(#1abc9c, 10%);
	transform: translate($ s * -100, $ s * -40) rotate(130deg);
	transition: all 700ms ease;
} */
.list-group-item {
  position: relative;
  display: block;
  padding: 0.75rem 1.25rem;
  margin-bottom: 5px;
  background-color: black;
  border: 2px solid #fac564; 
  
  }
.panel-body{
color: white;
}

</style>
<script type="text/javascript">
	function readGo(tno) {
		var url = "./read";
		url = url + "?tno=" + tno;
		
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowpage=${param.nowPage}";

		location.href = url;

	}
	function update() {
		var url = "./update";
		url += "?tno=${param.tno}";
		url+= "&oldfile=${dto.fname}"

		location.href = url;
	}
	function del() {
		var url = "./delete";
		url += "?tno=${param.tno}";
		
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowpage=${param.nowPage}";

		location.href = url;
	}
	
</script>
</head>
<body>
	<div class="container">
		<h2 style="color:#fac564">자유 게시글 조회</h2>
		<table class="table table-bordered">
			<tr>
				<td colspan="3" style="text-align: center;"><img
					src="./storage/${dto.fname}" class="img-rounded" width="250px"
					height="250px"></td>
			</tr>
		</table>

		<table class="table table-bordered">
			<tr>
				<th style=" color: #FFCD12;">ID</th>
				<td style=" color: white;">${dto.id }</td>
			</tr>
			<tr>
				<th style=" color: #FFCD12;">TITLE</th>
				<td style=" color: white;">${dto.title}</td>
			</tr>
			<tr>
				<th style=" color:#FFCD12; ">CONTENT</th>
				<td style="color:white;">${dto.content}</td>
			</tr>
			<tr>
				<th style=" color: #FFCD12;">DATE</th>
				<td style=" color: white;">${dto.rdate }</td>
			</tr>
		</table>
		<c:if test="${not empty id && (grade=='A' || dto.id==id)}">
			<button class="btn btn-white btn-outline-white" onclick="update()" >수정</button>
			<button class="btn btn-white btn-outline-white" onclick="del()">삭제</button>
		</c:if>
		<button class="btn btn-white btn-outline-white" onclick="location.href='list'">목록</button>
		<br><br>
	<div class='row'>
			<div class="col-lg-12">

				<!-- /.panel -->
				<div class="panel panel-default">

					<div class="panel-heading">
						<button id='addReplyBtn' class='btn btn-white btn-outline-white'>NewReply</button>
					</div>


					<!-- /.panel-heading -->
					<br>
					<div class="panel-body">

						<ul class="chat list-group">
							<li class="left clearfix" data-rno="12">
								<div>
									<div class="header">
									</div>
									<p>댓글을 입력해주세요</p>

								</div>
							</li>
						</ul>
						<!-- ./ end ul -->
					</div>
					<!-- /.panel .chat-panel -->

					<div class="panel-footer"></div>

				</div>
			</div>
			<!-- ./ end row -->
	</div>

	<%-- <script src="${root }/js/jquery.min.js"></script>
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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="${root }/js/google-map.js"></script>
	 <script src="${root }/js/main.js"></script>
	 	 --%>
	<!-- Modal -->
			 <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content" style="border: 3px solid #fff;">
            <div class="modal-header" style="background-color:black">
              <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="myModalLabel" style="color:#fac564">REPLY MODAL</h4>
            </div>
            <div class="modal-body" style="background-color:black">
              <div class="form-group">
                <label style="color:#fac564">내용</label> 
                <textarea cols="10" rows="3" class="form-control" name='content' style="color:#fac564">New Reply!!!!</textarea> 
              </div>      
              <div class="form-group">
                <label>아이디</label> 
                <input class="form-control" name='id' value='${sessionScope.id}'>
              </div>
              <div class="form-group">
                <label>등록날짜</label> 
                <input class="form-control" name='rdate' value='2018-01-01 13:13'>
              </div>
      

						</div>
						<div class="modal-footer" style="background-color:black">
							<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
							<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
							<button id='modalRegisterBtn' type="button"
								class="btn btn-primary">Register</button>
							<button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
	
			<script type="text/javascript" src="${root }/js/breply.js"></script>
			<script type="text/javascript">
				
				$(document).ready(function () { 
					  
					  var tno = '<c:out value="${tno}"/>';
					  var sno = '<c:out value="${sno}"/>';
					  var eno = '<c:out value="${eno}"/>';
					  //컨트롤러 모델에 저장되있었던 정보들을 가져와서 지역변수에 저장 =>자바스크립트에 저장
					  var replyUL = $(".chat");
					  //.을 통해 검색함 
					  //chat이라는 클래스를 찾아서 replyUL에 저장하여 참조
					  
					  showList();
					  
					  function showList(){//function의 실행결과 => json객체
						    replyService.getList({tno:tno,sno:sno,eno:eno}, function(list) { //getList()호출
							//relplyService 안에 있는 getList함수 호출 (json 객체와 함수를 보냄 )            
						    //replyService는 breply.js에 선언되어있는 함수 
						     var str="";
						     
						     if(list == null || list.length == 0){
						       return;
						     }
						     
						     for (var i = 0, len = list.length || 0; i < len; i++) {
						       str +="<li class='list-group-item' data-trno='"+list[i].trno+"'>";
						       str +="<div><div class='header'><strong class='primary-font'>"+list[i].id+"&nbsp;</strong>";  
						       str +="<small class='pull-right text-muted'>"+list[i].rdate+"</small></div>";
						       str +=replaceAll(list[i].content,'\n','<br>')+"</div></li>";
						     }
						 
						     replyUL.html(str);
						     //function(list)가 실행됨
						     showReplyPage();
						     		 
						  });//end function   
						     
						 }//end showList
						 function replaceAll(str, searchStr, replaceStr) {
							  return str.split(searchStr).join(replaceStr);
							}
						 var nPage = '<c:out value="${nPage}"/>';
						 var nowPage = '<c:out value="${nowPage}"/>';
						 var colx = '<c:out value="${col}"/>';
						 var wordx = '<c:out value="${word}"/>';
						 var replyPageFooter = $(".panel-footer");
						 var param = "nPage="+nPage;
						 param += "&nowPage="+nowPage;
						 param += "&tno="+tno;
						 param += "&col="+colx;
						 param += "&word="+wordx;
						  
						 function showReplyPage(){
						  
						 replyService.getPage(param, function(paging) {
						  
						   console.log(paging);
						  
						     var str ="<div><small class='text-muted'>"+paging+"</small></div>";
						     replyPageFooter.html(str);
						   
						 });
						 }//end showReplyPage
						 
						 var modal = $(".modal");
						 var modalInputContent = modal.find("textarea[name='content']");
						 var modalInputId = modal.find("input[name='id']");
						 var modalInputRegDate = modal.find("input[name='rdate']");
						  
						 var modalModBtn = $("#modalModBtn");
						 var modalRemoveBtn = $("#modalRemoveBtn");
						 var modalRegisterBtn = $("#modalRegisterBtn");
						 $("#modalCloseBtn").on("click", function(e){
							 
							 modal.modal('hide');
							 });
						 
						 $(".chat").on("click", "li", function(e){
							   
							   var trno = $(this).data("trno"); //this=li
							   
							   //alert(rnum)
							   replyService.get(trno, function(reply){ //get메소드를 통해 함수호출
							   
							     modalInputContent.val(reply.content);
							     modalInputId.val(reply.id);
							     modalInputRegDate.val(reply.rdate);
							     modal.data("trno", reply.trno);
							     
							     modal.find("button[id !='modalCloseBtn']").hide();
							     
							     if('${sessionScope.id}'==reply.id){
							         modalModBtn.show();
							       modalRemoveBtn.show();
							     }
							     $(".modal").modal("show");
							         
							   });
							 });
						 
						 modalModBtn.on("click", function(e){
							  
							    var reply = {trno:modal.data("trno"), content: modalInputContent.val()};
							  
							    replyService.update(reply, function(result){
							          
							      alert(result);
							      modal.modal("hide");
							      showList();//갱신된 댓글 목록 가져오기
							      
							      
							    });
							    
							  });//modify 
							 
							 
							  modalRemoveBtn.on("click", function (e){
							    
							    var trno = modal.data("trno");
							    
							    replyService.remove(trno, function(result){
							          
							        alert(result);
							        modal.modal("hide");
							        showList();
							        
							    });
							    
							  });//remove
							 
				
				
				$("#addReplyBtn").on("click", function(e){
					  
					  if('${sessionScope.id}'==''){
					   if(confirm("로그인을 해야 댓글을 쓸수 있습니다.")) {
					        var url = "../member/login";
					        url += "?col=${col}";
					        url += "&word=${word}";
					        url += "&nowPage=${nowPage}";
					        url += "&nPage=${nPage}";
					        url += "&tno=${tno}";
					        url += "&rurl=../talk/read";
					   location.href = url;
					   
					   }
					  }else{
					 
					  modalInputContent.val("");
					  modalInputId.closest("div").hide();
					  modalInputRegDate.closest("div").hide();
					  modal.find("button[id !='modalCloseBtn']").hide();
					  
					  modalRegisterBtn.show();
					  
					  $(".modal").modal("show");
					  
					  
					  }
					});
					 
					 
					modalRegisterBtn.on("click",function(e){
					  
					  if(modalInputContent.val()==''){
					  alert("댓글을 입력하세요")
					  return ;
					  }
					 
					  var reply = {
					        content: modalInputContent.val(),
					        id:'<c:out value="${sessionScope.id}"/>',
					        tno:'<c:out value="${tno}"/>'
					      };
					  //alert(reply.content);
					  replyService.add(reply, function(result){
					    
					    alert(result);
					    
					    modal.find("input").val("");
					    modal.modal("hide");
					    
					    //showList(1);
					    showList();
					    
					  }); //end add
					  
					}); //end modalRegisterBtn.on
				});
				</script>
	</div>
</body>
</html>
