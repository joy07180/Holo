<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** UserList **</title>
	<link rel="stylesheet" type="text/css" href="resources/myLib/userlist.css">
	<script src="resources/myLib/Test02.js"></script>
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>

<script>
	function goto() {
		
	    if (confirm("회원 삭제 하시겠습니까??")) {
		//if(prompt("비밀번호 입력")=${apple.id}){
	        location.href = "userdelete?id=${apple.id }";
		//}
	    }
	}//goto
	
	$(function() { 
		// searchType 이 '전체'이면 keyword 클리어
		// .val() => value 값
		$('#searchType').change(function () {
			if($(this).val()=='n') $('#keyword').val(''); 
		}); //change
		
		// 2) 검색 후 요청 
		$('#searchBtn').click(function(){
			self.location="user"
				+"${pageMaker.makeQuery(1)}"
				+"&searchType="
				+$('#searchType').val()
				+"&keyword="
				+$('#keyword').val()
		}); //click
	}); //ready
	
	</script>
</head>

<body>

	<div class="contents">
			<div class="header">
				<div>
					<a href="home" class="logo">logo</a>
				</div>
			</div>
	</div>
	
			<br>
			<hr>
			<div id="searchbar">
				<select name="searchType" id="searchType">
					<!-- <option value="n" selected> 을 조건 (cri.searchType 의 값) 에 따라 작성하기 위한 삼항식 
         => value="n" : ~~~~.cri.searchType==null ? 'selected':''  첫화면 출력시 초기값 으로 selected
      	-->
					<option value="i" ${pageMaker.cri.searchType==i ? 'selected' : ''}>ID</option>
					<option value="na"
						${pageMaker.cri.searchType==na ? 'selected' : ''}>NAME</option>
					<option value="in"
						${pageMaker.cri.searchType==in ? 'selected' : ''}>ID or
						NAME</option>
				</select> <input type="text" name="keyword" id="keyword"
					value="${pageMaker.cri.keyword}" placeholder="회원 정보 검색">
				<button id="searchBtn">검색</button>
			</div>
			<br>

			<hr>
			<table width=100%>
				<tr height="30">
					<th>I D</th>
					<th>이름</th>
					<th>Birthday</th>
					<th>Gneder</th>
					<th>핸드폰번호</th>
					<th>Image</th>
					<th>회원 삭제</th>
				</tr>

				<c:if test="${not empty banana}">
					<c:forEach var="user" items="${banana}">
						<tr height="30" >

							<td><a href="userdetail?id=${user.id}">${user.id}</a></td>

							<%-- <td>${user.password}</td> --%>
							<td>${user.name}</td>
							<td>${user.birthday}</td>
							<td>${user.gender}</td>
							<td>${user.phonenum}</td>
							<!-- ** Image(File) DownLoad 추가 
   ** 기본과정 ****************
   1) 요청시 컨트롤러에게 파일패스(path) 와 이름을 제공  (axMemberList.jsp)
   2) 요청받은 컨트롤러에서는 그 파일패스와 이름으로 File 객체를 만들어 뷰로 전달
      (MemberController.java , 매핑 메서드 dnload ) 
   3) 뷰에서는 받은 file 정보를 이용해서 실제 파일을 읽어들인 다음 원하는 위치에 쓰는 작업을 한다.
       -> DownloadView.java
            일반적인 경우에는 컨트롤러에서 작업을 한 후, JSP뷰 페이지로 결과값을 뿌려주는데
          다운로드에 사용될 뷰는 JSP가 아니라 파일정보 임 
      -> 그래서 일반적으로 사용하던 viewResolver 가 처리하는 것이 아니라
          download 만을 처리하는 viewResolver 가 따로 존재해야 함.    
   4) 위 사항이 실행 가능하도록 xml 설정  (servlet-context.xml) 
   ***************************
   ** UI(View) 동작 구현
   1) class="dnload" 를 이용하여  jQuery Ajax 로 처리 
      => 안됨 (java 클래스인 서버의 response가 웹브러우져로 전달되지 못하고 resultArea에 담겨질 뿐 )  
      <img src="${list.uploadfile}" width="50" height="60" class="dnload textLink"> 
   2) aTag 로 직접 요청함 
      => java 클래스인  서버의 response가  웹브러우져로 전달되어 download 잘됨. 
-->
							<td><img src="${user.uploadfile}" width="50" height="60"></td>

							<!-- ** Delete 기능 실습 
   => 1) JQ 방식 : class_이벤트리스너 적용 , id_선택한(삭제할) id 전달 위해 필요  
   => 2) JS의 function 으로 처리 
      - function amDelete ....
      - delete 대상을 알 수 있는 id값이 있기 때문에 이것을 이용했음
        그런데 이러한 유일한 값이 없는 경우에는 반복문의 index 또는 count 값을 id 속성의 값으로 이용함  
      - function Test 영향을 받지 않도록 ddd -> ddd1 로 잠시 변경              
-->
							<td><a href="javascript:goto()">Delete</a></td>
						</tr>
					</c:forEach>
				</c:if>
			</table>

			<!-- Cri_Page -->
			<div align="center">

				<!-- First, Prev -->
				<c:choose>
					<c:when test="${pageMaker.prev && pageMaker.spageNo>1}">

						<a href="user${pageMaker.searchQuery(1)}">FP</a>
						<a href="user${pageMaker.searchQuery(pageMaker.spageNo-1)}">&lt;</a>&nbsp;&nbsp;  
			
		</c:when>
					<c:otherwise>
						<font color="Gray">FP&nbsp;&lt;&nbsp;&nbsp;</font>
					</c:otherwise>
				</c:choose>

				<!-- Displag PageNo -->
				<c:forEach var="i" begin="${pageMaker.spageNo}"
					end="${pageMaker.epageNo}">
					<c:if test="${i==pageMaker.cri.currPage}">
						<font size="5" color="Orange">${i}</font>&nbsp;
		</c:if>
					<c:if test="${i!=pageMaker.cri.currPage}">
						<!-- New_ver01_Cri -->
						<a href="user${pageMaker.searchQuery(i)}">${i}</a>
					</c:if>
				</c:forEach>

				<!-- Next, Last -->
				<c:choose>
					<c:when test="${pageMaker.next && pageMaker.epageNo>0}">

						<!-- New_ver01_Cri -->
						<a href="user${pageMaker.searchQuery(pageMaker.epageNo+1)}">&nbsp;&nbsp;&gt;</a>
						<a href="user${pageMaker.searchQuery(pageMaker.lastPageNo)}">&nbsp;LP</a>


					</c:when>
					<c:otherwise>
						<font color="Gray">&nbsp;&gt;&nbsp;&nbsp;LP</font>
					</c:otherwise>
				</c:choose>
			</div>
</body>

<hr>
<footer>
        <div class="bottom">
            <span>
                <div>Copyright (c) Holo.net All rights reserved.</div>
                <div>Contact us, holo at gmail dot com</div>
                <div><a href="">이용약관</a> | <a href="">개인정보취급방침</a></div>
            </span>
        </div>
        <br>
</footer>
</html>