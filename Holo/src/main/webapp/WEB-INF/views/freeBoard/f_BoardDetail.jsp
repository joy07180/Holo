<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    // 엔터 입력시 줄바꿈
    pageContext.setAttribute("replaceChar","\n");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>** 자유게시판 디테일 **</title>
    <link rel="stylesheet" type="text/css" href="resources/myLib/board.css">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	
</head>
<body>
    <div class="contents">
      <%@ include file="/WEB-INF/views/include/header.jsp" %>
        <br>
        <div class="Header_box">
        <h2>▶ 자유 게시판 ◀</h2>
        <p class="Header_text1">&nbsp;이곳은 자유게시판 입니다. 아래의 주제 외에 자유롭게 글을 작성해주세요.</p>
        <p class="Header_text2">&nbsp;팁 관련 주제는 <a href="tipblist">팁/정보</a>게시판, 물건 판매 및 거래는 <a href="t_bcrilist">거래/나눔</a>게시판, 동아리 및 모임 주제는 <a href="cbcrilist">동아리/모임</a>게시판에 남겨주세요.</p>
        <br>
        </div>
        <br>
        
	<c:if test="${not empty apple}">
	    <table class="board_dTop">
	        <tr class="board_dTitle">
	        	<td><br>${apple.title}</td>
	        </tr>
	        <tr class="board_dList">
	        	<td>글번호 : ${apple.seq}&nbsp;&nbsp;</td>
	            <td>| 작성자 : <img height="15" width="15" src="${apple.image}">${apple.id}&nbsp;&nbsp;</td>
	            <td>| 조회수 : ${apple.cnt}&nbsp;&nbsp;</td>
	            <td>| ${apple.regdate}</td>
	        </tr>
	        <tr class="board_dBottom">
	            <c:if test="${empty apple.uploadfile}">
	            	<td>${fn:replace(apple.content, replaceChar, "<br/>")}</td>
	            </c:if>
	            <c:if test="${not empty apple.uploadfile}">
	            	<td><img width="100%" src="${apple.uploadfile}"><br><br>${fn:replace(apple.content, replaceChar, "<br/>")}<br><br></td>
	            </c:if>
	        </tr>
	    </table>
	</c:if>
	
		<div>
			<!-- 아이디 로그인이랑 다를때 메뉴 -->
	        <c:if test="${loginID!=apple.id || loginID!='admin'}">
			<a href="f_binsertf">새글등록</a>
	        &nbsp;&nbsp;<a href="f_rinsertf?root=${apple.root}&step=${apple.step}&indent=${apple.indent}">답글등록</a>
			&nbsp;&nbsp;<a href="f_bcrilist">목록으로</a>       
	        </c:if>
	        <!-- 아이디 로그인이랑 같을때 추가 메뉴 -->
	        <c:if test="${loginID==apple.id || loginID=='admin' }">
	        &nbsp;&nbsp;<a href="f_bdetail?jCode=U&seq=${apple.seq}">글수정</a>
	        &nbsp;&nbsp;<a href="f_bdelete?seq=${apple.seq}&root=${apple.root}">글삭제</a>
	        </c:if>
	        <br>
	        
	        <br>
	        <c:if test="${Prev!='T'}">
	        <a href="f_bdetail?jCode=P&seq=${apple.seq}">이전글</a>
	        </c:if>
	        <c:if test="${Prev=='T'}">
	        이전글
	        </c:if>
	        
	        &nbsp;&nbsp;<a href="f_bdetail?jCode=N&seq=${apple.seq}">다음글</a>
        </div>
	
	
</div> <!-- contents /div -->

 <%@ include file="/WEB-INF/views/include/footer.jsp" %>

</body>
</html>
