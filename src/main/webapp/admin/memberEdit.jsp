<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식당 게시판 글쓰기</title>
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
</style>
</head>
<body>
<body style="font-family: Roboto">
	<div id="app" class="relative h-screen">
		<div class="sidebar w-1/7 fixed h-screen bg-green-600 z-10">
			<div class="image-menu flex items-center mx-2 py-6 overflow-hidden z-10 border-b border-green-700">
				<img class="menu-icon border-2 w-10 h-10 rounded-full"
					src="http://web2tailwind.com/assets/docs/master/image-01.jpg">
				<div class="menu-text text-gray-100 ml-4">admin 계정명</div>
			</div>
			
			<div class="mx-4 px-3">
				<a href="#" class="flex  w-full flex hover:bg-green-700 rounded py-3"> <i
					class="material-icons fill-current text-gray-100">analytics</i>
					<div class="relative menu-text text-gray-100 ml-4">통계보기</div>
				</a>
			</div>
			
			<div class="mx-4 px-3">
				<a href="#" class="flex "> 
					<div class="flex  w-full flex hover:bg-green-700 rounded py-3" id="member">
					<i class="material-icons fill-current text-gray-100">perm_identity</i>
					<div class="relative menu-text text-gray-100 ml-4">회원관리</div>
					</div>
					
				</a>
			</div>
			
			
			<div class="flex mx-4 mb-3">
				<a href="#" x-data="{show:false}" class="w-full flex flex-col"
					@click="show=!show">
					<div
						class="w-full flex justify-between px-3 bg-green-700 hover:bg-green-700 rounded py-3" :class="{'bg-green-700':show}">
						<div class="flex">
							<i class="material-icons fill-current text-gray-100">article</i>
							<div class="relative menu-text text-gray-100 ml-4">게시글 관리</div>
						</div>
						<span class="transition ease-in duration-150 text-gray-100 material-icons transform" :class="{'rotate-180':show}"> arrow_drop_down </span>
					</div>
					<div x-show="show" class="transition ease-in mt-3">
						<div class="w-full flex px-3 hover:bg-green-800 rounded py-3 mb-3">
							<div class="relative text-xs font-light menu-text text-gray-100 ml-4" id="rbWrite">
								식당게시판 글쓰기
							</div>
						</div>
						<div class="w-full flex px-3 hover:bg-green-800 rounded py-3 mb-3">
							<div class="relative text-xs font-light menu-text text-gray-100 ml-4" id="rbEdit">
								식당게시판 글관리
							</div>
						</div>
						<div class="w-full flex px-3 hover:bg-green-800 rounded py-3 mb-3">
							<div class="relative text-xs font-light menu-text text-gray-100 ml-4">
								맛집매거진 글쓰기
							</div>
						</div>
						<div class="w-full flex px-3 hover:bg-green-800 rounded py-3 mb-3">
							<div class="relative text-xs font-light menu-text text-gray-100 ml-4">
								맛집매거진 글관리
							</div>
						</div>
						<div class="w-full flex px-3 hover:bg-green-800 rounded py-3 mb-3">
							<div class="relative text-xs font-light menu-text text-gray-100 ml-4">
								애견게시판 글관리
							</div>
						</div>
					</div>
				</a>
			</div>
		</div>
