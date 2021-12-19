<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대시보드</title>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.min.js" integrity="sha256-XF29CBwU1MWLaGEnsELogU6Y6rcc5nCkhhx89nFMIDQ=" crossorigin="anonymous"></script>

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
				<div class="menu-text text-gray-100 ml-4">관리자 ${loginID }</div>
			</div>
			
			<div class="mx-4 px-3" id="dash">
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
						<div class="w-full flex px-3 hover:bg-green-800 rounded py-3 mb-3" id="rbWrite">
							<div class="relative text-xs font-light menu-text text-gray-100 ml-4">
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
	<div class="bg-white p-8 rounded-md md:w-full">
		<div class=" flex items-center justify-center pb-6">
	
	
  
                    <!--/Metric Card-->
                <div class="md:w-full p-3">
                                  <!--Metric Card-->
                    <div class="bg-white border rounded shadow p-2 justify-center">
                        <div class="flex flex-row items-center ml-10">
                            <div class="flex-shrink pr-4 ">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z" />
</svg>
                            </div>
                            <div class="flex-1 text-left md:text-center">
                                <h5 class="font-bold uppercase text-gray-500">유저 수</h5>
                                <h3 class="font-bold text-2xl">${count[0].countU }(${count[0].countU-count[1].countU }) <span class="text-pink-500"><i class="fas fa-exchange-alt"></i></span></h3>
                            </div>
                        </div>
                    </div>
                    <!--Metric Card-->
                    <div class="bg-white border rounded shadow p-2">
                        <div class="flex flex-row items-center">
                            <div class="flex-shrink pr-4 ml-10">
<svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
  <path d="M17.414 2.586a2 2 0 00-2.828 0L7 10.172V13h2.828l7.586-7.586a2 2 0 000-2.828z" />
  <path fill-rule="evenodd" d="M2 6a2 2 0 012-2h4a1 1 0 010 2H4v10h10v-4a1 1 0 112 0v4a2 2 0 01-2 2H4a2 2 0 01-2-2V6z" clip-rule="evenodd" />
</svg>                                           </div>
                            <div class="flex-1 text-left md:text-center">
                                <h5 class="font-bold uppercase text-gray-500">게시글 수</h5>
                                <h3 class="font-bold text-2xl">${count[0].countC }(${count[0].countC-count[1].countC }) <span class="text-yellow-600"><i class="fas fa-caret-up"></i></span></h3>
                            </div>
                        </div>
                    </div>
                    
                                      <!--Metric Card-->
                    <div class="bg-white border rounded shadow p-2">
                        <div class="flex flex-row items-center">
                            <div class="flex-shrink pr-4 ml-10">
<svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 5a2 2 0 012-2h10a2 2 0 012 2v16l-7-3.5L5 21V5z" />
</svg>                           </div>
                            <div class="flex-1 text-left md:text-center">
                                <h5 class="font-bold uppercase text-gray-500">리뷰 수</h5>
                                <h3 class="font-bold text-2xl">${count[0].countR }(${count[0].countR-count[1].countR })</h3>
                            </div>
                        </div>
                    </div>
                    
                    
		          <div class="w-full p-3">
                    <!--Graph Card-->
                    <div class="bg-white border rounded shadow w-full md:w-4/5 lg:w-full">
                        <div class="border-b p-3">
                            <h5 class="font-bold uppercase text-gray-600">주간 증감 추이</h5>
                        </div>
                        <div class="p-5">
                            <canvas id="chartjs-0" class="chartjs"></canvas>
                        </div>
                    </div>
                    <!--/Graph Card-->
                </div>
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

document.querySelector('body').classList.toggle('sidebar-mini');



//차트                         
	let today = new Date();
	let month = today.getMonth() +1;
	let date = today.getDate();
	//날짜 수정하기
	new Chart(document.getElementById("chartjs-0"), {
		"type" : "line",
		"data" : {
			"labels" : [month+"/"+(date-6) , month+"/"+(date-5), month+"/"+(date-4), month+"/"+(date-3), month+"/"+(date-2),
				month+"/"+(date-1), month+"/"+date ], //x축
			"datasets" : [ { //y축
				"label" : "유저수",
				"data" : [ ${count[6].countU}, ${count[5].countU}, ${count[4].countU}, ${count[3].countU}, ${count[2].countU}, ${count[1].countU}, ${count[0].countU}],
				"fill" : false,
				"borderColor" : "rgb(75, 192, 222)",
				"lineTension" : 0.1
			},{
				"label" : "게시글수",
				"data" : [ ${count[6].countC}, ${count[5].countC}, ${count[4].countC}, ${count[3].countC}, ${count[2].countC}, ${count[1].countC}, ${count[0].countC}],
				"fill" : false,
				"borderColor" : "rgb(50, 70, 192)",
				"lineTension" : 0.1
			},{
				"label" : "리뷰수",
				"data" : [ ${count[6].countR}, ${count[5].countR}, ${count[4].countR}, ${count[3].countR}, ${count[2].countR}, ${count[1].countR}, ${count[0].countR}],
				"fill" : false,
				"borderColor" : "rgb(50, 220, 102)",
				"lineTension" : 0.1
			} ]
		},
		"options" : {}
	});
</script>
</body>
</html>