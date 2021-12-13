<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findID</title>
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
    #subtn{
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
        <h4 class="mb-3">PW찾기</h4>
        <form action="" method="post" enctype="multipart/form-data" class="validation-form" novalidate>
          
      
          
          <!-- 이메일 입력 -->
          <div class="mb-3">
            <label for="id">아이디입력</label>
            <input type="text" class="form-control" id="id" name="id" placeholder="id를입력하세요"  required>
            <div class="invalid-feedback">
             아이디를 입력해주세요.
            </div>
          </div>
          
		
			
		
			
        
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement" >개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          <div class="mb-4"></div>
          <div class="col text-center">
           <button class="btn btn-primary btn-lg btn-block" id="subtn" type="submit">비밀번호 찾기</button>
          </div>
         
        </form>
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