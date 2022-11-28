<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user 회원가입</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/join.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/inCheck.js"></script>
<script src="resources/myLib/Test01.js"></script>

<script>
// ** id 중복 확인 **
// => UI 개선사항
// => 중복확인 버튼 추가
//	  처음 : 중복확인_enable / submit_disable
// => 중복확인 완료 후 submit 이 가능하도록
//	  중복확인_enable / submit_disable
// => 중복확인 가능 : function idDupCheck()
// 	  id 확인요청 -> 서버로 전송 -> id , selectOne 결과 -> response : 사용가능/불가능
// => 서버측 : 컨트롤러에 idDupCheck 요청을 처리하는 매핑메서드, view_Page 작성

function idDupCheck(){
	// 1) id 무결성 확인
	if ( iCheck==false ) iCheck=idCheck();
	else {
	// 2) 서버로 확인 요청 -> 결과는 새창으로 처리
		let url='idDupCheck?id='+$('#id').val();
		window.open(url, '_blank', 
				'width=400, height=300, resizable=yes, scrollbars=yes,tollbar=no,menubar=yes')		
		
	}
	
	
}//idDupCheck

// ===================================================================
	
// ** 입력값 무결성 점검 **	
// 1) 전역변수 선언
// => 개별적 오류 확인을 위한 switch 변수
	let iCheck=false;
	let pCheck=false;
	let ppCheck=false;
	let nCheck=false;
	let bCheck=false;
	let phCheck=false;

// 2) 개별적 focusout 이벤트 핸들러 작성 : JQuery
$(function(){
	$('#id').focus();
	// ** ID
	$('#id').keydown(function(e){
		if ( e.which==13 ) {
			e.preventDefault();
			// => form 에 submit 이 있는경우
			// => enter 누르면 자동 submit 발생되므로 이를 제거함
			$('#password').focus();
		}
	}).focusout(function(){    
		iCheck=idCheck();
	}); //id
	
	// ** Password
	$('#password').keydown(function(e){
		if ( e.which==13 ) {
			e.preventDefault();
			$('#password2').focus();
		}
	}).focusout(function(){    
		pCheck=	pwCheck();
	}); //password
	
	$('#password2').keydown(function(e){
		if ( e.which==13 ) {
			e.preventDefault();
			$('#name').focus();
		}
	}).focusout(function(){    
		ppCheck=pw2Check();
	}); //password2
	
	// ** Name
	$('#name').keydown(function(e){
		if ( e.which==13 ) {
			e.preventDefault();
			$('#birthday').focus();
		}
	}).focusout(function(){    
		nCheck=nmCheck();
	});	//name
	
	// ** Birthday
	$('#birthday').keydown(function(e){
		if ( e.which==13 ) {
			e.preventDefault();
			$('#phonenum').focus();
		}
	}).focusout(function(){    
		bCheck=bdCheck();
	});	//birthday
	
	// ** Phonenum : 정수
	$('#phonenum').keydown(function(e){
		if ( e.which==13 ) {
			e.preventDefault();
			$('#submit').focus();
		}
	}).focusout(function(){    
		phCheck=phoCheck();
	});	//Phonenum
}); //ready

// 3) submit 판단 & 실행 :  JS submit
function inCheck() {
// => 무결성 확인결과 submit 판단 & 실행
// => 모든 항목에 오류가 없으면 : submit -> return true 또는 default
//    하나의 항목이라도 오류가 있으면 : submit 취소 -> return false	 
	if (iCheck==false) { $('#iMessage').html(' id 를 확인하세요 !!');}
	if (pCheck==false) { $('#pMessage').html(' Password 를 확인하세요 !!');}
	if (ppCheck==false) { $('#ppMessage').html(' Password2 를 확인하세요 !!');}
	if (nCheck==false) { $('#nMessage').html(' Name 을 확인하세요 !!');}
	if (bCheck==false) { $('#bMessage').html(' Birthday 를 확인하세요 !!');}
	if (phCheck==false) { $('#phMessage').html(' 핸드폰 번호를 확인하세요 !!');}

	if ( iCheck && pCheck && ppCheck && nCheck &&
		 bCheck && phCheck ) {
		// => submit 확인
		if ( confirm("~~ 정말 가입 하십니까 ? (Yes:확인 / No:취소)")==false ) {
			 alert('~~ 가입이 취소 되었습니다 ~~');
			  return false; 
		}else return true; // submit 진행  
	}else {
		return false;
	}
} //inCheck

</script>	
	
	
	
</head>
<body>

