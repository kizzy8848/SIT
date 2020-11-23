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
    <title>欢迎登录</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
  </head>
  <body>
  <form action="login">
    username：<input type="text" name="user"><br/>
    password：<input type="password" name="password"><br/>
    <input type="submit" name="提交">
    <a href="register.jsp">注册</a>
  </form>
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
