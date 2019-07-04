<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<style>
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

<script>


	function listM() {
		var url = "list";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";

		location.href = url;
	}

	function update() {
		var url = "update";
		url += "?gno=${dto.gno}";

		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";

		location.href = url;
	}

	function del() {
		var url = "delete";
		url += "?gno=${dto.gno}";

		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";

		location.href = url;
	}

	function replyM() {
		var url = "reply";
		url += "?gno=${dto.gno}";

		location.href = url;
	}
</script>
<title>게시판 글 조회</title>
</head>
<body>
	<div class="container">
		<h2 style="color:#fac564">등업 게시글 조회</h2>
		<table class="table table-bordered">
			<tr>
				<th style="color:#fac564">번호</th>
				<td>${dto.gno}</td>
			</tr>
			<tr>
				<th style="color:#fac564">작성자</th>
				<td>${dto.id}</td>
			</tr>
			<tr>
				<th style="color:#fac564">제목</th>
				<td>${dto.title}</td>
			</tr>
			<tr>
				<th style="color:#fac564">내용</th>
				<td>${dto.content}</td>
			</tr>
			<tr>
				<th style="color:#fac564">수정일</th>
				<td>${dto.rdate}</td>
			</tr>
		</table>
			

		<div>
			<c:if test="${not empty id }">
			<button type="button" class="btn btn-white btn-outline-white" onclick="location.href='./create'">등록</button>
			</c:if>
			<c:if test="${id==dto.id}">
			<button type="button" class="btn btn-white btn-outline-white" onclick="update();">수정</button>
			<button type="button" class="btn btn-white btn-outline-white" onclick="del();">삭제</button>
			</c:if>
			<button type="button" class="btn btn-white btn-outline-white" onclick="listM()">목록</button>
		</div>
		<br>
		<div class='row'>

			<div class="col-lg-12">

				<!-- /.panel -->
				<div class="panel panel-default">

					<div class="panel-heading" style="margin-bottom:20px">
					<c:if test="${not empty dto.id && grade=='A'}">
						<button id='addReplyBtn' class='btn btn-white btn-outline-white'>New Reply</button>
					</c:if>				
					</div>


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
        <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
        <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
      </div>          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      <script type="text/javascript" src="${root}/js/gradereply.js"></script>
      
      <script type="text/javascript">
      $(document).ready(function () {
    	  
    	  var gno = '<c:out value="${gno}"/>';
    	  var sno = '<c:out value="${sno}"/>';
    	  var eno = '<c:out value="${eno}"/>';
    	  var replyUL = $(".chat");
    	  
    	  showList();
    	  
    	  function showList(){
    		    replyService.getList({gno:gno,sno:sno,eno:eno}, function(list) {
    		            
    		     var str="";
    		     
    		     if(list == null || list.length == 0){
    		       return;
    		     }
    		     
    		     for (var i = 0, len = list.length || 0; i < len; i++) {
    		       str +="<li class='list-group-item' data-grno='"+list[i].grno+"'>";
    		       str +="<div><div class='header'><strong class='primary-font'>"+list[i].id+"&nbsp;</strong>"; 
    		       str +="<small class='pull-right text-muted'>"+list[i].rdate+"</small></div>";
    		       str +=replaceAll(list[i].content,'\n','<br>')+"</div></li>";
    		     }
    		 
    		     replyUL.html(str);
    		     
    		     showReplyPage();
    		     
    		 
    		 
    		  });//end getList function   
    		     
    		 }//end showList
    		 

    		function replaceAll(str, searchStr, replaceStr) {
    		  	return str.split(searchStr).join(replaceStr);
    		}

    		var nPage = '<c:out value="${nPage}"/>';
    		var nowPage = '<c:out value="${nowPage}"/>';
    		var colx = '<c:out value="${col}"/>';
    		var wordx = '<c:out value="${word}"/>';
    		
    		var replyPageFooter = $(".panel-footer");
    		
    		 
    		function showReplyPage(){
    		 
    		var param = "nPage="+nPage;
    		param += "&nowPage="+nowPage;
    		param += "&gno="+gno;
    		param += "&col="+colx;
    		param += "&word="+wordx;
    		
    		replyService.getPage(param, function(paging) {
    		 
//     		  console.log(paging);
    		 
    		    var str ="<div><small class='text-muted'>"+paging+"</small></div>";
    		    replyPageFooter.html(str);
    		  
    		});
    		}//end showReplyPage
    		
    		var modal = $(".modal");
    		var modalInputContent = modal.find("textarea[name='content']");
    		var modalInputId = modal.find("input[name='id']");
    		var modalInputRDate = modal.find("input[name='rdate']");
    		 
    		var modalModBtn = $("#modalModBtn");
    		var modalRemoveBtn = $("#modalRemoveBtn");
    		var modalRegisterBtn = $("#modalRegisterBtn");
    		
    		$("#modalCloseBtn").on("click", function(e){
    			 
    			modal.modal('hide');
    		});
    		
    		//댓글 조회 클릭 이벤트 처리 
    		 $(".chat").on("click", "li", function(e){
    		   
    		   var grno = $(this).data("grno");
    		   
    		   //alert(grno)
    		   replyService.get(grno, function(gradereply){
    		   
    		     modalInputContent.val(gradereply.content);
    		     modalInputId.closest("div").hide();
    		     modalInputRDate.closest("div").hide();
    		     modal.data("grno", gradereply.grno);
    		     
    		     modal.find("button[id !='modalCloseBtn']").hide();
    		     
    		     if('${sessionScope.id}'==gradereply.id){
    		         modalModBtn.show();
    		       modalRemoveBtn.show();
    		     }
    		     $(".modal").modal("show");
    		   });
    		 });
    		
    		 modalModBtn.on("click", function(e){
    			  
    			    var gradereply = {grno:modal.data("grno"), content: modalInputContent.val()};
    			    //alert(reply.grno);
    			    replyService.update(gradereply, function(result){
    			          
    			      alert(result);
    			      modal.modal("hide");
    			      showList();
    			      
    			    });
    			    
    			  });//modify 
    			 
    			 
    			  modalRemoveBtn.on("click", function (e){
    			    
    			    var grno = modal.data("grno");
    			    
    			    replyService.remove(grno, function(result){
    			          
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
    				        url += "&gno=${gno}";
    				        url += "&rurl=../grade/read";
    				   location.href = url;
    				   
    				   }
    				  }else{
    				 
    				  modalInputContent.val("");
    				  modalInputId.closest("div").hide();
    				  modalInputRDate.closest("div").hide();
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
    				 
    				  var gradereply = {
    				        content: modalInputContent.val(),
    				        id:'<c:out value="${sessionScope.id}"/>',
    				        gno:'<c:out value="${gno}"/>'
    				      };
    				  //alert(reply.content);
    				  replyService.add(gradereply, function(result){
    				    
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