<div class="main-content w-full md:w-4/5 reltive float-right grid justify items-stretch">
	<div class="bg-white p-8 rounded-md w-full">
		<div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <form action="/signupProc.mem" method="post" class="validation-form" novalidate>
        <div class="mb-3">
            <label for="image">프로필사진</label>
            <input type="image" class="form-control" id="img">
        </div> 
        <!-- 아이디 입력 -->
           <div class="mb-3 mt-10 ">
            <label for="id">아이디</label>
            <input type="text" class="ml-10 form-control w-3/5 bg-gray-100 rounded-lg focus:outline-none border-2" id="id" name="id" placeholder="영문,숫자 6자리이상" pattern="^([a-z0-9]){6,20}$" required value="${dto.id }">
            <div class="col text-right"><span id="checkResult"></span>
          </div>
          </div>
          
          <!-- 닉네임 입력 -->
           <div class="mb-3 mt-10">
            <label for="nickname">닉네임</label>
            <input type="text" class="ml-10 form-control w-3/5 bg-gray-100 rounded-lg focus:outline-none border-2" id="nickname" name="nn" placeholder=""pattern="^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]{3,10}$" required value="${dto.nn }">
            <div class="col text-right"><span id="checkResultN"></span>
          </div>
          </div>
          
          
          <!-- 이메일 입력 -->
          <div class="mb-3 mt-10">
            <label for="email">이메일</label>
            <input type="email" class="ml-10 form-control w-3/5 bg-gray-100 rounded-lg focus:outline-none border-2" id="email" name="m" placeholder="you@example.com"  required value="${dto.m }">

          </div>
          
			<!-- 생년월일 -->
          <div class="row flex mt-10">
          <label for="ph">생년월일</label>
           <div class="col-md-4 mb-2">
            	<select class="ml-10 form-control" id="year" required>
   			 	<option>1997</option>
    			<option>1998</option>
    			<option>1999</option>
				</select>

            </div>
            <div class="col-md-4 mb-2">
              <input type="text" class="ml-10 form-control bg-gray-100 rounded-lg focus:outline-none border-2" id="month"  placeholder="월" value="" pattern="^(0[1-9]|1[012])$" required>
            </div>
            <div class="col-md-4 mb-2">
              <input type="text" class="ml-10 form-control bg-gray-100 rounded-lg focus:outline-none border-2" id="day"  placeholder="일" value=""pattern="^(0[1-9]|[12][0-9]|3[0-1])$" required>
            </div>
          </div>
          
          
          <!-- 나이 -->
            <div class="mb-3 mt-10">
            <label for="age">나 &#160; 이</label>
            <input type="text" class="ml-10 form-control w-3/5  bg-gray-100 rounded-lg focus:outline-none border-2" id="age" name="age" placeholder="나이를 입력하세요"  required value="${dto.age }">
 
          </div>
             
			<!-- 성별 선택 -->
          <div class="mb-3 mt-10">
          
			<div class="flex">
   			<label for="gender">성 &#160; 별</label>
   			 	<div class="flex items-center mb-2 mr-4">
        			<input type="radio" id="radio-example-1" name="gender" class="h-4 w-4 text-gray-700 px-3 py-3 border rounded mr-2  ml-10">
       		 		<label for="radio-example-1" class="text-gray-600">남성</label>
    			</div>
    			<div class="flex items-center mb-2">
       				 <input type="radio" id="radio-example-2" name="gender" class="h-4 w-4 text-gray-700 px-3 py-3 border rounded mr-2  ml-10">
       			 	 <label for="radio-example-2" class="text-gray-600">여성</label>
    			</div>
			</div>
          </div>
			
			<!-- 전화번호 -->
          <div class="row flex mt-10">
           	<div class="col-md-4 mb-2 ">
           	<label for="phone">연락처</label>
            	<select class="ml-10 form-control" name="phone1" id="phone1" required>
   			 	<option>선택</option>
   			 	<option>010</option>
    			<option >02</option> <!-- 강사님께 질문 1번 : 031 -->
    			<option >031</option>
				</select>
            </div>
            <div class="col-md-4 mb-2">
              <input type="text" class="ml-10 form-control bg-gray-100 rounded-lg focus:outline-none border-2" id="num2" placeholder="1234" value="" name="phone2"  pattern="^\d{4}$" required>
            </div>
            <div class="col-md-4 mb-2">
              <input type="text" class="ml-10 form-control bg-gray-100 rounded-lg focus:outline-none border-2" id="num3" placeholder="5678" value="" name="phone3"  pattern="^\d{4}$" required>
            </div>
          </div>
			
        
          <hr class="mb-4 mt-20">
          <div class="mb-4"></div>
          <div class="col text-center">
           <button class="btn btn-primary btn-lg btn-block" id="subtn" type="submit">정보 수정</button>
           <button class="btn btn-primary btn-lg btn-block" id="subtn" type="submit">탈퇴</button>
          </div>
         
        </form>
      </div>
	</div>
	</div>
</div>
	
		
		
		
	</div>
	
<script>
$("#rbEdit").on("click",function(){
	location.href="/rbEdit.admin";
})
$("#rbWrite").on("click",function(){
	location.href="/rbWrite.admin";
})
$("#create").on('click',function(){
	location.href="/rbWrite.admin";
})
$("#member").on("click",function(){
	location.href="/member.admin";
})

</script>
</body>
</html>