<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title><!-- 제목 식당이름 끌어오기 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss/dist/tailwind.min.css"
	rel="stylesheet">
	<link  rel="stylesheet"  href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"/>
<style>
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

</style>
</head>
<body>
</head>

<body class="bg-white font-sans leading-normal tracking-normal">
	<!--컨테이너 -->
	<div class="container md-container md:mx-auto h-1/2">

		<!-- carousel -->
		<div class="carousel relative shadow-2xl bg-white">
			<div class="carousel-inner relative overflow-hidden w-full">
				<!-- 메뉴,매장 사진 DB통해 끌어오기, forEach문 활용, 최대 3장 -->
				<!--Slide 1-->
				<input class="carousel-open" type="radio" id="carousel-1"
					name="carousel" aria-hidden="true" hidden="" checked="checked">
				<div class="carousel-item absolute opacity-0" style="height: 40vh;">
					<div
						class="block h-full w-full bg-indigo-500 text-white text-5xl text-center">Slide
						1</div>
					<!-- img태그. -->
				</div>
				<label for="carousel-3"
					class="prev control-1 w-10 h-10 ml-2 md:ml-10 absolute cursor-pointer hidden text-3xl font-bold text-black hover:text-white rounded-full bg-white hover:bg-blue-700 leading-tight text-center z-10 inset-y-0 left-0 my-auto">‹</label>
				<label for="carousel-2"
					class="next control-1 w-10 h-10 mr-2 md:mr-10 absolute cursor-pointer hidden text-3xl font-bold text-black hover:text-white rounded-full bg-white hover:bg-blue-700 leading-tight text-center z-10 inset-y-0 right-0 my-auto">›</label>

				<!--Slide 2-->
				<input class="carousel-open" type="radio" id="carousel-2"
					name="carousel" aria-hidden="true" hidden="">
				<div class="carousel-item absolute opacity-0" style="height: 40vh;">
					<div
						class="block h-full w-full bg-orange-500 text-white text-5xl text-center">Slide
						2</div>
				</div>
				<label for="carousel-1"
					class="prev control-2 w-10 h-10 ml-2 md:ml-10 absolute cursor-pointer hidden text-3xl font-bold text-black hover:text-white rounded-full bg-white hover:bg-blue-700 leading-tight text-center z-10 inset-y-0 left-0 my-auto">‹</label>
				<label for="carousel-3"
					class="next control-2 w-10 h-10 mr-2 md:mr-10 absolute cursor-pointer hidden text-3xl font-bold text-black hover:text-white rounded-full bg-white hover:bg-blue-700 leading-tight text-center z-10 inset-y-0 right-0 my-auto">›</label>

				<!--Slide 3-->
				<input class="carousel-open" type="radio" id="carousel-3"
					name="carousel" aria-hidden="true" hidden="">
				<div class="carousel-item absolute opacity-0" style="height: 40vh;">
					<div
						class="block h-full w-full bg-green-500 text-white text-5xl text-center">Slide
						3</div>
				</div>
				<label for="carousel-2"
					class="prev control-3 w-10 h-10 ml-2 md:ml-10 absolute cursor-pointer hidden text-3xl font-bold text-black hover:text-white rounded-full bg-white hover:bg-blue-700 leading-tight text-center z-10 inset-y-0 left-0 my-auto">‹</label>
				<label for="carousel-1"
					class="next control-3 w-10 h-10 mr-2 md:mr-10 absolute cursor-pointer hidden text-3xl font-bold text-black hover:text-white rounded-full bg-white hover:bg-blue-700 leading-tight text-center z-10 inset-y-0 right-0 my-auto">›</label>

				<!-- Add additional indicators for each slide-->
				<ol class="carousel-indicators">
					<li class="inline-block mr-3"><label for="carousel-1"
						class="carousel-bullet cursor-pointer block text-4xl text-white hover:text-blue-700">•</label>
					</li>
					<li class="inline-block mr-3"><label for="carousel-2"
						class="carousel-bullet cursor-pointer block text-4xl text-white hover:text-blue-700">•</label>
					</li>
					<li class="inline-block mr-3"><label for="carousel-3"
						class="carousel-bullet cursor-pointer block text-4xl text-white hover:text-blue-700">•</label>
					</li>
				</ol>


			</div>
		</div>


		<div class="grid gap-2 grid-col-12 grid-row-2">
		
			<div class="box-border p-4 border-4  col-span-12 row-span-2 sm:col-span-1">
			<!-- 지도 API -->
				<div>지도</div>
				<!--  주소 DB -->
				<div>
					서울시 강남구 <br>도산대로 0길 00
				</div>
			</div>
			<div class="box-border p-4 border-4 col-span-12 row-span-2 sm:col-span-1">
				<div class="text-center font-bold">가게이름</div><!-- 가게명 -->
				<div class="justify-end items-center text-right relative">
				 <div class="text-gray-700 text-right px-4 py-2 m-2 absoulute right-0"><img src="dummyImage/heart.png" class="absolute right-20" style="width:30px;height:30px;">222</div><!-- 추천수 -->
				  </div>
				  	<!-- 별점 -->
					<div class="col-span-1 row-span-3 text-right">
					3.0(1명 평가)
					<ul class="flex justify-end items-center">
					  <li><i class="fas fa-star fa-sm text-yellow-500 mr-1"></i></li>
					  <li><i class="fas fa-star fa-sm text-yellow-500 mr-1"></i></li>
					  <li><i class="fas fa-star fa-sm text-yellow-500 mr-1"></i></li>
					  <li><i class="far fa-star fa-sm text-yellow-500 mr-1"></i></li>
					  <li><i class="far fa-star fa-sm text-yellow-500 mr-1"></i></li>
					</ul>
					</div>
				<br>
				<div>
					<label>영업시간 : </label> 평일 11:00~22:00 주말 10:00~21:00 매주 화요일 휴무
				</div>

				<div>
					<label>연락처 : </label>02-123-4567, 010-1234-5555
				</div>
				<!-- 주차장 -->
				<div><label>주차 대수 : </label> 3대</div>
				
				<!-- 예약버튼 html 끌어오기 -->
				<div>네이버 예약 바로가기(버튼 삽입 예정)</div>
				
				<div>
					<div class="font-bold">메뉴 소개</div>
					<!-- 메뉴 데이터 삽입 -->
					<div>
						알리오 올리오, 10,000\ <br>라구 파스타, 10,000\ <br>짬뽕, 12,000\
					</div>
				</div>


			</div>
		</div>

		<div class="box-border  h-max p-4 border-4">
			<div class="grid grid-col-12 gap-2">
				<div class="col-span-8">
					<div class="w-2/12 sm:w-2/12 px-3">
						<img src="https://mdbootstrap.com/img/new/avatars/15.jpg"
							alt="..."
							class="rounded-full max-w-full h-auto align-middle border-none" />
					</div>
					<div>닉네임</div>
				</div>
				<div class="col-span-4 justify-right text-right">
				<!-- 추천전용 DB 별도 -->
					<button class="bg-green-300 hover:bg-green-400 text-white font-bold py-2 px-4 rounded-full justify-right">리뷰 추천하기</button>
					<!-- 구현 방법 생각.. -->
					<button class="bg-green-300 hover:bg-red-400 text-white font-bold py-2 px-4 rounded-full justify-right">신고하기</button>
					<!-- 별점, 숫자 넣어서 구분하는 방법 찾기 -->
					<div class="col-span-8 row-span-3">
					<label>별점 </label>3.0
					<ul class="flex justify-end items-center">
					  <li><i class="fas fa-star fa-sm text-yellow-500 mr-1"></i></li>
					  <li><i class="fas fa-star fa-sm text-yellow-500 mr-1"></i></li>
					  <li><i class="fas fa-star fa-sm text-yellow-500 mr-1"></i></li>
					  <li><i class="far fa-star fa-sm text-yellow-500 mr-1"></i></li>
					  <li><i class="far fa-star fa-sm text-yellow-500 mr-1"></i></li>
					</ul>
					</div>

				</div>
				<div class="col-span-12">
				  <label>추천 </label> 122</div><!-- 추천수 -->
				<div class="col-span-1">
					<img src="dummyImage/pizza.jpg"
						style="height: 180px; width: 180px;">
				</div>
				<div class="col-span-11">글</div>
			</div>
		</div>
		<form>
			<div class="grid grid-col-12 gap-2 box-border p-4 h-max border-4 text-center">
				<div class="bg-green-100 col-span-12">리뷰 등록</div>
				<div class="col-span-12">
					<textarea placeholder="리뷰 작성"
						class="form-textarea mt-1 block w-full" rows="3"></textarea>
				</div>
				<div class="col-span-10 justify-left text-left">
				<!-- 사진 1장만 -->
				 <input type="file" class="w-full text-gray-700 px-3 py-2 border rounded">
				</div>
				<div class="col-span-2 text-right">
					<button
						class="bg-green-300 hover:bg-green-400 text-white font-bold py-2 px-4 rounded-full justify-right">댓글
						등록</button>
				</div>
			</div>
		</form>



	</div>

</body>
</html>