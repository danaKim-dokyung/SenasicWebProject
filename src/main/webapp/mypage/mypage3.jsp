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
				<div class="menu-text text-gray-100 ml-4">로그인 한 계정명${loginID }</div>
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
								개인정보 변경
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
		
		
		
		
<div class="main-content w-full md:w-4/5 reltive float-right grid justify items-stretch">
	<div class="bg-white p-8 rounded-md w-full">
		<div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <form action="/modifyM.admin?seq=${list.seq }" method="post" enctype="multipart/form-data"  class="validation-form" novalidate>
        <div class="mb-3 flex">
            <label for="image">프로필사진</label>
            <label class="flex flex-col w-1/4 ml-8 px-3 border-4 border-dashed hover:bg-gray-100 hover:border-gray-300">
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
        <!-- 아이디 입력 -->
           <div class="mb-3 mt-10 ">
            <label for="id">아이디</label>
            <input type="text" class="ml-10 form-control w-3/5 bg-gray-100 rounded-lg focus:outline-none border-2" id="id" name="id"  pattern="^([a-z0-9]){6,20}$" required value="${list.id }">
            <div class="col text-right"><span id="checkResult"></span>
          </div>
          </div>
          
          <!-- 비밀번호 입력 -->
           <div class="mb-3 mt-10 ">
            <label for="password">비밀번호</label>
            <input type="password" class="ml-10 form-control w-3/5 bg-gray-100 rounded-lg focus:outline-none border-2" id="pw" name="pw"  pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" placeholder="숫자포함 8자리 이상 입력" required >
            <div class="col text-right">
          </div>
          </div>
          
          <!-- 비밀번호 확인 입력 -->
           <div class="mb-3 mt-10 ">
            <label for="confirmpw">비밀번호 확인</label>
            <input type="password" class="ml-10 form-control w-3/5 bg-gray-100 rounded-lg focus:outline-none border-2" id="cpw" name="cpw"  pattern="^([a-z0-9]){6,20}$" required ><span id="checkpw"></span>
            <div class="col text-right">
          </div>
          </div>
          
          
          
          <!-- 닉네임 입력 -->
           <div class="mb-3 mt-10">
            <label for="nickname">닉네임</label>
            <input type="text" class="ml-10 form-control w-3/5 bg-gray-100 rounded-lg focus:outline-none border-2" id="nickname" name="nn" placeholder=""pattern="^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]{3,10}$" required value="${list.nn }">
            <div class="col text-right"><span id="checkResultN"></span>
          </div>
          </div>
          
          
          <!-- 이메일 입력 -->
          <div class="mb-3 mt-10">
            <label for="email">이메일</label>
            <input type="email" class="ml-10 form-control w-3/5 bg-gray-100 rounded-lg focus:outline-none border-2" id="email" name="m" placeholder="you@example.com"  required value="${list.m }">

          </div>
          
         
			
			<!-- 전화번호 -->
          <div class="row flex mt-10">
           	<div class="col-md-4 mb-2 ">
           	<label for="phone">연락처</label>
            	<select class="ml-10 form-control" name="phone1" id="phone1" required>
   			 	<option>선택</option>
   			 	<option value="010"<c:if test="${phoneFirst eq 010}"> selected</c:if>>010</option>
    			<option value="02"<c:if test="${phoneFirst eq 02}"> selected</c:if>>02</option>
    			<option value="031"<c:if test="${phoneFirst eq 031}"> selected</c:if>>031</option>
				</select>
            </div>
            <div class="col-md-4 mb-2">
              <input type="text" class="ml-10 form-control bg-gray-100 rounded-lg focus:outline-none border-2" id="num2" placeholder="1234" value="${phoneMiddle }" name="phone2"  pattern="^\d{4}$" required>
            </div>
            <div class="col-md-4 mb-2">
              <input type="text" class="ml-10 form-control bg-gray-100 rounded-lg focus:outline-none border-2" id="num3" placeholder="5678" value="${phoneLast }" name="phone3"  pattern="^\d{4}$" required>
            </div>
          </div>
			
        
          <hr class="mb-4 mt-20">
          <div class="mb-4"></div>
          <div class="col justify-between text-right">
			<button class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"  type="submit" id="editBtn">
			  정보 수정
			</button>
			<button class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded" id="delBtn">
			  탈퇴
			</button>
          </div>
         
        </form>
      </div>
	</div>
	</div>
</div>
	
		
		
		
	</div>
	
<script>


//아이디 중복확인
$(function(){
	$("#id").on("input",function(){
		  let id = document.getElementById("id").value;
	        let idregex = /^([a-z0-9]){6,20}$/;
	        let result = idregex.test(id);
	        if(!result){
	        	$("#checkResult").css("color","red");
				$("#checkResult").text("잘못된 ID 입니다.");
	        	
	        	return false;
	        }
		$.ajax({
			url:"/idCheck.mem",
			data:{id:$("#id").val()}
		}).done(function(resp){
			if(resp == "true"){
				$("#checkResult").css("color","pink");
				$("#checkResult").text("이미 사용중인 ID 입니다.");
			}else{
				$("#checkResult").css("color","dodgerblue");
				$("#checkResult").text("사용 가능한 ID 입니다.");
			}
		});
	});
})



//비밀번호확인
$("#cpw").on("keyup",function(){
	if($("#pw").val()==$("#cpw").val()){
		$("#checkpw").css("color","green");
		$("#checkpw").text("비밀번호가 일치합니다");
	}else{
		$("#checkpw").css("color","pink");
		$("#checkpw").text("비밀번호가 틀립니다.");
	}
})


$("#delBtn").on("click",function(){
	if(confirm("계정을 삭제하시겠습니까? 복구할 수 없습니다.")){
		location.href="/deleteM.admin?seq=${dto.seq}";
		return false;
	}else{
		return false;
	}
})


</script>
</body>
</html>