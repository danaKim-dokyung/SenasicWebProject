<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
	<script
		src="https://unpkg.com/@popperjs/core@2.9.1/dist/umd/popper.min.js"
		charset="utf-8"></script>
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://unpkg.com/tailwindcss@%5E2/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>
    <link rel="stylesheet"
        href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"
            />

            <style>
                .carousel-open:checked + .carousel-item {
                  position: static;
                  opacity: 100;
                }
              
                .carousel-item {
                  -webkit-transition: opacity 0.6s ease-out;
                  transition: opacity 0.6s ease-out;
                }
              
                #carousel-1:checked ~ .control-1,
                #carousel-2:checked ~ .control-2,
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
              
                #carousel-1:checked
                  ~ .control-1
                  ~ .carousel-indicators
                  li:nth-child(1)
                  .carousel-bullet,
                #carousel-2:checked
                  ~ .control-2
                  ~ .carousel-indicators
                  li:nth-child(2)
                  .carousel-bullet,
                #carousel-3:checked
                  ~ .control-3
                  ~ .carousel-indicators
                  li:nth-child(3)
                  .carousel-bullet {
                  color: #2b6cb0;
                  /*Set to match the Tailwind colour you want the active one to be */
                }
                
                button:focus {
    outline: 1px dotted;
    outline: 5px auto -webkit-focus-ring-color;
}
      
      
      /* index에서 가져온 style */

.nav-container {
	display: flex;
	text-align: center;
}

.nav-item {
	text-align: center;
}

li>.nav-itme {
	float: left;
	padding: 30px;
}

li>.nav-itme:hover { /* 클래스이름 */
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

);
opacity:1;}
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

@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
* {font-family: GmarketSansMedium;}

#github>a{
padding:10px;
}

#shbtn:hover{background-color: #d7e9d433;}
/* index 스타일 끝부분 */
      
      
                
              </style>
</head>
<body>
	<!------ header : 상단 네브바, 세나식 로고, 게시판 링크 ------>
	<header
		class="text-gray-600 body-font sticky inset-x-0 top-0 left-0  py-5">
		<div
			class="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">

			<!------ 왼쪽 상단 세나식 로고 ----->
			<a href="/index.jsp"
				class="flex title-font font-medium items-center text-gray-900 mb-4 md:mb-0">
				<span class="ml-3 text-xl">SENASIC</span>
			</a>
			<!-- top에 붙어있는 nav bar, 로그인 회원가입, 마이페이지, 로그아웃-->
			<nav
				class="z-50 md:ml-auto flex flex-wrap items-center text-base justify-center">
				<c:choose>
					<c:when test="${loginID != null}">
				${loginID} 님 안녕하세요&nbsp;&nbsp;| &nbsp;&nbsp;
						<a href="/logout.mem" onclick="return confirm('정말 로그아웃 하시겠습니까?');">로그아웃&nbsp;&nbsp;|</a>&nbsp;&nbsp;
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
	<a href="/index.jsp">
	<div id="logo">
		<img src="/senasic_logo.png">
	</div></a>

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

