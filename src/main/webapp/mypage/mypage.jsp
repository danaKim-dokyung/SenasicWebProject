<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/icon?family=Material+Icons|Roboto@100;300;500"
	rel="stylesheet">
<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"
	defer></script>
<link
	href="https://cdn.jsdelivr.net/npm/@tailwindcss/custom-forms@0.2.1/dist/custom-forms.css"
	rel="stylesheet" />
<style>
@media screen and (min-width:400px) {
	.image-menu {
		padding-left: .75rem;
		padding-right: .75rem;
	}
	.sidebar-mini .sidebar {
		width: 80px;
	}
	.sidebar-mini .main-content {
		width: calc(100% - 80px);
	}
	.sidebar-mini img.menu-icon {
		padding-left: 0;
		padding-right: 0;
	}
	.sidebar-mini .menu-text {
		transform: translate3d(-25px, 0, 0);
		opacity: 0;
		transition: all .3s linear;
	}
	.sidebar-mini .sidebar:hover {
		width: 20%;
	}
	.sidebar, .main-content {
		transition-property: top, bottom, width;
		transition-duration: .2s, .2s, .35s;
		transition-timing-function: linear, linear, ease;
	}
	.sidebar-mini .sidebar:hover .menu-text {
		transform: translateZ(0);
		opacity: 1;
	}
}

@media screen and (max-width: 400px) {
	.sidebar {
		width: 260px;
		position: fixed;
		top: 0;
		right: 0;
		transform: translate3d(260px, 0, 0);
		transition: all .33s cubic-bezier(.685, .0473, .346, 1);
	}
	.nav-open .sidebar {
		transform: translateZ(0);
	}
	.main-content {
		transition: all .33s cubic-bezier(.685, .0473, .346, 1);
	}
	.nav-open .main-content {
		left: 0;
		transform: translate3d(-260px, 0, 0);
	}
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}

/* index에서 가져온 style */
@font-face {
	font-family: 'Hahmlet-Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/Hahmlet-Bold.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'Hahmlet-Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/Hahmlet-Bold.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
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
	width: 200px;
	display: block;
	margin: auto;
}

.work-sans {
	font-family: "Work Sans", sans-serif;
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

.carousel-open:checked+.carousel-item {
	position: static;
	opacity: 100;
}

.carousel-item {
	-webkit-transition: opacity 0.6s ease-out;
	transition: opacity 0.6s ease-out;
}

#carousel-1:checked ~ .control-1, #carousel-2:checked ~ .control-2,
	#carousel-3:checked ~ .control-3 {
	display: block;
}

.carousel-indicators {
	list-style: none;
	margin: 0;
	padding: 0;
	position: absolute;
	bottom: 2%;
	left: 0;
	right: 0;
	text-align: center;
	z-index: 10;
}

#carousel-1:checked ~ .control-1 ~ .carousel-indicators li:nth-child(1) .carousel-bullet,
	#carousel-2:checked ~ .control-2 ~ .carousel-indicators li:nth-child(2) .carousel-bullet,
	#carousel-3:checked ~ .control-3 ~ .carousel-indicators li:nth-child(3) .carousel-bullet
	{
	color: #000;
	/*Set to match the Tailwind colour you want the active one to be */
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
	height: 50px;
	text-align: center;
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

.microphone {
	position: absolute;
	height: 24px;
	width: 24px;
	background: #FF5252;
	right: 12px;
	top: 6px;
	border-radius: 100%;
	box-shadow: 0px 1px 2px 0px #555;
}

.microphone:after {
	content: "";
	position: absolute;
	background: #c70000;
	height: 12px;
	width: 8px;
	border-radius: 10px;
	left: 8px;
	top: 3px;
}

.microphone:before {
	content: "";
	position: absolute;
	border-bottom: 2px solid #c70000;
	height: 10px;
	width: 10px;
	border-radius: 100%;
	top: 6px;
	left: 7px;
}

.mic-stand {
	position: absolute;
	height: 4px;
	width: 2px;
	background: #c70000;
	bottom: 3px;
	left: 11px;
}

.icon-holder {
	display: flex;
	justify-content: space-around;
	margin-top: 5px;
}

.icon {
	position: relative;
	height: 35px;
	width: 80px;
	background: #064e3b;
	border-radius: 100%;
	box-shadow: 0px 1px 2px 0px #555;
	cursor: pointer;
	opacity: 100;
	transition: 0.4s;
}

.icon:hover {
	background: #70c5ed;
	animation-play-state: paused;
}

#parking:after {
	content: "P";
	font-weight: bold;
	position: absolute;
	font-size: 13px;
	color: #43b3e7;
	background: white;
	padding: 1px 3px 1px 4px;
	border-radius: 100%;
	left: 10px;
	top: 9px;
}

