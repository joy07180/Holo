/*
** 이클립스 자바스크립트 파일 내용이 흑백으로 나올때... 컬러로 고치기 
=> https://creampuffy.tistory.com/66
** js 문서관련 설정
윈도우 - 프레퍼런스 - 제네럴 - 에디터스 - 파일 어소시에이션 - 
add - *.js - 밑에 제네릭 텍스트 에디터 디폴트

********************************************
** Ajax_Test01 
 *  =>  MousePointer, axLogin, jsLoin,
   => form 의 input Data 처리
 */

$(function(){
		
	// => axlogin : ver01
    //    로그인 성공 or 실패는 모두 컨트롤러의 정상젓인 처리 결과이므로
	//	  success function 에서 처리함
    //    로그인 성공 or 실패에 따른 다른 처리가 필요함
	//	  ver01 : webPage 를 response로 전달받음
	//	  		성공 : 현재 화면을 새로고침
	//	  		실패 : 현재 로그인 폼을 그냥 두면 됨
	//			그러므로 response Page가 필요하지 않음
	//	  		로그인 성공 / 실패 결과만 알면됨
	
	//	  ver02 : 결과값 Data 를 response로 전달받음
   	//    		  서버로 부터 결과값을 전달받을 필요성 
   	//    		  서버의 결과는 Java 의 Data -> JS 가 이를 이용해서 코딩
   	//    		  그러므로 Java의 Data를 JS가 인식가능한 Data형식(JSON 포맷)으로 변환 해야함

	// => axlogin : ver01
	// -> success function내 에서 로그인 성공여부를 알수없음
	$('#axlogin').click(function() {
		$.ajax({
			type: 'Post',
			url: 'login',
			data: {
				id: $('#id').val(),
				password: $('#password').val()
			},
			success: function() {
				// => resultPage 를 사용하면
				//    실패시 로그인폼 출력은 가능 하지만,
				//    성공시 home 화면을 resultArea1에 출력하게됨


				// => resultArea 는 clear, 현재 Page는 새로 고침
				//	  그러나 실패시 로그인폼 출력이 어려움
				location.reload(); //새로고침
			}
		}); //ajax
	});	//axlogin_click



	$('#axlogout').click(function() {
		$.ajax({
			type: 'Post',
			url: 'logout',
			success: function() {
				// => resultPage 를 사용하면
				//    실패시 로그인폼 출력은 가능 하지만,
				//    성공시 home 화면을 resultArea1에 출력하게됨


				// => resultArea 는 clear, 현재 Page는 새로 고침
				//	  그러나 실패시 로그인폼 출력이 어려움
				location.reload(); //새로고침
			}
		}); //ajax
	});	//axlogin_click

}); //ready


// ** Error 처리 function **
function erroeMessage(message) {
	$('#resultArea1').html('~~ AjaxLogin 요청 Error => '+message);
}




