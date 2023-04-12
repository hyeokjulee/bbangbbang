<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<%@ include file="/WEB-INF/header.jsp"%>

<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<header id="gtco-header-sub" class="gtco-cover-sub2 gtco-cover-md" data-stellar-background-ratio="0.5">
<div class="overlay"></div>
      <div class="gtco-container">
         <div class="row">
            <div class="col-md-12 col-md-offset-0 text-center">

               <div class="row row-mt-8em">
                  <div class="col-md-12 mt-text animate-box" data-animate-effect="fadeInUp">
                     <h2 class="white-color" style="font-size: 60px; font-weight: bold;">가게 등록</h2>
                  </div>
                  
               </div>
               
            </div>
         </div>
      </div>
   </header>
<section class="py-5 text-center container"></section><br><br>
<body>
   <div class="container">
   <div class="row form-group" ></div>

<!--  ${_csrf.parameterName}=${_csrf.token} -->

   <form
      action="/store/update?${_csrf.parameterName}=${_csrf.token}&sid=${store.sid}"
      class="form-horizontal" method="POST" enctype="multipart/form-data">
      <fieldset>
         
         가게 이름 :
         <input name="sname" class="form-control" />
         가게 주소 :
         <input name="saddr" class="form-control" />
         가게 번호 :
         <input name="stel" class="form-control" />
         가게 사진 :
         <input name="sphotoFile" type="file" class="form-control" />
         <!-- 여기는 따로 수정이 필요 -->
         
         <button type="button" class="btn btn-primary" onclick="addMenu()">메뉴 추가</button>
         <div id="menu" class="col-md-12"></div>
       

         <br><button type="button" class="btn btn-primary"  onclick="sendForm()">등록</button>


      </fieldset>
   </form>
</div>
   
</body>

<script>
    


   function addMenu(){
      var menu = document.getElementById("menu");
      var div = document.createElement("div");
      div.innerHTML = "메뉴 : <input type='text' name='smenu' class='form-control col-md-6' /> 가격 : <input type='text' name='sprice' class='form-control col-md-6' />";
      menu.appendChild(div);
   }
</script>

<script>
   function getMenus(){
      var smenu = document.getElementsByName("smenu");
      var sprice = document.getElementsByName("sprice");
      var menus = [];
      var prices = [];
            
      for(var i=0; i<smenu.length; i++){

         smenu[i].value = "'" + smenu[i].value + "'";
         sprice[i].value = "'" + sprice[i].value + "'";
         menus.push(smenu[i].value);
         prices.push(sprice[i].value);
      }
      console.log(menus);
      console.log(prices);

      var updateMenu = document.createElement("input");
      updateMenu.setAttribute("type", "hidden");
      updateMenu.setAttribute("name", "smenu");
      updateMenu.setAttribute("value", updateMenu);
      document.forms[0].appendChild(updateMenu);

       var updatePrice = document.createElement("input");
       updatePrice.setAttribute("type", "hidden");
       updatePrice.setAttribute("name", "sprice");
       updatePrice.setAttribute("value", updatePrice);
       document.forms[0].appendChild(updatePrice);
   }
</script>


<script>
   function sendForm(){
      getMenus();
      document.forms[0].submit();
   }
</script>  

<section class="py-5 text-center container"></section><br><br><br><br>

<%@ include file="/WEB-INF/footer.jsp"%>