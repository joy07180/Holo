<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>자유 게시판</title>
	<link rel="stylesheet" type="text/css" href="resources/myLib/board.css">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<script>
	
    $(function() {
		// 1) SearchType 이 '전체' 면 keyword 클리어
		$('#searchType').change(function(){
			if ( $(this).val()=='n' ) $('#keyword').val('');
		}); //change
		
		// 2) 검색 후 요청 
		// => 검색조건 입력 후 첫 Page 요청
		//    이때는 서버에 searchType, keyword 가 전달되기 이전이므로 makeQuery 메서드사용
		// => self.location="bcrilist?currPage=?????" : 해당 요청을 서버로 전달 	
				
		// ** self.location	
		// 1) location 객체 직접사용 Test : url로 이동, 히스토리에 기록됨
		// 2) location 객체의 메서드
		// => href, replace('...'), reload()	
		
		$('#searchBtn').click(function(){
			self.location="f_bcrilist"
				+"${pageMaker.makeQuery(1)}"
				+"&searchType="
				+$('#searchType').val()
				+"&keyword="
				+$('#keyword').val()
		}); //click
	
	}); //ready */
	
	function checkClear() {
		$('.clear').attr('checked',false);
		return false; // reset 의 기본 onclick 취소
	} //checkClear
	
	
	</script>
</head>
<body>
    <div class="contents">
        <header>
            <div class="header">
                <div>
                    <a href="" class="logo">logo</a>
                </div>
                <div class="search">
                    <form action="">
                        <input class="searchBox" size="40" type="text" id="search" placeholder="게시판 & 통합검색">
                        <span>
                            <input class="searchClick" type="submit" value="검색">
                        </span>
                    </form>
                </div>

            </div>

            <nav class="headerM">
                <div>
                    <ul class="category">
                        <li>
                            <a href="noticelist" class="liText">공지사항
                            </a>
                        </li>
                        <li>
                            <a href="hbcrilist" class="liText">팁/정보
                            </a>
                        </li>
                        <li>
                            <a href="f_bcrilist" class="liText">자유게시판
                            </a>
                        </li>
                        <li>
                            <a href="t_bcrilist" class="liText">거래/나눔
                            </a>
                        </li>
                        <li>
                            <a href="cbcrilist" class="liText">동아리/모임
                            </a>
                        </li>
                        <li>
                            <a href="" class="liText">Q&A
                            </a>
                        </li>
                        
                    </ul>
                </div>
            </nav>

        </header>
        <br>
        <h2>자유 게시판</h2>
        <br>
        <br>
        
   		<div>
		<!-- 아이디 로그인할때만 가능하게 -->
        <c:if test="${not empty loginID}">
        &nbsp;&nbsp;<a href="f_binsertf">새글등록</a>
        </c:if>
        <c:if test="${empty loginID}">
		&nbsp;&nbsp;<a href="#"><p onclick="alert('로그인후 이용해주세요')">새글등록</p></a>       
        </c:if>
        </div>

	<table width=100%> 
		<tr bgcolor="Gold" height="30">
			<th>글 번호</th><th>제목</th><th>글쓴이</th><th>날짜</th><th>조회수</th>
		</tr>
		<c:if test="${not empty banana}">
			<c:forEach  var="free_board" items="${banana}" >
			<tr height="30">
				<td>${free_board.seq}</td>
				
				<td>
					<!-- 답글 등록후 indent 에 따른 들여쓰기 
							=> 답글인 경우에만 적용  -->
					<c:if test="${free_board.indent > 0}">
						<c:forEach begin="1" end="${free_board.indent}">
							<span>&nbsp;&nbsp;</span>
						</c:forEach>
						<span style="color:hotpink">re..</span>
					</c:if>
				
				<!-- 로그인 한 경우에만 title을 클릭하면 content를 볼 수 있도록 함
							=> f_detail 을 실행함 -->
					<c:if test="${empty loginID}">
				   		${trade_board.title}
					</c:if>		
					<c:if test="${not empty loginID}">
    					<a href="f_bdetail?seq=${free_board.seq}">${free_board.title}</a>&nbsp;&nbsp;
					</c:if> 
				</td>
	
				<td>${free_board.id}</td>
				<td>${free_board.regdate}</td><td>${free_board.cnt}</td>
			</tr>	
			</c:forEach>
		</c:if>
	</table>

	<!-- Cri_Page -->
	<div align="center">
		<!-- First, Prev -->
		<c:choose>
			<c:when test="${pageMaker.prev && pageMaker.spageNo>1}">
				<a href="f_bcrilist${pageMaker.searchQuery(pageMaker.spageNo-1)}">&lt;</a>&nbsp;&nbsp; 
			</c:when>
		</c:choose>	
		<!-- Display PageNo -->
		<c:forEach  var="i" begin="${pageMaker.spageNo}" end="${pageMaker.epageNo}">
			<c:if test="${i==pageMaker.cri.currPage}">
				<font size="5" color="Orange">${i}</font>&nbsp;
			</c:if>
			<c:if test="${i!=pageMaker.cri.currPage}">
				<a href="f_bcrilist${pageMaker.searchQuery(i)}">${i}</a>&nbsp;
			</c:if>
		</c:forEach>
		<!-- Next, Last -->
		<c:choose>
			<c:when test="${pageMaker.next && pageMaker.epageNo>0}">
				<a href="f_bcrilist${pageMaker.searchQuery(pageMaker.epageNo+1)}">&nbsp;&gt;</a>  
			</c:when>
		</c:choose>
	
	</div>
	<br>
	<div id="searchBar">
		<select name="searchType" id="searchType">
			<!-- <option value="n" selected> 을 조건 (cri.searchType 의 값) 에 따라 작성하기 위한 삼항식 
				=> value="n" : ~~~~.cri.searchType==null ? 'selected':''  첫화면 출력시 초기값 으로 selected
			-->
			<%-- <option value="n" ${pageMaker.cri.searchType==null ? 'selected' : ''}>전체</option> --%>
			<option value="tc" ${pageMaker.cri.searchType=='tc' ? 'selected' : ''} selected >제목+내용</option>
			<option value="t" ${pageMaker.cri.searchType=='t' ? 'selected' : ''}>제목</option>
			<option value="c" ${pageMaker.cri.searchType=='c' ? 'selected' : ''}>내용</option>
			<option value="i" ${pageMaker.cri.searchType=='i' ? 'selected' : ''}>ID(글쓴이)</option>
		</select>
		<input type="text" name="keyword" id="keyword" value="${pageMaker.cri.keyword}">	
		<button id="searchBtn">Search</button>
	&nbsp;&nbsp;
	</div>
</div>
<br>
<br>

<!-- ************************************************************* -->

<footer>
        <div class="bottom">
            <ul class="btMenu">
                <li><a href="">공지사항</a></li>
                <li><a href="">팁/정보</a></li>
                <li><a href="">자유게시판</a></li>
                <li><a href="">거래/나눔</a></li>
                <li><a href="">동아리/모임</a></li>
                <li><a href="">Q&A</a></li>
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
