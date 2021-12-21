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

      background: #047857
     
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
    #btn1{
    	text-align=center;
    }
    #btn2{
    	text-align=center;
    	
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
<script>



</script>    
</head>

<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">고객님의 계정을 찾았습니다.</h4>
        <h6 class="mb-3">아이디 확인 후 로그인해 주세요.</h6>
		<hr class="mb-4">
        
<!-- 고객 ID 띄워주기 -->          
          <div class="mb-3">
${id} 아이디


          </div>


<!-- 비밀번호 찾기 또는 로그인 -->

          <div class="mb-4"></div>
          <div class="col text-center">
           <div><a href="/findPw.mem"><button class="btn btn-primary btn-lg btn-block" id="btn1" >비밀번호 찾기</button></a></div>
           <div><a href="/signin.mem"><button class="btn btn-primary btn-lg btn-block" id="btn2" >로그인</button></a></div>
          </div>
         
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; hot-six</p>
    </footer>
  </div>
  <script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
 

   
   
    
  </script>
</body>
</html>