<%--
  Created by IntelliJ IDEA.
  User: Windows User
  Date: 2020-11-23
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎注册</title>
</head>
<body>
<fieldset id="">
    <legend>注册页面</legend>
    <form action="Register" style="text-align: center">
    <table>
        <tr>
            <td>username：</td>
            <td><input type="text" name="username" /></td>
        </tr>
        <tr>
            <td>studentID：</td>
            <td><input type="text" name="studentID" /></td>
        </tr>
        <tr>
            <td>
                password：
            </td>
            <td>
                <input type="password" name="password" />
            </td>
        </tr>
        <tr>
            <td>
                confirm password：
            </td>
            <td>
                <input type="password" name="repassword" />
                <span id="span2"></span>
            </td>
        </tr>
    </table>
    <input type="submit" id="btn2" value="提交" />
    <input type="button" id="btn1" value="验证" />
    </form>
</fieldset>
</body>
</html>
