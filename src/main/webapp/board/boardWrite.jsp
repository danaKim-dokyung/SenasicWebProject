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
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>


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
       
    </style>


</head>

<body>

    <!-- 글쓰기 Header -->
    <div class="container">
        <div class="head" style="border-bottom: 1px solid rgb(173, 173, 173); font-size: 20px; height: 50px;">
            <b># 반려견 게시판 글쓰기</b>
        </div>

        <!-- 제목 입력 -->
        <div>
            <input style="font-size: 12px; margin-top: 10px; margin-bottom: 10px; padding-left: 10px;" type="text" placeholder="제목을 입력해 주세요." class="
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
            <select
                class="rounded border border-gray-300 focus:outline-none focus:ring-2 focus:ring-indigo-200 focus:border-indigo-500 text-base pl-5 pr-5 w-auto h-14" style="font-size: 12px; margin-left: 10px;">
                <option>카테고리</option>
                <option>병원</option>
                <option>산책로</option>
                <option>음식</option>
                <option>기타</option>
            </select>

            <!-- textarea 태그에 작성 -->
            <div>
                <textarea name="content" id="summernote">aaf</textarea>
            </div>

            <!-- textarea에 summernote 적용 -->
            <script>
                $('#summernote').summernote({
                    placeholder: 'input',
                    tabsize: 2,
                    height: 600 // 높이 지정
                  });
                </script>

            <!-- 목록, 등록 버튼 생성 -->
            <div style="text-align: right;">
                <button type="button"
                class="border border-green-500 text-green-500 hover:bg-green-400 hover:text-gray-100 rounded px-4 py-2"
                style="margin-right: 5px; height: 65%;">목록</button>


                <button type="button"
                class="border border-green-500 text-green-500 hover:bg-green-400 hover:text-gray-100 rounded px-4 py-2"
                style="height: 65%;">등록</button>
            </div>
        </div>
    </div>

</body>

</html>