<section class="text-gray-600 body-font" >
  <div class="container px-5 mx-auto">



    <div class="carousel relative rounded relative overflow-hidden shadow-xl"><!--현재 캐러셀-->
    
  
    
        <div class="carousel-inner relative overflow-hidden w-full">
          <!--Slide 1-->
          <!-- >>이동버튼 -->
          <input
            class="carousel-open"
            type="radio"
            id="carousel-1"
            name="carousel"
            aria-hidden="true"
            hidden=""
            checked="checked"
          />
          <div
            class="carousel-item absolute opacity-0 bg-center"
            style="
              height: 500px;
              background-image: url();
              padding-bottom : 100px;
            "
          >
          <!-- url(https://mdbootstrap.com/img/new/slides/052.jpg) -->
        <!--  <a href="/load.rest?seq=${ct.seq } " > --> 
          <div>
            <section class="text-gray-600 body-font overflow-hidden" > <!-- 요부분-->
                <div class="container px-5 py-24 mx-auto">
                  <div class="lg:w-4/5 mx-auto flex flex-wrap"><!-- 이 아래부터 캐러셀 예정 -->
                    
                   <img alt="ecommerce" class="pt1 lg:w-1/2 w-full lg:h-auto h-40 object-cover object-center rounded z-10" src="${ct.photo1 }">
                    
                    <div class="lg:w-1/2 w-full lg:pl-10 lg:py-6 mt-6 lg:mt-0"><!-- 이 위까지 캐러셀 예정-->
                    
                      <h2 class="text-sm title-font text-gray-500 tracking-widest"> ${ct.category }</h2>
                      <h1 class="text-gray-900 text-3xl title-font font-medium mb-1"> ${ct.title }</h1>
                      <div class="flex mb-4">
                        <span class="flex items-center">
                          <div class="col-span-1 row-span-3 text-right">
					<ul class="flex justify-end items-center">
					<c:set var="rt" value="${ct.rate }"/>
					<c:forEach var='cnt' begin='1' end='5'>	
						<li>
						  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
							    <defs>
							        <linearGradient id="ct_grad${cnt }">
							        	<c:choose>
								        	<c:when test= "${cnt<=rt }">
								        		<stop offset="100%" stop-color="orange"/>
								        	</c:when>
								        	<c:when test="${cnt>rt and cnt-1<rt }">
								        		<stop offset="${100-(cnt-rt)*100 }%" stop-color="orange"/>
								        		<stop offset="${(cnt-rt)*100 }%" stop-color="white"/>
								        	</c:when>
											<c:otherwise>
									            <stop offset="100%" stop-color="white" stop-opacity="1" />							        	
											</c:otherwise>										
							        	</c:choose> 	
							        </linearGradient>
							    </defs>
						  <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" fill="url(#ct_grad${cnt })" stroke-width="1" stroke="orange"/>
								</svg>
							</li>
					</c:forEach>
					</ul>
					</div>
                          <span class="text-gray-600 ml-3">${ct.rate }</span>
                        </span>
                        <span class="flex ml-3 pl-3 py-2 border-l-2 border-gray-200 space-x-2s">
                          ${reviewN1 } Review
                        </span>
                      </div>
                      <p class="leading-relaxed">지역 : ${ct.locate } <br> 상세주소 : ${ct.locate_detail } <br> 영업시간 : ${ct.open_hour } <br> 주차여부 : ${ct.garage } <br> 추천 수 : <span id=rcN>${ct.recommend }</span> <br></p>
                      
        
                      <div class="flex">
                        <span class="title-font font-medium text-2xl text-gray-900"></span>
                        <button class="flex ml-auto text-white bg-indigo-500 border-0 py-2 px-6 focus:outline-none hover:bg-indigo-600 rounded" id=ctBtn >예약하기</button>
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
              </section> <!-- 요부분 -->
         </div>
        <!--  </a> -->
        </div>
        
          <label
            for="carousel-3"
            class="
              control-1
              w-10
              h-10
              ml-2
              md:ml-10
              absolute
              cursor-pointer
              hidden
              font-bold
              text-black
              hover:text-white
              rounded-full
              bg-white
              hover:bg-blue-700
              leading-tight
              text-center
              z-10
              inset-y-0
              left-0
              my-auto
              flex
              justify-center
              content-center
            "
            ><i class="fas fa-angle-left mt-3"></i
          ></label>
          <label
            for="carousel-2"
            class="
              next
              control-1
              w-10
              h-10
              mr-2
              md:mr-10
              absolute
              cursor-pointer
              hidden
              font-bold
              text-black
              hover:text-white
              rounded-full
              bg-white
              hover:bg-blue-700
              leading-tight
              text-center
              z-10
              inset-y-0
              right-0
              my-auto
            "
            ><i class="fas fa-angle-right mt-3"></i
          ></label>
     
      <!--  여기다 붙여넣기 캐러셀 2,3 부분 -->
      <!--Slide 2-->
          <input
            class="carousel-open"
            type="radio"
            id="carousel-2"
            name="carousel"
            aria-hidden="true"
            hidden=""
          />
          <div
            class="carousel-item absolute opacity-0 bg-center"
            style="
              height: 500px;
              background-image: url();
            "
          >
          <!-- url(https://mdbootstrap.com/img/new/slides/052.jpg) -->
          <div>
            <section class="text-gray-600 body-font overflow-hidden"> <!-- 요부분-->
                <div class="container px-5 py-24 mx-auto">
                  <div class="lg:w-4/5 mx-auto flex flex-wrap"><!-- 이 아래부터 캐러셀 예정 -->
                    
                   <img alt="ecommerce" class="pt2 lg:w-1/2 w-full lg:h-auto h-40 object-cover object-center rounded z-10" src="${ct1.photo1 }" >
                    
                    <div class="lg:w-1/2 w-full lg:pl-10 lg:py-6 mt-6 lg:mt-0"><!-- 이 위까지 캐러셀 예정-->
                      <h2 class="text-sm title-font text-gray-500 tracking-widest"> ${ct1.category }</h2>
                      <h1 class="text-gray-900 text-3xl title-font font-medium mb-1"> ${ct1.title }</h1>
                      <div class="flex mb-4">
                        <span class="flex items-center">
                          <div class="col-span-1 row-span-3 text-right">
					<ul class="flex justify-end items-center">
					<c:set var="rt" value="${ct1.rate }"/>
					<c:forEach var='cnt' begin='1' end='5'>	
						<li>
						  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
							    <defs>
							        <linearGradient id="ct1_grad${cnt }">
							        	<c:choose>
								        	<c:when test= "${cnt<=rt }">
								        		<stop offset="100%" stop-color="orange"/>
								        	</c:when>
								        	<c:when test="${cnt>rt and cnt-1<rt }">
								        		<stop offset="${100-(cnt-rt)*100 }%" stop-color="orange"/>
								        		<stop offset="${(cnt-rt)*100 }%" stop-color="white"/>
								        	</c:when>
											<c:otherwise>
									            <stop offset="100%" stop-color="white" stop-opacity="1" />							        	
											</c:otherwise>										
							        	</c:choose> 	
							        </linearGradient>
							    </defs>
						  <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" fill="url(#ct1_grad${cnt })" stroke-width="1" stroke="orange"/>
								</svg>
							</li>
					</c:forEach>
					</ul>
					</div>
                          <span class="text-gray-600 ml-3">${ct1.rate }</span>
                        </span>
                        <span class="flex ml-3 pl-3 py-2 border-l-2 border-gray-200 space-x-2s">
                          <a class="text-gray-500">
                            ${reviewN2 } Review
                          </a>
                        </span>
                      </div>
                      <p class="leading-relaxed">지역 : ${ct1.locate } <br> 상세주소 : ${ct1.locate_detail } <br> 영업시간 : ${ct1.open_hour } <br> 주차여부 : ${ct1.garage } <br> 추천 수 : <span id=rcN1>${ct1.recommend }</span> <br></p>
                      
        
                      <div class="flex">
                        <span class="title-font font-medium text-2xl text-gray-900"></span>
                  <button class="flex ml-auto text-white bg-indigo-500 border-0 py-2 px-6 focus:outline-none hover:bg-indigo-600 rounded" id=ct1Btn>예약하기</button>     
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
              </section> <!-- 요부분 -->
         </div>
        </div>
        
          <label
            for="carousel-1"
            class="
               control-2
		        w-10
		        h-10
		        ml-2
		        md:ml-10
		        absolute
		        cursor-pointer
		        hidden
		        font-bold
		        text-black
		        hover:text-white
		        rounded-full
		        bg-white
		        hover:bg-blue-700
		        leading-tight
		        text-center
		        z-10
		        inset-y-0
		        left-0
		        my-auto
            "
            ><i class="fas fa-angle-left mt-3"></i
          ></label>
          <label
             for="carousel-3"
		      class="
		        next
		        control-2
		        w-10
		        h-10
		        mr-2
		        md:mr-10
		        absolute
		        cursor-pointer
		        hidden
		        font-bold
		        text-black
		        hover:text-white
		        rounded-full
		        bg-white
		        hover:bg-blue-700
		        leading-tight
		        text-center
		        z-10
		        inset-y-0
		        right-0
		        my-auto
		      "
            ><i class="fas fa-angle-right mt-3"></i
          ></label>
          
          <!--Slide 3-->
          <input
            class="carousel-open"
            type="radio"
            id="carousel-3"
            name="carousel"
            aria-hidden="true"
            hidden=""
          />
          <div
            class="carousel-item absolute opacity-0 "
            style="
              height: 500px;
              background-image: url();
            "
          >
          <!-- url(https://mdbootstrap.com/img/new/slides/052.jpg) -->
          <div>
            <section class="text-gray-600 body-font overflow-hidden"> <!-- 요부분-->
                <div class="container px-5 py-24 mx-auto">
                  <div class="lg:w-4/5 mx-auto flex flex-wrap"><!-- 이 아래부터 캐러셀 예정 -->
                    
                    <img alt="ecommerce"class="pt3 lg:w-1/2 w-full lg:h-auto h-64 object-cover object-center rounded z-10" src="${ct2.photo1 }" >
                    
                    <div class="lg:w-1/2 w-full lg:pl-10 lg:py-6 mt-6 lg:mt-0"><!-- 이 위까지 캐러셀 예정-->
                      <h2 class="text-sm title-font text-gray-500 tracking-widest"> ${ct2.category }</h2>
                      <h1 class="text-gray-900 text-3xl title-font font-medium mb-1"> ${ct2.title }</h1>
                      <div class="flex mb-4">
                        <span class="flex items-center">
                          <div class="col-span-1 row-span-3 text-right">
					<ul class="flex justify-end items-center">
					<c:set var="rt" value="${ct2.rate }"/>
					<c:forEach var='cnt' begin='1' end='5'>	
						<li>
						  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
							    <defs>
							        <linearGradient id="ct2_grad${cnt }">
							        	<c:choose>
								        	<c:when test= "${cnt<=rt }">
								        		<stop offset="100%" stop-color="orange"/>
								        	</c:when>
								        	<c:when test="${cnt>rt and cnt-1<rt }">
								        		<stop offset="${100-(cnt-rt)*100 }%" stop-color="orange"/>
								        		<stop offset="${(cnt-rt)*100 }%" stop-color="white"/>
								        	</c:when>
											<c:otherwise>
									            <stop offset="100%" stop-color="white" stop-opacity="1" />							        	
											</c:otherwise>										
							        	</c:choose> 	
							        </linearGradient>
							    </defs>
						  <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" fill="url(#ct2_grad${cnt })" stroke-width="1" stroke="orange"/>
								</svg>
							</li>
					</c:forEach>
					</ul>
					</div>
                          <span class="text-gray-600 ml-3">${ct2.rate }</span>
                        </span>
                        <span class="flex ml-3 pl-3 py-2 border-l-2 border-gray-200 space-x-2s">
                          <a class="text-gray-500">
 							${reviewN3 } Review
                          </a>
                        </span>
                      </div>
                      <p class="leading-relaxed">지역 : ${ct2.locate } <br> 상세주소 : ${ct2.locate_detail } <br> 영업시간 : ${ct2.open_hour } <br> 주차여부 : ${ct2.garage } <br> 추천 수 : <span id=rcN2>${ct2.recommend }</span> <br></p>
                      
        
                      <div class="flex">
                        <span class="title-font font-medium text-2xl text-gray-900"></span>
                     	<button class="flex ml-auto text-white bg-indigo-500 border-0 py-2 px-6 focus:outline-none hover:bg-indigo-600 rounded" id=ct2Btn>예약하기</button>

                        </button>
                      </div>
                    </div>
                  </div>
                </div>
              </section> <!-- 요부분 -->
         </div>
        </div>
        
          <label
		      for="carousel-2"
		      class="
		        control-3
		        w-10
		        h-10
		        ml-2
		        md:ml-10
		        absolute
		        cursor-pointer
		        hidden
		        font-bold
		        text-black
		        hover:text-white
		        rounded-full
		        bg-white
		        hover:bg-blue-700
		        leading-tight
		        text-center
		        z-10
		        inset-y-0
		        left-0
		        my-auto
		      "
		      ><i class="fas fa-angle-left mt-3"></i
		    ></label>
		    <label
		      for="carousel-1"
		      class="
		        next
		        control-3
		        w-10
		        h-10
		        mr-2
		        md:mr-10
		        absolute
		        cursor-pointer
		        hidden
		        font-bold
		        text-black
		        hover:text-white
		        rounded-full
		        bg-white
		        hover:bg-blue-700
		        leading-tight
		        text-center
		        z-10
		        inset-y-0
		        right-0
		        my-auto
		      "
		      ><i class="fas fa-angle-right mt-3"></i
		    ></label>
       <!--  여기다 붙여넣기 캐러셀 2,3 부분 -->
         
      
          <!-- Add additional indicators for each slide-->
          <ol class="carousel-indicators">
            <li class="inline-block mr-3">
              <label
                for="carousel-1"
                class="
                  carousel-bullet
                  cursor-pointer
                  block
                  text-4xl text-white
                  hover:text-blue-700
                "
                >•</label
              >
            </li>
            
           <!--  이부분에 페이지 • 처리 2,3개 -->
           <li class="inline-block mr-3">
        <label
          for="carousel-2"
          class="
            carousel-bullet
            cursor-pointer
            block
            text-4xl text-white
            hover:text-blue-700
          "
          >•</label
        >
      </li>
      <li class="inline-block mr-3">
        <label
          for="carousel-3"
          class="
            carousel-bullet
            cursor-pointer
            block
            text-4xl text-white
            hover:text-blue-700
          "
          >•</label
        >
      </li>
           <!--  이부분에 페이지 • 처리 2,3개 -->
          </ol>
        </div>
      </div>
      
      
      
      
	<div>
<div class="flex justify-end py-4">
<div x-data="{ dropdownOpen: true }" class="relative">
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
					type="button" onclick="openDropdown(event,'dropdown-example-1')">
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
					<a href="/fboard.rest?cpage=1&category=이색"
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
						# 이색 </a> <a href="/fboard.rest?cpage=1&category=양식"
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
						# 양식 </a> <a href="/fboard.rest?cpage=1&category=일식"
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
						# 일식 </a> <a href="/fboard.rest?cpage=1&category=카페"
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
						# 카페 </a>
						 <a href="/fboard.rest?cpage=1&category=술집"
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
						# 술집 </a>
					<div
						class="
                    h-0
                    my-2
                    border border-solid border-t-0 border-blueGray-800
                    opacity-25
                  "></div>
					<a href="/fboard.rest?cpage=1"
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
	</div>
    


    <div class="flex flex-wrap -m-4" >

<c:set var="star" value="1" />

	<c:forEach var="dto" items="${list }">
		
      <div class="xl:w-1/4 md:w-1/2 lg:w-1/4 p-4" >
      <a href="/load.rest?seq=${dto.seq } " >
        <div class="bg-gray-100 p-6 rounded-lg">
          <img class="h-40 rounded w-full object-cover object-center mb-6" src="${dto.photo1 }" alt="content">
          <h2 class="text-lg text-gray-900 font-medium title-font mb-4">${dto.title }
               <!--  별점 -->
               <div class="col-span-1 row-span-3 text-right">
                    ${dto.rate }
                    <ul class="flex justify-end items-center">
                    <c:set var="rt" value="${dto.rate }"/>
                    <c:forEach var='cnt' begin='1' end='5'>
                    	<c:set var="star" value="${star+1}" />    
                        <li>
                          <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8" viewBox="0 0 20 20" fill="currentColor">
                                <defs>
                                    <linearGradient id="half_grad${star }">
                                        <c:choose>
                                            <c:when test= "${cnt<=rt }">
                                                <stop offset="100%" stop-color="orange"/>
                                            </c:when>
                                            <c:when test="${cnt>rt and cnt-1<rt }">
                                                <stop offset="${100-(cnt-rt)*100 }%" stop-color="orange"/>
                                                <stop offset="${(cnt-rt)*100 }%" stop-color="white"/>
                                            </c:when>
                                            <c:otherwise>
                                                <stop offset="100%" stop-color="white" stop-opacity="1" />                                        
                                            </c:otherwise>                                        
                                        </c:choose>     
                                    </linearGradient>
                                </defs>
                          <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" fill="url(#half_grad${star })" stroke-width="1" stroke="orange"/>
                                </svg>
                            </li>
                    </c:forEach>
                    </ul>
                  </div>
                 <!-- 별점 끝 -->
          </h2>
          <p>${dto.locate }</p>
          <p class="leading-relaxed text-base">${dto.locate_detail } <br> ${dto.category } <br> ${dto.open_hour }</p>
        </div>
        
      </div>
     
	</c:forEach>
     



    </div>

    </div>

  </div> <!--container -->


</section>


<div class="bg-white px-4 py-3 flex items-center justify-between border-t border-gray-200 sm:px-6">
  <div class="flex-1 flex justify-between sm:hidden">
    <a href="#" class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50">
      Previous
    </a>
    <a href="#" class="ml-3 relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50">
      Next
    </a>
  </div>
  <div class="hidden sm:flex-1 sm:flex sm:items-center sm:justify-between md:justify-center">
    <div>
      <nav class="relative z-0 inline-flex rounded-md shadow-sm -space-x-px" aria-label="Pagination">
        
        <!-- Current: "z-10 bg-indigo-50 border-indigo-500 text-indigo-600", Default: "bg-white border-gray-300 text-gray-500 hover:bg-gray-50" -->
         <c:forEach var="navi" items="${navi }">
       		<c:choose>
					<c:when test="${(navi%10) eq 0 and navi != Fnum}">
					<a href="/fboard.rest?cpage=${navi }<c:if test="${category ne null }">&${type }=${category }</c:if><c:if test="${target ne null }">&target=${target }</c:if>" class="relative inline-flex items-center px-2 py-2 rounded-l-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
			          <span class="sr-only">Previous</span>
			          <!-- Heroicon name: solid/chevron-left -->
			          <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
			            <path fill-rule="evenodd" d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clip-rule="evenodd" />
			          </svg>
			        </a>	
			</c:when> 
       		<c:when test="${fbPg eq navi }">
			        <a href="#" aria-current="page" class="z-10 bg-indigo-50 border-indigo-500 text-indigo-600 relative inline-flex items-center px-4 py-2 border text-sm font-medium">
			          ${navi }
			        </a>
       		</c:when>
       		<c:when test="${navi!=1 and (navi%10) eq 1 and navi!=Snum}">
			     <a href="/fboard.rest?cpage=${navi }<c:if test="${category ne null }">&${type }=${category }</c:if><c:if test="${target ne null }">&target=${target }</c:if>" class="relative inline-flex items-center px-2 py-2 rounded-r-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
			          <span class="sr-only">Next</span>
			          <!-- Heroicon name: solid/chevron-right -->
			          <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
			            <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd" />
			          </svg>
			        </a>
       		</c:when>
       		<c:otherwise>
			        <a href="/fboard.rest?cpage=${navi }<c:if test="${category ne null }">&${type }=${category }</c:if><c:if test="${target ne null }">&target=${target }</c:if>" class="bg-white border-gray-300 text-gray-500 hover:bg-gray-50 relative inline-flex items-center px-4 py-2 border text-sm font-medium">
			          ${navi}
			        </a>
			       		
       		</c:otherwise>
       		</c:choose>
        </c:forEach>
   
      </nav>
    </div>
  </div>
</div>
<script>
	$(".pt1").on("click",function(){
		location.href="load.rest?seq=${ct.seq }";
	});
	$(".pt2").on("click",function(){
		location.href="load.rest?seq=${ct1.seq }";
	});
	$(".pt3").on("click",function(){
		location.href="load.rest?seq=${ct2.seq }";
	});
	
	$("#ctBtn").on("click",function(){
		location.href="${ct.link }";
	});
	$("#ct1Btn").on("click",function(){
		location.href="${ct1.link }";
	});
	$("#ct2Btn").on("click",function(){
		location.href="${ct2.link }";
	});


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

<!-- footer -->
<footer class="text-center lg:text-left bg-green-900 text-gray-200">

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

					회원가입 , 로그인 : 곽서호 , 김도경 <br>  마이페이지 : 서호현 , 장건희
					<br> 맛집 리스트 : 서호현 , 김도경  <br> 검색 : 곽서호 , 임도혁
					<br> 맛집 게시판 : 임도혁 , 곽서호 , 장건희 <br> 반려견 게시판 :
					김도경 , 서호현 <br> 관리 : 임도혁
				</p>
			</div>
			<div>
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
					<a href="#!" class="text-gray-200">임도혁's Github</a>
				</p>
				<p class="mb-4">
					<a href="https://github.com/danaKim-dokyung" class="text-gray-200">김도경's Github</a>
				</p>
				<p class="mb-4">
					<a href="#!" class="text-gray-200">곽서호's Github</a>
				</p>
				<p class="mb-4">
					<a href="#!" class="text-gray-200">서호현's Github</a>
				</p>
				<p>
					<a href="#!" class="text-gray-200">장건희's Github</a>
				</p>
			</div>
			<div class="">
				<h6
					class="uppercase font-semibold mb-4 flex justify-center md:justify-start">
					구현 페이지</h6>
				<p class="mb-4">
					<a href="signin.mem" class="text-gray-200"> 로그인 </a>, <a
						href="signup.mem" class="text-gray-200">회원가입</a>
				</p>
				<p class="mb-4">
					<a href="#!" class="text-gray-200">메인 페이지</a>
				</p>
				<p class="mb-4">
					<a href="#!" class="text-gray-200">마이 페이지</a>
				</p>
				<p class="mb-4">
					<a href="/magagineList.mag" class="text-gray-200">맛집 매거진</a>
				</p>
				<p>
					<a href="/fboard.rest?cpage=1" class="text-gray-200">맛집 </a>, <a
						href="/list.board" class="text-gray-200"> 반려견 게시판</a>
				</p>			
		
			
			</div>
		</div>
	</div>
</footer>
</html>