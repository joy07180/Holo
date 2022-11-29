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
    <title>** 거래게시판 디테일 **</title>
	<link rel="stylesheet" type="text/css" href="resources/myLib/board.css">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
</head>
<body>
    <div class="contents">
        <header>
            <div class="header">
                <div>
                    <a href="home" class="logo">logo</a>
                </div>
                <div class="search">
					<form action="searchsearch">
						<input class="searchBox" type="text" size="40"
							placeholder="게시판 & 통합검색" type="text" name="keyword2"
							id="keyword2" /> <input class="searchClick" id="searchBtn2"
							type="submit" value="검색" />
					</form>
				</div>
            </div>
            <nav class="headerM">
                <div>
                    <ul class="category">
						<li><a href="noticelist" class="liText">공지사항 </a></li>
						<li><a href="tipblist" class="liText">팁/정보 </a></li>
						<li><a href="f_bcrilist" class="liText">자유게시판 </a></li>
						<li><a href="t_bcrilist" class="liText">거래/나눔 </a></li>
						<li><a href="cbcrilist" class="liText">동아리/모임 </a></li>
					</ul>
                </div>
            </nav>
        </header>
        <br>
        <div class="Header_box">
        <h2>▶ 거래 게시판 ◀</h2>
        <p class="Header_text1">&nbsp;이곳은 거래/나눔 게시판 입니다. 물건 거래, 나눔 글을 작성해주세요.</p>
        <p class="Header_text2">&nbsp;팁 관련 주제는 <a href="tipblist">팁/정보</a>게시판, 자유주제는 <a href="f_bcrilist">자유</a>게시판, 동아리 및 모임 주제는 <a href="cbcrilist">동아리/모임</a>게시판에 남겨주세요.</p>
        <br>
        </div>
        <br>
		
		
	<c:if test="${not empty apple}">
	    <table class="board_dTop">
	        <tr class="board_dTitle">
	            <td><br>${apple.title}</td>
	        	<td class="board_dSB">
	        		<c:if test="${apple.trade=='sell'}">&nbsp;판매</c:if>
	        		<c:if test="${apple.trade=='buy'}">&nbsp;구매</c:if>
	        	</td>
	        </tr>
	        <tr class="board_dList">
	            <td>글번호 : ${apple.seq}&nbsp;&nbsp;</td>
	            <td>| 작성자 : <img height="15" width="15" src="${apple.image}">${apple.id}&nbsp;&nbsp;</td>
	            <td>| 조회수 : ${apple.cnt}&nbsp;&nbsp;</td>
	            <td>| ${apple.regdate}<br></td>
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
		<a href="t_binsertf">새글등록</a>
        &nbsp;&nbsp;<a href="t_rinsertf?root=${apple.root}&step=${apple.step}&indent=${apple.indent}">답글등록</a>
		&nbsp;&nbsp;<a href="t_bcrilist">목록으로</a>       
        </c:if>
        <!-- 아이디 로그인이랑 같을때 추가 메뉴 -->
        <c:if test="${loginID==apple.id || loginID=='admin' }">
        &nbsp;&nbsp;<a href="t_bdetail?jCode=U&seq=${apple.seq}">글수정</a>
        &nbsp;&nbsp;<a href="t_bdelete?seq=${apple.seq}&root=${apple.root}">글삭제</a>
        </c:if>
        
        <br>
        <br>
        <c:if test="${Prev!='T'}">
        <a href="t_bdetail?jCode=P&seq=${apple.seq}">이전글</a>
        </c:if>
        <c:if test="${Prev=='T'}">
        이전글
        </c:if>
        &nbsp;&nbsp;<a href="t_bdetail?jCode=N&seq=${apple.seq}">다음글</a>
		<br>
		<br>        
        </div>
        
</div>
	<footer>
	    <div class="bottom">
	        <ul class="btMenu">
	            <li><a href="">A</a></li>
	            <li><a href="">B</a></li>
	            <li><a href="">C</a></li>
	            <li><a href="">D</a></li>
	            <li><a href="">E</a></li>
	            <li><a href="">F</a></li>
	        </ul>
	        <span>
	            <div>Copyright (c) Holo.net All rights reserved.</div>
	            <div>Contact us, holo at gmail dot com</div>
	            <div><a href="">이용약관</a> | <a href="">개인정보취급방침</a></div>
	        </span>
	    </div>
	    <br>
	</footer>
</body>
</html>