<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${dto.title }</title><!-- 제목 식당이름 끌어오기 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/tailwindcss/dist/tailwind.min.css" rel="stylesheet">
<link  rel="stylesheet"  href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"/>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43b19f59c0f83232d0344714fa6823a9&libraries=services,clusterer,drawing"></script>

	
	
	
<style>

#review{
border-radius:10px;
pidding:30px
}
#contents{
border:1px solid gray;
border-radius:10px
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
	color: #2b6cb0;
	/*Set to match the Tailwind colour you want the active one to be */
}

button:focus {
	outline: 1px dotted;
	outline: 5px auto -webkit-focus-ring-color;
}

#like:hover{
	fill:#DC2626;
	transition-duration: 0.3s;
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




  .mImg {
  }
}

li:hover {
   color: green;
}

li>a { text-style:bold}

ul{
text-align:center;
}

@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
* {font-family: GmarketSansMedium;}

#header{
   padding:0px;
   border-bottom-left-radius: 30px;
   border-bottom-right-radius: 30px;
    box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}

body{
letter-spacing :1.5px; 
color:gray;
}


</style>
<script>
	$(document).ready(function(){
		  if(${user}==0){
			  $("#heart").attr("fill","#dc2626");
		  }else if(${user}==1){
			  $("#heart").attr("fill","white");
		  }
	})
</script>

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
	</div> <!--  head 끝 -->



