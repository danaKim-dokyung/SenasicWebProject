<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="/path/to/tailwind.css" rel="stylesheet">
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

<!-- Required form plugin -->
<link
	href="https://cdn.jsdelivr.net/npm/@tailwindcss/custom-forms@0.2.1/dist/custom-forms.css"
	rel="stylesheet" />
<!-- Required font awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />

<style>
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
</style>
</head>
<body>


	<header
		class="text-gray-600 body-font sticky inset-x-0 top-0 left-0  py-5">
		<div
			class="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
			<a
				class="flex title-font font-medium items-center text-gray-900 mb-4 md:mb-0">

				<span class="ml-3 text-xl">Senasic</span> <!-- 왼쪽 상단 세나식 로고 -->
			</a>
			<nav
				class="md:ml-auto flex flex-wrap items-center text-base justify-center">
				<!-- top에 붙어있는 nav bar -->

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
						<!-- 
			<script>
                    $("#logout").on("click", function(){ 
                        if(confirm("정말 로그아웃 하시겠습니까?")){
                            location.href="/logout.mem";
                        }
                    })
                </script>
			 -->

					</c:otherwise>

				</c:choose>


			</nav>
		</div>
	</header>
	<div id="logo">
		<!-- 가운데 로고가 들어가는 자리 -->
		세상에 나쁜 개는 없다
	</div>
	<nav>
		<div class="grid grid-cols-9 gap-4 ">
			<div class="...">1</div>
			<!-- 왼쪽 여백 -->


			<div class="col-span-7">
				<!-- 게시판 네비게이션 -->
				<ul class="nav-container">
					<li class="nav-itme"><a href="">맛집 리스트</a></li>
					<li class="nav-itme"><a href="">맛집 매거진</a></li>
					<li class="nav-itme"><a href="/list.pet?cpage=1">반려견 게시판</a></li>
				</ul>


			</div>



			<div class="...">3</div>
			<!-- 오른쪽 여백 -->

		</div>




	</nav>
<body>
	<!-- Contents -->
	<div class="grid grid-cols-9 gap-4 ">
		<div class="...">1</div>
		<!-- 왼쪽 여백 -->


		<div class="col-span-7">
			<!-- contents : 이미지 + 검색창 + 태그 -->



			<!-- Large -->
			<div class="relative flex w-full flex-wrap items-stretch mb-3">
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
					<i class="fas fa-search"></i>
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


		</div>


		<div class="...">3</div>
		<!-- 오른쪽 여백 -->

	</div>

</body>


