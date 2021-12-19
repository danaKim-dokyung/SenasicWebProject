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

<body class="bg-white font-sans leading-normal tracking-normal">
	<!--컨테이너 -->
	<div class="container md-container md:mx-auto h-1/2">

	<div class="flex box-border border-4">
					<div class="justify-center mt-4 ml-4">
						<img src=${dto.photo1 } style="width:90%;height:90%;">
					</div>

				<!--Slide 2-->
					<div class="justify-center mt-4">
											<img src=${dto.photo2 }  style="width:90%;height:90%;">
					</div>

				<!--Slide 3-->
					<div class="justify-center mt-4">
						<img src=${dto.photo3 }  style="height: 90%;width:90%;">
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
					<button class="bg-green-300 hover:bg-green-400 text-white font-bold py-2 px-4 rounded-full mt-5 justify-end h-1/2" type="submit" id="inputReply">댓글 등록</button>
				</div>
			</div>
		</form>
		
		
<!-- 리뷰 보기 -->
<c:set var="rvStar" value="1" />
<c:forEach var="reply" items="${reply }">
		<div class="box-border  h-max p-4 border-4 flex grid grid-col-12 gird-rows-7 gap-2 flex">
			<div class="rows-span-3 col-span-12 flex justify-between">
				<div class="col-start-1 col-end-2 row-span-3 flex">
					<div class="px-3 row-span-2 col-span-1">
					<!-- 프로필사진 자리 -->
						<img src="https://mdbootstrap.com/img/new/avatars/15.jpg"
							class="rounded-full max-w-20 h-20 item-left border-none" />
					
					
					</div>
					
					
					
					
					<div class="row-span-1 col-span-1">${reply.writer }</div>
				</div>
					<div class="col-start-7 col-end-12 justify-right text-right row-span-3">
				<!-- 추천전용 DB 별도 -->
				<div class=col-span-9>
					<c:choose>
					<c:when test="${reply.id eq loginID }">
					<button class="bg-green-300 hover:bg-red-400 text-white font-bold py-2 px-4 rounded-full justify-right reviewDel">
					삭제
					<input type="hidden" class="replySeq" value="${reply.seq }">
					</button>
					</c:when>
					<c:otherwise>
					<button class="bg-green-300 hover:bg-green-500 text-white font-bold py-2 px-4 rounded-full justify-right reviewR">
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
					<img src="${reply.photo }"
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
 
   
</script>


</body>
</html>