#gas:after {
	content: "";
	position: absolute;
	height: 15px;
	width: 12px;
	background: white;
	border-top-right-radius: 4px;
	border-top-left-radius: 4px;
	top: 9px;
	left: 11px;
}

#gas:before {
	content: "";
	position: absolute;
	height: 6px;
	width: 8px;
	background: #43b3e7;
	left: 13px;
	top: 11px;
	z-index: 1;
}

.base {
	position: absolute;
	background: white;
	width: 16px;
	height: 4px;
	top: 23px;
	left: 9px;
	border-radius: 2px;
}

.base:after {
	content: "";
	position: absolute;
	height: 10px;
	width: 10px;
	border-radius: 100%;
	border-left: 2px solid white;
	bottom: 4px;
	left: -1px;
}

#eat:after {
	content: "";
	position: absolute;
	height: 13px;
	width: 4px;
	background: white;
	border-radius: 3px;
	top: 15px;
	left: 11px;
}

#eat:before {
	content: "";
	position: absolute;
	height: 5px;
	width: 8px;
	border-bottom-left-radius: 100%;
	border-bottom-right-radius: 100%;
	background: white;
	top: 12px;
	left: 9px;
}

.fork {
	position: absolute;
	height: 5px;
	width: 2px;
	background: white;
	top: 7px;
	left: 9px;
}

.fork:after {
	content: "";
	position: absolute;
	height: 5px;
	width: 2px;
	background: white;
	top: 0px;
	left: 3px;
}

.fork:before {
	content: "";
	position: absolute;
	height: 5px;
	width: 2px;
	background: white;
	top: 0px;
	left: 6px;
}

.knife {
	position: absolute;
	height: 9px;
	width: 4px;
	background: white;
	right: 11px;
	bottom: 7px;
	border-radius: 2px;
}

.knife:after {
	content: "";
	position: absolute;
	height: 13px;
	width: 6px;
	background: white;
	bottom: 8px;
	border-top-right-radius: 100%;
}

.cup {
	position: absolute;
	height: 14px;
	width: 17px;
	background: white;
	top: 15px;
	left: 8px;
	border-bottom-left-radius: 100%;
	border-bottom-right-radius: 100%;
}

.cup:after {
	content: "";
	position: absolute;
	height: 10px;
	width: 15px;
	border-radius: 100%;
	right: -4px;
	border-right: 2px solid white;
}

#coffee:after {
	content: "S";
	position: absolute;
	font-style: italic;
	font-size: 5px;
	transform: skewY(-40deg);
	color: white;
	top: 6px;
	left: 12px;
}

#coffee:before {
	content: "S";
	position: absolute;
	font-style: italic;
	font-size: 5px;
	transform: skewY(-40deg);
	color: white;
	top: 6px;
	left: 18px;
}

.dots {
	position: absolute;
	height: 5px;
	width: 5px;
	background: white;
	border-radius: 100%;
	left: 15px;
	top: 15px;
}

.dots:after {
	content: "";
	position: absolute;
	height: 5px;
	width: 5px;
	background: white;
	border-radius: 100%;
	left: 9px;
}

.dots:before {
	content: "";
	position: absolute;
	height: 5px;
	width: 5px;
	background: white;
	border-radius: 100%;
	left: -9px;
}

