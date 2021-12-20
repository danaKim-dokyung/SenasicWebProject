<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />

<style>
* {
	box-sizing: border-box;
}

td>a:hover {
	text-decoration: underline;
	/* hover시 밑줄표시 */
}


 .nav-container {
	display: flex;
	text-align: center;
}

.nav-item {
	text-align: center;
}

li {
	float: left;
	padding: 30px;
}

li:hover {
	color: green;
}

header {
	background-color: white;
	z-index: 100;
}

#logo>img {
	width: 100px;
	display: block;
	margin: auto;
}

.work-sans {
	font-family: 'Work Sans', sans-serif;
}

#menu-toggle:checked+#menu {
	display: block;
}

.hover\:grow {
	transition: all 0.3s;
	transform: scale(1);
}

.hover\:grow:hover {
	transform: scale(1.02);
}

@import url("https://fonts.googleapis.com/css?family=Raleway");

.forSearch {
	margin: 0;
	padding: 30px;
	font-family: "Raleway", sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
}

.container1 {
	position: relative;
}

.main {
	position: relative;
	border: 5px solid #064e3b;
	height: 50px;
	width: 800px;
	border-radius: 50px;
	padding-left: 41px;
	padding-right: 11px;
	padding-top: 4px;
	padding-bottom: 4px;
	font-size: 20px;
	color: #555;
}

.main:focus {
	outline: none;
}

.searchicon {
	position: absolute;
	height: 25px;
	width: 25px;
	background: transparent;
	border: 3px solid #064e3b;
	left: 12px;
	top: 14px;
	border-radius: 100%;
}

.searchicon:after {
	content: "";
	position: absolute;
	background: #5F8FA4;
	height: 6px;
	width: 3px;
	bottom: -5px;
	right: -3px;
	transform: rotate(-45deg);
}

.con_cmn {
	display: none
}

.con1 {
	display: block;
}

#hashtag {
	visibility: hidden;
}

.nametag {
	
}

#list img {
	filter: brightness(70%);
}

#list img:hover {
	filter: brightness(50%);
	
}
nav>ul{
	padding-left: 28%;
}
nav>ul>li{
	padding-right: 17%;
}
</style>
</head>
	<header
		class="text-gray-600 body-font sticky inset-x-0 top-0 left-0  py-5">
		<div
			class="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">

			<!------ 왼쪽 상단 세나식 로고 ----->
			<a href="/index.jsp"
				class="flex title-font font-medium items-center text-gray-900 mb-4 md:mb-0">
				<span class="ml-3 text-xl">Senasic</span>
			</a>
			<!-- top에 붙어있는 nav bar, 로그인 회원가입, 마이페이지, 로그아웃-->
			<nav
				class="z-50 md:ml-auto flex flex-wrap items-center text-base justify-center">
				<c:choose>
					<c:when test="${loginID != null}">
				${loginID}님 안녕하세요 <!-- 강사님께 질문 2-2 -->
						<a href="logout.mem" onclick="return confirm('정말 로그아웃 하시겠습니까?');">로그아웃</a>
						<!-- 강사님께 질문 3 -->
						<c:if test="${seqID < 0 }">
							<a href="dash.admin">관리자페이지</a>
						</c:if>
						<c:if test="${seqID > 0 }">
							<a href="mypage.mem?cpage=1">마이페이지</a>
						</c:if>
					</c:when>
					<c:otherwise>
						<a href="signin.mem" class="mr-5 hover:text-gray-900">로그인 </a>
						<a href="signup.mem">회원가입</a>
					</c:otherwise>
				</c:choose>
			</nav>
		</div>
	</header>
	<div id="logo">
		<img src="senasic_logo.png">
	</div>

	<!----------------- 게시판 네비게이션 --------------->
	<nav>
		<ul class="nav-container">
			<li class="nav-itme"><a href="/fboard.rest?cpage=1">맛집 리스트 </a></li>
			<li class="nav-itme"><a href="/magagineList.mag">맛집 매거진 </a></li>
			<li class="nav-itme"><a href="/list.pet?cpage=1&check_num=2">반려견
					게시판 </a></li>
		</ul>
	</nav>