<!-- footer -->
<footer class="text-gray-600 body-font">
	<!-- Footer -->
	<div
		class="container px-5 py-24 mx-auto flex md:items-center lg:items-start md:flex-row md:flex-nowrap flex-wrap flex-col">
		<div
			class="w-64 flex-shrink-0 md:mx-0 mx-auto text-center md:text-left md:mt-0 mt-10">
			<a
				class="flex title-font font-medium items-center md:justify-start justify-center text-gray-900">
				<svg xmlns="http://www.w3.org/2000/svg" fill="none"
					stroke="currentColor" stroke-linecap="round"
					stroke-linejoin="round" stroke-width="2"
					class="w-10 h-10 text-white p-2 bg-indigo-500 rounded-full"
					viewBox="0 0 24 24">
          <path
						d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"></path>
        </svg> <span class="ml-3 text-xl">Tailblocks</span>
			</a>
			<p class="mt-2 text-sm text-gray-500">Air plant banjo lyft occupy
				retro adaptogen indego</p>
		</div>
		<div
			class="flex-grow flex flex-wrap md:pr-20 -mb-10 md:text-left text-center order-first">
			<div class="lg:w-1/4 md:w-1/2 w-full px-4">
				<h2
					class="title-font font-medium text-gray-900 tracking-widest text-sm mb-3">CATEGORIES</h2>
				<nav class="list-none mb-10">
					<li><a class="text-gray-600 hover:text-gray-800">First
							Link</a></li>
					<li><a class="text-gray-600 hover:text-gray-800">Second
							Link</a></li>
					<li><a class="text-gray-600 hover:text-gray-800">Third
							Link</a></li>
					<li><a class="text-gray-600 hover:text-gray-800">Fourth
							Link</a></li>
				</nav>
			</div>
			<div class="lg:w-1/4 md:w-1/2 w-full px-4">
				<h2
					class="title-font font-medium text-gray-900 tracking-widest text-sm mb-3">CATEGORIES</h2>
				<nav class="list-none mb-10">
					<li><a class="text-gray-600 hover:text-gray-800">First
							Link</a></li>
					<li><a class="text-gray-600 hover:text-gray-800">Second
							Link</a></li>
					<li><a class="text-gray-600 hover:text-gray-800">Third
							Link</a></li>
					<li><a class="text-gray-600 hover:text-gray-800">Fourth
							Link</a></li>
				</nav>
			</div>
			<div class="lg:w-1/4 md:w-1/2 w-full px-4">
				<h2
					class="title-font font-medium text-gray-900 tracking-widest text-sm mb-3">CATEGORIES</h2>
				<nav class="list-none mb-10">
					<li><a class="text-gray-600 hover:text-gray-800">First
							Link</a></li>
					<li><a class="text-gray-600 hover:text-gray-800">Second
							Link</a></li>
					<li><a class="text-gray-600 hover:text-gray-800">Third
							Link</a></li>
					<li><a class="text-gray-600 hover:text-gray-800">Fourth
							Link</a></li>
				</nav>
			</div>
			<div class="lg:w-1/4 md:w-1/2 w-full px-4">
				<h2
					class="title-font font-medium text-gray-900 tracking-widest text-sm mb-3">CATEGORIES</h2>
				<nav class="list-none mb-10">
					<li><a class="text-gray-600 hover:text-gray-800">First
							Link</a></li>
					<li><a class="text-gray-600 hover:text-gray-800">Second
							Link</a></li>
					<li><a class="text-gray-600 hover:text-gray-800">Third
							Link</a></li>
					<li><a class="text-gray-600 hover:text-gray-800">Fourth
							Link</a></li>
				</nav>
			</div>
		</div>
	</div>
	<div class="bg-gray-100">
		<div
			class="container mx-auto py-4 px-5 flex flex-wrap flex-col sm:flex-row">
			<p class="text-gray-500 text-sm text-center sm:text-left">
				(주)세상에 나쁜 식당은 없다 <a href="https://twitter.com/knyttneve"
					rel="noopener noreferrer" class="text-gray-600 ml-1"
					target="_blank">@knyttneve</a>
			</p>
			<span
				class="inline-flex sm:ml-auto sm:mt-0 mt-2 justify-center sm:justify-start">
				<a class="text-gray-500"> <svg fill="currentColor"
						stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
						class="w-5 h-5" viewBox="0 0 24 24">
            <path
							d="M18 2h-3a5 5 0 00-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 011-1h3z"></path>
          </svg>
			</a> <a class="ml-3 text-gray-500"> <svg fill="currentColor"
						stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
						class="w-5 h-5" viewBox="0 0 24 24">
            <path
							d="M23 3a10.9 10.9 0 01-3.14 1.53 4.48 4.48 0 00-7.86 3v1A10.66 10.66 0 013 4s-4 9 5 13a11.64 11.64 0 01-7 2c9 5 20 0 20-11.5a4.5 4.5 0 00-.08-.83A7.72 7.72 0 0023 3z"></path>
          </svg>
			</a> <a class="ml-3 text-gray-500"> <svg fill="none"
						stroke="currentColor" stroke-linecap="round"
						stroke-linejoin="round" stroke-width="2" class="w-5 h-5"
						viewBox="0 0 24 24">
            <rect width="20" height="20" x="2" y="2" rx="5" ry="5"></rect>
            <path
							d="M16 11.37A4 4 0 1112.63 8 4 4 0 0116 11.37zm1.5-4.87h.01"></path>
          </svg>
			</a> <a class="ml-3 text-gray-500"> <svg fill="currentColor"
						stroke="currentColor" stroke-linecap="round"
						stroke-linejoin="round" stroke-width="0" class="w-5 h-5"
						viewBox="0 0 24 24">
            <path stroke="none"
							d="M16 8a6 6 0 016 6v7h-4v-7a2 2 0 00-2-2 2 2 0 00-2 2v7h-4v-7a6 6 0 016-6zM2 9h4v12H2z"></path>
            <circle cx="4" cy="4" r="2" stroke="none"></circle>
          </svg>
			</a>
			</span>
		</div>
	</div>
</footer>

</body>
</html>