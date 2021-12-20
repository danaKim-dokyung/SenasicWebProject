<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css"
	rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>


<style>
* {
	box-sizing: border-box;
}

.container {
	width: 800px;
	height: 700px;
	margin: auto;
	margin-top: 100px;
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
	padding: 30px;
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
nav>ul{
	padding-left: 28%;
}
nav>ul>li{
	padding-right: 17%;
}
</style>


</head>
<body>

	<header
		class="text-gray-600 body-font sticky inset-x-0 top-0 left-0  py-5">
		<div
			class="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">

			<!------ 왼쪽 상단 세나식 로고 ----->
			<a href="/index.jsp"
				class="flex title-font font-medium items-center text-gray-900 mb-4 md:mb-0">
				<span class="ml-3 text-xl">Senasic</span>
			</a>
			<!-- top에 붙어있는 nav bar, 로그인 회원가입, 마이페이지, 로그아웃-->
			<nav
				class="z-50 md:ml-auto flex flex-wrap items-center text-base justify-center">
				<c:choose>
					<c:when test="${loginID != null}">
				${loginID}님 안녕하세요 <!-- 강사님께 질문 2-2 -->
						<a href="logout.mem" onclick="return confirm('정말 로그아웃 하시겠습니까?');">로그아웃</a>
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
	<div id="logo">
		<img src="senasic_logo.png">
	</div>

	<!----------------- 게시판 네비게이션 --------------->
	<nav>
		<ul class="nav-container">
			<li class="nav-itme"><a href="/fboard.rest?cpage=1">맛집 리스트 </a></li>
			<li class="nav-itme"><a href="/magagineList.mag">맛집 매거진 </a></li>
			<li class="nav-itme"><a href="/list.pet?cpage=1&check_num=2">반려견
					게시판 </a></li>
		</ul>
	</nav>
	<div class="forSearch">
		<div class="container1">
			<form action="/fboard.rest">
				<input type="hidden" name="cpage" value="1"> <input
					type="hidden" name="category" value="all"> <input
					class="main" type="text" name="target" id="searching"> <a
					id="searchbytagName">
					<button
						class=" bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
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
	<form method="post" onsubmit="return confirm('정말 수정하시겠습니까?')"
		action="/modify_board.pet?seq=${list[0].seq }&cpage=${cpage }&check_category=${check_category }&check_num=${check_num }">
		<!-- 글쓰기 Header -->
		<div class="container">
			<div class="head"
				style="border-bottom: 1px solid rgb(173, 173, 173); font-size: 20px; height: 50px;">
				<b># 게시판 수정하기</b>
			</div>

			<!-- 제목 입력 -->
			<div>
				<input name="title"
					style="font-size: 12px; margin-top: 10px; margin-bottom: 10px; padding-left: 10px;"
					type="text" value="${list[0].title }"
					class="
                    placeholder-gray-400
                    text-gray-600 
                    relative
                    bg-white bg-white
                    rounded
                    text-sm
                    border border-gray-400
                    outline-none
                    focus:outline-none focus:ring
                    w-10/12
                    h-14
                  " />
				<!-- 어떤 카테고리에 쓸지 선택 -->
				<select name="category" id="category"
					class="rounded border border-gray-300 focus:outline-none focus:ring-2 focus:ring-indigo-200 focus:border-indigo-500 text-base pl-5 pr-5 w-auto h-14"
					style="font-size: 12px; margin-left: 10px;">
					<option>카테고리</option>
					<option>병원</option>
					<option>산책로</option>
					<option>음식</option>
					<option>기타</option>
				</select>

				<!-- textarea 태그에 작성 -->
				<div>
					<textarea name="contents" id="summernote">${list[0].contents }</textarea>
				</div>


				<!-- 목록, 등록 버튼 생성 -->

				<div style="text-align: right;">
					<button type="button" id="list"
						class="border border-green-500 text-green-500 hover:bg-green-400 hover:text-gray-100 rounded px-4 py-2"
						style="margin-right: 5px; height: 65%;">돌아가기</button>


					<button id="modify_board"
						class="border border-green-500 text-green-500 hover:bg-green-400 hover:text-gray-100 rounded px-4 py-2"
						style="height: 65%;">수정하기</button>
				</div>
			</div>
		</div>
	</form>

	<script>
	<!-- '목록' 클릭시 게시판리스트로 돌아가기 -->
		$("#list").on("click", function() {
			history.go(-1);
		});

		$("#category").val("${list[0].category}");
	</script>

	<!-- textarea에 summernote 적용 -->
	<script>
		$('#summernote').summernote({
			placeholder : 'input',
			tabsize : 2,
			height : 600,
			lang : "ko-KR",
			minHeight : null,
			maxHeight : null,
			focus : true,
			callbacks : {
				onImageUpload : function(files) {
					console.log(files[0]);
					sendFile(files[0], this);
				}
			}
		});
	</script>

	<!-- 이미지 업로드 -->
	<script>
		function sendFile(file, editor) {
			var form_data = new FormData();
			form_data.append('file', file);
			$.ajax({
				data : form_data,
				type : "POST",
				url : "/imageUpload.pet",
				cache : false,
				contentType : false,
				enctype : "multipart/form-data",
				processData : false,
				success : function(sysName) {
					console.log(sysName + "b")

					setTimeout(function() {
						$(editor).summernote('insertImage',
								'/board/img/' + sysName);
					}, 3500);
				}
			});
		}
	</script>


</body>

</html>