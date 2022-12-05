<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <header>
            <div class="header">
                <div>
                    <a href="home" class="logo">logo</a>
                </div>
                <div class="search">
                    <form action="searchsearch">
					<input class="searchBox" type="text" size="40"
						placeholder="게시판 & 통합검색" type="text" name="keyword2" id="keyword2" /> 
					<input class="searchClick" id="searchBtn2" type="submit" value="검색" />
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