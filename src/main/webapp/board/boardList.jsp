<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />

    <style>
        * {
            box-sizing: border-box;
        }

        td>a:hover {
            text-decoration: underline;
            /* hover시 밑줄표시 */
        }
    </style>
</head>

<body>

    <div class="md:container md:mx-auto">

        <div>
            <h1 class="text-6xl font-normal leading-normal h-48 mt-0 mb-2 text-green-800 text-center">
                반려견 게시판
            </h1>
        </div>

        <!-- 카테고리 선택 -->
        <div class="space-x-20 place-items-center md:w-32"
            style="margin-left: 10%; width: 80%; height: 100px; text-align: center">

            <button class="group bg-green-300 focus:bg-green-400 rounded-xl shadow-md w-1/6 h-2/4 text-center">
                # 병원
            </button>

            <button class="group bg-green-300 focus:bg-green-400 rounded-xl shadow-md w-1/6 h-2/4 text-center">
                # 산책로
            </button>

            <button class="group bg-green-300 focus:bg-green-400 rounded-xl shadow-md w-1/6 h-2/4 text-center">
                # 음식
            </button>

            <button class="group bg-green-300 focus:bg-green-400 rounded-xl shadow-md w-1/6 h-2/4 text-center">
                # 기타
            </button>
        </div>


        <!-- 글쓰기 버튼 -->
        <div class="btn">
            <div style="text-align: right; width: 85%;">
                <button type="button"
                    class="border border-green-500 text-green-500 hover:bg-green-400 hover:text-gray-100 rounded px-4 py-2"
                    style="margin-top: 10px;">글쓰기</button>

            </div>
        </div>


        <!-- 게시판 작성 -->
        <div class="board" style=" width: 70%; height: 100%; margin: auto;">

            <div class="bg-white rounded-lg shadow-lg py-6" style="height: 100%;">
                <!-- 게시판 큰 틀-->

                <div class="block overflow-x-auto mx-6">
                    <!-- 게시판 메인 작업 -->
                    <table class="w-full">
                        <thead>
                            <tr class="text-gray-800 border border-b-0 text-center">
                                <th colspan="6" class="px-4 py-3" style="width: 100%;"># 병원게시판</th>
                            </tr>

                            <!-- 게시판 상단 목차 -->
                            <tr class="text-gray-800 border border-b-0 text-center text-sm">
                                <th class="px-4 py-3 w-1/12">#</th>
                                <th class="px-4 py-3 w-7/12">제목</th>
                                <th class="px-4 py-3 w-1/12">작성자</th>
                                <th class="px-4 py-3 w-1/12">작성일</th>
                                <th class="px-4 py-3 w-1/12">조회수</th>
                                <th class="px-4 py-3 w-1/12">추천</th>
                            </tr>
                        </thead>

                        <!------------------------------------- 게시판 작성 ------------------------------------->
                        <tbody>
                            <tr
                                class="w-full font-light text-gray-700 bg-gray-100 whitespace-no-wrap border border-b-0 text-sm">
                                <td class="px-4 py-4 text-center">1</td>
                                <td class="px-4 py-4"><a href="">asdnoiwnoifnidosfniosdnoifani</a> </td>
                                <td class="px-4 py-4 text-center">핫식스</td>
                                <td class="px-4 py-4 text-center">2021.12.07</td>
                                <td class="px-4 py-4 text-center"> 5</td>
                                <td class="px-4 py-4 text-center"> 3</td>
                            </tr>

                            <tr class="w-full font-light text-gray-700 whitespace-no-wrap border text-sm">
                                <td class="px-4 py-4 text-center">2</td>
                                <td class="px-4 py-4"><a href="">너어어어어어어ㅓㅓㅓㅓㅓㅓㅓㅓㅓ무어렵다</a></td>
                                <td class="px-4 py-4 text-center">서호현</td>
                                <td class="px-4 py-4 text-center">2021.12.08</td>
                                <td class="px-4 py-4 text-center"> 45</td>
                                <td class="px-4 py-4 text-center"> 2</td>
                            </tr>

                            <tr
                                class="w-full font-light text-gray-700 bg-gray-100 whitespace-no-wrap border border-b-0 text-sm">
                                <td class="px-4 py-4 text-center">3</td>
                                <td class="px-4 py-4"><a href="">고생하셨습니다</a></td>
                                <td class="px-4 py-4 text-center">서호현</td>
                                <td class="px-4 py-4 text-center">2021.12.09</td>
                                <td class="px-4 py-4 text-center"> 3</td>
                                <td class="px-4 py-4 text-center"> 5</td>
                            </tr>

                            <tr class="w-full font-light text-gray-700 whitespace-no-wrap border text-sm">
                                <td class="px-4 py-4 text-center">4</td>
                                <td class="px-4 py-4"><a href="">Hotsix</a></td>
                                <td class="px-4 py-4 text-center">서호현</td>
                                <td class="px-4 py-4 text-center">2021.12.08</td>
                                <td class="px-4 py-4 text-center"> 45</td>
                                <td class="px-4 py-4 text-center"> 2</td>
                            </tr>

                            <tr
                                class="w-full font-light text-gray-700 bg-gray-100 whitespace-no-wrap border border-b-0 text-sm">
                                <td class="px-4 py-4 text-center">1</td>
                                <td class="px-4 py-4"><a href="">asdnoiwnoifnidosfniosdnoifani</a> </td>
                                <td class="px-4 py-4 text-center">핫식스</td>
                                <td class="px-4 py-4 text-center">2021.12.07</td>
                                <td class="px-4 py-4 text-center"> 5</td>
                                <td class="px-4 py-4 text-center"> 3</td>
                            </tr>

                            <tr class="w-full font-light text-gray-700 whitespace-no-wrap border text-sm">
                                <td class="px-4 py-4 text-center">2</td>
                                <td class="px-4 py-4"><a href="">너어어어어어어ㅓㅓㅓㅓㅓㅓㅓㅓㅓ무어렵다</a></td>
                                <td class="px-4 py-4 text-center">서호현</td>
                                <td class="px-4 py-4 text-center">2021.12.08</td>
                                <td class="px-4 py-4 text-center"> 45</td>
                                <td class="px-4 py-4 text-center"> 2</td>
                            </tr>

                            <tr
                                class="w-full font-light text-gray-700 bg-gray-100 whitespace-no-wrap border border-b-0 text-sm">
                                <td class="px-4 py-4 text-center">3</td>
                                <td class="px-4 py-4"><a href="">고생하셨습니다</a></td>
                                <td class="px-4 py-4 text-center">서호현</td>
                                <td class="px-4 py-4 text-center">2021.12.09</td>
                                <td class="px-4 py-4 text-center"> 3</td>
                                <td class="px-4 py-4 text-center"> 5</td>
                            </tr>

                            <tr class="w-full font-light text-gray-700 whitespace-no-wrap border text-sm">
                                <td class="px-4 py-4 text-center">4</td>
                                <td class="px-4 py-4"><a href="">Hotsix</a></td>
                                <td class="px-4 py-4 text-center">서호현</td>
                                <td class="px-4 py-4 text-center">2021.12.08</td>
                                <td class="px-4 py-4 text-center"> 45</td>
                                <td class="px-4 py-4 text-center"> 2</td>
                            </tr>
                            <tr
                                class="w-full font-light text-gray-700 bg-gray-100 whitespace-no-wrap border border-b-0 text-sm">
                                <td class="px-4 py-4 text-center">1</td>
                                <td class="px-4 py-4"><a href="">asdnoiwnoifnidosfniosdnoifani</a> </td>
                                <td class="px-4 py-4 text-center">핫식스</td>
                                <td class="px-4 py-4 text-center">2021.12.07</td>
                                <td class="px-4 py-4 text-center"> 5</td>
                                <td class="px-4 py-4 text-center"> 3</td>
                            </tr>

                            <tr class="w-full font-light text-gray-700 whitespace-no-wrap border text-sm">
                                <td class="px-4 py-4 text-center">2</td>
                                <td class="px-4 py-4"><a href="">너어어어어어어ㅓㅓㅓㅓㅓㅓㅓㅓㅓ무어렵다</a></td>
                                <td class="px-4 py-4 text-center">서호현</td>
                                <td class="px-4 py-4 text-center">2021.12.08</td>
                                <td class="px-4 py-4 text-center"> 45</td>
                                <td class="px-4 py-4 text-center"> 2</td>
                            </tr>

                            <tr
                                class="w-full font-light text-gray-700 bg-gray-100 whitespace-no-wrap border border-b-0 text-sm">
                                <td class="px-4 py-4 text-center">3</td>
                                <td class="px-4 py-4"><a href="">고생하셨습니다</a></td>
                                <td class="px-4 py-4 text-center">서호현</td>
                                <td class="px-4 py-4 text-center">2021.12.09</td>
                                <td class="px-4 py-4 text-center"> 3</td>
                                <td class="px-4 py-4 text-center"> 5</td>
                            </tr>

                            <tr class="w-full font-light text-gray-700 whitespace-no-wrap border text-sm">
                                <td class="px-4 py-4 text-center">4</td>
                                <td class="px-4 py-4"><a href="">Hotsix</a></td>
                                <td class="px-4 py-4 text-center">서호현</td>
                                <td class="px-4 py-4 text-center">2021.12.08</td>
                                <td class="px-4 py-4 text-center"> 45</td>
                                <td class="px-4 py-4 text-center"> 2</td>
                            </tr>
                            <tr
                                class="w-full font-light text-gray-700 bg-gray-100 whitespace-no-wrap border border-b-0 text-sm">
                                <td class="px-4 py-4 text-center">1</td>
                                <td class="px-4 py-4"><a href="">asdnoiwnoifnidosfniosdnoifani</a> </td>
                                <td class="px-4 py-4 text-center">핫식스</td>
                                <td class="px-4 py-4 text-center">2021.12.07</td>
                                <td class="px-4 py-4 text-center"> 5</td>
                                <td class="px-4 py-4 text-center"> 3</td>
                            </tr>

                            <tr class="w-full font-light text-gray-700 whitespace-no-wrap border text-sm">
                                <td class="px-4 py-4 text-center">2</td>
                                <td class="px-4 py-4"><a href="">너어어어어어어ㅓㅓㅓㅓㅓㅓㅓㅓㅓ무어렵다</a></td>
                                <td class="px-4 py-4 text-center">서호현</td>
                                <td class="px-4 py-4 text-center">2021.12.08</td>
                                <td class="px-4 py-4 text-center"> 45</td>
                                <td class="px-4 py-4 text-center"> 2</td>
                            </tr>

                            <tr
                                class="w-full font-light text-gray-700 bg-gray-100 whitespace-no-wrap border border-b-0 text-sm">
                                <td class="px-4 py-4 text-center">3</td>
                                <td class="px-4 py-4"><a href="">고생하셨습니다</a></td>
                                <td class="px-4 py-4 text-center">서호현</td>
                                <td class="px-4 py-4 text-center">2021.12.09</td>
                                <td class="px-4 py-4 text-center"> 3</td>
                                <td class="px-4 py-4 text-center"> 5</td>
                            </tr>

                            <tr class="w-full font-light text-gray-700 whitespace-no-wrap border text-sm">
                                <td class="px-4 py-4 text-center">4</td>
                                <td class="px-4 py-4"><a href="">Hotsix</a></td>
                                <td class="px-4 py-4 text-center">서호현</td>
                                <td class="px-4 py-4 text-center">2021.12.08</td>
                                <td class="px-4 py-4 text-center"> 45</td>
                                <td class="px-4 py-4 text-center"> 2</td>
                            </tr>
                        </tbody>
                        <!--------------------------------------- 게시판 작성 끝 --------------------------------------->
                    </table>
                </div>
            </div>
        </div>


        <!-- 게시판 footer -->
        <div class="footer" style="width: 70%; background-color: rgba(224, 223, 223, 0.288); margin: auto;">

            <!-- 게시판 페이징 -->
            <!-- <div class="space-x-3"
                style="height: 40px; text-align: center; line-height: 40px; border-bottom: 1px solid rgba(189, 187, 187, 0.288);">
                <a href="">1</a>
                <a href="">2</a>
                <a href="">3</a>
                <a href="">4</a>
                <a href="">5</a>
                <a href="">></a>

            </div> -->

            <!-- 게시판 페이징 2 -->
            <div
                style="margin-top: 15px;  height: 40px; text-align: center; border-bottom: 1px solid rgba(189, 187, 187, 0.288);">
                <button class="
                    text-green-500
                    bg-transparent
                    border border-green-500
                    hover:bg-green-500 hover:text-white
                    active:bg-green-600
                    font-bold
                    uppercase
                    text-xs
                    px-4
                    py-2
                    rounded-l
                    outline-none
                    focus:outline-none
                    mb-1
                    ease-linear
                    transition-all
                    duration-150
                  " type="button">
                    <i class="fas fa-angle-left"></i>
                </button>
                <button class="
                    text-green-500
                    bg-transparent
                    border border-green-500
                    hover:bg-green-500 hover:text-white
                    active:bg-green-600
                    font-bold
                    uppercase
                    text-xs
                    px-4
                    py-2
                    outline-none
                    focus:outline-none
                    mb-1
                    ease-linear
                    transition-all
                    duration-150
                  " type="button">
                    1
                </button>
                <button class="
                    text-green-500
                    bg-transparent
                    border border-green-500
                    hover:bg-green-500 hover:text-white
                    active:bg-green-600
                    font-bold
                    uppercase
                    text-xs
                    px-4
                    py-2
                    outline-none
                    focus:outline-none
                    mb-1
                    ease-linear
                    transition-all
                    duration-150
                  " type="button">
                    2
                </button>
                <button class="
                    text-green-500
                    bg-transparent
                    border border-solid border-green-500
                    hover:bg-green-500 hover:text-white
                    active:bg-green-600
                    font-bold
                    uppercase
                    text-xs
                    px-4
                    py-2
                    outline-none
                    focus:outline-none
                    mb-1
                    ease-linear
                    transition-all
                    duration-150
                  " type="button">
                    3
                </button>

                <button class="
                    text-green-500
                    bg-transparent
                    border border-solid border-green-500
                    hover:bg-green-500 hover:text-white
                    active:bg-green-600
                    font-bold
                    uppercase
                    text-xs
                    px-4
                    py-2
                    outline-none
                    focus:outline-none
                    mb-1
                    ease-linear
                    transition-all
                    duration-150
                  " type="button">
                    4
                </button>

                <button class="
                    text-green-500
                    bg-transparent
                    border border-solid border-green-500
                    hover:bg-green-500 hover:text-white
                    active:bg-green-600
                    font-bold
                    uppercase
                    text-xs
                    px-4
                    py-2
                    outline-none
                    focus:outline-none
                    mb-1
                    ease-linear
                    transition-all
                    duration-150
                  " type="button">
                    5
                </button>

                <button class="
                    text-green-500
                    bg-transparent
                    border border-green-500
                    hover:bg-green-500 hover:text-white
                    active:bg-green-600
                    font-bold
                    uppercase
                    text-xs
                    px-4
                    py-2
                    rounded-r
                    outline-none
                    focus:outline-none
                    mb-1
                    ease-linear
                    transition-all
                    duration-150
                  " type="button">
                    <i class="fas fa-angle-right"></i>
                </button>
            </div>

            <!-- 검색 기능 -->
            <div>
                <div class="" style="text-align: center; height: 70px; margin-bottom: 100px;">

                    <!-- 검색 조건 -->
                    <select
                        class="rounded border appearance-none border-gray-300 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-200 focus:border-indigo-500 text-base pl-3 pr-10 w-auto">
                        <option>제목</option>
                        <option>작성자</option>
                        <option>L</option>
                        <option>XL</option>
                    </select>

                    <!-- 검색 하기 -->
                    <input type="text" placeholder="Search" class="
                    px-2
                    py-1
                    placeholder-gray-400
                    text-gray-600 
                    relative
                    bg-white bg-white
                    rounded
                    text-sm
                    border border-gray-400
                    outline-none
                    focus:outline-none focus:ring
                    w-5/12
                    h-10
                  " />

                    <!-- 검색 버튼 -->
                    <button type="button"
                        class="border border-gray-500 text-black-500 bg-Gray-400 bg-gray-200 rounded px-4 py-1.5"
                        style="margin-top: 15px;">검색</button>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>