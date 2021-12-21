<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loginform</title>
	<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
 	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
 <style>
    body {
      min-height: 100vh;

      background: #ffffff
     
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
    	text-align:center;
    	background-color:green;
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
    @font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
* {font-family: GmarketSansMedium;}
    
  </style>
<script>



</script>    
</head>

<body>

  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원가입</h4>
        <form action="/signupProc.mem" method="post" enctype="multipart/form-data" class="validation-form" novalidate>
        <div class="mb-3">
            <label className="input-file-button" for="input-file">프로필 사진 선택</label><br>
            <input type="file" id="input-file" name="photo" style={{display:"none"}}/>
    
         
        </div> 
        
        
        <!-- 아이디 입력 -->
           <div class="mb-3">
            <label for="id">아이디</label>
            <input type="text" class="form-control" id="id" name="id" placeholder="영문,숫자 6자리이상" pattern="^([a-z0-9]){6,20}$" required>
            <div class="col text-right"><span id="checkResult"></span>
            <div class="invalid-feedback">
              아이디를 입력해주세요.
            </div>
          </div>
          </div>
          
          <!-- 닉네임 입력 -->
           <div class="mb-3">
            <label for="nickname">닉네임</label>
            <input type="text" class="form-control" id="nickname" name="nn" placeholder=""pattern="^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]{3,10}$" required>
            <div class="col text-right"><span id="checkResultN"></span>
            <div class="invalid-feedback">
              다른 닉네임을 입력해주세요.
            </div>
          </div>
          </div>
          
          <!-- 비밀번호 입력 -->
          <div class="mb-3">
            <label for="password">비밀번호</label>
            <input type="password" class="form-control" id="pw" name="pw" placeholder="숫자포함8자리이상입력"pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" required>
            <div class="invalid-feedback">
              비밀번호를 입력해주세요.
            </div>
          </div>
          
          <!-- 비밀번호 확인 -->
          <div class="mb-3">
            <label for="confirmpw">비밀번호 확인</label>
            <input type="password" class="form-control" id="cpw" placeholder="" required><span id="checkpw"></span>
            <div class="invalid-feedback">
              비밀번호를 입력해주세요. 
            </div>
          </div>
          
          <!-- 이메일 입력 -->
          <div class="mb-3">
            <label for="email">이메일</label>
            <input type="email" class="form-control" id="email" name="m" placeholder="you@example.com"  required>
            <div class="invalid-feedback">
              이메일을 입력해주세요.
            </div>
          </div>
          
			<!-- 생년월일 -->
        <!--   <div class="row">
          <div class="col-md-4 mb-2">
            	<select class="form-control"  required>
   			 	<option selected>년도</option>
   			 	<option>1997</option>
    			<option>1998</option>
    			<option>1999</option>
				</select>
              <div class="invalid-feedback">
                년도를 선택해주세요
              </div>
            </div>
            <div class="col-md-4 mb-2">--> 
            
     
             
             <!--   <input type="text" class="form-control" id="month"  placeholder="월" value="" pattern="^(0[1-9]|1[012])$" required>
              <div class="invalid-feedback">
                월을 입력해주세요.
              </div>
            </div>
            <div class="col-md-4 mb-2">
              
              <input type="text" class="form-control" id="day"  placeholder="일" value=""pattern="^(0[1-9]|[12][0-9]|3[0-1])$" required>
              <div class="invalid-feedback">
                일을 입력해주세요.
              </div>
            </div>
          </div>-->
          
          
          <!-- 나이 -->
                <div class="mb-3">
            <label for="age">나이</label>
            <input type="text" class="form-control" id="age" name="age" placeholder="나이를 입력하세요"pattern="^[1-9]{1,1}[0-9]{0,1}$"  required>
            <div class="invalid-feedback">
              나이를 입력해주세요.
            </div>
          </div>
             
			<!-- 성별 선택 -->
          <div class="mb-3">
           <label class="block text-gray-600 font-light mb-2">성별을 선택하세요</label>
			<div class="flex">
   			 	<div class="flex items-center mb-2 mr-4">
        			<input type="radio" id="radio-example-1" name="gender" value="M" class="h-4 w-4 text-gray-700 px-3 py-3 border rounded mr-2">
       		 		<label for="radio-example-1" class="text-gray-600">남성</label>
    			</div>
    			<div class="flex items-center mb-2">
       				 <input type="radio" id="radio-example-2" name="gender" value="W" class="h-4 w-4 text-gray-700 px-3 py-3 border rounded mr-2">
       			 	 <label for="radio-example-2" class="text-gray-600">여성</label>
    			</div>
			</div>
          </div>
			
			<!-- 전화번호 -->
          <div class="row">
           	<div class="col-md-4 mb-2">
            	<input type="text" class="form-control" name="phone1" value="010" readonly required>
              <div class="invalid-feedback">
                번호를 선택해주세요
              </div>
            </div>
            
            <div class="col-md-4 mb-2">
             
              <input type="text" class="form-control" id="num2" placeholder="1234" value="" name="phone2"  pattern="^\d{4}$" required>
              <div class="invalid-feedback">
                숫자를 입력해주세요.
              </div>
            </div>
            <div class="col-md-4 mb-2">
              
              <input type="text" class="form-control" id="num3" placeholder="5678" value="" name="phone3"  pattern="^\d{4}$" required>
              <div class="invalid-feedback">
                숫자를 입력해주세요.
              </div>
            </div>
          </div>
			
        
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement" >개인정보 수집 및 이용에 동의합니다.</label>
           <div class="invalid-feedback" id="agree">
                개인정보 동의는 필수사항 입니다
              </div>
          </div>
          <div class="mb-4"></div>
          <div class="col text-center">
           <button class="btn btn-primary btn-lg btn-block" id="subtn" type="submit">가입 완료</button>
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
 

    //아이디 중복확인
    $(function(){
		$("#id").on("input",function(){
			  let id = document.getElementById("id").value;
		        let idregex = /^([a-z0-9]){6,20}$/;
		        let result = idregex.test(id);
		        if(!result){
		        	$("#checkResult").css("color","red");
					$("#checkResult").text("잘못된 ID 입니다.");
		        	
		        	return false;
		        }
			$.ajax({
				url:"/idCheck.mem",
				data:{id:$("#id").val()}
			}).done(function(resp){
				if(resp == "true"){
					$("#checkResult").css("color","pink");
					$("#checkResult").text("이미 사용중인 ID 입니다.");
				}else{
					$("#checkResult").css("color","dodgerblue");
					$("#checkResult").text("사용 가능한 ID 입니다.");
				}
			});
		});
	})
    
    //닉네임 중복확인
    $(function(){
		$("#nickname").on("input",function(){
			 let nickname = document.getElementById("nickname").value;
		        let nickregex = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]{3,10}$/;
		        let result = nickregex.test(nickname);
		        if(!result){
		        	$("#checkResultN").css("color","red");
					$("#checkResultN").text("잘못된 닉네임 입니다.");
		        	
		        	return false;
		        }
			$.ajax({
				url:"/nicknameCheck.mem",
				data:{nn:$("#nickname").val()}
			}).done(function(resp){
				if(resp == "true"){
					$("#checkResultN").css("color","pink");
					$("#checkResultN").text("이미 사용중인 닉네임 입니다.");
				}else{
					$("#checkResultN").css("color","dodgerblue");
					$("#checkResultN").text("사용 가능한 닉네임 입니다.");
				}
			});
		});
	})
    

       
    
	//비밀번호확인
    $("#cpw").on("keyup",function(){
    	if($("#pw").val()==$("#cpw").val()){
    		$("#checkpw").css("color","green");
    		$("#checkpw").text("비밀번호가 일치합니다");
    	}else{
    		$("#checkpw").css("color","pink");
    		$("#checkpw").text("비밀번호가 틀립니다.");
    	}
    })
   
    
  </script>
</body>
</html>