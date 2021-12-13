<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My page3</title>
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
  rel="stylesheet"
/>
<style>
@media screen and (min-width:991px) {
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

@media screen and (max-width: 991px) {
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
			<div class="image-menu flex items-center mx-2 py-6 overflow-hidden z-10 border-b border-green-700">
				<img class="menu-icon border-2 w-10 h-10 rounded-full"
					src="http://web2tailwind.com/assets/docs/master/image-01.jpg">
				<div class="menu-text text-gray-100 ml-4">로그인 한 계정명</div>
			</div>
			
			
			<div class="flex mx-4 mb-3"> <!--  개인정보 관리 -->
				<a href="#" x-data="{show:false}" class="w-full flex flex-col"
					@click="show=!show">
					<div
						class="w-full flex justify-between px-3 hover:bg-green-700 rounded py-3" :class="{'bg-green-700':show}">
						<div class="flex">
							<i class="material-icons fill-current text-gray-100">perm_identity</i>
							<div class="relative menu-text text-gray-100 ml-4">개인 정보 관리</div>
						</div>
						<span class="transition ease-in duration-150 text-gray-100 material-icons transform" :class="{'rotate-180':show}"> arrow_drop_down </span>
					</div>
					<div x-show="show" class="transition ease-in duration-700 mt-3 bg-green-800">
						
						<div class="w-full flex px-3 hover:bg-green-700 rounded py-3 mb-3">
							<div class="relative text-xs font-light menu-text text-gray-100 ml-4">
								비밀번호 변경
							</div>
						</div>
						
						<div class="w-full flex px-3 hover:bg-green-700 rounded py-3 mb-3">
							<div class="relative text-xs font-light menu-text text-gray-100 ml-4">
								이메일 변경
							</div>
						</div>
						
						<div class="w-full flex px-3 hover:bg-green-700 rounded py-3 mb-3">
							<div class="relative text-xs font-light menu-text text-gray-100 ml-4">
								주소 변경
							</div>
						</div>
						
						<div class="w-full flex px-3 hover:bg-green-700 rounded py-3 mb-3">
							<div class="relative text-xs font-light menu-text text-gray-100 ml-4">
								연락처 변경
							</div>
						</div>
						
					</div>
				</a>
			</div> <!--  개인정보 관리 -->
			
			
			
			
			<div class="flex mx-4 mb-3"> <!--  게시글 관리  -->
				<a href="#" x-data="{show:false}" class="w-full flex flex-col"
					@click="show=!show">
					<div
						class="w-full flex justify-between px-3 hover:bg-green-700 rounded py-3" :class="{'bg-green-700':show}">
						<div class="flex">
							<i class="material-icons fill-current text-gray-100">article</i>
							<div class="relative menu-text text-gray-100 ml-4">게시글 관리</div>
						</div>
						<span class="transition ease-in duration-150 text-gray-100 material-icons transform" :class="{'rotate-180':show}"> arrow_drop_down </span>
					</div>
					<div x-show="show" class="transition ease-in duration-700 mt-3 bg-green-800">
						

						
						<div class="w-full flex px-3 hover:bg-green-700 rounded py-3 mb-3">
							<div class="relative text-xs font-light menu-text text-gray-100 ml-4">
								내가 올린 애견게시판 글
							</div>
						</div>
						<div class="w-full flex px-3 hover:bg-green-700 rounded py-3 mb-3">
							<div class="relative text-xs font-light menu-text text-gray-100 ml-4">
								리뷰 글 모아보기
							</div>
						</div>
					</div>
				</a>
			</div> <!--  게시글 관리  -->
			
			
			
			
			<div class="flex mx-4 mb-3"> <!--  사업자용  -->
				<a href="#" x-data="{show:false}" class="w-full flex flex-col"
					@click="show=!show">
					<div
						class="w-full flex justify-between px-3 hover:bg-green-700 rounded py-3" :class="{'bg-green-700':show}">
						<div class="flex">
							<i class="material-icons fill-current text-gray-100">perm_identity</i>
							<div class="relative menu-text text-gray-100 ml-4">사업자용</div>
						</div>
						<span class="transition ease-in duration-150 text-gray-100 material-icons transform" :class="{'rotate-180':show}"> arrow_drop_down </span>
					</div>
					<div x-show="show" class="transition ease-in duration-700 mt-3 bg-green-800">
						<div class="w-full flex px-3 hover:bg-green-700 rounded py-3 mb-3">
							<div class="relative text-xs font-light menu-text text-gray-100 ml-4">
								식당게시판 글쓰기
							</div>
						</div>
						<div class="w-full flex px-3 hover:bg-green-700 rounded py-3 mb-3">
							<div class="relative text-xs font-light menu-text text-gray-100 ml-4">
								식당게시판 글관리
							</div>
						</div>
						<div class="w-full flex px-3 hover:bg-green-700 rounded py-3 mb-3">
							<div class="relative text-xs font-light menu-text text-gray-100 ml-4">
								맛집매거진 글쓰기
							</div>
						</div>
						<div class="w-full flex px-3 hover:bg-green-700 rounded py-3 mb-3">
							<div class="relative text-xs font-light menu-text text-gray-100 ml-4">
								맛집매거진 글관리
							</div>
						</div>
					</div>
				</a>
			</div> <!--  사업자용  -->
			
			
			<div class="flex mx-4 mb-3"> <!--  사업자용  -->
				<a href="#" x-data="{show:false}" class="w-full flex flex-col"
					@click="show=!show">
					<div
						class="w-full flex justify-between px-3 hover:bg-green-700 rounded py-3" :class="{'bg-green-700':show}">
						<div class="flex">
							<i class="material-icons fill-current text-gray-100">textsms</i>
							<div class="relative menu-text text-gray-100 ml-4">쪽지함</div>
						</div>
						<span class="transition ease-in duration-150 text-gray-100 material-icons transform" :class="{'rotate-180':show}"> arrow_drop_down </span>
					</div>
					<div x-show="show" class="transition ease-in duration-700 mt-3 bg-green-800">
						<div class="w-full flex px-3 hover:bg-green-700 rounded py-3 mb-3">
							<div class="relative text-xs font-light menu-text text-gray-100 ml-4">
								쪽지
							</div>
						</div>
					</div>
				</a>
			</div> <!--  사업자용  -->
			
			
			
			
		</div><!-- 마무리 예상 div -->
		
		
		
		
<form action="/upload.admin" method="post" enctype="multipart/form-data" name="">
<div class="main-content w-full md:w-4/5 reltive float-right grid justifyitems-stretch">
	<div class="p-4 shadow-md rounded-md text-left justify-self-center w-full" style="max-width: 800px">
	
	
	<h1>개인정보 수정</h1>
	<br>
	
  <label class="block">
    <span class="text-gray-700">변경할 비밀번호</span>
    <input class="form-input mt-1 block w-full" name="title"/>
  </label>
  
  <br>
  
   <label class="block">
    <span class="text-gray-700">비밀번호 확인</span>
    <input class="form-input mt-1 block w-full"  name="location"/>
  </label>
  
  <br>
  
<label class="block">
    <span class="text-gray-700">이메일</span>
    <input class="form-input mt-1 block w-full"  name="location"/>
  </label>
  
  <br>
  
 <label class="block">
    <span class="text-gray-700">상세 주소</span>
    <input class="form-input mt-1 block w-full" name="location_detail"/>
  </label>
  
  <br>
  
  
 <label class="block">
    <span class="text-gray-700">연락처</span>
    <input class="form-input mt-1 block w-full" placeholder="070-0000-0000, 010-0000-0000" name="phone"/>
  </label>
  
  <br>
  
  
   

 
<div class="flex justify-center mt-8">
    <div class="rounded-lg shadow-xl bg-gray-50">
        <div class="m-4">
            <div class="flex items-center justify-center w-full">
                <label class="flex flex-col w-full h-20 border-4 border-dashed hover:bg-gray-100 hover:border-gray-300">
                    <div class="flex flex-col items-center justify-center pt-7" id="ph1">
                        <svg xmlns="http://www.w3.org/2000/svg"
                            class="w-12 h-12 text-gray-400 group-hover:text-gray-600" viewBox="0 0 20 20"
                            fill="currentColor">
                            <path fill-rule="evenodd"
                                d="M4 3a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V5a2 2 0 00-2-2H4zm12 12H4l4-8 3 6 2-4 3 6z"
                                clip-rule="evenodd" />
                        </svg>
                        <p class="pt-1 text-sm tracking-wider text-gray-400 group-hover:text-gray-600">
                            메인 사진 선택</p>
                    </div>
                    <input accept="image/*" id="img1" type="file" class="opacity-0" name="photo[0]"/>
                </label>
            </div>
        </div>
    </div>
</div>


 		<div class="flex p-2 space-x-4 grid justify-items-end">
            <button class="px-4 py-2 text-white bg-green-500 rounded shadow-xl item-end">수정</button>
        </div>
</div>

</div>
</form>		
	
		
		
		
	</div>
	
<script>
$("#img1").on("change",function(){
	let file = this.files[0];
	if (file) {
	    $("#ph1").html("<img class='w-full h-20' viewBox='0 0 20 20' src = "+URL.createObjectURL(file)+">");
	  }
	})






</script>
</body>
</html>