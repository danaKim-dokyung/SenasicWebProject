<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${dto.id } 수정</title>
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
		width: 220px;
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
    
        
    
 .nav-container {
	display: flex;
	text-align: center;
}

.nav-item {
	text-align: center;
}

li {
	float: left;
	padding-left:30px;
	padding-right:30px;
}

li:hover {
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


#header{
	padding:0px;
	border-bottom-left-radius: 30px;
	border-bottom-right-radius: 30px;
    box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
.forSearch{
position:relative;
}      

li>a { text-style:bold}

ul{
text-align:center;
}

body{
letter-spacing :1.5px; 
}
</style>
<script>
$(document).ready(function(){
	if(${seqID == null}){
		  alert("접근권한이 없습니다.");
		  location.href = "/index.jsp";		
	}else if(${seqID >0}){

		  alert("접근권한이 없습니다.");
		  location.href = "/index.jsp";
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
	</div>
	</div>
<body style="font-family: Roboto">
	<div id="app" class="relative h-screen">
		<div class="sidebar w-1/7  absolute fixed h-screen bg-green-600 z-10">
			<div class="image-menu flex items-center mx-2 py-6 overflow-hidden z-10 border-b border-green-700">

				<div class="menu-text text-gray-100 ml-4">관리자 ${loginID }</div>
			</div>
			
			<div class="mx-4 px-3">
				<a href="#" class="flex  w-full flex hover:bg-green-700 rounded py-3" id="dash"> <i
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
				<a href="#" x-data="{show:true}" class="w-full flex flex-col"
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
							<div class="relative text-xs font-light menu-text text-gray-100 ml-4" id="pbEdit">
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
        <form action="/modifyM.admin?seq=${dto.seq }" method="post" enctype="multipart/form-data"  class="validation-form" novalidate>
       <div class="mb-3 flex">
            <label for="image">프로필사진</label>
            <label class="flex flex-col w-40 h-40 ml-8 border-4 border-dashed hover:bg-gray-100 hover:border-gray-300">
				                    <div class="flex flex-col items-center justify-center pt-7" id="ph">
				                        <img src=${dto.img } id='profile' class='h-40 w-40'>
				                    </div>
				                    <input accept="image/*" id="img" type="file" class="opacity-0" name="photo" />
				                </label>          
        </div> 
        <!-- 아이디 입력 -->
           <div class="mb-3 mt-10 ">
            <label for="id">아이디</label>
            <input type="text" class="ml-10 form-control w-3/5 bg-gray-100 rounded-lg focus:outline-none border-2" id="id" name="id" readonly pattern="^([a-z0-9]){6,20}$" required value="${dto.id }">
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
        			<input type="radio" id="radio-example-1" name="gender" class="h-4 w-4 text-gray-700 px-3 py-3 border rounded mr-2  ml-10" value ='M' <c:if test="${dto.gender eq 'M'}">checked</c:if>>
       		 		<label for="radio-example-1" class="text-gray-600">남성</label>
    			</div>
    			<div class="flex items-center mb-2">
       				 <input type="radio" id="radio-example-2" name="gender" class="h-4 w-4 text-gray-700 px-3 py-3 border rounded mr-2  ml-10" value ='F' <c:if test="${dto.gender eq 'F'}">checked</c:if>>
       			 	 <label for="radio-example-2" class="text-gray-600">여성</label>
    			</div>
			</div>
          </div>
			
			<!-- 전화번호 -->
          <div class="row flex mt-10">
                     	<label for="phone">연락처</label>
          
           	<div class="col-md-4 mb-2 ">
   			 	<input type = "text" class="w-12 ml-10 form-control bg-gray-100 rounded-lg focus:outline-none border-2" id="phone1" name="phone1" value="${phoneFirst }" readonly>
            </div>
            <div class="col-md-4 mb-2">
              <input type="text" class="w-12 ml-10 form-control bg-gray-100 rounded-lg focus:outline-none border-2" id="num2" placeholder="1234" value="${phoneMiddle }" name="phone2"  pattern="^\d{4}$" required>
            </div>
            <div class="col-md-4 mb-2">
              <input type="text" class="w-12 ml-10 form-control bg-gray-100 rounded-lg focus:outline-none border-2" id="num3" placeholder="5678" value="${phoneLast }" name="phone3"  pattern="^\d{4}$" required>
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

$("#pbEdit").on("click",function(){
	location.href="/pet.admin";
})

$("#dash").on("click",function(){
	location.href="/dash.admin";
})


$("#img").on("change",function(){
	let file = this.files[0];
	if (file) {
	    $("#ph").html("<img class='w-40 h-40' viewBox='0 0 20 20' src = "+URL.createObjectURL(file)+">");

	  }
	})


$("#editBtn").on("click",function(){
	if(confirm("개인정보를 수정하시겠습니까?")){
		return true;
	}else{
		return false;
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

document.querySelector('body').classList.toggle('sidebar-mini');


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
</html>