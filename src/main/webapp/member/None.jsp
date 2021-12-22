<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result of finding ID</title>
	<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
 	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
 <style>
    body {
      min-height: 100vh;

      background: white;
     
    }

    .input-form {
      max-width: 680px;

      margin-top: 200px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
    #btn1{
    	text-align=center;
    }
    #btn2{
    	text-align=center;
    	
    }
    #padbtn{
    padding-top:10px;
    }
    #real-input{
    	visibility:hidden;
    }
    .input-file-button{
    	padding: 6px 25px;
    	background-color:#FF6600;
    	border-radius:4px;
    	color:white;
    	cursor:pointer;
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
				<span class="ml-3 text-xl">SENASIC</span>
			</a>
			
		</div>
	</header>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">요청하신 정보를 찾지 못했습니다.</h4>
        
		<hr class="mb-4">
        
        
          <div class="mb-3">
<a href="/findId.mem">ID찾기 </a>&nbsp;&nbsp;&nbsp;
<a href="/findPw.mem">PW찾기 </a>


          </div>




          <div class="mb-4"></div>
          <div class="col text-center">
           <div><a href="/signup.mem"><button class="btn btn-primary btn-lg btn-block" id="btn1" >회원가입</button></a></div>
           <div id="padbtn"><a href="/signin.mem"><button class="btn btn-primary btn-lg btn-block" id="btn2" >로그인</button></a></div>
          </div>
         
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; 관리자 메일 : hot-six@naver.com</p>
    </footer>
  </div>
 
</body>
</html>