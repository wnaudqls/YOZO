function addlikes(recipe_no, member_no) {
	$('.like_icon').prop('disabled',true);
	if (member_no != null) {
		var param = '?command=like&recipe_no=' + recipe_no;
		param += '&member_no=' + member_no;
		//넘겨줄 파라미터 지정
		$.ajax({
			url: "like.do" + param,
			type: "POST",
			cache: false,
			dataType: "text",
		
			success:
				function(data) { //ajax통신 성공시 넘어오는 데이터 통째 이름  = data
				alert(data);
					location.reload();// 페이지 다시 불러옴
					
				},
			error:
				function(request, status, error) {
					alert("좋아요 추가 실패 \n사유: " + error)
				}
		});
	}
	else{
		$('.like_icon').prop('disabled',false);
		alert("로그인부터 해라");
	}
}