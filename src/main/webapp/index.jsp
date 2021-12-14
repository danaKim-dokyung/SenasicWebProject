<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>


<link href="https://unpkg.com/tailwindcss/dist/tailwind.min.css"
	rel="stylesheet">
<!--Replace with your tailwind.css once created-->
<link
	href="https://fonts.googleapis.com/css?family=Work+Sans:200,400&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css" />


<!-- 보류 스타일 태그 -->
<!-- <style>
header { /*navbar를 상단에 고정*/
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
}

#logo {
	text-align: center;
}

.nav-container {
	display: flex;
	text-align: center;
}

.nav-item {
	text-align: center;
}
</style>  -->
<!-- 스타일 태그 -->
<style>
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

img {
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
}

.main {
  position: relative;
  border: 5px solid #064e3b;
  height: 50px;
  width: 800px;
  border-radius: 50px;
  padding-left: 31px;
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
  width: 35px;
  background: #064e3b;
  border-radius: 100%;
  box-shadow: 0px 1px 2px 0px #555;
  cursor: pointer;
  opacity: 0;
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

input:focus ~ .icon-holder > .icon {
  animation: ani 2.2s ease-out infinite;
}
@keyframes ani {
  0% {
    opacity: 1;
  }
  10% {
    transform: scale(1.2);
    opacity: 1;
  }
  20% {
    transform: scale(1);
    opacity: 1;
  }
  100% {
    transform: scale(1);
    opacity: 1;
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

.icon:hover > .tooltip {
  animation: ani 0.4s ease-out forwards;
  animation-delay: 0.3s;
}
</style>

</head>
<body>
	<!------ header : 상단 네브바, 세나식 로고, 게시판 링크 ------>
	<header
		class="text-gray-600 body-font sticky inset-x-0 top-0 left-0  py-5">
		<div
			class="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">

			<!------ 왼쪽 상단 세나식 로고 ----->
			<a
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
						<a href="#.mem">마이페이지</a>
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
			<li class="nav-itme"><a href="/list.mag">맛집 매거진 </a></li>
			<li class="nav-itme"><a href="/list.board">반려견 게시판 </a></li>
		</ul>
	</nav>
<body>
<div class="forSearch">
<div class="container1">
  <input class="main"  type="text"/><span class="searchicon"></span>

  <div class="icon-holder">
    <div class="icon" id="parking">
      <div class="tooltip">Parking</div>
      서울
    </div>    
    <div class="icon" id="gas">
      <div class="base"></div>
      <div class="tooltip">Gas</div>
    </div>
    <div class="icon" id="eat">
      <div class="fork"></div>
      <div class="knife"></div>
      <div class="tooltip">Food</div>
    </div>
    <div class="icon" id="coffee">
      <div class="cup"></div>
      <div class="tooltip">Coffee</div>
    </div>
    <div class="icon" id="misc">
      <div class="dots"></div>
      <div class="tooltip">Misc</div>
    </div>
  </div>
</div>
</div>
	<!------------- 캐러셀 시작 ---------------->
	<div class="carousel relative container mx-auto"
		style="max-width: 1600px;">
		<div class="carousel-inner relative overflow-hidden w-full">
			<!--Slide 1-->
			<input class="carousel-open" type="radio" id="carousel-1"
				name="carousel" aria-hidden="true" hidden="" checked="checked">
			<div class="carousel-item absolute opacity-0" style="height: 50vh;">
				<div
					class="block h-full w-full mx-auto flex pt-6 md:pt-0 md:items-center bg-cover bg-right"
					style="background-image: url('https://images.unsplash.com/photo-1422190441165-ec2956dc9ecc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1600&q=80');">

					<div class="container mx-auto">
						<div
							class="flex flex-col w-full lg:w-1/2 md:ml-16 items-center md:items-start px-6 tracking-wide">
							<p class="text-black text-2xl my-4">
								<!-- 검색 시작부분 -->
							<div class="relative flex w-full flex-wrap items-stretch ">
								<span
									class="
									z-10
									h-full
									leading-normal
									font-normal
									absolute
									text-center text-gray-400
									absolute
									bg-transparent
									rounded
									text-lg
									items-center
									justify-center
									w-8
									pl-3
									py-4
									">
									<!-- 검색 바 --> <!-- 돋보기 아이콘 --> <svg
										xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none"
										viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round"
											stroke-width="2"
											d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
        </svg>
								</span> <input type="text" placeholder="Search"
									class="
									px-3
									py-4
									placeholder-gray-400
									text-gray-600
									relative
									bg-white bg-white
									rounded
									text-base
									border border-gray-400
									outline-none
									focus:outline-none focus:ring
									w-full
									pl-10
									" id="searchBar"/>
							</div>
							</p>
							<a
								class="text-xl inline-block no-underline border-b border-gray-600 leading-relaxed hover:text-black hover:border-black"
								href="#">view product</a>
						</div>
					</div>

				</div>
			</div>
			<label for="carousel-3"
				class="prev control-1 w-10 h-10 ml-2 md:ml-10 absolute cursor-pointer hidden text-3xl font-bold text-black hover:text-white rounded-full bg-white hover:bg-gray-900 leading-tight text-center z-10 inset-y-0 left-0 my-auto">‹</label>
			<label for="carousel-2"
				class="next control-1 w-10 h-10 mr-2 md:mr-10 absolute cursor-pointer hidden text-3xl font-bold text-black hover:text-white rounded-full bg-white hover:bg-gray-900 leading-tight text-center z-10 inset-y-0 right-0 my-auto">›</label>
			<!--Slide 2-->
			<input class="carousel-open" type="radio" id="carousel-2"
				name="carousel" aria-hidden="true" hidden="">
			<div class="carousel-item absolute opacity-0 bg-cover bg-right"
				style="height: 50vh;">
				<div
					class="block h-full w-full mx-auto flex pt-6 md:pt-0 md:items-center bg-cover bg-right"
					style="background-image: url('https://images.unsplash.com/photo-1533090161767-e6ffed986c88?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjM0MTM2fQ&auto=format&fit=crop&w=1600&q=80');">

					<div class="container mx-auto">
						<div
							class="flex flex-col w-full lg:w-1/2 md:ml-16 items-center md:items-start px-6 tracking-wide">
							<p class="text-black text-2xl my-4">
								<!-- 검색 시작부분 -->
							<div class="relative flex w-full flex-wrap items-stretch ">
								<span
									class="
									z-10
									h-full
									leading-normal
									font-normal
									absolute
									text-center text-gray-400
									absolute
									bg-transparent
									rounded
									text-lg
									items-center
									justify-center
									w-8
									pl-3
									py-4
									">
									<!-- 검색 바 --> <!-- 돋보기 아이콘 --> <svg
										xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none"
										viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round"
											stroke-width="2"
											d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
        </svg>
								</span> <input type="text" placeholder="Search"
									class="
									px-3
									py-4
									placeholder-gray-400
									text-gray-600
									relative
									bg-white bg-white
									rounded
									text-base
									border border-gray-400
									outline-none
									focus:outline-none focus:ring
									w-full
									pl-10
									" />
							</div>


							</p>
							<a
								class="text-xl inline-block no-underline border-b border-gray-600 leading-relaxed hover:text-black hover:border-black"
								href="#">view product</a>
						</div>
					</div>

				</div>
			</div>
			<label for="carousel-1"
				class="prev control-2 w-10 h-10 ml-2 md:ml-10 absolute cursor-pointer hidden text-3xl font-bold text-black hover:text-white rounded-full bg-white hover:bg-gray-900  leading-tight text-center z-10 inset-y-0 left-0 my-auto">‹</label>
			<label for="carousel-3"
				class="next control-2 w-10 h-10 mr-2 md:mr-10 absolute cursor-pointer hidden text-3xl font-bold text-black hover:text-white rounded-full bg-white hover:bg-gray-900  leading-tight text-center z-10 inset-y-0 right-0 my-auto">›</label>

			<!--Slide 3-->
			<input class="carousel-open" type="radio" id="carousel-3"
				name="carousel" aria-hidden="true" hidden="">
			<div class="carousel-item absolute opacity-0" style="height: 50vh;">
				<div
					class="block h-full w-full mx-auto flex pt-6 md:pt-0 md:items-center bg-cover bg-bottom"
					style="background-image: url('https://images.unsplash.com/photo-1519327232521-1ea2c736d34d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1600&q=80');">

					<div class="container mx-auto">
						<div
							class="flex flex-col w-full lg:w-1/2 md:ml-16 items-center md:items-start px-6 tracking-wide">
							<p class="text-black text-2xl my-4">
								<!-- 검색 시작부분 -->
							<div class="relative flex w-full flex-wrap items-stretch ">
								<span
									class="
									z-10
									h-full
									leading-normal
									font-normal
									absolute
									text-center text-gray-400
									absolute
									bg-transparent
									rounded
									text-lg
									items-center
									justify-center
									w-8
									pl-3
									py-4
									">
									<!-- 검색 바 --> <!-- 돋보기 아이콘 --> <svg
										xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none"
										viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round"
											stroke-width="2"
											d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
        </svg>
								</span> <input type="text" placeholder="Search"
									class="
										px-3
										py-4
										placeholder-gray-400
										text-gray-600
										relative
										bg-white bg-white
										rounded
										text-base
										border border-gray-400
										outline-none
										focus:outline-none focus:ring
										w-full
										pl-10
										" />
							</div>
							</p>
							<a
								class="text-xl inline-block no-underline border-b border-gray-600 leading-relaxed hover:text-black hover:border-black"
								href="#">view product</a>
						</div>
					</div>

				</div>
			</div>
			<label for="carousel-2"
				class="prev control-3 w-10 h-10 ml-2 md:ml-10 absolute cursor-pointer hidden text-3xl font-bold text-black hover:text-white rounded-full bg-white hover:bg-gray-900  leading-tight text-center z-10 inset-y-0 left-0 my-auto">‹</label>
			<label for="carousel-1"
				class="next control-3 w-10 h-10 mr-2 md:mr-10 absolute cursor-pointer hidden text-3xl font-bold text-black hover:text-white rounded-full bg-white hover:bg-gray-900  leading-tight text-center z-10 inset-y-0 right-0 my-auto">›</label>

			<!-- Add additional indicators for each slide-->
			<ol class="carousel-indicators">
				<li class="inline-block mr-3"><label for="carousel-1"
					class="carousel-bullet cursor-pointer block text-4xl text-gray-400 hover:text-gray-900">•</label>
				</li>
				<li class="inline-block mr-3"><label for="carousel-2"
					class="carousel-bullet cursor-pointer block text-4xl text-gray-400 hover:text-gray-900">•</label>
				</li>
				<li class="inline-block mr-3"><label for="carousel-3"
					class="carousel-bullet cursor-pointer block text-4xl text-gray-400 hover:text-gray-900">•</label>
				</li>
			</ol>

		</div>
	</div>


	<!--------------맛집 매거진 목록 시작------------>
	<section class="bg-white py-8">

		<div class="container mx-auto flex items-center flex-wrap pt-4 pb-12">

			<nav id="store" class="w-full z-30 top-0 px-6 py-1">
				<div
					class="w-full container mx-auto flex flex-wrap items-center justify-between mt-0 px-2 py-3">

					<a
						class="uppercase tracking-wide no-underline hover:no-underline font-bold text-gray-800 text-xl "
						href="#"> 맛집 매거진 모아보기 </a>

					<div class="flex items-center" id="store-nav-content">

						<a class="pl-3 inline-block no-underline hover:text-black"
							href="#"> <svg class="fill-current hover:text-black"
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24">
                                <path
									d="M7 11H17V13H7zM4 7H20V9H4zM10 15H14V17H10z" />
                            </svg>
						</a> <a class="pl-3 inline-block no-underline hover:text-black"
							href="#"> <svg class="fill-current hover:text-black"
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24">
                                <path
									d="M10,18c1.846,0,3.543-0.635,4.897-1.688l4.396,4.396l1.414-1.414l-4.396-4.396C17.365,13.543,18,11.846,18,10 c0-4.411-3.589-8-8-8s-8,3.589-8,8S5.589,18,10,18z M10,4c3.309,0,6,2.691,6,6s-2.691,6-6,6s-6-2.691-6-6S6.691,4,10,4z" />
                            </svg>
						</a>

					</div>
				</div>
			</nav>

			<div class="w-full md:w-1/3 xl:w-1/4 p-6 flex flex-col">
				<a href="#"> <img class="hover:grow hover:shadow-lg"
					src="https://images.unsplash.com/photo-1555982105-d25af4182e4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&h=400&q=80">
					<div class="pt-3 flex items-center justify-between">
						<p class="">Product Name</p>
						<svg class="h-6 w-6 fill-current text-gray-500 hover:text-black"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path
								d="M12,4.595c-1.104-1.006-2.512-1.558-3.996-1.558c-1.578,0-3.072,0.623-4.213,1.758c-2.353,2.363-2.352,6.059,0.002,8.412 l7.332,7.332c0.17,0.299,0.498,0.492,0.875,0.492c0.322,0,0.609-0.163,0.792-0.409l7.415-7.415 c2.354-2.354,2.354-6.049-0.002-8.416c-1.137-1.131-2.631-1.754-4.209-1.754C14.513,3.037,13.104,3.589,12,4.595z M18.791,6.205 c1.563,1.571,1.564,4.025,0.002,5.588L12,18.586l-6.793-6.793C3.645,10.23,3.646,7.776,5.205,6.209 c0.76-0.756,1.754-1.172,2.799-1.172s2.035,0.416,2.789,1.17l0.5,0.5c0.391,0.391,1.023,0.391,1.414,0l0.5-0.5 C14.719,4.698,17.281,4.702,18.791,6.205z" />
                        </svg>
					</div>
					<p class="pt-1 text-gray-900">£9.99</p>
				</a>
			</div>

			<div class="w-full md:w-1/3 xl:w-1/4 p-6 flex flex-col">
				<a href="#"> <img class="hover:grow hover:shadow-lg"
					src="https://images.unsplash.com/photo-1508423134147-addf71308178?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&h=400&q=80">
					<div class="pt-3 flex items-center justify-between">
						<p class="">Product Name</p>
						<svg class="h-6 w-6 fill-current text-gray-500 hover:text-black"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path
								d="M12,4.595c-1.104-1.006-2.512-1.558-3.996-1.558c-1.578,0-3.072,0.623-4.213,1.758c-2.353,2.363-2.352,6.059,0.002,8.412 l7.332,7.332c0.17,0.299,0.498,0.492,0.875,0.492c0.322,0,0.609-0.163,0.792-0.409l7.415-7.415 c2.354-2.354,2.354-6.049-0.002-8.416c-1.137-1.131-2.631-1.754-4.209-1.754C14.513,3.037,13.104,3.589,12,4.595z M18.791,6.205 c1.563,1.571,1.564,4.025,0.002,5.588L12,18.586l-6.793-6.793C3.645,10.23,3.646,7.776,5.205,6.209 c0.76-0.756,1.754-1.172,2.799-1.172s2.035,0.416,2.789,1.17l0.5,0.5c0.391,0.391,1.023,0.391,1.414,0l0.5-0.5 C14.719,4.698,17.281,4.702,18.791,6.205z" />
                        </svg>
					</div>
					<p class="pt-1 text-gray-900">£9.99</p>
				</a>
			</div>

			<div class="w-full md:w-1/3 xl:w-1/4 p-6 flex flex-col">
				<a href="#"> <img class="hover:grow hover:shadow-lg"
					src="https://images.unsplash.com/photo-1449247709967-d4461a6a6103?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&h=400&q=80">
					<div class="pt-3 flex items-center justify-between">
						<p class="">Product Name</p>
						<svg class="h-6 w-6 fill-current text-gray-500 hover:text-black"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path
								d="M12,4.595c-1.104-1.006-2.512-1.558-3.996-1.558c-1.578,0-3.072,0.623-4.213,1.758c-2.353,2.363-2.352,6.059,0.002,8.412 l7.332,7.332c0.17,0.299,0.498,0.492,0.875,0.492c0.322,0,0.609-0.163,0.792-0.409l7.415-7.415 c2.354-2.354,2.354-6.049-0.002-8.416c-1.137-1.131-2.631-1.754-4.209-1.754C14.513,3.037,13.104,3.589,12,4.595z M18.791,6.205 c1.563,1.571,1.564,4.025,0.002,5.588L12,18.586l-6.793-6.793C3.645,10.23,3.646,7.776,5.205,6.209 c0.76-0.756,1.754-1.172,2.799-1.172s2.035,0.416,2.789,1.17l0.5,0.5c0.391,0.391,1.023,0.391,1.414,0l0.5-0.5 C14.719,4.698,17.281,4.702,18.791,6.205z" />
                        </svg>
					</div>
					<p class="pt-1 text-gray-900">£9.99</p>
				</a>
			</div>

			<div class="w-full md:w-1/3 xl:w-1/4 p-6 flex flex-col">
				<a href="#"> <img class="hover:grow hover:shadow-lg"
					src="https://images.unsplash.com/reserve/LJIZlzHgQ7WPSh5KVTCB_Typewriter.jpg?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&h=400&q=80">
					<div class="pt-3 flex items-center justify-between">
						<p class="">Product Name</p>
						<svg class="h-6 w-6 fill-current text-gray-500 hover:text-black"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path
								d="M12,4.595c-1.104-1.006-2.512-1.558-3.996-1.558c-1.578,0-3.072,0.623-4.213,1.758c-2.353,2.363-2.352,6.059,0.002,8.412 l7.332,7.332c0.17,0.299,0.498,0.492,0.875,0.492c0.322,0,0.609-0.163,0.792-0.409l7.415-7.415 c2.354-2.354,2.354-6.049-0.002-8.416c-1.137-1.131-2.631-1.754-4.209-1.754C14.513,3.037,13.104,3.589,12,4.595z M18.791,6.205 c1.563,1.571,1.564,4.025,0.002,5.588L12,18.586l-6.793-6.793C3.645,10.23,3.646,7.776,5.205,6.209 c0.76-0.756,1.754-1.172,2.799-1.172s2.035,0.416,2.789,1.17l0.5,0.5c0.391,0.391,1.023,0.391,1.414,0l0.5-0.5 C14.719,4.698,17.281,4.702,18.791,6.205z" />
                        </svg>
					</div>
					<p class="pt-1 text-gray-900">£9.99</p>
				</a>
			</div>

			<div class="w-full md:w-1/3 xl:w-1/4 p-6 flex flex-col">
				<a href="#"> <img class="hover:grow hover:shadow-lg"
					src="https://images.unsplash.com/photo-1467949576168-6ce8e2df4e13?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&h=400&q=80">
					<div class="pt-3 flex items-center justify-between">
						<p class="">Product Name</p>
						<svg class="h-6 w-6 fill-current text-gray-500 hover:text-black"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path
								d="M12,4.595c-1.104-1.006-2.512-1.558-3.996-1.558c-1.578,0-3.072,0.623-4.213,1.758c-2.353,2.363-2.352,6.059,0.002,8.412 l7.332,7.332c0.17,0.299,0.498,0.492,0.875,0.492c0.322,0,0.609-0.163,0.792-0.409l7.415-7.415 c2.354-2.354,2.354-6.049-0.002-8.416c-1.137-1.131-2.631-1.754-4.209-1.754C14.513,3.037,13.104,3.589,12,4.595z M18.791,6.205 c1.563,1.571,1.564,4.025,0.002,5.588L12,18.586l-6.793-6.793C3.645,10.23,3.646,7.776,5.205,6.209 c0.76-0.756,1.754-1.172,2.799-1.172s2.035,0.416,2.789,1.17l0.5,0.5c0.391,0.391,1.023,0.391,1.414,0l0.5-0.5 C14.719,4.698,17.281,4.702,18.791,6.205z" />
                        </svg>
					</div>
					<p class="pt-1 text-gray-900">£9.99</p>
				</a>
			</div>

			<div class="w-full md:w-1/3 xl:w-1/4 p-6 flex flex-col">
				<a href="#"> <img class="hover:grow hover:shadow-lg"
					src="https://images.unsplash.com/photo-1544787219-7f47ccb76574?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&h=400&q=80">
					<div class="pt-3 flex items-center justify-between">
						<p class="">Product Name</p>
						<svg class="h-6 w-6 fill-current text-gray-500 hover:text-black"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path
								d="M12,4.595c-1.104-1.006-2.512-1.558-3.996-1.558c-1.578,0-3.072,0.623-4.213,1.758c-2.353,2.363-2.352,6.059,0.002,8.412 l7.332,7.332c0.17,0.299,0.498,0.492,0.875,0.492c0.322,0,0.609-0.163,0.792-0.409l7.415-7.415 c2.354-2.354,2.354-6.049-0.002-8.416c-1.137-1.131-2.631-1.754-4.209-1.754C14.513,3.037,13.104,3.589,12,4.595z M18.791,6.205 c1.563,1.571,1.564,4.025,0.002,5.588L12,18.586l-6.793-6.793C3.645,10.23,3.646,7.776,5.205,6.209 c0.76-0.756,1.754-1.172,2.799-1.172s2.035,0.416,2.789,1.17l0.5,0.5c0.391,0.391,1.023,0.391,1.414,0l0.5-0.5 C14.719,4.698,17.281,4.702,18.791,6.205z" />
                        </svg>
					</div>
					<p class="pt-1 text-gray-900">£9.99</p>
				</a>
			</div>

			<div class="w-full md:w-1/3 xl:w-1/4 p-6 flex flex-col">
				<a href="#"> <img class="hover:grow hover:shadow-lg"
					src="https://images.unsplash.com/photo-1550837368-6594235de85c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&h=400&q=80">
					<div class="pt-3 flex items-center justify-between">
						<p class="">Product Name</p>
						<svg class="h-6 w-6 fill-current text-gray-500 hover:text-black"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path
								d="M12,4.595c-1.104-1.006-2.512-1.558-3.996-1.558c-1.578,0-3.072,0.623-4.213,1.758c-2.353,2.363-2.352,6.059,0.002,8.412 l7.332,7.332c0.17,0.299,0.498,0.492,0.875,0.492c0.322,0,0.609-0.163,0.792-0.409l7.415-7.415 c2.354-2.354,2.354-6.049-0.002-8.416c-1.137-1.131-2.631-1.754-4.209-1.754C14.513,3.037,13.104,3.589,12,4.595z M18.791,6.205 c1.563,1.571,1.564,4.025,0.002,5.588L12,18.586l-6.793-6.793C3.645,10.23,3.646,7.776,5.205,6.209 c0.76-0.756,1.754-1.172,2.799-1.172s2.035,0.416,2.789,1.17l0.5,0.5c0.391,0.391,1.023,0.391,1.414,0l0.5-0.5 C14.719,4.698,17.281,4.702,18.791,6.205z" />
                        </svg>
					</div>
					<p class="pt-1 text-gray-900">£9.99</p>
				</a>
			</div>

			<div class="w-full md:w-1/3 xl:w-1/4 p-6 flex flex-col">
				<a href="#"> <img class="hover:grow hover:shadow-lg"
					src="https://images.unsplash.com/photo-1551431009-a802eeec77b1?ixlib=rb-1.2.1&auto=format&fit=crop&w=400&h=400&q=80">
					<div class="pt-3 flex items-center justify-between">
						<p class="">Product Name</p>
						<svg class="h-6 w-6 fill-current text-gray-500 hover:text-black"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path
								d="M12,4.595c-1.104-1.006-2.512-1.558-3.996-1.558c-1.578,0-3.072,0.623-4.213,1.758c-2.353,2.363-2.352,6.059,0.002,8.412 l7.332,7.332c0.17,0.299,0.498,0.492,0.875,0.492c0.322,0,0.609-0.163,0.792-0.409l7.415-7.415 c2.354-2.354,2.354-6.049-0.002-8.416c-1.137-1.131-2.631-1.754-4.209-1.754C14.513,3.037,13.104,3.589,12,4.595z M18.791,6.205 c1.563,1.571,1.564,4.025,0.002,5.588L12,18.586l-6.793-6.793C3.645,10.23,3.646,7.776,5.205,6.209 c0.76-0.756,1.754-1.172,2.799-1.172s2.035,0.416,2.789,1.17l0.5,0.5c0.391,0.391,1.023,0.391,1.414,0l0.5-0.5 C14.719,4.698,17.281,4.702,18.791,6.205z" />
                        </svg>
					</div>
					<p class="pt-1 text-gray-900">£9.99</p>
				</a>
			</div>

		</div>

	</section>

	<section class="bg-white py-8">

		<div class="container py-8 px-6 mx-auto">

			<a
				class="uppercase tracking-wide no-underline hover:no-underline font-bold text-gray-800 text-xl mb-8"
				href="#"> About </a>

			<p class="mt-8 mb-8">
				This template is inspired by the stunning nordic minamalist design -
				in particular: <br> <a
					class="text-gray-800 underline hover:text-gray-900"
					href="http://savoy.nordicmade.com/" target="_blank">Savoy Theme</a>
				created by <a class="text-gray-800 underline hover:text-gray-900"
					href="https://nordicmade.com/">https://nordicmade.com/</a> and <a
					class="text-gray-800 underline hover:text-gray-900"
					href="https://www.metricdesign.no/" target="_blank">https://www.metricdesign.no/</a>
			</p>

			<p class="mb-8">
				Lorem ipsum dolor sit amet, consectetur <a href="#">random link</a>
				adipiscing elit, sed do eiusmod tempor incididunt ut labore et
				dolore magna aliqua. Vel risus commodo viverra maecenas accumsan
				lacus vel facilisis volutpat. Vitae aliquet nec ullamcorper sit.
				Nullam eget felis eget nunc lobortis mattis aliquam. In est ante in
				nibh mauris. Egestas congue quisque egestas diam in. Facilisi nullam
				vehicula ipsum a arcu. Nec nam aliquam sem et tortor consequat. Eget
				mi proin sed libero enim sed faucibus turpis in. Hac habitasse
				platea dictumst quisque. In aliquam sem fringilla ut. Gravida rutrum
				quisque non tellus orci ac auctor augue mauris. Accumsan lacus vel
				facilisis volutpat est velit egestas dui id. At tempor commodo
				ullamcorper a. Volutpat commodo sed egestas egestas fringilla. Vitae
				congue eu consequat ac.
			</p>

		</div>
	</section>
</body>


<!-- footer -->
<footer class="container mx-auto bg-white py-8 border-t border-gray-400">
	<div class="container flex px-3 py-8 ">
		<div class="w-full mx-auto flex flex-wrap">
			<div class="flex w-full lg:w-1/2 ">
				<div class="px-3 md:px-0">
					<h3 class="font-bold text-gray-900">About</h3>
					<p class="py-4">Lorem ipsum dolor sit amet, consectetur
						adipiscing elit. Maecenas vel mi ut felis tempus commodo nec id
						erat. Suspendisse consectetur dapibus velit ut lacinia.</p>
				</div>
			</div>
			<div class="flex w-full lg:w-1/2 lg:justify-end lg:text-right">
				<div class="px-3 md:px-0">
					<h3 class="font-bold text-gray-900">Social</h3>
					<ul class="list-reset items-center pt-3">
						<li><a
							class="inline-block no-underline hover:text-black hover:underline py-1"
							href="#">Add social links</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</footer>

</body>

</html>