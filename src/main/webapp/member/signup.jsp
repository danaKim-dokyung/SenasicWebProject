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
        <h4 class="mb-3">????????????</h4>
        <form action="/signupProc.mem" method="post" enctype="multipart/form-data" class="validation-form" novalidate>
        <div class="mb-3">
            <label className="input-file-button" for="input-file">????????? ?????? ??????</label><br>
                     </div>
<div class="flex justify-left mt-2">
    <div class="rounded-xl shadow-xl bg-gray-50 ">
        <div class="m-4">
            <div class="flex items-center justify-center w-full">
                <label class="flex flex-col w-20 h-20  hover:bg-gray-100 hover:border-gray-300"id="pholabel">
                    <div class="flex flex-col items-center justify-center pt-0" id="pho">
                       <svg xmlns="http://www.w3.org/2000/svg" class="h-20 w-20" fill="none" viewBox="0 0 24 24" stroke="rgb(203 213 225)">
  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5.121 17.804A13.937 13.937 0 0112 16c2.5 0 4.847.655 6.879 1.804M15 10a3 3 0 11-6 0 3 3 0 016 0zm6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
</svg>

                    </div>
                    <input accept="image/*" id="input-file" type="file" class="opacity-0" name="photo"/>
                </label>
            </div>
        </div>
    </div>

    
         
        </div> 

        
        
        <!-- ????????? ?????? -->
           <div class="mb-3">
            <label for="id">?????????</label>
            <input type="text" class="form-control" id="id" name="id" placeholder="??????,?????? 6????????????" pattern="^([a-z0-9]){6,20}$" required>
            <div class="col text-right"><span id="checkResult"></span>
            <div class="invalid-feedback">
              ???????????? ??????????????????.
            </div>
          </div>
          </div>
          
          <!-- ????????? ?????? -->
           <div class="mb-3">
            <label for="nickname">?????????</label>
            <input type="text" class="form-control" id="nickname" name="nn" placeholder=""pattern="^[???-???|???-???|a-z|A-Z|0-9|]{3,10}$" required>
            <div class="col text-right"><span id="checkResultN"></span>
            <div class="invalid-feedback">
              ?????? ???????????? ??????????????????.
            </div>
          </div>
          </div>
          
          <!-- ???????????? ?????? -->
          <div class="mb-3">
            <label for="password">????????????</label>
            <input type="password" class="form-control" id="pw" name="pw" placeholder="????????????8??????????????????"pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" required>
            <div class="invalid-feedback">
              ??????????????? ??????????????????.
            </div>
          </div>
          
          <!-- ???????????? ?????? -->
          <div class="mb-3">
            <label for="confirmpw">???????????? ??????</label>
            <input type="password" class="form-control" id="cpw" placeholder="" required><span id="checkpw"></span>
            <div class="invalid-feedback">
              ??????????????? ??????????????????. 
            </div>
          </div>
          
          <!-- ????????? ?????? -->
          <div class="mb-3">
            <label for="email">?????????</label>
            <input type="email" class="form-control" id="email" name="m" placeholder="you@example.com"  required>
            <div class="invalid-feedback">
              ???????????? ??????????????????.
            </div>
          </div>
          
         <!-- ???????????? -->
        <!--   <div class="row">
          <div class="col-md-4 mb-2">
               <select class="form-control"  required>
                <option selected>??????</option>
                <option>1997</option>
             <option>1998</option>
             <option>1999</option>
            </select>
              <div class="invalid-feedback">
                ????????? ??????????????????
              </div>
            </div>
            <div class="col-md-4 mb-2">--> 
            
     
             
             <!--   <input type="text" class="form-control" id="month"  placeholder="???" value="" pattern="^(0[1-9]|1[012])$" required>
              <div class="invalid-feedback">
                ?????? ??????????????????.
              </div>
            </div>
            <div class="col-md-4 mb-2">
              
              <input type="text" class="form-control" id="day"  placeholder="???" value=""pattern="^(0[1-9]|[12][0-9]|3[0-1])$" required>
              <div class="invalid-feedback">
                ?????? ??????????????????.
              </div>
            </div>
          </div>-->
          
          
          <!-- ?????? -->
                <div class="mb-3">
            <label for="age">??????</label>
            <input type="text" class="form-control" id="age" name="age" placeholder="????????? ???????????????"pattern="^[1-9]{1,1}[0-9]{0,1}$"  required>
            <div class="invalid-feedback">
              ????????? ??????????????????.
            </div>
          </div>
             
         <!-- ?????? ?????? -->
          <div class="mb-3">
           <label class="block text-gray-600 font-light mb-2">????????? ???????????????</label>
         <div class="flex">
                <div class="flex items-center mb-2 mr-4">
                 <input type="radio" id="radio-example-1" name="gender" value="M" class="h-4 w-4 text-gray-700 px-3 py-3 border rounded mr-2">
                    <label for="radio-example-1" class="text-gray-600">??????</label>
             </div>
             <div class="flex items-center mb-2">
                    <input type="radio" id="radio-example-2" name="gender" value="W" class="h-4 w-4 text-gray-700 px-3 py-3 border rounded mr-2">
                     <label for="radio-example-2" class="text-gray-600">??????</label>
             </div>
         </div>
          </div>
         
         <!-- ???????????? -->
          <div class="row">
              <div class="col-md-4 mb-2">
               <input type="text" class="form-control" name="phone1" value="010" readonly required>
              <div class="invalid-feedback">
                ????????? ??????????????????
              </div>
            </div>
            
            <div class="col-md-4 mb-2">
             
              <input type="text" class="form-control" id="num2" placeholder="1234" value="" name="phone2"  pattern="^\d{4}$" required>
              <div class="invalid-feedback">
                ????????? ??????????????????.
              </div>
            </div>
            <div class="col-md-4 mb-2">
              
              <input type="text" class="form-control" id="num3" placeholder="5678" value="" name="phone3"  pattern="^\d{4}$" required>
              <div class="invalid-feedback">
                ????????? ??????????????????.
              </div>
            </div>
          </div>
         
        
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement" >???????????? ?????? ??? ????????? ???????????????.</label>
           <div class="invalid-feedback" id="agree">
                ???????????? ????????? ???????????? ?????????
              </div>
          </div>
          <div class="mb-4"></div>
          <div class="col text-center">
           <button class="btn btn-primary btn-lg btn-block" id="subtn" type="submit">?????? ??????</button>
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
 

    //????????? ????????????
    $(function(){
      $("#id").on("input",function(){
           let id = document.getElementById("id").value;
              let idregex = /^([a-z0-9]){6,20}$/;
              let result = idregex.test(id);
              if(!result){
                 $("#checkResult").css("color","red");
               $("#checkResult").text("????????? ID ?????????.");
                 
                 return false;
              }
         $.ajax({
            url:"/idCheck.mem",
            data:{id:$("#id").val()}
         }).done(function(resp){
            if(resp == "true"){
               $("#checkResult").css("color","pink");
               $("#checkResult").text("?????? ???????????? ID ?????????.");
            }else{
               $("#checkResult").css("color","dodgerblue");
               $("#checkResult").text("?????? ????????? ID ?????????.");
            }
         });
      });
   })
    
    //????????? ????????????
    $(function(){
      $("#nickname").on("input",function(){
          let nickname = document.getElementById("nickname").value;
              let nickregex = /^[???-???|???-???|a-z|A-Z|0-9|]{3,10}$/;
              let result = nickregex.test(nickname);
              if(!result){
                 $("#checkResultN").css("color","red");
               $("#checkResultN").text("????????? ????????? ?????????.");
                 
                 return false;
              }
         $.ajax({
            url:"/nicknameCheck.mem",
            data:{nn:$("#nickname").val()}
         }).done(function(resp){
            if(resp == "true"){
               $("#checkResultN").css("color","pink");
               $("#checkResultN").text("?????? ???????????? ????????? ?????????.");
            }else{
               $("#checkResultN").css("color","dodgerblue");
               $("#checkResultN").text("?????? ????????? ????????? ?????????.");
            }
         });
      });
   })
    

       
    
   //??????????????????
    $("#cpw").on("keyup",function(){
       if($("#pw").val()==$("#cpw").val()){
          $("#checkpw").css("color","green");
          $("#checkpw").text("??????????????? ???????????????");
       }else{
          $("#checkpw").css("color","pink");
          $("#checkpw").text("??????????????? ????????????.");
       }
    })
      $("#input-file").on("change",function(){
      let file = this.files[0];
      if (file) {
          $("#pho").html("<img class='w-20 h-20' viewBox='0 0 20 20' src = "+URL.createObjectURL(file)+">");
        }
      })
   
    
  </script>
</body>
</html>