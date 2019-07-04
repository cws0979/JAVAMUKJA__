<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_recipe.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>레시피 조회</title>
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
.list-group-item {
  position: relative;
  display: block;
  padding: 0.75rem 1.25rem;
  margin-bottom: 5px;
  background-color: black;
  border: 2px solid #fac564; }
.panel-body{
color: white;
}
</style>
<script type="text/javascript">
	function recomR(rno) {
		var url = "./recom";
		url = url + "?rno=${dto.rno}";
	
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
	
		location.href = url;
	}
	function readR(rno) {
		var url = "./read";
		url = url + "?rno=" + rno;

		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";

		location.href = url;
	}
	function filedown() {
		var url = "${root}/download";
		url += "?dir=/recipe/storage";
		url += "&filename=${dto.fname}";

		location.href = url;
	}
	function deleteR() {
		var url = "delete";
		url += "?rno=${dto.rno}";
		url += "&oldfile=${dto.fname}";

		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";

		location.href = url;
	}
	function updateR() {
		var url = "update";
		url += "?rno=${dto.rno}";

		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";

		location.href = url;
	}
	function updateFile() {
		var url = "updateFile";
		url += "?rno=${dto.rno}";
		url += "&oldfile=${dto.fname}";

		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";

		location.href = url;
	}
	function listR() {
		var url = "list";

		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";

		location.href = url;
	}
</script>
</head>
<body>
	<div class="container">
		<table class="table table-bordered" class="col-sm-12">
			<TR>
				<c:forEach var="i" begin="0" end="4">
					<c:choose>
						<c:when test="${files[i]=='0'}">
							<td class="td_padding" align="center"><img
								src="./storage/image.jpg" width="150px" height="120px"></td>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${noArr[i]==dto.rno}">
									<td class="td_padding" align="center"><a
										href="javascript:readR('${noArr[i]}')"> <img
											class="curImg" src="./storage/${files[i]}" width="150px"
											height="120px" border="0">
									</a></td>
								</c:when>
								<c:otherwise>
									<td class="td_padding" align="center"><a
										href="javascript:readR('${noArr[i]}')"> <img
											src="./storage/${files[i]}" width="150px" height="120px"
											border="0">
									</a></td>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</TR>
		</table>
		<div align="center"><img src="./storage/${dto.fname}" class="img-rounded" width="360px"
					height="300px"></div><br>
		<table class="table table-bordered">
			<tr>
				<th style="color: #fac564"  >만든이</th>
				<td style="color: white" colspan="4" >${dto.id}</td>
			</tr>
			<tr>
				<th style="color: #fac564"  >제목</th>
				<td style="color: white" colspan="4" >${dto.title}</td>
			</tr>
			<tr>
				<th style="color: #fac564"  >재료</th>
				<td style="color: white" colspan="4" >${dto.ingredient}</td>
			</tr>
			<tr>
				<th style="color: #fac564"  >분류</th>
				<td style="color: white"  colspan="4" >${dto.category}</td>
			</tr>
			<tr>
				<th style="color: #fac564"  >인원</th>
				<td style="color: white" colspan="4" >${dto.portion}</td>
			</tr>
			<tr>
				<th style="color: #fac564"  >시간</th>
				<td style="color: white"  colspan="4" >${dto.time}</td>
			</tr>
			<tr>
				<th style="color: #fac564"  >요리<br>방법</th>
				<td style="color: white"  colspan="4" >${dto.content}</td>
			</tr>
			<tr>
				<th style="color: #fac564"  >등록<br>날짜</th>
				<td style="color: white"  colspan="4" >${dto.rdate}</td>
			</tr>
			<tr>
				<th style="color: #fac564"  >조회수</th>
				<td style="color: white"  colspan="4" >${dto.viewcnt}</td>
			</tr>
			<tr>
				<th style="color: #fac564"  >추천수</th>
				<td style="color: white"  colspan="4" >${dto.rcnt}</td>
			</tr>
		</table>
		<div class='row'>
			<div class="col-lg-12">
				<!-- /.panel -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<button id='addReplyBtn' class='btn btn-white btn-outline-white'>New Reply</button>
					</div>
					<br>
					<!-- /.panel-heading -->
					<div class="panel-body">

						<ul class="chat list-group">
							<li class="left clearfix" data-rno="12">
								<div>
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
		<button class="btn btn-white btn-outline-white" onclick="recomR()">추천하기</button>
		<c:if test="${not empty id && (grade=='A' || dto.id==id)}">
			<button class="btn btn-white btn-outline-white" onclick="updateR()">수정</button>
			<button class="btn btn-white btn-outline-white" onclick="deleteR()">삭제</button>
		</c:if>
		<button class="btn btn-white btn-outline-white" onclick="filedown()">다운로드</button>
		<button class="btn btn-white btn-outline-white" onclick="listR()">목록</button>
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
<%--  	<script src="${root }/js/scrollax.min.js"></script> --%>
<!-- 	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
<%-- 	<script src="${root }/js/google-map.js"></script> --%>
	<script src="${root }/js/main.js"></script>
	
	<!-- Modal -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content" style="border: 3px solid #fff;">
            <div class="modal-header" style="background-color: black;">
              <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
            </div>
            <div class="modal-body" style="background-color: black;">
              <div class="form-group">
                <label>내용</label> 
                <textarea cols="10" rows="3" class="form-control" name='content'>New Reply!!!!</textarea> 
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
		  	  <div class="modal-footer" style="background-color: black;">
			      <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
			      <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
			      <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
			      <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
		      </div>         
     	 	</div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      
     <script type="text/javascript" src="${root }/js/rreply.js"></script>
      
      <script type="text/javascript">
      $(document).ready(function () {
    	  var rno = '<c:out value="${rno}"/>';
    	  var sno = '<c:out value="${sno}"/>';
    	  var eno = '<c:out value="${eno}"/>';
    	  var replyUL = $(".chat");
    	  
    	  showList();
    	  
    	  function showList(){
    		     replyService.getList({rno:rno,sno:sno,eno:eno}, function(list) {
	    		     var str="";
	    		     
	    		     if(list == null || list.length == 0){
	    		       return;
    		     }
    		     
//     		     len에 list.length가 존재하면 그 값을 넣고 아니면 0을 넣음
    		     for (var i = 0, len = list.length || 0; i < len; i++) {
	    		     str += "<li class='list-group-item' data-rrno='"+list[i].rrno+"'>";
	    		     str += "<div><div class='header'><strong class='primary-font'>"+list[i].id+"&nbsp;</strong>"; 
	    		     str += "<small class='pull-right text-muted'>"+list[i].rdate+"</small></div>";
	    		     str += replaceAll(list[i].content,'\n','<br>')+"</div></li>";
    		     }
    		 
    		     replyUL.html(str);
    		     
    		     // paging
    		     showReplyPage();
    		     
    		  });// end getList function 호출
    		  
    	  }// end showList
    	  
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
    	  param += "&rno="+rno;
    	  param += "&col="+colx;
    	  param += "&word="+wordx;
    	   
    	  function showReplyPage(){
	    	  replyService.getPage(param, 
	    			function(paging) {
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
    	 
    	  // close버튼을 누르면 꺼지도록 처리
    	  $("#modalCloseBtn").on("click", function(e){
    		  
    		  modal.modal('hide');
    	  });
    	  
    	  //댓글 조회 클릭 이벤트 처리 
    	  $(".chat").on("click", "li", function(e){
    	    
    	    var rrno = $(this).data("rrno");
    	    
    	    //alert(rrno)
    	    replyService.get(rrno, function(reply){
    	    
    	    	// content는 보여주고 id값과 regdate값은 숨김
    	      modalInputContent.val(reply.content);
    	      modalInputId.closest("div").hide();
    	      modalInputRegDate.closest("div").hide();
    	      modal.data("rrno", reply.rrno);
    	      
    	      modal.find("button[id !='modalCloseBtn']").hide();
    	      
    	      // 글쓴이의 id와 현재 로그인한 id가 같을 때만 수정,삭제버튼 보여줌
    	      if('${sessionScope.id}'==reply.id){
	    	      modalModBtn.show();
	    	      modalRemoveBtn.show();
    	      }
    	      $(".modal").modal("show");
    	          
    	  	  });
    	  });
    	  
    	  modalModBtn.on("click", function(e){
    		  
    		    var reply = {rrno:modal.data("rrno"), content: modalInputContent.val()};
    		    //alert(reply.rrno);
    		    replyService.update(reply, function(result){
	    		    alert(result);
	    		    modal.modal("hide");
	    		    showList(); // 갱신된 댓글 목록 가져오기
    		    });
    		    
    	  });//modify 
    		 
   		  modalRemoveBtn.on("click", function (e){
   		    
	   		    var rrno = modal.data("rrno");
	   		    
	   		    replyService.remove(rrno, function(result){
		   		    alert(result);
		   		    modal.modal("hide");
		   		    showList(); // 갱신된 댓글 목록 가져오기
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
   		        url += "&rno=${rno}";
   		        url += "&rurl=../recipe/read";
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
   		        rno:'<c:out value="${rno}"/>'
   		      };
   		  //alert(reply.content);
   		  replyService.add(reply, function(result){
   		    
   		    alert(result);
   		    
// 		 	modal.find("input").val(""); 
			// modal은 하나로 사용하기 때문에
			// 다음 댓글 생성시에 혹시모를 중복되지않도록 하기위해서 필요
   		    modal.modal("hide");
   		    
   		    //showList(1);
   		    showList();
   		    
   		  }); //end add
   		  
   		}); //end modalRegisterBtn.on
   		  
      });
      </script>
</body>
</html>
