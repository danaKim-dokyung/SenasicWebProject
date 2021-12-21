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
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />


<style>
* {
	box-sizing: border-box;
}

.body {
	border: 1px solid rgb(202, 202, 202);
	width: 800px;
	margin: auto;
	padding: 30px;
	margin-bottom: 20px;
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

<body>



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
		<img src="/senasic_logo.png">
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

	<!-- 목록으로 돌아가기 -->
	<div
		style="height: 60px; margin: auto; width: 800px; margin-top: 100px;">
		<button type="button" id="back"
			class="border border-green-500 text-green-500 hover:bg-green-400 hover:text-gray-100 rounded px-4 py-2"
			style="float: right;">목록</button>
	</div>

	<form method="post"
		action="/comment.pet?check_category=${check_category }&check_num=${check_num }">
		<!-- 게시판 상세보기 header 부분 -->
		<div class="body rounded-md">
			<div class="title space-y-1">
				<div class="text-xs text-green-500">[반려견
					게시판_#${list[0].category }]</div>
				<div class="text-2xl font-medium">
					<span>${list[0].title }</span>
				</div>
				<div>
					<span class="writer">${list[0].writer }</span>
				</div>
				<div class="grid grid-cols-2 text-gray-400"
					style="padding-bottom: 10px; border-bottom: 1px solid rgb(202, 202, 202);">
					<div class="write_date text-sm">${list[0].detailDate }</div>
					<div class="text-right">
						<i class="far fa-eye"></i> ${list[0].view_count }
					</div>
				</div>
			</div>

			<!-- 게시글 본문내용 삽입 -->
			<div
				style="border-bottom: 1px solid rgb(202, 202, 202); padding-bottom: 15px;">

				<div style="margin-top: 10px;">${list[0].contents }</div>

				<!-- 오른쪽 하단에 추천과 댓글수 조회 -->
				<div class="content_b text-right text-base">
					<br>

					<!-- 추천시 하트 아이콘이 변하고 추천수가 올라가는 기능 -->
					<button type="button" class="nice" id="good">
						<span style="font-size: 17px;" id="heart"> <c:choose>
								<c:when test="${user == 0 }">
									<i class='fas fa-heart'></i>
								</c:when>
								<c:otherwise>
									<i class='far fa-heart'></i>
								</c:otherwise>
							</c:choose>
						</span> 추천 <span id="good_n">${list[0].good_count }</span>
					</button>

					<span style="margin-left: 10px;"><i
						class="far fa-comment-dots"></i> 댓글 <span id="comment_n">${CountComment }</span>
					</span>
				</div>
			</div>



			<!-- 댓글 삽입 기능 -->
			<c:forEach var="replyList" items="${replyList }">
				<div class="input_commend">
					<table
						style="border-bottom: 1px solid rgb(202, 202, 202); width: 100%; margin-top: 15px;">
						<tr>
							<td rowspan="3"
								style="width: 15px; height: 15px; padding-right: 10px;">image</td>
							<td style="padding-top: 10px; font-weight: 600;">${replyList.writer }</td>
						</tr>

						<tr>
							<td><div id="content"
									style="width: 100%; min-height: 30px; overflow-y: hidden; resize: none;"
									rows="1" onkeyup="resize(this)" onkeydown="resize(this)">${replyList.comments }</div></td>
						</tr>

						<tr>
							<td class="text-sm text-gray-400" style="padding-bottom: 10px;">${replyList.detailDate }</td>
							<c:if test="${replyList.writer eq loginID }">
								<td><button type="button" class="delComment"
										style="color: red; float: right; margin-right: 20px;">
										X<input class="replySeq" type="hidden"
											value="${replyList.seq }">
									</button></td>
							</c:if>
						</tr>
					</table>
				</div>
			</c:forEach>

			<!-- 댓글달기 기능 -->
			<div class="commend space-y-2 rounded-md"
				style="padding: 15px; border: 1px solid rgb(187, 186, 186); margin-top: 15px;">
				<div class="writer font-bold">${loginID }</div>

				<!-- 댓글 입력받기 -->
				<div>
					<input type="hidden" name="seq" value="${list[0].seq }"> <input
						type="hidden" name="cpage" value="${cpage }">
					<textarea name="comment" id="message" placeholder="댓글을 남겨주세요."
						style="width: 100%; min-height: 30px; overflow-y: hidden; resize: none;"
						rows="1" onkeyup="resize(this)" onkeydown="resize(this)"></textarea>
					<!-- textarea 자동 높이조절-->
				</div>

				<div>
					<!-- label 태그로 사진 img에 file 버튼 태그 적용시키기 -->
					<label style="font-size: 22px;"> <i class="far fa-image"></i>
						<input type="file" class="hidden">
					</label>
					<button id="commentBtn" class="summit float-right text-green-400"
						type="submit">등록</button>
				</div>
			</div>
		</div>
	</form>

	<!-- 수정하기 삭제하기 기능.  -->
	<div id="modi" style="margin: auto; width: 800px;">
		<c:if test="${list[0].id == loginID }">
			<button type="button" id="modify"
				class="border border-green-500 text-green-500 hover:bg-green-400 hover:text-gray-100 rounded px-4 py-2"
				style="float: right; margin-left: 20px;">수정하기</button>
			<button type="button" id="delete"
				class="border border-green-500 text-green-500 hover:bg-green-400 hover:text-gray-100 rounded px-4 py-2"
				style="float: right; margin-bottom: 70px;">삭제하기</button>
		</c:if>
	</div>


<!-- footer -->
<footer class="text-center lg:text-left bg-gray-100 text-gray-600 mt-40 ">
	<div
		class="flex justify-center items-center lg:justify-between p-6 border-b border-gray-300">
		<div class="mr-12 hidden lg:block">
			<span>Get connected with us on social networks:</span>
		</div>
		<div class="flex justify-center">
			<a href="#!" class="mr-6 text-gray-600"> <svg aria-hidden="true"
					focusable="false" data-prefix="fab" data-icon="facebook-f"
					class="svg-inline--fa fa-facebook-f w-2.5" role="img"
					xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512">
          <path fill="currentColor"
						d="M279.14 288l14.22-92.66h-88.91v-60.13c0-25.35 12.42-50.06 52.24-50.06h40.42V6.26S260.43 0 225.36 0c-73.22 0-121.08 44.38-121.08 124.72v70.62H22.89V288h81.39v224h100.17V288z">
          </path>
        </svg>
			</a> <a href="#!" class="mr-6 text-gray-600"> <svg aria-hidden="true"
					focusable="false" data-prefix="fab" data-icon="twitter"
					class="svg-inline--fa fa-twitter w-4" role="img"
					xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
          <path fill="currentColor"
						d="M459.37 151.716c.325 4.548.325 9.097.325 13.645 0 138.72-105.583 298.558-298.558 298.558-59.452 0-114.68-17.219-161.137-47.106 8.447.974 16.568 1.299 25.34 1.299 49.055 0 94.213-16.568 130.274-44.832-46.132-.975-84.792-31.188-98.112-72.772 6.498.974 12.995 1.624 19.818 1.624 9.421 0 18.843-1.3 27.614-3.573-48.081-9.747-84.143-51.98-84.143-102.985v-1.299c13.969 7.797 30.214 12.67 47.431 13.319-28.264-18.843-46.781-51.005-46.781-87.391 0-19.492 5.197-37.36 14.294-52.954 51.655 63.675 129.3 105.258 216.365 109.807-1.624-7.797-2.599-15.918-2.599-24.04 0-57.828 46.782-104.934 104.934-104.934 30.213 0 57.502 12.67 76.67 33.137 23.715-4.548 46.456-13.32 66.599-25.34-7.798 24.366-24.366 44.833-46.132 57.827 21.117-2.273 41.584-8.122 60.426-16.243-14.292 20.791-32.161 39.308-52.628 54.253z">
          </path>
        </svg>
			</a> <a href="#!" class="mr-6 text-gray-600"> <svg aria-hidden="true"
					focusable="false" data-prefix="fab" data-icon="google"
					class="svg-inline--fa fa-google w-3.5" role="img"
					xmlns="http://www.w3.org/2000/svg" viewBox="0 0 488 512">
          <path fill="currentColor"
						d="M488 261.8C488 403.3 391.1 504 248 504 110.8 504 0 393.2 0 256S110.8 8 248 8c66.8 0 123 24.5 166.3 64.9l-67.5 64.9C258.5 52.6 94.3 116.6 94.3 256c0 86.5 69.1 156.6 153.7 156.6 98.2 0 135-70.4 140.8-106.9H248v-85.3h236.1c2.3 12.7 3.9 24.9 3.9 41.4z">
          </path>
        </svg>
			</a> <a href="#!" class="mr-6 text-gray-600"> <svg aria-hidden="true"
					focusable="false" data-prefix="fab" data-icon="instagram"
					class="svg-inline--fa fa-instagram w-3.5" role="img"
					xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
          <path fill="currentColor"
						d="M224.1 141c-63.6 0-114.9 51.3-114.9 114.9s51.3 114.9 114.9 114.9S339 319.5 339 255.9 287.7 141 224.1 141zm0 189.6c-41.1 0-74.7-33.5-74.7-74.7s33.5-74.7 74.7-74.7 74.7 33.5 74.7 74.7-33.6 74.7-74.7 74.7zm146.4-194.3c0 14.9-12 26.8-26.8 26.8-14.9 0-26.8-12-26.8-26.8s12-26.8 26.8-26.8 26.8 12 26.8 26.8zm76.1 27.2c-1.7-35.9-9.9-67.7-36.2-93.9-26.2-26.2-58-34.4-93.9-36.2-37-2.1-147.9-2.1-184.9 0-35.8 1.7-67.6 9.9-93.9 36.1s-34.4 58-36.2 93.9c-2.1 37-2.1 147.9 0 184.9 1.7 35.9 9.9 67.7 36.2 93.9s58 34.4 93.9 36.2c37 2.1 147.9 2.1 184.9 0 35.9-1.7 67.7-9.9 93.9-36.2 26.2-26.2 34.4-58 36.2-93.9 2.1-37 2.1-147.8 0-184.8zM398.8 388c-7.8 19.6-22.9 34.7-42.6 42.6-29.5 11.7-99.5 9-132.1 9s-102.7 2.6-132.1-9c-19.6-7.8-34.7-22.9-42.6-42.6-11.7-29.5-9-99.5-9-132.1s-2.6-102.7 9-132.1c7.8-19.6 22.9-34.7 42.6-42.6 29.5-11.7 99.5-9 132.1-9s102.7-2.6 132.1 9c19.6 7.8 34.7 22.9 42.6 42.6 11.7 29.5 9 99.5 9 132.1s2.7 102.7-9 132.1z">
          </path>
        </svg>
			</a> <a href="#!" class="mr-6 text-gray-600"> <svg aria-hidden="true"
					focusable="false" data-prefix="fab" data-icon="linkedin-in"
					class="svg-inline--fa fa-linkedin-in w-3.5" role="img"
					xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
          <path fill="currentColor"
						d="M100.28 448H7.4V148.9h92.88zM53.79 108.1C24.09 108.1 0 83.5 0 53.8a53.79 53.79 0 0 1 107.58 0c0 29.7-24.1 54.3-53.79 54.3zM447.9 448h-92.68V302.4c0-34.7-.7-79.2-48.29-79.2-48.29 0-55.69 37.7-55.69 76.7V448h-92.78V148.9h89.08v40.8h1.3c12.4-23.5 42.69-48.3 87.88-48.3 94 0 111.28 61.9 111.28 142.3V448z">
          </path>
        </svg>
			</a> <a href="#!" class="text-gray-600"> <svg aria-hidden="true"
					focusable="false" data-prefix="fab" data-icon="github"
					class="svg-inline--fa fa-github w-4" role="img"
					xmlns="http://www.w3.org/2000/svg" viewBox="0 0 496 512">
          <path fill="currentColor"
						d="M165.9 397.4c0 2-2.3 3.6-5.2 3.6-3.3.3-5.6-1.3-5.6-3.6 0-2 2.3-3.6 5.2-3.6 3-.3 5.6 1.3 5.6 3.6zm-31.1-4.5c-.7 2 1.3 4.3 4.3 4.9 2.6 1 5.6 0 6.2-2s-1.3-4.3-4.3-5.2c-2.6-.7-5.5.3-6.2 2.3zm44.2-1.7c-2.9.7-4.9 2.6-4.6 4.9.3 2 2.9 3.3 5.9 2.6 2.9-.7 4.9-2.6 4.6-4.6-.3-1.9-3-3.2-5.9-2.9zM244.8 8C106.1 8 0 113.3 0 252c0 110.9 69.8 205.8 169.5 239.2 12.8 2.3 17.3-5.6 17.3-12.1 0-6.2-.3-40.4-.3-61.4 0 0-70 15-84.7-29.8 0 0-11.4-29.1-27.8-36.6 0 0-22.9-15.7 1.6-15.4 0 0 24.9 2 38.6 25.8 21.9 38.6 58.6 27.5 72.9 20.9 2.3-16 8.8-27.1 16-33.7-55.9-6.2-112.3-14.3-112.3-110.5 0-27.5 7.6-41.3 23.6-58.9-2.6-6.5-11.1-33.3 2.6-67.9 20.9-6.5 69 27 69 27 20-5.6 41.5-8.5 62.8-8.5s42.8 2.9 62.8 8.5c0 0 48.1-33.6 69-27 13.7 34.7 5.2 61.4 2.6 67.9 16 17.7 25.8 31.5 25.8 58.9 0 96.5-58.9 104.2-114.8 110.5 9.2 7.9 17 22.9 17 46.4 0 33.7-.3 75.4-.3 83.6 0 6.5 4.6 14.4 17.3 12.1C428.2 457.8 496 362.9 496 252 496 113.3 383.5 8 244.8 8zM97.2 352.9c-1.3 1-1 3.3.7 5.2 1.6 1.6 3.9 2.3 5.2 1 1.3-1 1-3.3-.7-5.2-1.6-1.6-3.9-2.3-5.2-1zm-10.8-8.1c-.7 1.3.3 2.9 2.3 3.9 1.6 1 3.6.7 4.3-.7.7-1.3-.3-2.9-2.3-3.9-2-.6-3.6-.3-4.3.7zm32.4 35.6c-1.6 1.3-1 4.3 1.3 6.2 2.3 2.3 5.2 2.6 6.5 1 1.3-1.3.7-4.3-1.3-6.2-2.2-2.3-5.2-2.6-6.5-1zm-11.4-14.7c-1.6 1-1.6 3.6 0 5.9 1.6 2.3 4.3 3.3 5.6 2.3 1.6-1.3 1.6-3.9 0-6.2-1.4-2.3-4-3.3-5.6-2z">
          </path>
        </svg>
			</a>
		</div>
	</div>
	<div class="mx-6 py-10 text-center md:text-left">
		<div class="grid grid-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
			<div class="">
				<h6
					class="
            uppercase
            font-semibold
            mb-4
            flex
            items-center
            justify-center
            md:justify-start
          ">
					<svg aria-hidden="true" focusable="false" data-prefix="fas"
						data-icon="cubes" class="svg-inline--fa fa-cubes w-4 mr-3"
						role="img" xmlns="http://www.w3.org/2000/svg"
						viewBox="0 0 512 512">
            <path fill="currentColor"
							d="M488.6 250.2L392 214V105.5c0-15-9.3-28.4-23.4-33.7l-100-37.5c-8.1-3.1-17.1-3.1-25.3 0l-100 37.5c-14.1 5.3-23.4 18.7-23.4 33.7V214l-96.6 36.2C9.3 255.5 0 268.9 0 283.9V394c0 13.6 7.7 26.1 19.9 32.2l100 50c10.1 5.1 22.1 5.1 32.2 0l103.9-52 103.9 52c10.1 5.1 22.1 5.1 32.2 0l100-50c12.2-6.1 19.9-18.6 19.9-32.2V283.9c0-15-9.3-28.4-23.4-33.7zM358 214.8l-85 31.9v-68.2l85-37v73.3zM154 104.1l102-38.2 102 38.2v.6l-102 41.4-102-41.4v-.6zm84 291.1l-85 42.5v-79.1l85-38.8v75.4zm0-112l-102 41.4-102-41.4v-.6l102-38.2 102 38.2v.6zm240 112l-85 42.5v-79.1l85-38.8v75.4zm0-112l-102 41.4-102-41.4v-.6l102-38.2 102 38.2v.6z">
            </path>
          </svg>
					Hoxsix Senasic6
				</h6>
				<p>

					회원가입 , 로그인 : 곽서호 , 김도경 <br> <br> 마이페이지 : 서호현 , 장건희 <br>
					<br> 맛집 리스트 : 서호현 , 김도경 <br> <br> 검색 : 곽서호 , 임도혁 <br>
					<br> 맛집 게시판 : 임도혁 , 곽서호 , 장건희 <br> <br> 반려견 게시판 :
					김도경 , 서호현 <br> <br> 관리 : 임도혁
				</p>
			</div>
			<div class="">
				<h6
					class="uppercase font-semibold mb-4 flex justify-center md:justify-start">
					조원</h6>
				<p class="mb-4">
					<a href="#!" class="text-gray-600">임도혁</a>
				</p>
				<p class="mb-4">
					<a href="#!" class="text-gray-600">김도경</a>
				</p>
				<p class="mb-4">
					<a href="#!" class="text-gray-600">곽서호</a>
				</p>
				<p class="mb-4">
					<a href="#!" class="text-gray-600">서호현</a>
				</p>
				<p>
					<a href="#!" class="text-gray-600">장건희</a>
				</p>
			</div>
			<div class="">
				<h6
					class="uppercase font-semibold mb-4 flex justify-center md:justify-start">
					구현 페이지</h6>
				<p class="mb-4">
					<a href="signin.mem" class="text-gray-600"> 로그인 </a>, <a
						href="signup.mem" class="text-gray-600">회원가입</a>
				</p>
				<p class="mb-4">
					<a href="#!" class="text-gray-600">메인 페이지</a>
				</p>
				<p class="mb-4">
					<a href="#!" class="text-gray-600">마이 페이지</a>
				</p>
				<p class="mb-4">
					<a href="/magagineList.mag" class="text-gray-600">맛집 매거진</a>
				</p>
				<p>
					<a href="/fboard.rest?cpage=1" class="text-gray-600">맛집 </a>, <a
						href="/list.board" class="text-gray-600"> 애견 게시판</a>
				</p>
			</div>
			<div class="">
				<h6
					class="uppercase font-semibold mb-4 flex justify-center md:justify-start">
					개발환경</h6>
				<p class="flex items-center justify-center md:justify-start mb-4">
					<svg aria-hidden="true" focusable="false" data-prefix="fas"
						data-icon="home" class="svg-inline--fa fa-home w-4 mr-4"
						role="img" xmlns="http://www.w3.org/2000/svg"
						viewBox="0 0 576 512">
            <path fill="currentColor"
							d="M280.37 148.26L96 300.11V464a16 16 0 0 0 16 16l112.06-.29a16 16 0 0 0 15.92-16V368a16 16 0 0 1 16-16h64a16 16 0 0 1 16 16v95.64a16 16 0 0 0 16 16.05L464 480a16 16 0 0 0 16-16V300L295.67 148.26a12.19 12.19 0 0 0-15.3 0zM571.6 251.47L488 182.56V44.05a12 12 0 0 0-12-12h-56a12 12 0 0 0-12 12v72.61L318.47 43a48 48 0 0 0-61 0L4.34 251.47a12 12 0 0 0-1.6 16.9l25.5 31A12 12 0 0 0 45.15 301l235.22-193.74a12.19 12.19 0 0 1 15.3 0L530.9 301a12 12 0 0 0 16.9-1.6l25.5-31a12 12 0 0 0-1.7-16.93z">
            </path>
          </svg>
					Java , Eclipse
				</p>
				<p class="flex items-center justify-center md:justify-start mb-4">
					<svg aria-hidden="true" focusable="false" data-prefix="fas"
						data-icon="envelope" class="svg-inline--fa fa-envelope w-4 mr-4"
						role="img" xmlns="http://www.w3.org/2000/svg"
						viewBox="0 0 512 512">
            <path fill="currentColor"
							d="M502.3 190.8c3.9-3.1 9.7-.2 9.7 4.7V400c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V195.6c0-5 5.7-7.8 9.7-4.7 22.4 17.4 52.1 39.5 154.1 113.6 21.1 15.4 56.7 47.8 92.2 47.6 35.7.3 72-32.8 92.3-47.6 102-74.1 131.6-96.3 154-113.7zM256 320c23.2.4 56.6-29.2 73.4-41.4 132.7-96.3 142.8-104.7 173.4-128.7 5.8-4.5 9.2-11.5 9.2-18.9v-19c0-26.5-21.5-48-48-48H48C21.5 64 0 85.5 0 112v19c0 7.4 3.4 14.3 9.2 18.9 30.6 23.9 40.7 32.4 173.4 128.7 16.8 12.2 50.2 41.8 73.4 41.4z">
            </path>
          </svg>
					JSP , ApacheTomcat
				</p>
				<p class="flex items-center justify-center md:justify-start mb-4">
					<svg aria-hidden="true" focusable="false" data-prefix="fas"
						data-icon="phone" class="svg-inline--fa fa-phone w-4 mr-4"
						role="img" xmlns="http://www.w3.org/2000/svg"
						viewBox="0 0 512 512">
            <path fill="currentColor"
							d="M493.4 24.6l-104-24c-11.3-2.6-22.9 3.3-27.5 13.9l-48 112c-4.2 9.8-1.4 21.3 6.9 28l60.6 49.6c-36 76.7-98.9 140.5-177.2 177.2l-49.6-60.6c-6.8-8.3-18.2-11.1-28-6.9l-112 48C3.9 366.5-2 378.1.6 389.4l24 104C27.1 504.2 36.7 512 48 512c256.1 0 464-207.5 464-464 0-11.2-7.7-20.9-18.6-23.4z">
            </path>
          </svg>
					GitHub , Tailwind
				</p>
				<p class="flex items-center justify-center md:justify-start">
					<svg aria-hidden="true" focusable="false" data-prefix="fas"
						data-icon="print" class="svg-inline--fa fa-print w-4 mr-4"
						role="img" xmlns="http://www.w3.org/2000/svg"
						viewBox="0 0 512 512">
            <path fill="currentColor"
							d="M448 192V77.25c0-8.49-3.37-16.62-9.37-22.63L393.37 9.37c-6-6-14.14-9.37-22.63-9.37H96C78.33 0 64 14.33 64 32v160c-35.35 0-64 28.65-64 64v112c0 8.84 7.16 16 16 16h48v96c0 17.67 14.33 32 32 32h320c17.67 0 32-14.33 32-32v-96h48c8.84 0 16-7.16 16-16V256c0-35.35-28.65-64-64-64zm-64 256H128v-96h256v96zm0-224H128V64h192v48c0 8.84 7.16 16 16 16h48v96zm48 72c-13.25 0-24-10.75-24-24 0-13.26 10.75-24 24-24s24 10.74 24 24c0 13.25-10.75 24-24 24z">
            </path>
          </svg>
					+ 01 234 567 89
				</p>
			</div>
		</div>
	</div>
	<div class="text-center p-6 bg-gray-200">
		<span>© 2021 Copyright:</span> <a class="text-gray-600 font-semibold"
			href="https://mdbootstrap.com/">Tailwind Elements</a>
	</div>
</footer>

	<script>
		// 댓글 textarea 자동 높이조절
		function resize(obj) {

			obj.style.height = "1px";
			obj.style.height = (12 + obj.scrollHeight) + "px";
		};
		
		// 비회원시 댓글 쓰기 막기
		$("#commentBtn").on("click",function() {
			if(${loginID == null}){
				alert("로그인 후 이용해주세요.");
			return false;
			}
		})
		
		
		
		
		// 댓글 삭제 기능
		$(".delComment").on("click", function() {
			let replySeq = $(this).find(".replySeq").val();
			 if (confirm("정말 삭제하시겠습니까?")) {
				location.href = "/deleteComment.pet?cpage=${cpage }&board_seq=${replyList[0].board_seq }&seq=" + replySeq + "&check_category=${check_category }&check_num=${check_num }" ;
			} 
		})

		
		// 목록으로 돌아가기
		$("#back")
				.on(
						"click",
						function() {
							if(${check_num} == 1){
							 location.href = "/pet_board.my?cpage=${cpage }";
							}else if(${check_num} == 2){
							 location.href = "/list.pet?cpage=${cpage }&check_num=${check_num }";
							}else if(${check_num} == 3){
							 location.href = "/category.pet?cpage=${cpage }&category=${list[0].category }&check_num=${check_num }";
							}else if(${check_num} == 4){
							 location.href = "/search.pet?cpage=${cpage }&check_num=${check_num }&check_category=1&keyword=${keyword }&searchWord=${searchWord}";
							}				  
							
							/* history.back(); */
						})

						
						
		// 추천 기능
		$("#good").on("click", function() {
			if(${loginID != null}){
				$.ajax({
					url : "/likes.pet?seq=${list[0].seq }",
					dataType: "json"
				}).done(function(resp){
					console.log(resp);
					$("#good_n").text(resp[0]);
					if(resp[1] == 1){
						$("#heart").html("<i class='fas fa-heart'></i>");
					}else if(resp[1] == 0){
						$("#heart").html("<i class='far fa-heart'></i>");
					}
				});
			}else{
				alert("로그인 후 이용가능합니다.")
			}
		})
		
		// 게시글 수정하기
		$("#modify").on("click", function() {
				location.href = "/modify.pet?seq=${list[0].seq }&cpage=${cpage }&check_category=${check_category }&check_num=${check_num }";
				
		}) 

		 // 게시글 삭제하기
		 $("#delete").on("click", function() {
			 if (confirm("정말 삭제하시겠습니까? 하시겠습니까??")) {
				location.href = "/delete.pet?seq=${list[0].seq }&cpage=${cpage }&category=${list[0].category }&check_num=${check_num }";
				 /* history.back(); */
			}
		}) 
		
		//검색 태그 보이게 하기 
	$("#searching").on("click", function() {
		$("#hashtag").css("visibility", "visible");

	})
	// 클릭시 검색창에 #xx 보이게 하기
	$("#koreanfood").on(
			"click",
			function() {
				//같은 종류의 카테고리안에서는 새로 갱신
				if ($("#searching").val() == ""
						|| $("#searching").val() == "#양식"
						|| $("#searching").val() == "#일식"
						|| $("#searching").val() == "#이색"
						|| $("#searching").val() == "#카페"
						|| $("#searching").val() == "#술집") {

					$("#searching").val("#양식");
					document.getElementById("searchbytagName").setAttribute(
							"href",
							"/fboard.rest?cpage=1&category=all&target=양식");
					//다른 카테고리가 이미 있으면 그 뒤에 값을 + 해준다
				} else if ($("#searching").val() != ""
						|| $("#searching").val() != "#양식"
						|| $("#searching").val() != "#일식"
						|| $("#searching").val() != "#이색"
						|| $("#searching").val() != "#카페"
						|| $("#searching").val() != "#술집") {
					let elem = $("#searching").val();
					let newtext = "#양식";

					let korean = elem.substring(elem.length - 3, elem.length)

					if (korean == (newtext)) {

					} else if (korean == "#일식" || korean == "#카페"
							|| korean == "#이색" || korean == "#술집") {
						let first = elem.substring(elem.length - 8,
								elem.length - 4);
						let seconed = elem.substring(elem.length - 3,
								elem.length);
						let result = first + " " + newtext;
						$("#searching").val(result);

					} else {
						let result = elem + " " + newtext;
						$("#searching").val(result);
					}

				}

			})
	//일식
	$("#japaneesefood").on(
			"click",
			function() {

				//같은 종류의 카테고리안에서는 새로 갱신
				if ($("#searching").val() == ""
						|| $("#searching").val() == "#양식"
						|| $("#searching").val() == "#일식"
						|| $("#searching").val() == "#이색"
						|| $("#searching").val() == "#카페"
						|| $("#searching").val() == "#술집") {

					$("#searching").val("#일식");
					document.getElementById("searchbytagName").setAttribute(
							"href",
							"/fboard.rest?cpage=1&category=all&target=일식");
					//다른 카테고리가 이미 있으면 그 뒤에 값을 + 해준다
				} else if ($("#searching").val() != ""
						|| $("#searching").val() != "#양식"
						|| $("#searching").val() != "#일식"
						|| $("#searching").val() != "#이색"
						|| $("#searching").val() != "#카페"
						|| $("#searching").val() != "#술집") {
					let elem = $("#searching").val();
					let newtext = "#일식";

					//#강남구#일식			3			6
					let japan = elem.substring(elem.length - 3, elem.length)
					//일식			일식
					if (japan == (newtext)) {

					} //일식	양식
					else if (japan == "#양식" || japan == "#카페" || japan == "#이색"
							|| japan == "#술집") {
						let first = elem.substring(elem.length - 8,
								elem.length - 4);
						let seconed = elem.substring(elem.length - 3,
								elem.length);
						let result = first + " " + newtext;
						$("#searching").val(result);

					} else {
						let result = elem + " " + newtext;
						$("#searching").val(result);
					}

				}
			})
	//이색
	$("#boonsik").on(
			"click",
			function() {
				//같은 종류의 카테고리안에서는 새로 갱신
				if ($("#searching").val() == ""
						|| $("#searching").val() == "#양식"
						|| $("#searching").val() == "#일식"
						|| $("#searching").val() == "#이색"
						|| $("#searching").val() == "#카페"
						|| $("#searching").val() == "#술집") {

					$("#searching").val("#이색");
					document.getElementById("searchbytagName").setAttribute(
							"href",
							"/fboard.rest?cpage=1&category=all&target=이색");
					//다른 카테고리가 이미 있으면 그 뒤에 값을 + 해준다
				} else if ($("#searching").val() != ""
						|| $("#searching").val() != "#양식"
						|| $("#searching").val() != "#일식"
						|| $("#searching").val() != "#이색"
						|| $("#searching").val() != "#카페"
						|| $("#searching").val() != "#술집") {
					let elem = $("#searching").val();
					let newtext = "#이색";

					let boonsik = elem.substring(elem.length - 3, elem.length)

					if (boonsik == (newtext)) {

					} else if (boonsik == "#양식" || boonsik == "#카페"
							|| boonsik == "#일식" || boonsik == "#술집") {
						let first = elem.substring(elem.length - 8,
								elem.length - 4);
						let seconed = elem.substring(elem.length - 3,
								elem.length);
						let result = first + " " + newtext;
						$("#searching").val(result);

					} else {
						let result = elem + " " + newtext;
						$("#searching").val(result);
					}

				}
			})
	//카페
	$("#cafe").on(
			"click",
			function() {

				//같은 종류의 카테고리안에서는 새로 갱신
				if ($("#searching").val() == ""
						|| $("#searching").val() == "#양식"
						|| $("#searching").val() == "#일식"
						|| $("#searching").val() == "#이색"
						|| $("#searching").val() == "#카페"
						|| $("#searching").val() == "#술집") {

					$("#searching").val("#카페");
					document.getElementById("searchbytagName").setAttribute(
							"href",
							"/fboard.rest?cpage=1&category=all&target=카페");
					//다른 카테고리가 이미 있으면 그 뒤에 값을 + 해준다
				} else if ($("#searching").val() != ""
						|| $("#searching").val() != "#양식"
						|| $("#searching").val() != "#일식"
						|| $("#searching").val() != "#이색"
						|| $("#searching").val() != "#카페"
						|| $("#searching").val() != "#술집") {
					let elem = $("#searching").val();
					let newtext = "#카페";

					//#강남구 #카페
					let cafe = elem.substring(elem.length - 3, elem.length);

					if (cafe == (newtext)) {

					} else if (cafe == "#양식" || cafe == "#일식" || cafe == "#이색"
							|| cafe == "#술집") {
						let first = elem.substring(elem.length - 8,
								elem.length - 4);
						let seconed = elem.substring(elem.length - 3,
								elem.length);
						let result = first + " " + newtext;
						$("#searching").val(result);

					} else {
						let result = elem + " " + newtext;
						$("#searching").val(result);
					}

				}
			})
	//술집
	$("#fastfood").on(
			"click",
			function() {

				//같은 종류의 카테고리안에서는 새로 갱신
				if ($("#searching").val() == ""
						|| $("#searching").val() == "#양식"
						|| $("#searching").val() == "#일식"
						|| $("#searching").val() == "#이색"
						|| $("#searching").val() == "#카페"
						|| $("#searching").val() == "#술집") {

					$("#searching").val("#술집");
					document.getElementById("searchbytagName").setAttribute(
							"href",
							"/fboard.rest?cpage=1&category=all&target=술집");
					//다른 카테고리가 이미 있으면 그 뒤에 값을 + 해준다
				} else if ($("#searching").val() != ""
						|| $("#searching").val() != "#양식"
						|| $("#searching").val() != "#일식"
						|| $("#searching").val() != "#이색"
						|| $("#searching").val() != "#카페"
						|| $("#searching").val() != "#술집") {
					let elem = $("#searching").val();
					let newtext = "#술집";

					//#강남구#일식			3			6
					let fastfood = elem.substring(elem.length - 3, elem.length)
					//일식			일식
					if (fastfood == (newtext)) {

					} //일식	양식
					else if (fastfood == "#양식" || fastfood == "#카페"
							|| fastfood == "#이색" || fastfood == "#일식") {
						let first = elem.substring(elem.length - 8,
								elem.length - 4);
						let seconed = elem.substring(elem.length - 3,
								elem.length);
						let result = first + " " + newtext;
						$("#searching").val(result);

					} else {
						let result = elem + " " + newtext;
						$("#searching").val(result);
					}

				}
			})

	$("#gangnam").on(
			"click",
			function() {

				$("#searching").val("#강남구");
				document.getElementById("searchbytagName").setAttribute("href",
						"/fboard.rest?cpage=1&category=all&target=강남구");

			})
	$("#sungbuk").on(
			"click",
			function() {

				$("#searching").val("#성북구");
				document.getElementById("searchbytagName").setAttribute("href",
						"/fboard.rest?cpage=1&category=all&target=성북구");
			})
	$("#jongro").on(
			"click",
			function() {

				$("#searching").val("#종로구");
				document.getElementById("searchbytagName").setAttribute("href",
						"/fboard.rest?cpage=1&category=all&target=종로구");
			})
	$("#mapo").on(
			"click",
			function() {

				$("#searching").val("#마포구");
				document.getElementById("searchbytagName").setAttribute("href",
						"/fboard.rest?cpage=1&category=all&target=마포구");
			})
	$("#gangdong").on(
			"click",
			function() {

				$("#searching").val("#송파구");
				document.getElementById("searchbytagName").setAttribute("href",
						"/fboard.rest?cpage=1&category=all&target=송파구");
			})

	let selectTab = document.getElementById("selectTab"); // select 저장

	let con = document.getElementsByClassName("con_cmn"); // select 에 대응하는 콘텐츠 요소들 저장

	selectTab.addEventListener("change", function() { // select가 변화할 때 

		let val = selectTab.options[selectTab.selectedIndex].value; // option value값

		for (var i = 0; i < selectTab.length - 1; i++) { // select가 4개, 콘텐츠가 3개이기때문에 length-1 

			con[i].style.display = "none"; // 콘텐츠 모두 숨김

			if (val == i) { // select에 해당하는 콘텐츠가 보여짐

				con[i].style.display = "block";

			} else if (val == "x") { // value값이 x인 첫번째 option을 선택 했을 때

				con[0].style.display = "block"; // 1번째 콘텐츠 보여주고

				document.getElementById("tab1").selected = true; // select는 첫번째를 선택

			}
		}
	});

	</script>

</body>

</html>