<body>
	<div class="forSearch">
		<div class="container1">
			<form action="/fboard.rest">
				<input type="hidden" name="cpage" value="1"> <input
					type="hidden" name="category" value="all"> <input
					class="main" type="text" name="target" id="searching"> <a
					id="searchbytagName">
					<button
						class=" bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
						id="shbtn">검색</button>
				</a>
			</form>

			<div class="flex justify-center" id="hashtag">
				<span class="searchicon"></span> <select id="selectTab"
					class="select_tab" title="세부검색">
					<option value="x">-검색</option>
					<option value="0" id="tab1">지역</option>
					<option value="1">음식종류</option>
				</select> &nbsp;&nbsp;&nbsp;&nbsp;



				<div class="con_cmn con1">

					<span class=" mt-2" id="gangnam">
						<button>#강남구</button>
					</span>&nbsp;&nbsp; <span class=" mt-2" id="sungbuk">
						<button>#성북구</button>
					</span> &nbsp;&nbsp; <span class=" mt-2" id="jongro">
						<button>#종로구</button>
					</span> &nbsp;&nbsp; <span class=" mt-2" id="mapo">
						<button>#마포구</button>
					</span> &nbsp;&nbsp; <span class=" mt-2" id="gangdong">
						<button>#송파구</button>
					</span>

				</div>



				<div class="con_cmn con2">


					<span class=" mt-2" class="food" id="koreanfood">
						<button>#양식</button>
					</span>&nbsp;&nbsp; <span class=" mt-2" class="food" id="boonsik">
						<button>#이색</button>
					</span> &nbsp;&nbsp; <span class=" mt-2" class="food" id="japaneesefood">
						<button>#일식</button>
					</span> &nbsp;&nbsp; <span class=" mt-2" class="food" id="cafe">
						<button>#카페</button>
					</span> &nbsp;&nbsp; <span class=" mt-2" class="food" id="fastfood">
						<button>#술집</button>
					</span>

				</div>








			</div>

		</div>
	</div>
	<div class="md:container md:mx-auto">

		<div>
			<h1
				class="text-6xl font-normal leading-normal h-48 mt-0 mb-2 text-green-800 text-center">
				반려견 게시판</h1>
		</div>

		<!-- 카테고리 선택 -->


		<!-- 글쓰기 버튼 -->
		<div class="btn">
			<div style="text-align: right; width: 85%;">
				<button type="button" id="writeBtn"
					class="border border-green-500 text-green-500 hover:bg-green-400 hover:text-gray-100 rounded px-4 py-1.5"
					style="margin-right: 10px; margin-top: 10px;">글쓰기</button>

				<button
					class="
                  bg-green-500
                  text-white
                  active:bg-green-600
                  font-bold
                  uppercase
                  text-xs
                  px-4
                  py-2.5
                  rounded
                  shadow
                  hover:shadow-md 
                  outline-none
                  focus:outline-none
                  mr-1
                  mb-1
                  ease-linear
                  transition-all
                  duration-150
                "
					type="button" id="category"
					onclick="openDropdown(event,'dropdown-example-1')">
					카테고리<i class="fas fa-angle-down ml-2"></i>
				</button>
				<div
					class="
                  hidden
                  bg-white
                  text-base
                  z-50
                  float-left
                  py-2
                  list-none
                  text-left
                  rounded
                  shadow-lg
                  mt-1
                "
					style="min-width: 12rem" id="dropdown-example-1">
					<a href="/category.pet?cpage=1&category=병원&check_num=3"
						class="
                    text-sm
                    py-2
                    px-4
                    font-normal
                    block
                    w-full
                    whitespace-nowrap
                    bg-transparent
                    text-gray-700
                    hover:bg-gray-100
                  ">
						# 병원 </a> <a href="/category.pet?cpage=1&category=산책로&check_num=3"
						class="
                    text-sm
                    py-2
                    px-4
                    font-normal
                    block
                    w-full
                    whitespace-nowrap
                    bg-transparent
                    text-gray-700
                    hover:bg-gray-100
                  ">
						# 산책로 </a> <a href="/category.pet?cpage=1&category=음식&check_num=3"
						class="
                    text-sm
                    py-2
                    px-4
                    font-normal
                    block
                    w-full
                    whitespace-nowrap
                    bg-transparent
                    text-gray-700
                    hover:bg-gray-100
                  ">
						# 음식 </a> <a href="/category.pet?cpage=1&category=기타&check_num=3"
						class="
                    text-sm
                    py-2
                    px-4
                    font-normal
                    block
                    w-full
                    whitespace-nowrap
                    bg-transparent
                    text-gray-700
                    hover:bg-gray-100
                  ">
						# 기타 </a>
					<div
						class="
                    h-0
                    my-2
                    border border-solid border-t-0 border-blueGray-800
                    opacity-25
                  "></div>
					<a href="/list.pet?cpage=1&check_num=2"
						class="
                    text-sm
                    py-2
                    px-4
                    font-normal
                    block
                    w-full
                    whitespace-nowrap
                    bg-transparent
                    text-gray-700
                    hover:bg-gray-100
                  ">
						전체 보기 </a>
				</div>

			</div>
		</div>


		<!-- 게시판 작성 -->
		<div class="board" style="width: 70%; height: 100%; margin: auto;">

			<div class="bg-white rounded-lg shadow-lg py-6" style="height: 100%;">
				<!-- 게시판 큰 틀-->

				<div class="block overflow-x-auto mx-6">
					<!-- 게시판 메인 작업 -->
					<table class="w-full">
						<thead>
							<tr class="text-gray-800 border border-b-0 text-center">
								<th colspan="6" class="px-4 py-3" style="width: 100%;"># <c:choose>
										<c:when test="${check_category == 1 }">
									전체 게시판
								</c:when>
										<c:otherwise>
									${list[0].category }게시판
								</c:otherwise>
									</c:choose></th>
							</tr>




							<!-- 게시판 상단 목차 -->
							<tr class="text-gray-800 border border-b-0 text-center text-sm">
								<th class="px-4 py-3 w-1/12">#</th>
								<th class="px-4 py-3 w-7/12">제목</th>
								<th class="px-4 py-3 w-1/12">작성자</th>
								<th class="px-4 py-3 w-1/12">작성일</th>
								<th class="px-4 py-3 w-1/12">조회수</th>
								<th class="px-4 py-3 w-1/12">추천</th>
							</tr>
						</thead>

						<!------------------------------------- 게시판 작성 ------------------------------------->
						<tbody>


							<tr>
								<td align="center">
								<td><a id="seq" href=></a>
								<td align="center">
								<td align="center">
								<td align="center">
							</tr>


							<c:forEach var="dto" items="${list }">
								<tr
									class="w-full font-light text-gray-700 bg-gray-100 whitespace-no-wrap border border-b-0 text-sm">
									<td class="px-4 py-4 text-center">${dto.seq }</td>
									<%-- <td class="px-4 py-4"><a
										href="/detail.pet?seq=${dto.seq }&cpage=${cpage }&check_category=${check_category }&check_num=${check_num }">${dto.title }
											<c:if test="${dto.comment_count ne 0 }">
								&nbsp <i class="far fa-comment-dots"> </i>
												<span style="color: red;">[${dto.comment_count }]</span>
											</c:if>
									</a></td> --%>
									<!-- 검색창에 키워드랑 내용같이 전달 -->
									<c:choose>
										<c:when test="${check_num == 4 }">
											<td class="px-4 py-4"><a
												href="/detail.pet?seq=${dto.seq }&cpage=${cpage }&check_category=${check_category }&check_num=${check_num }&keyword=${keyword }&searchWord=${searchWord}">${dto.title }
													 <c:if test="${dto.comment_count ne 0 }">
							&nbsp <i class="far fa-comment-dots"> </i>
														<span style="color: red;">[${dto.comment_count }]</span>
													</c:if>
											</a></td>
										</c:when>
										<c:otherwise>
											<td class="px-4 py-4"><a
												href="/detail.pet?seq=${dto.seq }&cpage=${cpage }&check_category=${check_category }&check_num=${check_num }">${dto.title }
													<c:if test="${dto.comment_count ne 0 }">
							&nbsp <i class="far fa-comment-dots"> </i>
														<span style="color: red;">[${dto.comment_count }]</span>
													</c:if>
											</a></td>
										</c:otherwise>
									</c:choose>
									<td class="px-4 py-4 text-center">${dto.writer }</td>
									<td class="px-4 py-4 text-center">${dto.detailDate }</td>
									<td class="px-4 py-4 text-center">${dto.view_count }</td>
									<td class="px-4 py-4 text-center">${dto.good_count }</td>
								</tr>
							</c:forEach>



							<!-- <tr
								class="w-full font-light text-gray-700 whitespace-no-wrap border text-sm">
								<td class="px-4 py-4 text-center">2</td>
								<td class="px-4 py-4"><a href="">너어어어어어어ㅓㅓㅓㅓㅓㅓㅓㅓㅓ무어렵다</a></td>
								<td class="px-4 py-4 text-center">서호현</td>
								<td class="px-4 py-4 text-center">2021.12.08</td>
								<td class="px-4 py-4 text-center">45</td>
								<td class="px-4 py-4 text-center">2</td>
							</tr> -->


						</tbody>
						<!--------------------------------------- 게시판 작성 끝 --------------------------------------->
					</table>
				</div>
			</div>
		</div>

		<!-- 게시판 footer -->
		<div class="footer"
			style="width: 70%; background-color: rgba(224, 223, 223, 0.288); margin: auto;">

			<!-- 게시판 페이징 -->

			<%-- <c:forEach var="dto" items="${navi }" varStatus="status">
				<div class="text-center">
					<button style="text-align: center; margin-top: 10px;"
						class="
                    text-green-500
                    bg-transparent
                    border border-green-500
                    hover:bg-green-500 hover:text-white
                    active:bg-green-600
                    font-bold
                    uppercase
                    text-xs
                    px-4
                    py-2
                    rounded
                    outline-none
                    focus:outline-none
                    mb-1
                    ease-linear
                    transition-all
                    duration-150
                  "
						type="button">${navi.get(status.index) }</button>
				</div>
			</c:forEach> --%>


			<div class="text-center">
				<c:forTokens var="item" items="${navi }" delims=",">
					<button style="text-align: center; margin-top: 10px;"
						class="
                    text-green-500
                    bg-transparent
                    border border-green-500
                    hover:bg-green-500 hover:text-white
                    active:bg-green-600
                    font-bold
                    uppercase
                    text-xs
                    px-4
                    py-2
                    rounded
                    outline-none
                    focus:outline-none
                    mb-1
                    ease-linear
                    transition-all
                    duration-150
                  "
						type="button">${item }</button>
				</c:forTokens>
			</div>


			<!-- 검색 기능 -->
			<form method="post"
				action="/search.pet?cpage=${cpage }&check_num=${check_num }&check_category=${check_category }">
				<div>
					<div class=""
						style="text-align: center; height: 70px; margin-bottom: 100px;">

						<!-- 검색 조건 -->
						<select name="keyword"
							class="rounded border appearance-none border-gray-300 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-200 focus:border-indigo-500 text-base pl-3 pr-10 w-auto">
							<option>제목</option>
							<option>작성자</option>
						</select> <input type="hidden" name="cpage" value="${cpage }">

						<!-- 검색 하기 -->
						<input name="searchWord" type="text" placeholder="Search"
							class="
                    px-2
                    py-1
                    placeholder-gray-400
                    text-gray-600 
                    relative
                    bg-white bg-white
                    rounded
                    text-sm
                    border border-gray-400
                    outline-none
                    focus:outline-none focus:ring
                    w-5/12
                    h-10
                  " />

						<!-- 검색 버튼 -->
						<button id="search"
							class="border border-gray-500 text-black-500 bg-Gray-400 bg-gray-200 rounded px-4 py-1.5"
							style="margin-top: 15px;">검색</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<c:choose>
		<c:when test="${check_category == 1 }">
				카테고리
		</c:when>
		<c:otherwise>
			<script>
				$("#category").html("#" + "${list[0].category}");
			</script>
		</c:otherwise>
	</c:choose>


	<!-- Drop down -->
	<script
		src="https://unpkg.com/@popperjs/core@2.9.1/dist/umd/popper.min.js"
		charset="utf-8"></script>
	<script>
		function openDropdown(event, dropdownID) {
			let element = event.target;
			while (element.nodeName !== "BUTTON") {
				element = element.parentNode;
			}
			var popper = Popper.createPopper(element, document
					.getElementById(dropdownID), {
				placement : "bottom-start",
			});
			document.getElementById(dropdownID).classList.toggle("hidden");
			document.getElementById(dropdownID).classList.toggle("block");
		}
	</script>

	<script>
		$("#writeBtn").on("click", function() {
			location.href = "/write.pet?check_num=${check_num }";
		})
	</script>

</body>
</html>