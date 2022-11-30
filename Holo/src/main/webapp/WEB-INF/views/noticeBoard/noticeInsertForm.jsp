<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice_Board Insert</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/board.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
</head>
<body>
	<div class="contents">
<<<<<<< HEAD
		<%@ include file="/WEB-INF/views/include/header.jsp" %>
=======
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
>>>>>>> branch 'master' of https://github.com/joy07180/holo.git
		<h2>공지사항</h2>
		<form action="noticeinsert" method="Post"
			enctype="multipart/form-data">
			<table>
				<tr height="40">
					<td bgcolor="Linen">I D</td>
					<td><input type="text" name="id" value="${loginID}" size="20"
						readonly></td>
				</tr>

				<tr height="40">
					<td bgcolor="Linen">제목</td>
					<td><input type="text" name="title" placeholder="제목을 입력해 주세요."></td>
				</tr>
				<tr height="40">
					<td bgcolor="Linen">Content</td>
					<td><textarea rows="5" cols="50" name="content"></textarea></td>
				</tr>
				<tr height="40">
					<td bgcolor="LightBlue">Image</td>
					<td><img src="" class="select_img"><br> <input
						type="file" name="uploadfilef" id="uploadfilef"></td>
				</tr>

				<script>
				$('#uploadfilef').change(function(){
					if(this.files && this.files[0]) {
						var reader = new FileReader;
						reader.readAsDataURL(this.files[0]);
			 			reader.onload = function(e) {
		 					$(".select_img").attr("src", e.target.result)
		 									.width(80).height(100);
		 				} // onload_function
			 		} // if	
				}); //change
			</script>
				<tr>
					<td></td>
				<tr height="40">
					<td bgcolor="LightBlue">고정 공지</td>
					<td><select name="fix" id="fix">
							<option value="1">상단 고정</option>
							<option value="0" selected>고정X</option>

					</select></td>
				</tr>

				<td><input type="submit" value="등록">&nbsp;&nbsp; 
				<input type="reset" value="취소"></td>
			</table>
		</form>

	</div>
	<hr>
	&nbsp;&nbsp;
	<a href="noticelist">공지사항</a> &nbsp;&nbsp;
	<a href="javascript:history.go(-1)">이전으로</a> &nbsp;&nbsp;
	<a href="home">[Home]</a>
	 <%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>