<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** ID 중복 확인 **</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/inCheck.js"></script>
<script>
//** idOK : 사용자가 입력한 id 를 사용가능하도록 해주고, 현재(this)창은 close
//1) this 창의 id 를 부모창의 id 로
//2) 부모창의 ID중복확인 버튼은 disable & submit 은 enable
//3) 부모창의 id 는 수정불가 (readonly) , password 에 focus
//4) 현재(this)창은 close

function idOK() {
	// 1)
	//opener.document.getElementById('id').value='${newId}' ;
	// jsp 페이지에서 sever에 있는 ''안에 있는 el태그를 처리함 
	//=> <script> 에서 EL은 문자열Type 내부에서 사용 가능함.
	opener.$('#id').val('${newId}');
	
	opener.$('#submit').prop('disabled', false);
	opener.$('#idDup').prop('disabled', true);
	
	// 3)
	// => id 가 확정 되었으므로 수정불가 -> readonly 
	// => attr , prop 비교
	//opener.$('#id').attr('readonly', 'readonly');
	opener.$('#id').prop('readonly', true);
	opener.$('#password').focus();
	
	// 4)
	window.close(); 

} //idOK

</script>
<style>
body {
      font-family: 맑은고딕;
   }
   #wrap {
      margin-left: 0;
      text-align: center;
   }
   h3 { color: navy; }
</style>
</head>
<body>
<div id="Wrap">
	<h3>ID 중복 확인</h3>
	<form action="idDupCheck" method="get">
		ID :
		<input type="text" name="id" id="id">&nbsp;
		<input type="submit" value="ID 중복확인" onclick="return idCheck()"><br>
		<!-- inCheck.js 의  idCheck() 의 결과에 따라 submit 결정-->
		<span id="iMessage" class="eMessage" ></span>
	</form>
	<br><br>
	<!-- ** 서버의 확인 결과에 따른 처리 영역 
		=>  isUse : 'T' 가능  / 'F' 불가능  
	-->
	<div id="msgBlock">
		<c:if test="${isUse=='T'}">
			${newId} 는 사용 가능한 ID 입니다 &nbsp;&nbsp; 
			<input type="button" value="아이디 사용" onclick="idOK()" >
			<!-- 사용자가 입력한 id 를 사용가능하도록 해주고, 현재(this)창은 close -->
		</c:if>
		<c:if test="${isUse=='F'}">
			${newId} 는 사용 불가능 합니다 (사용중) ~~ <br>
			다시 입력 하세요 ~~
			<!-- 부모창(joinForm, opener)에 남아있는 사용자가 입력한 id는 지워주고,  
			     현재(this)창 에서는 id 에 focus 를 주고 재입력 유도 -> script 필요
			-->
			<script>
				$('#id').focus();			
				opener.document.getElementById('id').value='';
			</script>
		</c:if>
	</div>
</div>
</body>
</html>