input:focus ~ .icon-holder>.icon {
	animation: ani 2.2s ease-out infinite;
}

@
keyframes ani { 0% {
	opacity: 1;
}

10


%
{
transform


:


scale


(


1
.2


)
;


opacity


:


1
;


}
20


%
{
transform


:


scale


(


1


)
;


opacity


:


1
;


}
100


%
{
transform


:


scale
(


1


)
;


opacity


:


1
;


}
}
#gas {
	animation-delay: 0.1s;
}

#eat {
	animation-delay: 0.2s;
}

#coffee {
	animation-delay: 0.3s;
}

#misc {
	animation-delay: 0.4s;
}

.tooltip {
	opacity: 0;
	position: absolute;
	font-size: 12px;
	color: white;
	background: #555;
	padding: 8px;
	top: 15px;
	border-radius: 15%;
	top: 45px;
}

.tooltip:after {
	content: "";
	position: absolute;
	background: #555;
	clip-path: polygon(50% 0%, 0% 100%, 100% 100%);
	height: 18px;
	width: 18px;
	top: -10px;
	left: 7px;
}

.icon:hover>.tooltip {
	animation: ani 0.4s ease-out forwards;
	animation-delay: 0.3s;
}

.con_cmn {
	
}

.con1 {
	
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

nav>ul {
	
}

nav>ul>li {
	
}

#carousel-font-1 {
	color: rgb(221, 221, 221);
	padding: 10px;
}

#carousel-font-2 {
	color: rgb(221, 221, 221);
}

#search_bar>span {
	background-color: rgba(5, 88, 5, 0.400);
	padding-top: 10px;
	border-radius: 30px;
	border: 8px solid rgba(5, 88, 5, 0.582);
	box-sizing: context-box;
}

#search_bar2>span {
	background-color: rgba(5, 88, 5, 0.582);
	padding-top: 10px;
	border-radius: 30px;
	border: 8px solid rgba(5, 88, 5, 0.582);
	box-sizing: context-box;
}

@font-face {
	font-family: "GmarketSansMedium";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff")
		format("woff");
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: GmarketSansMedium;
}

#github>a {
	padding: 10px;
}

#footer {
	font-size: 6px;
}

#header {
	padding: 0px;
	border-bottom-left-radius: 30px;
	border-bottom-right-radius: 30px;
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}

#shbtn:hover {
	background-color: #d7e9d433;
}

#list {
	margin-left: 200px;
	margin-right: 200px;
}

#hashtag {
	padding-top: 25px;
	font-size: 27px;
	color: white;
}

.con_cmn con2 {
	padding-top: 25px;
	font-size: 20px;
}

#selectTab {
	border-radius: 20px;
	background-color: rgba(236, 234, 234, 0.411);
	text-align: center;
	height: 65px;
	margin-top: 0px;
	color: white;
}

option {
	background-color: white;
	border-radius: 20px;
}

#search_bar {
	font-size: 27px;
}

#search_bar2 {
	font-size: 27px;
}

#search_bar>span {
	
}

#senasic {
	font-family: Hahmlet-Bold;
}


/* index 스타일 끝부분 */
</style>
</head>
<body>
	<!------ header : 상단 네브바, 세나식 로고, 게시판 링크 ------>
   <header
      class="text-gray-600 body-font sticky inset-x-0 top-0 left-0  py-5" id="header">
      <div
         class="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center justify-between">

               <!------ 왼쪽 상단 세나식 로고 ----->
         <a href="/index.jsp"
            class="flex title-font font-medium items-center text-gray-900 mb-4 md:mb-0">
            <span class="ml-3 text-xl">SENASIC