<!--  ** FileUpLoad Form **
=> form 과 table Tag 사용시 주의사항 : form 내부에 table 사용해야함
   -> form 단위작업시 인식안됨
   -> JQ 의 serialize, FormData 의 append all 등 
   
=> method="post" : 255 byte 이상 대용량 전송 가능 하므로 
=> enctype="multipart/form-data" : 화일 upload 를 가능하게 해줌 
   ** multipart/form-data는 파일업로드가 있는 입력양식요소에 사용되는 enctype 속성의 값중 하나이고, 
       multipart는 폼데이터가 여러 부분으로 나뉘어 서버로 전송되는 것을 의미
       이 폼이 제출될 때 이 형식을 서버에 알려주며, 
       multipart/form-data로 지정이 되어 있어야 서버에서 정상적으로 데이터를 처리할 수 있다.     
-->
	<div class="header">
		<div>
			<a href="home" class="logo">logo</a>
		</div>

	</div>

	<form action="join" method="post" id="myForm" enctype="multipart/form-data">
<table>
	<tr><td >I D</td>
		<td><input type="text" name="id" id="id" size="20" 
								placeholder="id는 영문,숫자 10자 이내">
			<button type="button" id="idDup" onclick="idDupCheck()">ID 중복확인</button><br>
			<span id="iMessage" class="eMessage" ></span></td></tr>
			
	<tr><td	>Password</td>
		<td><input type="password" name="password" id="password" size="20"
								placeholder="특수문자 반드시 포함" value="12345!"><br>
 			<span id="pMessage" class="eMessage" ></span>
		</td></tr>
	<tr>
		<td ><label for=password>PW  확인</label></td><br>
		<td><input type="password"  id=password2 size="20"><br>
 			<span id="ppMessage" class="eMessage" ></span></td>
	</tr>	
	<tr><td >Name</td>
		<td><input type="text" name="name" id="name" ><br>
 			<span id="nMessage" class="eMessage" ></span></td></tr>
 			
	<tr><td >Birthday</td>
		<td><input type="date" name="birthday" id="birthday"><br>
 			<span id="bMessage" class="eMessage" ></span></td></tr>
 			
	<tr><td >Gender</td>
		<td><select name="gender" id="gender" style="border:1px solid #388aff; height: 50px; border-radius: 3px;" >
				<option value="여성">여성</option>
				<option value="남성" selected>남성</option>
			</select>
		</td></tr>
 						
	<tr><td>핸드폰번호</td>
		<td><input type="text" name="phonenum" id="phonenum"
			placeholder="01012345678 형식 입력"><br>
 			<span id="phMessage" class="eMessage" ></span></td></tr>
		
	<tr><td >Image</td>
		<td><img src="" class="select_img" ><br>
			<input type="file" name="uploadfilef" id="uploadfilef" style="border: 0;" ></td></tr>
			<script>
				// 해당 파일의 서버상의 경로를 src로 지정하는것으로는 클라이언트 영역에서 이미지는 표시될수 없기 때문에
				// 이를 해결하기 위해 FileReader이라는 Web API를 사용
				// => 이 를 통해 url data를 얻을 수 있음.
				//    ( https://developer.mozilla.org/ko/docs/Web/API/FileReader)
				// ** FileReader
				// => 웹 애플리케이션이 비동기적으로 데이터를 읽기 위하여 읽을 파일을 가리키는File
				//    혹은 Blob 객체를 이용해 파일의 내용을(혹은 raw data버퍼로) 읽고 
				//    사용자의 컴퓨터에 저장하는 것을 가능하게 해줌.   
				// => FileReader.onload 이벤트의 핸들러.
				//    읽기 동작이 성공적으로 완료 되었을 때마다 발생.
				// => e.target : 이벤트를 유발시킨 DOM 객체
				// => type="file" 은 복수개의 파일을 업로드 할 수 있도록 설계됨
				//    그러므로 files[] 배열 형태의 속성을 가짐
				$('#uploadfilef').change(function() {
							if (this.files && this.files[0]) {
								var reader = new FileReader;
								reader.readAsDataURL(this.files[0]);
								reader.onload = function(e) {
									$(".select_img").attr("src",e.target.result)
													.width(100).height(100);
								} // onload_function
							} // if   
						}); //change
			</script>
	<tr><td></td>
		<td><input type="submit" value="가입" id="submit" 
					onclick="return inCheck()" disabled="disabled" width="50" >&nbsp;&nbsp;
			<input type="reset" value="취소">&nbsp;&nbsp;
		</td>	
	</tr>	
</table>
</form>
<c:if test="${not empty message}">
${message}<br>
</c:if>
</body>
</html>
