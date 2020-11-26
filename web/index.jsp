<%--
  Created by IntelliJ IDEA.
  User: Windows User
  Date: 2020-11-9
  Time: 21:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
  <meta name="description" content="基于 Java 开发的在线 OJ"/>
  <title>在线 OJ</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0,text/html; charset=UTF-8" http-equiv="Content-Type">
  <!--Bootstrap 4-->
  <link  href="css/bootstrap.min.css" rel="stylesheet">
  <!-- 开发环境版本，包含了有帮助的命令行警告 -->
  <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
  <!--<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>-->
  <script src="js/jquery-3.2.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/app.js"></script>
  <script type="text/javascript">
    function checkUsername1() {
      var flag = true;
      var ele = document.getElementById("username1");
      var regNumber = /^.{0,10}$/ ;
      if(ele.value==""||ele.value==null) {
        alert("Please input username !");
        document.getElementById("username1span").innerHTML=
                "<font style='color:red;font-size:15px' <b>username不能为空</b> </font>"
        return false;
      }
      else if(!regNumber.test(ele.value)) {
        alert("Username's length should be no more than 10!");
        flag = false;
      }
      if(flag) document.getElementById("username1span").innerHTML=
              "<font style='color:green;font-size:15px' <b>输入格式正确</b> </font>"
      else document.getElementById("username1span").innerHTML=
              "<font style='color:red;font-size:15px' <b>输入格式错误</b> </font>"
      return flag;
    }
    function checkPassword() {
      var flag = true;
      var ele = document.getElementById("password1");
      var regNumber = /^.{0,20}$/ ;
      if(ele.value==""||ele.value==null) {
        alert("Please input password !");
        document.getElementById("password1span").innerHTML=
                "<font style='color:red;font-size:15px' <b>password不能为空</b> </font>"
        return false;
      }
      else if(!regNumber.test(ele.value)) {
        alert("Password's length should be no more than 20!");
        flag = false;
      }
      if(flag) document.getElementById("password1span").innerHTML=
              "<font style='color:green;font-size:15px' <b>输入格式正确</b> </font>"
      else document.getElementById("password1span").innerHTML=
              "<font style='color:red;font-size:15px' <b>输入格式错误</b> </font>"
      return flag;
    }
  </script>
</head>
<body>
<div class="container">
  <form action="login" method="post">
    <%--          <input type="hidden" name="type" value="person">--%>
    <div class="form-group">
      <center>
        <label for="username1">username:</label><span id="username1span"></span><input type="text" class="form-control" id="username1" name="username" onblur="checkUsername1()" style="width: 400px;" maxlength="20" placeholder="Please input username">
      </center>
    </div>

    <div class="form-group">
      <center>
        <label for="password1">password:</label><span id="password1span"></span><input type="text" class="form-control" id="password1" name="password" onblur="checkPassword()" placeholder="Please input password" style="width: 400px;" maxlength="20">
      </center>
    </div>

    <div class="form-group" style="text-align: center">
      <input class="btn btn-primary" type="submit" value="登录" />
      <a class="btn btn-default" href="register.jsp" >注册</a>
    </div>
  </form>
</div>
  <script>
    //鼠标点击出现爱心特效
    (function(window,document,undefined){
      var hearts = [];
      window.requestAnimationFrame = (function(){
        return window.requestAnimationFrame ||
                window.webkitRequestAnimationFrame ||
                window.mozRequestAnimationFrame ||
                window.oRequestAnimationFrame ||
                window.msRequestAnimationFrame ||
                function (callback){
                  setTimeout(callback,1000/60);
                }
      })();
      init();
      function init(){
        css(".heart{width: 10px;height: 10px;position: fixed;background: #f00;transform: rotate(45deg);-webkit-transform: rotate(45deg);-moz-transform: rotate(45deg);}.heart:after,.heart:before{content: '';width: inherit;height: inherit;background: inherit;border-radius: 50%;-webkit-border-radius: 50%;-moz-border-radius: 50%;position: absolute;}.heart:after{top: -5px;}.heart:before{left: -5px;}");
        attachEvent();
        gameloop();
      }
      function gameloop(){
        for(var i=0;i<hearts.length;i++){
          if(hearts[i].alpha <=0){
            document.body.removeChild(hearts[i].el);
            hearts.splice(i,1);
            continue;
          }
          hearts[i].y--;
          hearts[i].scale += 0.004;
          hearts[i].alpha -= 0.013;
          hearts[i].el.style.cssText = "left:"+hearts[i].x+"px;top:"+hearts[i].y+"px;opacity:"+hearts[i].alpha+";transform:scale("+hearts[i].scale+","+hearts[i].scale+") rotate(45deg);background:"+hearts[i].color;
        }
        requestAnimationFrame(gameloop);
      }
      function attachEvent(){
        var old = typeof window.onclick==="function" && window.onclick;
        window.onclick = function(event){
          old && old();
          createHeart(event);
        }
      }
      function createHeart(event){
        var d = document.createElement("div");
        d.className = "heart";
        hearts.push({
          el : d,
          x : event.clientX - 5,
          y : event.clientY - 5,
          scale : 1,
          alpha : 1,
          color : randomColor()
        });
        document.body.appendChild(d);
      }
      function css(css){
        var style = document.createElement("style");
        style.type="text/css";
        try{
          style.appendChild(document.createTextNode(css));
        }catch(ex){
          style.styleSheet.cssText = css;
        }
        document.getElementsByTagName('head')[0].appendChild(style);
      }
      function randomColor(){
        return "rgb("+(~~(Math.random()*255))+","+(~~(Math.random()*255))+","+(~~(Math.random()*255))+")";
      }
    })(window,document);
  </script>
  </body>
</html>
