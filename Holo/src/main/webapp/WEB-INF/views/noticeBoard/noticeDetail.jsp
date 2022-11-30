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
	<link rel="stylesheet" type="text/css" href="resources/myLib/board.css">
	<title>** 공지사항 **</title>
</head>
<body>
    <div class="contents">
        <%@ include file="/WEB-INF/views/include/header.jsp" %>
        <br>
        <div class="Header_box">
        <h2>▶ 공지사항 ◀</h2>
        <p class="Header_text1">&nbsp;이곳은 공지사항 게시판 입니다.</p>
        <p class="Header_text2">&nbsp;관리자 외에 글을 쓸 수 없으며, 글 읽기만 가능합니다.</p>
        <br>
        </div>
        <br>
	
	<table class="board_dTop">
	        <tr class="board_dTitle"><td><br>${apple.title}</td></tr>
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
	
	<div>
	<c:if test="${loginID=='admin'}">
	&nbsp;&nbsp;<a href="noticeinsertf">새글등록</a>
	&nbsp;&nbsp;<a href="noticedetail?jCode=U&seq=${apple.seq}">글수정</a>
	&nbsp;&nbsp;<a href="noticedelete?seq=${apple.seq}">글삭제</a>
	</c:if>
	        
    <br>
    &nbsp;&nbsp;<a href="noticelist">목록</a>       
    <c:if test="${Prev!='T'}">
    &nbsp;&nbsp;<a href="t_bdetail?jCode=P&seq=${apple.seq}">이전글</a>
    </c:if>
    <c:if test="${Prev=='T'}">
    &nbsp;&nbsp;이전글
    </c:if>
    &nbsp;&nbsp;<a href="t_bdetail?jCode=N&seq=${apple.seq}">다음글</a>
	<br>
	<br>  
	</div>

</div>

 <%@ include file="/WEB-INF/views/include/footer.jsp" %>

</body>
</html>