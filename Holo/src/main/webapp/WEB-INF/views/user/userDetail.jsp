<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/myLib/userDetail.css">
<title>내 정보</title>
<script>
function goto() {
    if (confirm("탈퇴하시겠습니까??")) {
        location.href = "userdelete?id=${apple.id }";
    }
}
</script>
</head>
<div>
	<a href="home" class="logo">logo</a>
</div>
<body>
<c:if test="${loginID!='admin'}">
<h2>마이페이지</h2>
</c:if>
<c:if test="${loginID=='admin'}">
<h2>${apple.id}의 회원 정보 **</h2>
</c:if>
<c:if test="${not empty apple}"> 
	<table>
		<tr height="40"><td bgcolor="lavender">I D</td><td>${apple.id}</td></tr>
		<tr height="40"><td bgcolor="lavender">이름</td><td>${apple.name}</td></tr>
		<tr height="40"><td bgcolor="lavender">생년월일</td><td>${apple.birthday}</td></tr>
		<tr height="40"><td bgcolor="lavender">Gender</td><td>${apple.gender}</td></tr>
		<tr height="40"><td bgcolor="lavender">핸드폰 번호</td><td>${apple.phonenum}</td></tr>
		<tr height="40"><td bgcolor="lavender">회원 사진</td>
		<td><img src="${apple.uploadfile}" width="70" height="80"></td></tr>
	</table>
</c:if>
<c:if test="${not empty message}">
<hr>
${message}<br>
</c:if>
<hr>
<c:if test="${loginID==apple.id}">
<h2>내가 쓴 글</h2>
</c:if>
<c:if test="${loginID!=apple.id}">
<h2>${apple.id}가 쓴 글</h2>
</c:if>
<table width=100%>
			<thead>
				<tr height="30">
					<th width="40%">제 목</th>
					<th width="20%">날 짜</th>
					<th width="10%">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty nservice}">
					<c:forEach var="nboard" items="${nservice}">
						<tr height="30" bgcolor="lightGray">
							<td width="40%"><a href="searchdetail?seq=${nboard.seq}">${nboard.title}</a></td>
							<td class="ct" width="10%">${nboard.regdate}</td>
							<td class="ct" width="10%">${nboard.cnt}</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		
<hr>		
<c:if test="${loginID!='admin'}">
&nbsp;&nbsp;<a href="userdetail?jCode=U&id=${apple.id}" >내정보수정</a>
</c:if>
<c:if test="${loginID=='admin'}">
&nbsp;&nbsp;<a href="userdetail?jCode=U&id=${apple.id}" >회원정보수정	</a>
</c:if>

&nbsp;&nbsp; <a href="javascript:goto()" >회원탈퇴</a><br>
</body>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/myLib/board.css">
<title>** MemberDetail Web_MVC2 **</title>
<script>
function goto() {
    if (confirm("탈퇴하시겠습니까??")) {
        location.href = "userdelete?id=${apple.id }";
    }
}
</script>
</head>
<body>
<c:if test="${loginID!='admin'}">
<h2>** 마이페이지 **</h2>
</c:if>
<c:if test="${loginID=='admin'}">
<h2>** ${apple.id}의 회원 정보 **</h2>
</c:if>
<hr>
<c:if test="${not empty apple}"> 
	<table>
		<tr height="40"><td bgcolor="lavender">I D</td><td>${apple.id}</td></tr>
		<tr height="40"><td bgcolor="lavender">Name</td><td>${apple.name}</td></tr>
		<tr height="40"><td bgcolor="lavender">Birthday</td><td>${apple.birthday}</td></tr>
		<tr height="40"><td bgcolor="lavender">Gender</td><td>${apple.gender}</td></tr>
		<tr height="40"><td bgcolor="lavender">Phonenum</td><td>${apple.phonenum}</td></tr>
		<tr height="40"><td bgcolor="lavender">Image</td>
		<td><img src="${apple.uploadfile}" width="70" height="80"></td></tr>
	</table>
</c:if>
<c:if test="${not empty message}">
<hr>
${message}<br>
</c:if>
<hr>

<c:if test="${loginID!='admin'}">
&nbsp;&nbsp;<a href="userdetail?jCode=U&id=${apple.id}" >[내정보수정]</a>
</c:if>
<c:if test="${loginID=='admin'}">
&nbsp;&nbsp;<a href="userdetail?jCode=U&id=${apple.id}" >[회원정보수정]</a>
</c:if>

<!-- memberList 에서 요청한 경우는 session 에 보관된 id로는 수정 할 수 없기때문에 parameter로 처리함  -->
&nbsp;&nbsp; <a href="javascript:goto()" >[회원탈퇴]</a><br>
&nbsp;&nbsp;<a href="javascript:history.go(-1)">이전으로</a>
&nbsp;&nbsp;<a href="home">[Home]</a>
</body>
</html>