<body class="bg-white font-sans leading-normal tracking-normal">
	<!--컨테이너 -->
	<div class="container md-container md:mx-auto h-1/2">

	<div class="flex box-border justify-center mb-10 ml-10 mr-10 radio-btns" role="radiogroup">
					<div class="justify-center p-10 radio-btns__btn" role="radio" aria-checked="false" tabindex="-1" aria-label="Select image one">
						<img src=${dto.photo1 } class="w-80 h-64 mImg">
					</div>

				<!--Slide 2-->
					<div class="justify-center p-10 radio-btns__btn" role="radio" aria-checked="false" tabindex="-1" aria-label="Select image two">
						<img src=${dto.photo2 }  class="w-80 h-64 mImg">
					</div>

				<!--Slide 3-->
					<div class="justify-center p-10 radio-btns__btn" role="radio" aria-checked="false" tabindex="-1" aria-label="Select image three">
						<img src=${dto.photo3 }  class="w-80 h-64 mImg">
					</div>
			</div>

		<div class="grid gap-2 grid-col-12 md:grid-flow-col">
		
			<div class="box-border p-4   col-span-12 md:col-span-3">
			<!-- 지도 API -->
				<div class="flex justify-center">
					<div id="map" class="items-center w-full h-48 md:h-96"></div>
				</div>
				<!--  주소 DB -->
				<div class="text-center">
					${dto.locate } ${dto.locate_detail }
				</div>
			</div>
			
			<div class="box-border p-4 col-span-12 md:col-span-9">
				
				<div class="justify-between items-center text-right relative flex">
					<div class="text-center font-bold text-4xl">${dto.title }</div><!-- 가게명 -->
				
				 <div class="text-gray-700 text-right px-4 py-2 m-2 absoulute right-0">
				<svg xmlns="http://www.w3.org/2000/svg" className="h-3 w-3" fill="white" viewBox="0 0 24 24" class="stroke-current text-red-600" id="heart">
				<path fillRule="evenodd" d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z" clipRule="evenodd" id="like"/>
				</svg>
				
				<div>
				<label>추천수 </label><span id="recommandN">${dto.recommend }</span><!-- 추천수 -->
				</div>
				</div>
				</div>
				
				  	<!-- 별점 -->
					<div class="col-span-1 row-span-3 text-right">
					${dto.rate }
					<ul class="flex justify-end items-center">
					<c:set var="rt" value="${dto.rate }"/>
					<c:forEach var='cnt' begin='1' end='5'>	
						<li>
						  <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8" viewBox="0 0 20 20" fill="currentColor">
							    <defs>
							        <linearGradient id="half_grad${cnt }">
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
						  <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" fill="url(#half_grad${cnt })" stroke-width="1" stroke="orange"/>
								</svg>
							</li>
					</c:forEach>
					</ul>
					</div>
				<br>
				<div>
					<label>영업시간 : </label> ${dto.open_hour }
				</div>

				<div>
					<label> 연 락 처 : </label>${dto.phone}
				</div>
				<!-- 주차장 -->
				<div><label>주 &#160; &#160; 차 : </label> ${dto.garage }</div>
				
					<div class="font-bold"><br>메뉴 소개</div>
					<!-- 메뉴 데이터 삽입 -->
					<div class="flex">
						<div>
							${menu.menu1 }<br>
							${menu.menu2 }<br>
							${menu.menu3 }
						</div>
						<div class="ml-4">
							${menu.price1 }\<br>
							${menu.price2 }\<br>
							${menu.price3 }\
							
						</div>
					</div>
					
									<!-- 예약버튼 html 끌어오기 -->
				<div class="flex justify-end">
					<button class="bg-transparent hover:bg-green-600 text-green-700 font-semibold hover:text-white py-2 px-4 border border-green-600 hover:border-transparent rounded"><a href=${dto.link }>네이버 예약</a></button></div>
				<div>
					
					
				</div>

			</div>
		</div>

<!-- 리뷰 작성 -->		
				<form action="/reply.rest" method="post" enctype="multipart/form-data">
			<input type="hidden" value=${dto.seq } id="seq" name="seq">		
			<div class="grid grid-col-12 gap-2 box-border p-4 h-max text-center mt-8">
				<div class="bg-green-900 col-span-12 text-white" id="review">리뷰 등록</div>			
					<div class="justify-between flex col-span-2 w-44 ml-12 mt-4">
				                <label class="flex flex-col w-full px-3 border-4 border-dashed hover:bg-gray-100 hover:border-gray-300">
				                    <div class="flex flex-col items-center justify-center pt-7" id="ph">
				                        <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-gray-400 group-hover:text-gray-600" viewBox="0 0 20 20"
				                            fill="currentColor">
				                            <path fill-rule="evenodd"  d="M4 3a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V5a2 2 0 00-2-2H4zm12 12H4l4-8 3 6 2-4 3 6z"
				                                clip-rule="evenodd" />
				                        </svg>
				                    </div>
				                    <input accept="image/*" id="img" type="file" class="opacity-0" name="photo" />
				                </label>                    
				</div>
				<div class="flex mt-1 w-full col-span-10 mt-4">
				       <textarea placeholder="리뷰 작성" class="flex form-textarea block w-full resize-none mr-6" rows="5" name="contents" id="contents"></textarea>
				</div>
				

				<div class="col-span-12 justify-between flex w-full h-20">
					     <label class="block mt-4">
					    <span class="text-gray-700">평점</span>
					    <select class="form-select mt-1 block w-full" name="rating">
					      <option value=1.0>1.0</option>
					      <option value=1.5>1.5</option>
					      <option value=2.0>2.0</option>
					      <option value=2.5>2.5</option>
					      <option value=3.0>3.0</option>
					      <option value=3.5>3.5</option>
					      <option value=4.0>4.0</option>
					      <option value=4.5>4.5</option>
					      <option value=5.0 selected>5.0</option>
					    </select>
					  </label>
					<button class="bg-green-600 hover:bg-green-800 text-white font-bold py-2 px-4 rounded-full mt-5 justify-end h-1/2" type="submit" id="inputReply">등록</button>
				</div>
			</div>
		</form>
		
		
<!-- 리뷰 보기 -->
<c:set var="rvStar" value="1" />
<c:set var="rvStar1" value="0" />
<c:forEach var="reply" items="${reply }">

		<div class="box-border border-t-2 h-max p-4 flex grid grid-col-12 gird-rows-7 gap-2 flex">
			<div class="rows-span-3 col-span-12 flex justify-between">
				<div class="col-start-1 col-end-2 row-span-3 flex">
					<div class="px-3 row-span-2 col-span-1">
					<!-- 프로필사진 자리 -->
						<img src="${str.get(rvStar1) }"
	class="rounded-full w-16 h-16 item-left border-none" />
					<c:set var="rvStar1" value="${rvStar1+1}" />
					
					</div>
					
					
					
					
					<div class="row-span-1 col-span-1">${reply.writer }</div>
				</div>
					<div class="col-start-7 col-end-12 justify-right text-right row-span-3">
				<!-- 추천전용 DB 별도 -->
				<div class=col-span-9>
					<c:choose>
					<c:when test="${reply.id eq loginID }">
					<button class="bg-green-600 hover:bg-red-600 text-white font-bold py-2 px-4 rounded-full justify-right reviewDel">
					삭제
					<input type="hidden" class="replySeq" value="${reply.seq }">
					</button>
					</c:when>
					<c:otherwise>
					<button class="bg-green-600 hover:bg-green-800 text-white font-bold py-2 px-4 rounded-full justify-right reviewR">
					추천
					<input type="hidden" class="replySeq" value="${reply.seq }">
					</button>
					</c:otherwise>
					</c:choose>
				</div>
					<div class="col-span-9 row-span-1 flex justify-end">
					<label>별점 </label>${reply.rate }
					<ul class="justify-end items-center flex">
					<c:set var="rprt" value="${reply.rate }"/>
					<c:forEach var='cn' begin='1' end='5'>
					
				        <c:set var="rvStar" value="${rvStar+1}" />    	
						<li>
						  <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" viewBox="0 0 20 20" fill="currentColor">
							    <defs>
							        <linearGradient id="grad${rvStar }">
							        	<c:choose>
								        	<c:when test= "${cn<=rprt }">
								        		<stop offset="100%" stop-color="orange"/>
								        	</c:when>
								        	<c:when test="${cn>rprt and cn-1<rprt }">
								        		<stop offset="${100-(cn-rprt)*100 }%" stop-color="orange"/>
								        		<stop offset="${(cn-rprt)*100 }%" stop-color="white"/>
								        	</c:when>
											<c:otherwise>
									            <stop offset="100%" stop-color="white" stop-opacity="1" />							        	
											</c:otherwise>										
							        	</c:choose> 	
							        </linearGradient>
							    </defs>
						  <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" fill="url(#grad${rvStar })" stroke-width="1" stroke="orange"/>
								</svg>
							</li>
					</c:forEach>
					</ul>
					</div>
					<div class="col-span-9 row-span-1">
				 ${reply.getFormdDate() }	<br>
				  <label>추천 </label> <span id="replyRcmd${reply.seq }">${reply.recommand }</span>
				 </div>
				 </div>
				</div>
				
				<div class="col-span-1 row-span-4">
					<img src=
					<c:choose>
					
					<c:when test="${reply.photo.substring(fn:length(reply.photo)-4,fn:length(reply.photo)) eq 'null'}">
					"http://elkin.kr/board/img/no_img.png"
					</c:when>
					<c:otherwise>
					"${reply.photo }"
					
					</c:otherwise>
					</c:choose>
					
						style="height: 180px; width: 180px;">
				</div>
				<div class="col-span-11 flex row-span-4">${reply.contents }</div>
			</div>
</c:forEach>
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
					<a href="/load.rest?seq=${dto.seq }&rvpg=${navi }" class="relative inline-flex items-center px-2 py-2 rounded-l-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
			          <span class="sr-only">Previous</span>
			          <!-- Heroicon name: solid/chevron-left -->
			          <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
			            <path fill-rule="evenodd" d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clip-rule="evenodd" />
			          </svg>
			        </a>	
			</c:when> 
       		<c:when test="${rvPg eq navi }">
			        <a href="#" aria-current="page" class="z-10 bg-indigo-50 border-indigo-500 text-indigo-600 relative inline-flex items-center px-4 py-2 border text-sm font-medium">
			          ${navi }
			        </a>
       		</c:when>
       		<c:when test="${navi!=1 and (navi%10) eq 1 and navi!=Snum}">
			     <a href="/load.rest?seq=${dto.seq }&rvpg=${navi }" class="relative inline-flex items-center px-2 py-2 rounded-r-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
			          <span class="sr-only">Next</span>
			          <!-- Heroicon name: solid/chevron-right -->
			          <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
			            <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd" />
			          </svg>
			        </a>
       		</c:when>
       		<c:otherwise>
			        <a href="/load.rest?seq=${dto.seq }&rvpg=${navi }" class="bg-white border-gray-300 text-gray-500 hover:bg-gray-50 relative inline-flex items-center px-4 py-2 border text-sm font-medium">
			          ${navi}
			        </a>
			       		
       		</c:otherwise>
       		</c:choose>
        </c:forEach>
   
      </nav>
    </div>
  </div>
</div>


	</div>

<script>
//지도 API
let mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 1 // 지도의 확대 레벨
};  

//지도를 생성합니다    
let map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
let geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch('${dto.locate},${dto.locate_detail}', function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });


    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});     

