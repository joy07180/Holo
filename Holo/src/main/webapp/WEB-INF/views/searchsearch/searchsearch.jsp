<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Notice_Board PageList</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/board.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script>
        </script>
</head>


<body>
	<div class="contents">
	
		 <%@ include file="/WEB-INF/views/include/header.jsp" %>
		 
		<br>
		<h2>검색 결과</h2>
		<br> <br>

        <table id="board_container">
            <thead class="boardList_head">
                <tr>
                    <th class="headT">제 목</th>
                    <th class="headI">글쓴이</th>
                    <th class="headR">날 짜</th>
					<th class="headC">조회수</th>
				</tr>
            </thead>
			<tbody class="boardList_body">
				<c:if test="${not empty nservice}">
					<c:forEach var="nboard" items="${nservice}">
						<tr height="30">
							<td width="40%"><a href="searchdetail?seq=${nboard.seq}">${nboard.title}</a></td>
							<td class="ct" width="20%"><img height="25" width="25" src="${nboard.image}"><a href="userdetail?id=${nboard.id}">${nboard.id}</a></td>
							<td class="ct" width="10%">${nboard.regdate}</td>
							<td class="ct" width="10%">${nboard.cnt}</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>



		<!-- Cri_Page -->
		<div align="center">
			<!-- First, Prev -->
			<c:choose>
				<c:when test="${pageMaker.prev && pageMaker.spageNo>1}">
					<a href="searchsearch${pageMaker.searchQuery(pageMaker.spageNo-1)}">&lt;</a>&nbsp;&nbsp;

                </c:when>
			</c:choose>
			<!-- Displag PageNo -->
			<c:forEach var="i" begin="${pageMaker.spageNo}"
				end="${pageMaker.epageNo}">
				<c:if test="${i==pageMaker.cri.currPage}">
					<font size="5" color="Orange">${i}</font>&nbsp;
                </c:if>
				<c:if test="${i!=pageMaker.cri.currPage}">

					<a href="searchsearch${pageMaker.searchQuery(i)}">${i}</a>&nbsp;

                </c:if>
			</c:forEach>

			<c:choose>
				<c:when test="${pageMaker.next && pageMaker.epageNo>0}">
					<a href="searchsearch${pageMaker.searchQuery(pageMaker.epageNo+1)}">&nbsp;&gt;</a>

				</c:when>
			</c:choose>
		</div>
		<br> 
		<br>

</div>
 <%@ include file="/WEB-INF/views/include/footer.jsp" %>


</body>

</html>