</span>
         </a>
 
         <!----------------- 게시판 네비게이션 --------------->
    <nav class=" justify-between">
        <ul class="nav-container justify-between">
            <li class="nav-itme "><a href="/fboard.rest?cpage=1">맛집 리스트 </a></li>
            <li class="nav-itme md:ml-36 md:mr-36"><a href="/magagineList.mag">맛집 매거진 </a></li>
            <li class="nav-itme "><a href="/list.pet?cpage=1&check_num=2">반려견
                    게시판 </a></li>
        </ul>
    </nav>





         <!-- top에 붙어있는 nav bar, 로그인 회원가입, 마이페이지, 로그아웃-->
         <nav
            class="z-50   flex flex-wrap items-right text-base text-right justify-right ">
 <c:choose>
               <c:when test="${loginID != null}">
            ${loginID} 님 안녕하세요&nbsp;&nbsp;| &nbsp;&nbsp;
                  <a href="/logout.mem" onclick="return confirm("정말 로그아웃 하시겠습니까?");">로그아웃&nbsp;&nbsp;|</a>&nbsp;&nbsp;
                  <!-- 강사님께 질문 3 -->
                  <c:if test="${seqID < 0 }">
                     <a href="/dash.admin">관리자페이지</a>
                  </c:if>
                  <c:if test="${seqID > 0 }">
                     <a href="/mypage.mem?cpage=1">마이페이지</a>
                  </c:if>
               </c:when>
               <c:otherwise>
                  <a href="/signin.mem" class="mr-5 hover:text-gray-900">로그인 </a>
                  <a href="/signup.mem">회원가입</a>
               </c:otherwise>
            </c:choose>
         </nav>
      </div>
   </header>
<body>
	<div class="forSearch">
		<div class="container1">
			<form action="/fboard.rest">
				<input type="hidden" name="cpage" value="1"> <input
					type="hidden" name="category" value="all"> <input
					class="main" type="text" name="target" id="searching"> <a
					id="searchbytagName">
					<button
						class=" bg-transparent  text-green-900 font-semibold hover:text-green-800 py-2 px-4 border border-gray-200 hover:border-transparent rounded"
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



	<!--  head 끝 -->
