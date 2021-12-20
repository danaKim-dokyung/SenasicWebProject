<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>


<link href="https://unpkg.com/tailwindcss/dist/tailwind.min.css"
	rel="stylesheet">
<!--Replace with your tailwind.css once created-->
<link
	href="https://fonts.googleapis.com/css?family=Work+Sans:200,400&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css" />


<style>
* {
	box-sizing: border-box;
}

#list img {
	filter: brightness(70%);
}

#list img:hover {
	filter: brightness(50%);
}

.hover\:grow {
	transition: all 0.3s;
	transform: scale(1);
}

.hover\:grow:hover {
	transform: scale(1.02);
}
</style>
</head>




<body>
	<div
		style="padding-top: 20px; margin: auto; width: 1000px; height: 100px; font-size: 25px; color: green;">
		맛집 매거진</div>


	<div id="list" class="space-y-20">
		<div class="flex space-x-20 justify-center">
			<a href="/magagine.mag">
				<div class="hover:grow hover:shadow-lg"
					style="position: relative; width: 500px; height: 250px;">
					<img class="rounded-md shadow-lg"
						style="width: 100%; height: 100%;"
						src="/magazine/magagine_img/1.png" alt="">
					<div
						style="color: white; font-weight: 500; width: 500px; position: absolute; top: 45%; left: 50%; transform: translate(-50%, -50%); font-size: 30px; text-align: center; margin: auto;">
						여유로운 휴일을 위한 카페 10선</div>
					<div
						style="color: white; position: absolute; top: 70%; left: 50%; transform: translate(-50%, -50%); text-align: center;">
						"우리 강아지도 한가로이 카페 즐길 줄 안답니다"</div>
				</div>
			</a> <a href="/magagine.mag">
				<div class="hover:grow hover:shadow-lg"
					style="position: relative; width: 500px; height: 250px;">
					<img class="rounded-md shadow-lg"
						style="width: 100%; height: 100%;"
						src="/magazine/magagine_img/2.jpg" alt="">
					<div
						style="color: white; font-weight: 500; width: 500px; position: absolute; top: 45%; left: 50%; transform: translate(-50%, -50%); font-size: 30px; text-align: center; margin: auto;">
						분위기 내기 좋은 레스토랑 10선</div>
					<div
						style="color: white; position: absolute; top: 70%; left: 50%; transform: translate(-50%, -50%); text-align: center;">
						"기분내고 싶은 날에는 꼭 강아지와 함께"</div>
				</div>
			</a>
		</div>

		<div class="flex space-x-20 justify-center">
			<a href="/magagine.mag">
				<div class="hover:grow hover:shadow-lg"
					style="position: relative; width: 500px; height: 250px;">
					<img class="rounded-md shadow-lg"
						style="width: 100%; height: 100%;"
						src="/magazine/magagine_img/33.jpg" alt="">
					<div
						style="color: white; font-weight: 500; width: 500px; position: absolute; top: 45%; left: 50%; transform: translate(-50%, -50%); font-size: 30px; text-align: center; margin: auto;">
						뚜벅이로도 방문 가능한 10곳</div>
					<div
						style="color: white; position: absolute; top: 70%; left: 50%; transform: translate(-50%, -50%); text-align: center;">
						"지하철역 주변, 걸어가도 좋아요!"</div>
				</div>
			</a> <a href="/magagine.mag">
				<div class="hover:grow hover:shadow-lg"
					style="position: relative; width: 500px; height: 250px;">
					<img class="rounded-md shadow-lg"
						style="width: 100%; height: 100%;"
						src="/magazine/magagine_img/4.jpg" alt="">
					<div
						style="color: white; font-weight: 500; width: 500px; position: absolute; top: 45%; left: 50%; transform: translate(-50%, -50%); font-size: 30px; text-align: center; margin: auto;">
						강아지와 함께 할 수 있는 pub!</div>
					<div
						style="color: white; position: absolute; top: 70%; left: 50%; transform: translate(-50%, -50%); text-align: center;">
						"우리 강아지의 불금을 책임지는!"</div>
				</div>
			</a>
		</div>

		<div class="flex space-x-20 justify-center">
			<a href="/magagine.mag">
				<div class="hover:grow hover:shadow-lg"
					style="position: relative; width: 500px; height: 250px;">
					<img class="rounded-md shadow-lg"
						style="width: 100%; height: 100%;"
						src="/magazine/magagine_img/5.jpg" alt="">
					<div
						style="color: white; font-weight: 500; width: 500px; position: absolute; top: 45%; left: 50%; transform: translate(-50%, -50%); font-size: 30px; text-align: center; margin: auto;">
						여행 온 듯한 이색풍 레스토랑 10선</div>
					<div
						style="color: white; position: absolute; top: 70%; left: 50%; transform: translate(-50%, -50%); text-align: center;">
						"여행은 못가도 우리 기분만은 베트남, 중국, 인도!"</div>
				</div>
			</a> <a href="/magagine.mag">
				<div class="hover:grow hover:shadow-lg"
					style="position: relative; width: 500px; height: 250px;">
					<img class="rounded-md shadow-lg"
						style="width: 100%; height: 100%;"
						src="/magazine/magagine_img/6.jpg" alt="">
					<div
						style="color: white; font-weight: 500; width: 500px; position: absolute; top: 45%; left: 50%; transform: translate(-50%, -50%); font-size: 30px; text-align: center; margin: auto;">
						연말 분위기 내기 좋은 10곳</div>
					<div
						style="color: white; position: absolute; top: 70%; left: 50%; transform: translate(-50%, -50%); text-align: center;">
						"올해도 수고했어, 우리 강아지, 내년에도 잘 부탁해!"</div>
				</div>
			</a>
		</div>

		<div class="flex space-x-20 justify-center">
			<a href="/magagine.mag">
				<div class="hover:grow hover:shadow-lg"
					style="position: relative; width: 500px; height: 250px;">
					<img class="rounded-md shadow-lg"
						style="width: 100%; height: 100%;"
						src="/magazine/magagine_img/7.jpg" alt="">
					<div
						style="color: white; font-weight: 500; width: 500px; position: absolute; top: 45%; left: 50%; transform: translate(-50%, -50%); font-size: 30px; text-align: center; margin: auto;">
						강아지 음식이 함께 있는 10곳</div>
					<div
						style="color: white; position: absolute; top: 70%; left: 50%; transform: translate(-50%, -50%); text-align: center;">
						"우리끼리 먹어서 미안했다면?"</div>
				</div>
			</a> <a href="/magagine.mag">
				<div class="hover:grow hover:shadow-lg"
					style="position: relative; width: 500px; height: 250px;">
					<img class="rounded-md shadow-lg"
						style="width: 100%; height: 100%;"
						src="/magazine/magagine_img/8.jpg" alt="">
					<div
						style="color: white; font-weight: 500; width: 500px; position: absolute; top: 45%; left: 50%; transform: translate(-50%, -50%); font-size: 30px; text-align: center; margin: auto;">
						테라스가 있는 10곳</div>
					<div
						style="color: white; position: absolute; top: 70%; left: 50%; transform: translate(-50%, -50%); text-align: center;">
						"바깥바람 쐬는 걸 좋아하는 우리 강아지를 위해!"</div>
				</div>
				<!--  -->
			</a>
		</div>


	</div>

</body>
</html>