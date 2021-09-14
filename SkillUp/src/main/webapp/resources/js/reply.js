console.log("comment MODULE....");

var commentService = (function() {

	//コメント登録関数（作動確認後、パスワード入力による登録機能追加）
	function add(comment, callback, error) {
		$.ajax({
			type: 'post',
			url: '/comments/new',
			data: JSON.stringify(comment),
			contentType : 'application/json; charset=UTF-8',
			success: function(result) {
				if(callback) {
					callback(result);
				}
			},
			error: function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});//END ajax()
	}//END add()


	//コメントリスト呼び出し関数
	function getList(param, callback, error) {
		var pNo = param.pNo;
		var page = param.page || 1;

		$.getJSON("/comments/pages/" + pNo + "/" + page + ".json",
			function(data) {
				if(callback) {
					callback(data.list, data.ccnt);
				}
			}
		).fail(function(xhr, status, er) {
			if (error) {
				error(er);
			}
		});//END getJSON() fail()
	}//END getList()

	//コメント削除関数（作動確認後、パスワード入力による削除機能追加）
	function remove(cNo, cPass, callback, error) {
		$.ajax({
			type: 'delete',
			url: '/comments/' + cNo,
			data: JSON.stringify({ cno: cNo, cpass: cPass }),
			contentType: "application/json; charset=UTF-8",
			success: function(result) {
				if (callback) {
					callback(result);
				}
			},
			error: function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});//END ajax()
	}//END remove()

	//コメント修正関数（作動確認後、パスワード入力による修正機能追加）
	function update(comment, callback, error) {
		$.ajax({
			type: 'put',
			url: '/comments/' + comment.cno,
			data: JSON.stringify(comment),
			contentType: 'application/json; charset=UTF-8',
			success: function(result) {
				if (callback) {
					callback(result);
				}
			},
			error: function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});//END ajax()
	}//END update()


	//コメント1個呼び出し関数
	function get(cNo, callback, error) {
		$.get("/comments/" + cNo + ".json",
			function(data) {
				if (callback) {
					callback(data);
				}
			}
		).fail(function(xhr, status,  er) {
			if (error) {
				error(er);
			}
		});//END get() fail()
	}//END get()

	//コメント作成日時表示関数
	function displayTime(timeValue) {
		var today = new Date();
		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);

		//등록일과 오늘 날짜 체크
		if (today.getDate() === dateObj.getDate()) {
			//같으면 '시:분:초' 출력
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();

			return [(hh > 9 ? '' : '0') + hh, ':',
			(mi > 9 ? '' : '0') + mi, ':',
			(ss > 9 ? '' : '0') + ss].join('');
		} else {
			//다르면 '연/월/일' 출력
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1;
			var dd = dateObj.getDate();

			return [yy, '/',
				(mm > 9 ? '' : '0') + mm, '/',
				(dd > 9 ? '' : '0') + dd].join('');
		}
	}//END displayTime()

	return {
		get: get, update: update, remove: remove,
		getList: getList, add: add,
		displayTime: displayTime
	};
})();

