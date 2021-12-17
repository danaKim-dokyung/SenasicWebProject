<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${dto.title } 수정</title>
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
<body style="font-family: Roboto">
	<div id="app" class="relative h-screen">
		<div class="sidebar w-1/7 fixed h-screen bg-green-600 z-10">
			<div class="image-menu flex items-center mx-2 py-6 overflow-hidden z-10 border-b border-green-700">
				<img class="menu-icon border-2 w-10 h-10 rounded-full"
					src="http://web2tailwind.com/assets/docs/master/image-01.jpg">
				<div class="menu-text text-gray-100 ml-4">관리자</div>
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
						<div class="w-full flex px-3 hover:bg-green-800 rounded py-3 mb-3" id="rbEdit">
							<div class="relative text-xs font-light menu-text text-gray-100 ml-4">
								식당게시판 글 관리
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
							<div class="relative text-xs font-light menu-text text-gray-100 ml-4" id="pbEdit">
								애견게시판 글관리
							</div>
						</div>
					</div>
				</a>
			</div>
		</div>
<form action="/rbModify.admin?seq=${dto.seq }" method="post" enctype="multipart/form-data" name="">
<div class="main-content w-full md:w-4/5 reltive float-right grid justifyitems-stretch">
	<div class="p-4 shadow-md rounded-md text-left justify-self-center w-full" style="max-width: 800px">
  <label class="block">
    <span class="text-gray-700">상호 명</span>
    <input class="form-input mt-1 block w-full" name="title" value="${dto.title }"/>
  </label>
  
      <label class="block mt-4">
    <span class="text-gray-700">카테고리</span>
    <select class="form-select mt-1 block w-full" name="category" id="category">
      <option value="카페" <c:if test="${dto.category eq '카페'}">selected</c:if>>카페</option>
      <option value="양식" <c:if test="${dto.category eq '양식'}">selected</c:if>>양식</option>
      <option value="일식" <c:if test="${dto.category eq '일식'}">selected</c:if>>일식</option>
      <option value="한식" <c:if test="${dto.category eq '한식'}">selected</c:if>>한식</option>
      <option value="패스트푸드" <c:if test="${dto.category eq '패스트푸드'}">selected</c:if>>패스트푸드</option>
    </select>
  </label>
  
<label class="block">
    <span class="text-gray-700">지역</span>
    <input class="form-input mt-1 block w-full" placeholder="서울 강남구" name="location" value="${dto.locate }"/>
  </label>
 <label class="block">
    <span class="text-gray-700">상세 주소</span>
    <input class="form-input mt-1 block w-full" name="location_detail" value="${dto.locate_detail }"/>
  </label>
 <label class="block">
    <span class="text-gray-700">연락처</span>
    <input class="form-input mt-1 block w-full" placeholder="070-0000-0000, 010-0000-0000" name="phone" value="${dto.phone }"/>
  </label>
  
   <label class="block">
    <span class="text-gray-700">영업시간</span>
    <input class="form-input mt-1 block w-full" placeholder="평일 10:00~22:00 주말 11:00~22:00, 매주 수요일 휴무" name="hour" value="${dto.open_hour }"/>
  </label>
  
   <label class="block">
    <span class="text-gray-700">주차여부</span>
    <input class="form-input mt-1 block w-full" placeholder="X, 3대, 15대" name="garage" value="${dto.garage }"/>
  </label>
  
   <label class="block">
    <span class="text-gray-700">예약링크</span>
    <input class="form-input mt-1 block w-full" placeholder="https://www.naver.com/abc의 형태" name="link" value="${dto.link }"/>
  </label>

 <label class="block">
    <span class="text-gray-700">대표메뉴 1</span>
    <input class="form-input mt-1 block w-full" placeholder="아메리카노" name="menu1" value="${Mdto.menu1 }"/>
    <span class="text-gray-700">대표메뉴 1 가격</span>
    <input class="price form-input mt-1 block w-full" placeholder="4100" name="price1" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="${Mdto.price1 }"/>
  </label>
  
 <label class="block">
    <span class="text-gray-700">대표메뉴 2</span>
    <input class="form-input mt-1 block w-full" placeholder="아메리카노" name="menu2" value="${Mdto.menu2 }"/>
    <span class="text-gray-700">대표메뉴 2 가격</span>
    <input class="price form-input mt-1 block w-full" placeholder="4100" name="price2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="${Mdto.price2 }"/>
  </label>  
 <label class="block">
    <span class="text-gray-700">대표메뉴 3</span>
    <input class="form-input mt-1 block w-full" placeholder="아메리카노" name="menu3" value="${Mdto.menu3 }"/>
    <span class="text-gray-700">대표메뉴 3 가격</span>
    <input class="price form-input mt-1 block w-full" placeholder="4100" name="price3"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="${Mdto.price3 }"/>
  </label>
<div class="flex justify-center mt-8">
    <div class="rounded-lg shadow-xl bg-gray-50">
        <div class="m-4">
            <div class="flex items-center justify-center w-full">
                <label class="flex flex-col w-full h-20 border-4 border-dashed hover:bg-gray-100 hover:border-gray-300">
                    <div class="flex flex-col items-center justify-center pt-7" id="ph1">
                        <img src=${dto.photo1 }" class="h-20 w-full ">
                    </div>
                    <input accept="image/*" id="img1" type="file" class="opacity-0" name="photo[0]"/>
                </label>
            </div>
        </div>
    </div>
</div>
<div class="flex justify-center mt-8">
    <div class="rounded-lg shadow-xl bg-gray-50">
        <div class="m-4">
            <div class="flex items-center justify-center w-full">
                <label class="flex flex-col w-full h-20 border-4 border-dashed hover:bg-gray-100 hover:border-gray-300">
                    <div class="flex flex-col items-center justify-center pt-7" id="ph2">
                        <img src="${dto.photo2 }" class="h-20 w-full">
                    </div>
                    <input accept="image/*" id="img2" type="file" class="opacity-0" name="photo[1]"/>
                </label>
            </div>
        </div>
    </div>
</div>
<div class="flex justify-center mt-8">
    <div class="rounded-lg shadow-xl bg-gray-50 ">
        <div class="m-4">
            <div class="flex items-center justify-center w-full">
                <label class="flex flex-col w-full h-20 border-4 border-dashed hover:bg-gray-100 hover:border-gray-300">
                    <div class="flex flex-col items-center justify-center pt-7" id="ph3">
                        <img src="${dto.photo3 }" class="h-20 w-full">
                    </div>
                    <input accept="image/*" id="img3" type="file" class="opacity-0" name="photo[2]"/>
                </label>
            </div>
        </div>
    </div>
</div>
 		<div class="flex p-2 space-x-4 grid justify-items-end">
            <button class="px-4 py-2 text-white bg-green-500 rounded shadow-xl item-end" id="modify">수정</button>
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

$("#img2").on("change",function(){
	let file = this.files[0];
	if (file) {
	    $("#ph2").html("<img class='w-full h-20' viewBox='0 0 20 20' src = "+URL.createObjectURL(file)+">");
	  }
	})
$("#img3").on("change",function(){
	let file = this.files[0];
	if (file) {
	    $("#ph3").html("<img class='w-full h-20' viewBox='0 0 20 20' src = "+URL.createObjectURL(file)+">");
	  }
	})
	

	
$("#rbEdit").on("click",function(){
	location.href="/rbEdit.admin";
})
$("#rbWrite").on("click",function(){
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

$("#modify").on("click",function(){
	if(confirm("수정하시겠습니까?")){
		return true;
	}else{
		return false;
	}
})


</script>
</body>
</html>