//이미지 파일 미리보기
$("#img").on("change",function(){
	let file = this.files[0];
	if (file) {
	    $("#ph").html("<img class='w-full h-20' src = "+URL.createObjectURL(file)+">");
	  }
	})

$("#inputReply").on("click",function(){
	if(${loginID==null}){
		alert("회원전용 기능입니다.")
		return false;
	}
})
//like 버튼눌렀을떄
   $("#like").on("click",function(){
      if(${loginID !=null}){
    	  $.ajax({
    		url:"/like.rest?seq=${dto.seq}",
    		dataType:"json"
    	  }).done(function(resp){
    		  console.log(resp);
    		  $("#recommandN").text(resp[0]);
    		  if(resp[1]==1){
    			  $("#heart").attr("fill","#dc2626");
    		  }else if(resp[1]==0){
    			  $("#heart").attr("fill","white");
    		  }
    	  });
      }else{
         alert("로그인 후 이용해 주세요");
      }      
   })
   
   //리뷰삭제
   $(".reviewDel").on("click",function(){
	   let replySeq = $(this).find(".replySeq").val();
		 if (confirm("삭제하시겠습니까?")) {
	   			location.href="/reviewDel.rest?num="+replySeq+"&seq="+${dto.seq};
			} 
	})
	
	//리뷰추천
	$(".reviewR").on("click",function(){
		let replySeq = $(this).find(".replySeq").val();
      if(${loginID !=null}){
    	  $.ajax({
    		url:"/reviewLike.rest?seq="+replySeq,
    		dataType:"json"
    	  }).done(function(resp){
    		  console.log(resp);
    		  $("#replyRcmd"+replySeq).text(resp[0]);
    		  if(resp[1]==1){
    			  alert("추천되었습니다.");
    		  }else if(resp[1]==0){
    			  alert("이미 추천한 리뷰입니다.");
    		  }
    	  });
      }else{
         alert("로그인 후 이용해 주세요");
      }      
   })
	 
   $("#inputReply").on("click",function(){
	   let regex = /([\s\S]){5,2000}/;
	   let contents = $("#contents").val();
       let result = regex.test(contents);
       if(!result){
       	alert("리뷰를 5자 이상 입력해주세요.");
       	return false;
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
<!-- footer -->
<footer class="text-center lg:text-left bg-gray-100 text-gray-600">
	<div
		class="flex justify-center items-center lg:justify-between p-6 border-b border-gray-300">
		<div class="mr-12 hidden lg:block"></div>
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
					<svg aria-hidden="true" focusable="false" data-prefix="fab"
						data-icon="github" class="svg-inline--fa fa-github w-4" role="img"
						xmlns="http://www.w3.org/2000/svg" viewBox="0 0 496 512">
                <path fill="currentColor"
							d="M165.9 397.4c0 2-2.3 3.6-5.2 3.6-3.3.3-5.6-1.3-5.6-3.6 0-2 2.3-3.6 5.2-3.6 3-.3 5.6 1.3 5.6 3.6zm-31.1-4.5c-.7 2 1.3 4.3 4.3 4.9 2.6 1 5.6 0 6.2-2s-1.3-4.3-4.3-5.2c-2.6-.7-5.5.3-6.2 2.3zm44.2-1.7c-2.9.7-4.9 2.6-4.6 4.9.3 2 2.9 3.3 5.9 2.6 2.9-.7 4.9-2.6 4.6-4.6-.3-1.9-3-3.2-5.9-2.9zM244.8 8C106.1 8 0 113.3 0 252c0 110.9 69.8 205.8 169.5 239.2 12.8 2.3 17.3-5.6 17.3-12.1 0-6.2-.3-40.4-.3-61.4 0 0-70 15-84.7-29.8 0 0-11.4-29.1-27.8-36.6 0 0-22.9-15.7 1.6-15.4 0 0 24.9 2 38.6 25.8 21.9 38.6 58.6 27.5 72.9 20.9 2.3-16 8.8-27.1 16-33.7-55.9-6.2-112.3-14.3-112.3-110.5 0-27.5 7.6-41.3 23.6-58.9-2.6-6.5-11.1-33.3 2.6-67.9 20.9-6.5 69 27 69 27 20-5.6 41.5-8.5 62.8-8.5s42.8 2.9 62.8 8.5c0 0 48.1-33.6 69-27 13.7 34.7 5.2 61.4 2.6 67.9 16 17.7 25.8 31.5 25.8 58.9 0 96.5-58.9 104.2-114.8 110.5 9.2 7.9 17 22.9 17 46.4 0 33.7-.3 75.4-.3 83.6 0 6.5 4.6 14.4 17.3 12.1C428.2 457.8 496 362.9 496 252 496 113.3 383.5 8 244.8 8zM97.2 352.9c-1.3 1-1 3.3.7 5.2 1.6 1.6 3.9 2.3 5.2 1 1.3-1 1-3.3-.7-5.2-1.6-1.6-3.9-2.3-5.2-1zm-10.8-8.1c-.7 1.3.3 2.9 2.3 3.9 1.6 1 3.6.7 4.3-.7.7-1.3-.3-2.9-2.3-3.9-2-.6-3.6-.3-4.3.7zm32.4 35.6c-1.6 1.3-1 4.3 1.3 6.2 2.3 2.3 5.2 2.6 6.5 1 1.3-1.3.7-4.3-1.3-6.2-2.2-2.3-5.2-2.6-6.5-1zm-11.4-14.7c-1.6 1-1.6 3.6 0 5.9 1.6 2.3 4.3 3.3 5.6 2.3 1.6-1.3 1.6-3.9 0-6.2-1.4-2.3-4-3.3-5.6-2z">
                </path>
                 </svg>
					&nbsp;Hotsix's Github
				</h6>
				<p class="mb-4">
					<a href="#!" class="text-gray-600">임도혁"s Github</a>
				</p>
				<p class="mb-4">
					<a href="https://github.com/danaKim-dokyung" class="text-gray-600">김도경"s
						Github</a>
				</p>
				<p class="mb-4">
					<a href="https://github.com/KwakSeoHo" class="text-gray-600">곽서호"s
						Github</a>
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