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
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


    <style>
        * {
            box-sizing: border-box;
        }

        .body {
            border: 1px solid rgb(202, 202, 202);
            width: 800px;
            margin: auto;
            margin-top: 100px;
            padding: 30px;
            margin-bottom: 30px;
        }
    </style>
</head>

<body>

    <!-- 게시판 상세보기 header 부분 -->
    <div class="body rounded-md">
        <div class="title space-y-1">
            <div class="text-xs text-green-500">[반려견 게시판_#병원]</div>
            <div class="text-2xl font-medium">
                <span>안녕하세요 HOTSIX 입니다.</span>
            </div>
            <div>
                <span class="writer">suhoh01</span>
            </div>
            <div class="grid grid-cols-2 text-gray-400"
                style="padding-bottom: 10px; border-bottom: 1px solid rgb(202, 202, 202);">
                <div class="write_date text-sm">2021.11.30 19.09</div>
                <div class="text-right"> <i class="far fa-eye"></i> 조회 4</div>
            </div>
        </div>

        <!-- 게시글 본문내용 삽입 -->
        <div style="border-bottom: 1px solid rgb(202, 202, 202); padding-bottom: 15px;">

            <div style="margin-top: 10px;">
                안녕
                dnisd<br>
                dnisd<br>
                dnisd<br>
                dnisd<br>
                dnisd<br>
                dnisd<br>
                dnisd<br>
                dnisd<br>
                dnisd<br>
                dnisd<br>
                dnisd<br>
                dnisd<br>
                dnisd<br>
                dnisd<br>
                dnisd<br>
            </div>

            <!-- 오른쪽 하단에 추천과 댓글수 조회 -->
            <div class="content_b text-right text-base">
                <br>
                <!-- 추천시 하트 아이콘이 변하고 추천수가 올라가는 기능 -->
                <button class="nice" id="good"><span style="font-size: 17px;" id="heart"><i
                            class='far fa-heart'></i></span> 추천 <span id="good_n">9</span></button>

                <span style="margin-left: 10px;"><i class="far fa-comment-dots"></i> 댓글 <span id="comment_n">3</span> </span>
            </div>
        </div>

        <!-- 댓글 삽입 기능 -->
        <div class="input_commend">
            <table style="border-bottom: 1px solid rgb(202, 202, 202); width: 100%; margin-top: 15px;">
                <tr>
                    <td rowspan="3" style="width: 15px; height: 15px; padding-right: 10px;">image</td>
                    <td style="padding-top: 10px; font-weight: 600;">suhoh01</td>
                </tr>

                <tr>
                    <td><textarea id="content" style="width: 100%; min-height: 30px; overflow-y: hidden; resize: none;"
                            rows="1" onkeyup="resize(this)" onkeydown="resize(this)">고생 많았습니다.</textarea></td>
                </tr>

                <tr>
                    <td class="text-sm text-gray-400" style="padding-bottom: 10px;">2021.12.08 16:20</td>
                </tr>
            </table>
        </div>

        <div class="input_commend">
            <table style="border-bottom: 1px solid rgb(202, 202, 202); width: 100%; margin-top: 15px;">
                <tr>
                    <td rowspan="3" style="width: 15px; height: 15px; padding-right: 10px;">image</td>
                    <td style="padding-top: 10px; font-weight: 600;">suhoh02</td>
                </tr>

                <tr>
                    <td><textarea id="content" style="width: 100%; min-height: 30px; overflow-y: hidden; resize: none;"
                            rows="1" onkeyup="resize(this)" onkeydown="resize(this)">고dsadasdasg.</textarea></td>
                </tr>

                <tr>
                    <td class="text-sm text-gray-400" style="padding-bottom: 10px;">2021.12.08 16:20</td>
                </tr>
            </table>
        </div>

        <div class="input_commend">
            <table style="border-bottom: 1px solid rgb(202, 202, 202); width: 100%; margin-top: 15px;">
                <tr>
                    <td rowspan="3" style="width: 15px; height: 15px; padding-right: 10px;">image</td>
                    <td style="padding-top: 10px; font-weight: 600;">suhoh03</td>
                </tr>

                <tr>
                    <td><textarea id="content" style="width: 100%; min-height: 30px; overflow-y: hidden; resize: none;"
                            rows="1" onkeyup="resize(this)" onkeydown="resize(this)">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</textarea></td>
                </tr>

                <tr>
                    <td class="text-sm text-gray-400" style="padding-bottom: 10px;">2021.12.08 16:20</td>
                </tr>
            </table>
        </div>

        <!-- 댓글달기 기능 -->
        <div class="commend space-y-2 rounded-md"
            style="padding: 15px; border: 1px solid rgb(187, 186, 186); margin-top: 15px;">
            <div class="writer font-bold">suhoh01</div>

            <!-- 댓글 입력받기 -->
            <div>
                <textarea id="message" placeholder="댓글을 남겨주세요."
                    style="width: 100%; min-height: 30px; overflow-y: hidden; resize: none;" rows="1"
                    onkeyup="resize(this)" onkeydown="resize(this)"></textarea> <!-- textarea 자동 높이조절-->
            </div>

            <div>
                <!-- label 태그로 사진 img에 file 버튼 태그 적용시키기 -->
                <label style="font-size: 22px;">
                    <i class="far fa-image"></i>
                    <input type="file" class="hidden">
                </label>
                <button class="summit float-right text-green-400" type="submit">등록</button>
            </div>
        </div>
    </div>

    <script>

        // 댓글 textarea 자동 높이조절
        function resize(obj) {

            obj.style.height = "1px";
            obj.style.height = (12 + obj.scrollHeight) + "px";
        }


        // 추천시 하트 아이콘이 변하고 추천수가 올라가는 기능
        $(".nice").on("click", function () {
            if ($(this).attr("id") == "good") {
                $("#heart").html("<i class='fas fa-heart'></i>");
                $(this).attr("id", "good_full")
                let num = parseInt($("#num").html())
                let result = num + 1
                $("#num").html(result)

            } else if ($(this).attr("id") == "good_full") {
                $("#heart").html("<i class='far fa-heart'></i>");
                $(this).attr("id", "good")
                let num = parseInt($("#num").html())
                let result = num - 1
                $("#num").html(result)
            }
        })

    </script>

</body>
</html>