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
</head>

<style>
* {
	box-sizing: border-box;
}

.more>a:hover {
	color: rgb(26, 190, 48);
	text-decoration: underline;
}

.shop>div {
	float: left;
}
</style>
	<!------------- 맛집 매거진 주제, 글 생성 날짜, 조회수 -------------->
    <header>

        <div style="border: 1px solid black; width: 100%; height: 100px;"></div>

        <div class="shadow-t-lg" style="text-align: center; border-bottom: 1px solid rgb(172, 168, 168);  background-color:rgba(211, 211, 211, 0.445); height: 180px;">

            <div class="date">
                <!-- 작성 날짜 및 조회수-->
                <div style="padding-top: 30px;">
                    2021.12.17
                </div>
            </div>
            

            <!-- 매거진 제목 -->
            <div style="font-size: 35px; font-weight: 500; padding-top: 10px; padding-bottom: 10px;" id="big-title">
                수프 맛집 베스트 10곳
            </div>


            <!-- 매거진 부제목 -->
            <div id="small-title" style="color: grey; font-size: 18px;">
                “몸 녹일 땐 스프가 진리!”
            </div>
        </div>
    </header>

<body>

    <!------------- 맛집 디테일 시작 부분 -------------->

	<c:forEach var="dto" items="${list }" varStatus="status">
		<div class="shop bg-white shadow-lg"
			style="padding-top: 20px; padding-bottom: 20px; width: 850px; height: 250px; border-top: rgb(179, 176, 176); border-bottom: 1px solid rgb(179, 176, 176); margin: auto;">
			<div style="width: 220px; height: 100%">
				<img style="height: 100%;"
					class="rounded-md w-full object-cover object-center mb-6"
					src=${dto.photo1 } alt="content">
			</div>

			<div style="height: 100%; width: 72%; padding-left: 30px;">
				<div style="font-size: 25px; color: rgb(73, 73, 73);">
					${status.count }. ${dto.title } &nbsp; <span class="text-green-500">${dto.rate }</span>
				</div>
				<div style="font-size: 16px; color: rgb(154, 156, 158);">${dto.locate }
					${dto.locate_detail }</div>
				<div style="height: 90px; padding-top : 15px">
					<textarea style="width: 100%;">맛이가 아주없습니다.</textarea>
				</div>
				<div class="more" style="text-align: right; color: gray; ">
					<a href="/load.rest?seq=${dto.seq }">${dto.title } 더보기 ></a>
				</div>
			</div>
		</div>
	</c:forEach>




</body>
</html>