function addlikes(recipe_no, member_no) {
	$('.like_icon').prop('disabled',true);
	if (member_no != null) {
		var param = {
				"recipe_no" :recipe_no,
				"member_no": member_no
		};
		//넘겨줄 파라미터 지정
		$.ajax({
			url: "like",
			type: "POST",
			data: JSON.stringify(param),
			dataType: "json",
			contentType: "application/json",
			
		
			success:
				function(data) { //ajax통신 성공시 넘어오는 데이터 통째 이름  = data
				alert(data.vaild);
				recipelist();// recipelist 다시실행
					
				},
			error:
				function(request, status, error) {
					alert("좋아요 추가 실패 \n사유: " + error)
				}
		});
	}
	else{
		$('.like_icon').prop('disabled',false);
		alert("로그인부터 하고 오세요.");
		location.href="/YORIZORI/login";
	}
}