<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023/11/1
  Time: 23:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>登录</title>
    <script src="../js/jquery-3.7.1.min.js"></script>
</head>
<body>
<div id="login">
    <form action="/jsp/DoLogin" method="post" id="form">

        <table>
            <tr>
                <td>账号：</td><td><input type="text" name="loginName"/></td><td></td>
            </tr>
            <tr>
                <td>密码：</td><td><input type="password" name="passWord"/></td><td></td>
            </tr>
            <tr>
                <td>验证码：</td><td><input type="text" name="icode"/></td>
                <td><img id="icode" onclick="changeCode();" alt="江西财经大学" src="/jsp/loadcode" />
                    <a href="javaScript:void(0);" onclick="changeCode();">看不清，换一张</a>
                </td>
            </tr>
            <tr>
                <td><input type="radio"  name="loginer" value="管理员登录">管理员登录</td>
                <td><input type="radio" name="loginer" value="用户登录">用户登录</td>

            </tr>
            <tr>
                <td></td>
                <td><input type="checkbox" name="autoLogin" value="autoLogin"/>自动登录</td>
                <td><input type="submit" value="登录"/> </td>
            </tr>
        </table>
    </form>
</div>
</body>

<script type="text/javascript">
    $("#form").submit(function(event){
        console.log("123")
        if($("input[name='loginer']:checked").val() === "管理员登录"){
            request("post","/jsp/DoLogin",false)
        } else if($("input[name='loginer']:checked").val() === "用户登录"){
            event.preventDefault();
        }else{
            alert("请选择以什么身份登录");
            event.preventDefault();
        }
    });
    function request(method,url,async){
        $.ajax({
            url: url,
            async:async,
            method: method
        });
    }
    function changeCode()
    {
        var obj = document.getElementById("icode");
        obj.src = "jsp/loadcode?" + Math.random();
    }
</script>

<style>
    #login{
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 10%;
    }
</style>
</html>