<body style="font-family: Roboto">
	<div id="app" class="relative h-screen">
		<div class="sidebar w-1/7 fixed h-screen bg-green-600 z-10 absolute">
			<div
				class="image-menu flex items-center mx-2 py-6 overflow-hidden z-10 border-b border-green-700">
				<img class="menu-icon border-2 w-10 h-10 rounded-full"
					src="${list.get(0).img }">
				<div class="menu-text text-gray-100 ml-4">${loginID }님페이지</div>
			</div>


			<div class="flex mx-4 mb-3">
				<!--  개인정보 관리 -->
				<a href="#" x-data="{show:false}" class="w-full flex flex-col"
					@click="show=!show">
					<div
						class="w-full flex justify-between px-3 hover:bg-green-700 rounded py-3"
						:class="{'bg-green-700':show}">
						<div class="flex">
							<i class="material-icons fill-current text-gray-100">perm_identity</i>
							<div class="relative menu-text text-gray-100 ml-4">개인 정보 관리</div>
						</div>
						<span
							class="transition ease-in duration-150 text-gray-100 material-icons transform"
							:class="{'rotate-180':show}"> arrow_drop_down </span>
					</div>
					<div x-show="show"
						class="transition ease-in duration-700 mt-3 bg-green-800">

						<div class="w-full flex px-3 hover:bg-green-700 rounded py-3 mb-3">
							<div
								class="relative text-xs font-light menu-text text-gray-100 ml-4">
								개인정보 변경</div>
						</div>

					</div>
				</a>
			</div>
			<!--  개인정보 관리 -->




			<div class="flex mx-4 mb-3">
				<!--  게시글 관리  -->
				<a href="#" x-data="{show:false}" class="w-full flex flex-col"
					@click="show=!show">
					<div
						class="w-full flex justify-between px-3 hover:bg-green-700 rounded py-3"
						:class="{'bg-green-700':show}">
						<div class="flex">
							<i class="material-icons fill-current text-gray-100">article</i>
							<div class="relative menu-text text-gray-100 ml-4">게시글 관리</div>
						</div>
						<span
							class="transition ease-in duration-150 text-gray-100 material-icons transform"
							:class="{'rotate-180':show}"> arrow_drop_down </span>
					</div>
					<div x-show="show"
						class="transition ease-in duration-700 mt-3 bg-green-800">



						<div class="w-full flex px-3 hover:bg-green-700 rounded py-3 mb-3">
							<div id="pet_board"
								class="relative text-xs font-light menu-text text-gray-100 ml-4">
								내가 올린 애견게시판 글</div>
						</div>
						<div class="w-full flex px-3 hover:bg-green-700 rounded py-3 mb-3">
							<div id="review"
								class="relative text-xs font-light menu-text text-gray-100 ml-4">
								리뷰 글 모아보기</div>
						</div>
					</div>
				</a>
			</div>
			<!--  게시글 관리  -->








		</div>
		<!-- 마무리 예상 div -->




		<div
			class="main-content w-full md:w-4/5 reltive float-right grid justify items-stretch">

			<div class="bg-white p-8 rounded-md w-full">



				<div class="input-form-backgroud row">
					<div class="input-form col-md-12 mx-auto">
						<form action="/modify.mem?seq=${list[0].seq }&cpage=${cpage }" method="post" enctype="multipart/form-data">
							<div class="mb-3 flex">
								<label for="image">프로필사진</label> <label
									class="flex flex-col w-1/4 ml-8 px-3 border-4 hover:bg-gray-100 hover:border-gray-300">
									<div class="flex flex-col items-center justify-center pt-7"
										id="ph">
										<img src="${list[0].img }" alt="">
									</div> <input accept="image/*" id="img" type="file" class="opacity-0"
									name="photo" />
								</label>
							</div>
							<!-- 아이디 입력 -->
							<div class="mb-3 mt-10 ">
								<label for="id">아이디</label> <input style="margin-left: 40px;" type="text"
									class="ml-10 form-control w-3/5 bg-gray-100 rounded-lg focus:outline-none border-2"
									id="id" name="id" pattern="^([a-z0-9]){6,20}$" required
									value="${list[0].id }" readonly>
								<div class="col text-right">
									<span id="checkResult"></span>
								</div>
							</div>

							<!-- 비밀번호 입력 -->
							<div class="mb-3 mt-10 ">
								<label for="password">비밀번호</label> <input style="margin-left: 38px;" type="password"
									class="ml-10 form-control w-3/5 bg-gray-100 rounded-lg focus:outline-none border-2"
									id="pw" name="pw"
									pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"
									placeholder="숫자포함 8자리 이상 입력" required>
								<div class="col text-right"></div>
							</div>

							<!-- 비밀번호 확인 입력 -->
							<div class="mb-3 mt-10 ">
								<label for="confirmpw">비밀번호 확인</label> <input style="margin-left: 0px;" type="password"
									class="ml-10 form-control w-3/5 bg-gray-100 rounded-lg focus:outline-none border-2"
									id="cpw" name="cpw" pattern="^([a-z0-9]){6,20}$" required><span
									id="checkpw"></span>
								<div class="col text-right"></div>
							</div>



							<!-- 닉네임 입력 -->
							<div class="mb-3 mt-10">
								<label for="nickname">닉네임</label> <input type="text"
									class="ml-10 form-control w-3/5 bg-gray-100 rounded-lg focus:outline-none border-2"
									id="nickname" name="nn" placeholder=""
									pattern="^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]{3,10}$" required
									value="${list[0].nn }">
								<div class="col text-right">
									<span id="checkResultN"></span>
								</div>
							</div>


							<!-- 이메일 입력 -->
							<div class="mb-3 mt-10">
								<label for="email">이메일</label> <input type="email"
									class="ml-10 form-control w-3/5 bg-gray-100 rounded-lg focus:outline-none border-2"
									id="email" name="m" placeholder="you@example.com" required
									value="${list[0].m }">

							</div>



							<!-- 전화번호 -->
							<div class="row flex mt-10">
								<div class="col-md-4 mb-2 ">
									<label for="phone">연락처</label> <input type="text"
										style="width: 100px"
										class="ml-10 form-control bg-gray-100 rounded-lg focus:outline-none border-2 text-center"
										id="phone1" value="010" name="phone1" required>

									<!-- 		 <select
										class="ml-10 form-control" name="phone1" id="phone1" required>
										<option>선택</option>
										<option value="010"
											<c:if test="${phoneFirst eq 010}"> selected</c:if>>010</option>
									</select>   -->
												
								</div>
								<div class="col-md-4 mb-2">
									<input type="text" style="width: 100px; padding-left: 10px;"
										class="ml-10 form-control bg-gray-100 rounded-lg focus:outline-none border-2 "
										id="num2"  value="${phone2 }"
										name="phone2" pattern="^\d{4}$" required>
								</div>
								<div class="col-md-4 mb-2">
									<input type="text" style="width: 100px; padding-left: 10px;"
										class="ml-10 form-control bg-gray-100 rounded-lg focus:outline-none border-2"
										id="num3"  value="${phone3 }"
										name="phone3" pattern="^\d{4}$" required>
								</div>
							</div>


							<hr class="mb-4 mt-20">
							<div class="mb-4"></div>
							<div class="col justify-between text-right">
								<button
									class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
									type="submit" id="editBtn">정보 수정</button>
								<button
									class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
									id="delBtn">탈퇴</button>
							</div>

						</form>
					</div>
				</div>
			</div>


		</div>




	</div>

	<c:if test="${delete_result eq '1' }">
		<script>
			alert("성공적으로 탈퇴되었습니다.");
			location.href = "/index.jsp";
		</script>
	</c:if>




	<c:if test="${result eq '1' }">
		<script>
			alert("정보 변경에 성공하였습니다");
			location.href = "/mypage.mem?cpage=${cpage }";
		</script>
	</c:if>



	<script>
	
	$("#img").on("change",function(){
		let file = this.files[0];
		if (file) {
		    $("#ph").html("<img class='w-28 h-28' viewBox='0 0 20 20' src = "+URL.createObjectURL(file)+">");
		  }
		})
	
	
	
		document.querySelector('body').classList.toggle('sidebar-mini');

		$("#btn").on("click", function() {
			location.href = "/magagine.my";
		})

		//비밀번호확인
		$("#cpw").on("keyup", function() {
			if ($("#pw").val() == $("#cpw").val()) {
				$("#checkpw").css("color", "green");
				$("#checkpw").text("비밀번호가 일치합니다");
			} else {
				$("#checkpw").css("color", "pink");
				$("#checkpw").text("비밀번호가 틀립니다.");
			}
		})

		$("#delBtn").on("click", function() {
			if (confirm("계정을 삭제하시겠습니까? 복구할 수 없습니다.")) {
				location.href = "/delete_member.my?seq=${list[0].seq }";
				return false;
			} else {
				return false;
			}
		})

		// 내가 올린 반려견 게시글

		$("#pet_board").on("click", function() {
			location.href = "/pet_board.my?cpage=${cpage }";
		})

		// 내가 쓴 리뷰 모아보기
		$("#review").on("click", function() {
			location.href = "/my_review.my?cpage=${cpage }";
		})

		//검색 태그 보이게 하기 
		$("#searching").on("click", function() {
			$("#hashtag").css("visibility", "visible");

		})
		// 클릭시 검색창에 #xx 보이게 하기
		$("#koreanfood")
				.on(
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
								document
										.getElementById("searchbytagName")
										.setAttribute("href",
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

								let korean = elem.substring(elem.length - 3,
										elem.length)

								if (korean == (newtext)) {

								} else if (korean == "#일식" || korean == "#카페"
										|| korean == "#이색" || korean == "#술집") {
									let first = elem.substring(elem.length - 8,
											elem.length - 4);
									let seconed = elem.substring(
											elem.length - 3, elem.length);
									let result = first + " " + newtext;
									$("#searching").val(result);

								} else {
									let result = elem + " " + newtext;
									$("#searching").val(result);
								}

							}

						})
		//일식
		$("#japaneesefood")
				.on(
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
								document
										.getElementById("searchbytagName")
										.setAttribute("href",
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
								let japan = elem.substring(elem.length - 3,
										elem.length)
								//일식			일식
								if (japan == (newtext)) {

								} //일식	양식
								else if (japan == "#양식" || japan == "#카페"
										|| japan == "#이색" || japan == "#술집") {
									let first = elem.substring(elem.length - 8,
											elem.length - 4);
									let seconed = elem.substring(
											elem.length - 3, elem.length);
									let result = first + " " + newtext;
									$("#searching").val(result);

								} else {
									let result = elem + " " + newtext;
									$("#searching").val(result);
								}

							}
						})
		//이색
		$("#boonsik")
				.on(
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
								document
										.getElementById("searchbytagName")
										.setAttribute("href",
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

								let boonsik = elem.substring(elem.length - 3,
										elem.length)

								if (boonsik == (newtext)) {

								} else if (boonsik == "#양식" || boonsik == "#카페"
										|| boonsik == "#일식" || boonsik == "#술집") {
									let first = elem.substring(elem.length - 8,
											elem.length - 4);
									let seconed = elem.substring(
											elem.length - 3, elem.length);
									let result = first + " " + newtext;
									$("#searching").val(result);

								} else {
									let result = elem + " " + newtext;
									$("#searching").val(result);
								}

							}
						})
		//카페
		$("#cafe")
				.on(
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
								document
										.getElementById("searchbytagName")
										.setAttribute("href",
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
								let cafe = elem.substring(elem.length - 3,
										elem.length);

								if (cafe == (newtext)) {

								} else if (cafe == "#양식" || cafe == "#일식"
										|| cafe == "#이색" || cafe == "#술집") {
									let first = elem.substring(elem.length - 8,
											elem.length - 4);
									let seconed = elem.substring(
											elem.length - 3, elem.length);
									let result = first + " " + newtext;
									$("#searching").val(result);

								} else {
									let result = elem + " " + newtext;
									$("#searching").val(result);
								}

							}
						})
		//술집
		$("#fastfood")
				.on(
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
								document
										.getElementById("searchbytagName")
										.setAttribute("href",
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
								let fastfood = elem.substring(elem.length - 3,
										elem.length)
								//일식			일식
								if (fastfood == (newtext)) {

								} //일식	양식
								else if (fastfood == "#양식" || fastfood == "#카페"
										|| fastfood == "#이색"
										|| fastfood == "#일식") {
									let first = elem.substring(elem.length - 8,
											elem.length - 4);
									let seconed = elem.substring(
											elem.length - 3, elem.length);
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
					document.getElementById("searchbytagName").setAttribute(
							"href",
							"/fboard.rest?cpage=1&category=all&target=강남구");

				})
		$("#sungbuk").on(
				"click",
				function() {

					$("#searching").val("#성북구");
					document.getElementById("searchbytagName").setAttribute(
							"href",
							"/fboard.rest?cpage=1&category=all&target=성북구");
				})
		$("#jongro").on(
				"click",
				function() {

					$("#searching").val("#종로구");
					document.getElementById("searchbytagName").setAttribute(
							"href",
							"/fboard.rest?cpage=1&category=all&target=종로구");
				})
		$("#mapo").on(
				"click",
				function() {

					$("#searching").val("#마포구");
					document.getElementById("searchbytagName").setAttribute(
							"href",
							"/fboard.rest?cpage=1&category=all&target=마포구");
				})
		$("#gangdong").on(
				"click",
				function() {

					$("#searching").val("#송파구");
					document.getElementById("searchbytagName").setAttribute(
							"href",
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
<!-- footer -->
<!-- footer -->
<footer class="text-center lg:text-left bg-gray-100 text-gray-600">
	<div
		class="flex justify-center items-center lg:justify-between p-6 border-b border-gray-300">
		<div class="mr-12 hidden lg:block">
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
	<div class="mx-6 py-10 text-center md:text-left" id="footer">
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
                  <svg aria-hidden="true"
               focusable="false" data-prefix="fab" data-icon="github"
               class="svg-inline--fa fa-github w-4" role="img"
               xmlns="http://www.w3.org/2000/svg" viewBox="0 0 496 512">
                <path fill="currentColor" d="M165.9 397.4c0 2-2.3 3.6-5.2 3.6-3.3.3-5.6-1.3-5.6-3.6 0-2 2.3-3.6 5.2-3.6 3-.3 5.6 1.3 5.6 3.6zm-31.1-4.5c-.7 2 1.3 4.3 4.3 4.9 2.6 1 5.6 0 6.2-2s-1.3-4.3-4.3-5.2c-2.6-.7-5.5.3-6.2 2.3zm44.2-1.7c-2.9.7-4.9 2.6-4.6 4.9.3 2 2.9 3.3 5.9 2.6 2.9-.7 4.9-2.6 4.6-4.6-.3-1.9-3-3.2-5.9-2.9zM244.8 8C106.1 8 0 113.3 0 252c0 110.9 69.8 205.8 169.5 239.2 12.8 2.3 17.3-5.6 17.3-12.1 0-6.2-.3-40.4-.3-61.4 0 0-70 15-84.7-29.8 0 0-11.4-29.1-27.8-36.6 0 0-22.9-15.7 1.6-15.4 0 0 24.9 2 38.6 25.8 21.9 38.6 58.6 27.5 72.9 20.9 2.3-16 8.8-27.1 16-33.7-55.9-6.2-112.3-14.3-112.3-110.5 0-27.5 7.6-41.3 23.6-58.9-2.6-6.5-11.1-33.3 2.6-67.9 20.9-6.5 69 27 69 27 20-5.6 41.5-8.5 62.8-8.5s42.8 2.9 62.8 8.5c0 0 48.1-33.6 69-27 13.7 34.7 5.2 61.4 2.6 67.9 16 17.7 25.8 31.5 25.8 58.9 0 96.5-58.9 104.2-114.8 110.5 9.2 7.9 17 22.9 17 46.4 0 33.7-.3 75.4-.3 83.6 0 6.5 4.6 14.4 17.3 12.1C428.2 457.8 496 362.9 496 252 496 113.3 383.5 8 244.8 8zM97.2 352.9c-1.3 1-1 3.3.7 5.2 1.6 1.6 3.9 2.3 5.2 1 1.3-1 1-3.3-.7-5.2-1.6-1.6-3.9-2.3-5.2-1zm-10.8-8.1c-.7 1.3.3 2.9 2.3 3.9 1.6 1 3.6.7 4.3-.7.7-1.3-.3-2.9-2.3-3.9-2-.6-3.6-.3-4.3.7zm32.4 35.6c-1.6 1.3-1 4.3 1.3 6.2 2.3 2.3 5.2 2.6 6.5 1 1.3-1.3.7-4.3-1.3-6.2-2.2-2.3-5.2-2.6-6.5-1zm-11.4-14.7c-1.6 1-1.6 3.6 0 5.9 1.6 2.3 4.3 3.3 5.6 2.3 1.6-1.3 1.6-3.9 0-6.2-1.4-2.3-4-3.3-5.6-2z">
                </path>
                 </svg>
               &nbsp;Hotsix's Github</h6>
            <p class="mb-4">
               <a href="#!" class="text-gray-600">임도혁"s Github</a>
            </p>
            <p class="mb-4">
               <a href="https://github.com/danaKim-dokyung" class="text-gray-600">김도경"s Github</a>
            </p>
            <p class="mb-4">
               <a href="https://github.com/KwakSeoHo" class="text-gray-600">곽서호"s Github</a>
            </p>
            <p class="mb-4">
               <a href="#!" class="text-gray-600">서호현"s Github</a>
            </p>
            <p>
               <a href="#!" class="text-gray-600">장건희"s Github</a>
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
                  href="/list.board" class="text-gray-600"> 반려견 게시판</a>
            </p>         

			</div>
		</div>
	</div>
</footer>
</html>

my