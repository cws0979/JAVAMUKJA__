console.log("*****Reply Module........");

var replyService = (function() {

	function add(reply, callback, error) {
		console.log("add reply...............");

		$.ajax({
			type : 'post',
			url : './reply/create',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}

	function getList(param, callback, error) {
		var tno = param.tno;
		var sno = param.sno;
		var eno = param.eno;

		$.getJSON("./reply/list/" + tno + "/" + sno + "/" + eno + ".json",
				function(data) {
					// alert(data);
					if (callback) {
						callback(data); // 댓글 목록만 가져오는 경우
						// callback(data.replyCnt, data.list); //댓글 숫자와 목록을 가져오는
						// 경우
					}
				});

	}

	function getPage(param, callback, error) {
//		var nPage = param.nPage;
//		var nowPage = param.nowPage;
//		var col = param.col;
//		var word = param.word;
//		var tno = param.tno;

		$.ajax({
			type : 'get',
			url : "./reply/page",
			data : param,
			contentType : "application/text; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}

	function remove(trno, callback, error) {
		$.ajax({
			type : 'delete',
			url : './reply/' + trno,
			success : function(deleteResult, status, xhr) {
				if (callback) {
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}

	function update(reply, callback, error) {

		console.log("trno: " + reply.trno);

		$.ajax({
			type : 'put',
			url : './reply/' + reply.trno,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}
	
	// callback함수: 인자로 넘겨받은  breply.js파일의 해당 함수를 호출한 그곳에 명시된  함수
	function get(trno, callback, error) {

		$.get("./reply/" + trno + ".json", function(result) {

			if (callback) {
				callback(result);
			}

		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}

	;

// 각종 함수의 리턴값인 JSON객체를 가지고있는 객체 replyService이다
	return {
		add : add,
		get : get,
		getList : getList,
		getPage : getPage,
		remove : remove,
		update : update
	};

})();