<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식당 게시판 글 수정</title>
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

<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
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
</style>
</head>
<body>
<body style="font-family: Roboto">
	<div id="app" class="relative h-screen">
		<div class="sidebar w-1/7 fixed h-screen bg-green-600 z-10">
			<div
				class="image-menu flex items-center mx-2 py-6 overflow-hidden z-10 border-b border-green-700">
				<img class="menu-icon border-2 w-10 h-10 rounded-full"
					src="http://web2tailwind.com/assets/docs/master/image-01.jpg">
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
							<div id="modify"
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
							<div
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
				<div class=" flex items-center justify-between pb-6">
					<div>
						<h2 class="text-gray-600 font-semibold">나의 게시판 모아보기</h2>
					</div>
			<!-- 		<button id="main">click</button> -->
					
					 <!-- 목록으로 돌아가기 -->
					<div
						style="height: 60px; margin: auto; width: 800px; margin-top: 100px;">
						<button type="button" id="main"
							class="border border-green-500 text-green-500 hover:bg-green-400 hover:text-gray-100 rounded px-4 py-2"
							style="float: right;">메인화면</button>
					</div>
					
					
				</div>
				<div>
					<div class="-mx-4 sm:-mx-8 px-4 sm:px-8 py-4 overflow-x-auto">
						<div
							class="inline-block min-w-full shadow rounded-lg overflow-hidden">
							<table class="min-w-full leading-normal">
								<thead>
									<tr>
										<th
											class="px-5 w-1/12 py-3 text-center border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
											#</th>
										<th
											class="px-5 w-7/12 py-3 text-center border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
											제목</th>
										<th
											class="px-5 w-1/12 py-3 text-center border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
											닉네임</th>
										<th
											class="px-5 w-1/12 py-3 text-center border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
											작성일</th>
										<th
											class="px-5 w-1/12 py-3 text-center border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
											조회수</th>
										<th
											class="px-5 w-1/12 py-3 text-center border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
											추천수</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach var="dto" items="${list }">
										<tr>
											<td
												class="px-5 w-1/12 text-center py-5 border-b border-gray-200 bg-white text-sm">
												<div class="flex items-center">
													<div class="ml-3">
														<p class="text-gray-900 whitespace-no-wrap">${dto.seq }</p>
													</div>
												</div>
											</td>
											<td
												class="px-5 w-7/12 py-5 border-b border-gray-200 bg-white text-sm">
												<p class="text-gray-900 whitespace-no-wrap">
													<a
														href="/detail.pet?seq=${dto.seq }&cpage=${cpage }&check_category=${check_category }&check_num=1">${dto.title }
														<c:if test="${dto.comment_count ne 0 }">
								&nbsp <i class="far fa-comment-dots"> </i>
															<span style="color: red;">[${dto.comment_count }]</span>
															
														</c:if>
													</a>
												</p>
											</td>
											<td
												class="px-5 w-1/12 text-center py-5 border-b border-gray-200 bg-white text-sm">
												<p class="text-gray-900 whitespace-no-wrap">${dto.writer }
												</p>
											</td>
											<td
												class="px-5 w-1/12 text-center text-center py-5 border-b border-gray-200 bg-white text-sm">
												<p class="text-gray-900 whitespace-no-wrap">
													${dto.detailDate }</p>
											</td>
											<td
												class="px-5 w-1/12 text-center py-5 border-b border-gray-200 bg-white text-sm">
												<p class="text-gray-900 whitespace-no-wrap">
													${dto.view_count }</p>
											</td>
											<td
												class="px-5 w-1/12 text-center py-5 border-b border-gray-200 bg-white text-sm">
												<p class="text-gray-900 whitespace-no-wrap">
													${dto.good_count }</p>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
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
						</div>
					</div>
				</div>
			</div>
		</div>




	</div>

	<script>
	
	document.querySelector('body').classList.toggle('sidebar-mini');
		
		
		// 리뷰 모아보기 이동
		$("#review").on("click", function() {
			location.href = "/my_review.my?cpage=1";
		})
		
		// 회원정보 수정 이동
		$("#modify").on("click", function() {
			location.href = "mypage.mem?cpage=1";
		})
		
		// 메인화면으로 돌아가기
		$("#main").on("click",function(){
			location.href ="/index.jsp";
		})
		
	</script>
</body>
</html>