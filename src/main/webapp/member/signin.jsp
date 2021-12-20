<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
<style>

    .i {
        color: #d9d9d9;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .i i {
        transition: .3s;
    }

    .input-div>div {
        position: relative;
        height: 45px;
    }

    .input-div>div>h5 {
        position: absolute;
        left: 10px;
        top: 50%;
        transform: translateY(-50%);
        color: #999;
        font-size: 18px;
        transition: .3s;
    }

    .input-div:before,
    .input-div:after {
        content: '';
        position: absolute;
        bottom: -2px;
        width: 0%;
        height: 2px;
        background-color: #38d39f;
        transition: .4s;
    }

    .input-div:before {
        right: 50%;
    }

    .input-div:after {
        left: 50%;
    }

    .input-div.focus:before,
    .input-div.focus:after {
        width: 50%;
    }

    .input-div.focus>div>h5 {
        top: -5px;
        font-size: 15px;
    }

    .input-div.focus>.i>i {
        color: #38d39f;
    }
    #box{       box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)

    }
    
    @font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
* {font-family: GmarketSansMedium;}
    
</style>  
</head>
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
						<a href="logout.mem" onclick="return confirm('정말 로그아웃 하시겠습니까?');">로그아웃&nbsp;&nbsp;|</a>&nbsp;&nbsp;
						<!-- 강사님께 질문 3 -->
						<c:if test="${seqID < 0 }">
							<a href="dash.admin">관리자페이지</a>
						</c:if>
						<c:if test="${seqID > 0 }">
							<a href="mypage.mem?cpage=1">마이페이지</a>
						</c:if>
					</c:when>
					<c:otherwise>
						<a href="signin.mem" class="mr-5 hover:text-gray-900">로그인 </a>
						<a href="signup.mem">회원가입</a>
					</c:otherwise>
				</c:choose>
			</nav>
		</div>
	</header>



<body class="bg-white">
    <div class="h-screen flex justify-center items-center">
        <div class="bg-white rounded-lg w-2/5 px-16 py-16" id="box">
            <form action="login.mem" method="post">
                <div class="flex font-bold justify-center">
                    <img class="h-20 w-20"
                        src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/avatar.svg">
                </div>
                <h2 class="text-3xl text-center text-gray-700 mb-4">Login Form</h2>
                <div class="input-div border-b-2 relative grid my-5 py-1 focus:outline-none"
                    style="grid-template-columns: 7% 93%;">
                    <div class="i">
                        <i class="fas fa-user"></i>
                    </div>
                    <div class="div">
                        <h5>ID</h5>
                        <input type="text" name="id" class="absolute w-full h-full py-2 px-3 outline-none inset-0 text-gray-700"
                            style="background:none;">
                    </div>
                </div>
                <div class="input-div border-b-2 relative grid my-5 py-1 focus:outline-none"
                    style="grid-template-columns: 7% 93%;">
                    <div class="i">
                        <i class="fas fa-lock"></i>
                    </div>
                    <div class="div">
                        <h5>Password</h5>
                        <input name="password" type="password"
                            class="absolute w-full h-full py-2 px-3 outline-none inset-0 text-gray-700"
                            style="background:none;">
                    </div>
                </div>
            
      
            <a href="/findPw.mem" class="text-xs text-green-400 hover:text-green-500 float-right mb-4">비밀번호 찾기</a>
       		<a href="/findId.mem" class="text-xs text-green-400 hover:text-green-500 float-right mb-4">아이디 찾기&nbsp;&nbsp;&nbsp;</a>
                
                <input type="submit" id="login" 
                    class="w-full py-2 rounded-full bg-green-600 text-gray-100  focus:outline-none" value="Login">
            </form>
            <br>
					<a href="/member/signup.jsp"><input type=button 
                    class="w-full py-2 rounded-full bg-green-600 text-gray-100  focus:outline-none" value="회원가입"></a>
       	 	</div>
    	</div>
    <script>
        const inputs = document.querySelectorAll("input");


        function addcl() {
            let parent = this.parentNode.parentNode;
            parent.classList.add("focus");
        }

        function remcl() {
            let parent = this.parentNode.parentNode;
            if (this.value == "") {
                parent.classList.remove("focus");
            }
        }


        inputs.forEach(input => {
            input.addEventListener("focus", addcl);
            input.addEventListener("blur", remcl);
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