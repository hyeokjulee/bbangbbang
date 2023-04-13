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
                     <h2 class="white-color" style="font-size: 60px; font-weight: bold;">가게 수정</h2>
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

    <form id="updateForm"
        action="/store/update?${_csrf.parameterName}=${_csrf.token}"
        class="form-horizontal" method="POST" enctype="multipart/form-data">
        <fieldset>
        
        가게 이름 :
        <input type="text" name="sname" class="form-control" value="${store.sname }"/>
        가게 주소 :
        <input name="saddr" class="form-control" value="${store.saddr }"/>
        가게 번호 :
        <input name="stel" class="form-control" value="${store.stel }" />
        가게 사진 :
        <input name="sphotoFile" type="file" class="form-control"/>
        <!-- 여기는 따로 수정이 필요 -->
        
        <button type="button" class="btn btn-primary" onclick="addMenu()">메뉴 추가</button>
        <div id="menu" class="col-md-12" ></div>
    

        <br><button type="button" class="btn btn-primary"  onclick="sendForm()">등록</button>
        <input type="hidden" name="sid" class="form-control" value="${store.sid }"/>

        <div class="append"></div>
        <div class="pappend"></div>
    
    </fieldset>

    </form>
    <input type="text" class="smenu" class="form-control" value="${store.smenu}"/>
    <input type="text" class="sprice" class="form-control" value="${store.sprice}"/>
</div>

</body>
<script>
    window.onload = function(){
        var menu = document.getElementById("menu");

        var smenuList = document.querySelector(".smenu").value;
        var spriceList = document.querySelector(".sprice").value;

        var smenuList2 = smenuList.split(",");
        var spriceList2 = spriceList.split(",");
        
     //   console.log(smenuList2) ;
       // console.log(spriceList2) ;

        //menu.innerText 로 하면 안됨
        for(var i=0; i<smenuList2.length; i++){
            var div = document.createElement("div");
            div.className = "row form-group";
            div.innerHTML = "<div class='col-md-6'><input type='text'  class='form-control addsmenu' value="+smenuList2[i]+"></div><div class='col-md-6'><input type='text' name='sprice' class='form-control addsprice' value="+spriceList2[i]+"></div>";
            menu.appendChild(div);
        }

    }

</script>

<script>
function addMenu(){
    var menu = document.getElementById("menu");
    var div = document.createElement("div");
    div.className = "row form-group";
    div.innerHTML = "<div class='col-md-6'><input type='text' class='form-control col-md-6 addsmenu' placeholder='메뉴 이름'></div><div class='col-md-6'><input type='text' class='form-control col-md-6 addsprice' placeholder='메뉴 가격'></div>";
    menu.appendChild(div);
}
</script>  

<script>
    var formSubmitted = false;

    function getMenus(){
    if(formSubmitted) return;
    formSubmitted = true;

    var smenu = document.querySelectorAll(".addsmenu");
    var values = [];
    for (var i = 0; i < smenu.length; i++) {
      values.push("|"+smenu[i].value+"|");
    }
        console.log("smenu : "+values);

    var sprice = document.querySelectorAll(".addsprice");
    var price_values = [];
    for (var i = 0; i < sprice.length; i++) {
        price_values.push("|"+sprice[i].value+"|");
    }
        console.log("sprice : "+price_values);
    
    //menus 를 form 에 name="smenu" 의 이름으로 추가해서 보내기
    var append = document.getElementsByClassName("append")[0];
    append.innerHTML = "<input type='text' name='smenu' class='form-control' value="+values+">";
    var pappend = document.getElementsByClassName("pappend")[0];
    pappend.innerHTML = "<input type='text' name='sprice' class='form-control' value='"+price_values.join(",")+"'>";

}
</script>


<script>
    function sendForm(){
        var updateForm = document.getElementById("updateForm");
        getMenus();
        updateForm.submit();
        formSubmitted = false;
    }
</script>  


<section class="py-5 text-center container"></section><br><br><br><br>
</body>
<%@ include file="/WEB-INF/footer.jsp"%>