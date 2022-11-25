<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="resources/myLib/board.css">
	<title>** 공지사항</title>
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
<h2>공지사항</h2>
<hr>
	<table>
		<tr height="40">
		<td bgcolor="Khaki" width="5%">Seq</td><td width="10%">${apple.seq}</td>
		<td bgcolor="Khaki" width="5%">I D</td><td width="15%">${apple.id}</td>
		<td bgcolor="Khaki" width="5%">RegDate</td><td width="40%">${apple.regdate}</td>
		<td bgcolor="Khaki" width="5%">조회수</td><td width="10%">${apple.cnt}</td>
		</tr>
		<tr height="40">
		<td bgcolor="Khaki" width="5%">Title</td><td width="50%">${apple.title}</td>
		</tr>
		<tr height="100" width="100">
	            <c:if test="${empty apple.uploadfile}">
	            	<td>${apple.content}</td>
	            </c:if>
	            <c:if test="${not empty apple.uploadfile}">
	            	<td><img height="300" width="300" src="${apple.uploadfile}"><br>${apple.content}</td>
	            </c:if>
	        </tr>
		<tr height="40"></tr>
	</table>
<hr>
<c:if test="${loginID=='admin'}">
&nbsp;&nbsp;<a href="noticedetail?jCode=U&seq=${apple.seq}">[글수정]</a>
&nbsp;&nbsp;<a href="noticedelete?seq=${apple.seq}">[글삭제]</a>
</c:if>
&nbsp;&nbsp;<a href="javascript:history.go(-1)">이전으로</a>
&nbsp;&nbsp;<a href="home">[Home]</a>

</div>
</body>
</html>