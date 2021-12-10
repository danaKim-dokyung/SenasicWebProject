<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					<!-- img태그. -->
				<input class="carousel-open" type="radio" id="carousel-1"
					name="carousel" aria-hidden="true" hidden="" checked="checked">
				<div class="carousel-item absolute opacity-0" style="height: 40vh;">
					<div class="block h-full w-fulltext-white text-5xl text-center">
						<img src=${dto.photo1 } style="width:100%;hieght:100%;">
					</div>
				</div>
				<label for="carousel-3"
					class="prev control-1 w-10 h-10 ml-2 md:ml-10 absolute cursor-pointer hidden text-3xl font-bold text-black hover:text-white rounded-full bg-white hover:bg-blue-700 leading-tight text-center z-10 inset-y-0 left-0 my-auto">‹</label>
				<label for="carousel-2"
					class="next control-1 w-10 h-10 mr-2 md:mr-10 absolute cursor-pointer hidden text-3xl font-bold text-black hover:text-white rounded-full bg-white hover:bg-blue-700 leading-tight text-center z-10 inset-y-0 right-0 my-auto">›</label>

				<!--Slide 2-->
				<input class="carousel-open" type="radio" id="carousel-2"
					name="carousel" aria-hidden="true" hidden="">
				<div class="carousel-item absolute opacity-0" style="height: 40vh;">
					<div class="block h-full w-full text-white text-5xl text-center">
											<img src=${dto.photo2 }  style="width:100%;hieght:100%;">
					</div>
				</div>
				<label for="carousel-1"
					class="prev control-2 w-10 h-10 ml-2 md:ml-10 absolute cursor-pointer hidden text-3xl font-bold text-black hover:text-white rounded-full bg-white hover:bg-blue-700 leading-tight text-center z-10 inset-y-0 left-0 my-auto">‹</label>
				<label for="carousel-3"
					class="next control-2 w-10 h-10 mr-2 md:mr-10 absolute cursor-pointer hidden text-3xl font-bold text-black hover:text-white rounded-full bg-white hover:bg-blue-700 leading-tight text-center z-10 inset-y-0 right-0 my-auto">›</label>

				<!--Slide 3-->
				<input class="carousel-open" type="radio" id="carousel-3"
					name="carousel" aria-hidden="true" hidden="">
				<div class="carousel-item absolute opacity-0" style="height: 40vh;">
					<div class="block h-full w-full  text-white text-5xl text-center">
						<img src=${dto.photo3 }  style="width:100%;hieght:100%;">
					</div>
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


		<div class="grid gap-2 grid-col-12 md:grid-flow-col">
		
			<div class="box-border p-4 border-4  col-span-12 md:col-span-3">
			<!-- 지도 API -->
				<div class="flex justify-center">
					<div id="map" class="items-center w-full h-48 md:h-96"></div>
				</div>
				<!--  주소 DB -->
				<div class="text-center">
					${dto.locate } ${dto.locate_detail }
				</div>
			</div>
			<div class="box-border p-4 border-4 col-span-12 md:col-span-9">
				
				<div class="justify-between items-center text-right relative flex">
					<div class="text-center font-bold text-4xl">${dto.title }</div><!-- 가게명 -->
				
				 <div class="text-gray-700 text-right px-4 py-2 m-2 absoulute right-0">
				<svg xmlns="http://www.w3.org/2000/svg" className="h-3 w-3" fill="white" viewBox="0 0 24 24" class="stroke-current text-red-600">
				<path fillRule="evenodd" d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z" clipRule="evenodd" id="like"/>
				</svg>
				
				<div>
				추천 : ${dto.recommend }<!-- 추천수 -->
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
					<label>연락처 : </label>${dto.phone}
				</div>
				<!-- 주차장 -->
				<div><label>주차 대수 : </label> ${dto.garage }</div>
				
					<div class="font-bold">메뉴 소개</div>
					<!-- 메뉴 데이터 삽입 -->
					<div>
						${menu.menu1 } <br>${menu.menu2 } <br>${menu.menu3 }
					</div>
					
									<!-- 예약버튼 html 끌어오기 -->
				<div class="flex justify-end">
					<button class="bg-transparent hover:bg-green-600 text-green-700 font-semibold hover:text-white py-2 px-4 border border-green-600 hover:border-transparent rounded"><a href=${dto.link }>네이버 예약</a></button></div>
				<div>
					
					
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
					<button class="bg-green-300 hover:bg-green-400 text-white font-bold py-2 px-4 rounded-full justify-right" id="rvrcmd">리뷰 추천하기</button>
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
		<form action="/reply.rest" method="post" enctype="multipart/form-data">
			<input type="hidden" value=${dto.seq } id="seq" name="seq">		
			<div class="grid grid-col-12 gap-2 box-border p-4 h-max border-4 text-center">
				<div class="bg-green-100 col-span-12">리뷰 등록</div>				
					<div class="justify-between flex col-span-2 w-44 ml-12">
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
				<div class="flex mt-1 w-full col-span-10">
				       <textarea placeholder="리뷰 작성" class="flex form-textarea block w-full resize-none mr-6" rows="5" name="contents"></textarea>
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
					      <option value=5.0>5.0</option>
					    </select>
					  </label>
					<button class="bg-green-300 hover:bg-green-400 text-white font-bold py-2 px-4 rounded-full mt-5 justify-end h-1/2" type="submit">댓글 등록</button>
				</div>
			</div>
		</form>
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
	
$("#like").on("click",function(){
	alert("hello");
})
	</script>


</body>
</html>