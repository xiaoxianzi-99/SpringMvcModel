<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>注册</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
<form:form modelAttribute="ResignUser" method="post" action="jsp/useradd" id="form">
    <fieldset style="
  width: 30%;
  margin: 0  auto;
    background-color: rgba(226, 157, 224, 0.1)">
        <p>
            <label for="username" class="left">用户名： </label>
            <form:input  class="right" id="username" path="username" placeholder="请输入用户名"/><br>
        </p>
        <p>
            <label for="email" class="left">邮箱地址：</label>
            <form:input  class="right" id="email" path="email" placeholder="请输入邮箱地址" />
            <span class="error-message" id="emailError"  style=" color: red;font-size: smaller;"></span><br>
        </p>
        <p>
            <label for="password" class="left">设置密码：</label>
            <form:password class="right" id="password" path="password"  />
            <span  id="passwordError" class="error" style=" color: red;font-size: smaller;"></span><br>
        </p>
        <p>
            <label for="confirmPassword" class="left">确认密码：</label>
            <input class="right" type="password" id="confirmPassword" name="confirmPassword"  onblur="validatePassword(this.value, 'confirmPasswordError')" required>
            <span id="confirmPasswordError" class="error" style=" color: red;font-size: smaller;"></span><br>
        </p>
        <p>
            <label class="left">真实姓名：</label>
            <form:input class="right" id="realname" path="realname" placeholder="请输入真实姓名"/>
        </p>
        <p>
            <label class="left">性别：</label>
            <form:radiobutton name="gender" value="男" path="gender"/>男
            <form:radiobutton  value="女" path="gender"/>女
        </p>
        <p>
            <label class="left">上传头像</label>
            <input class="right" type="file" name="imge">
        </p>
        <p>
            <label class="left">您的手机号：</label>
            <form:input class="right" path="phone" placeholder="请输入手机号"/>
        </p>
        <p>
            <label class="left">单位名称：</label>
            <form:input class="right" path="working" placeholder="请输入单位名称"/>
        </p>
        <p>
            <label class="left">单位地址：</label>
        </p>
        <p>
            <label class="left">您的爱好：</label>

        </p>
        <p>
            <label class="left">协议内容：</label>
            <form:textarea class="right" path="content" cols="30" rows="2"/>
        </p>

        <input type="submit" value="提交">
    </fieldset>
</form:form>
</body>

<script>
    $(document).ready(function() {
        // 当邮箱输入框失焦时触发
        $("#email").blur(function() {
            validateEmail();
        });

        // 表单提交时进行整体校验
        $("#myForm").submit(function(event) {
            // 在提交前进行整体校验
            if (!validateEmail()) {
                event.preventDefault(); // 阻止表单提交
            }
        });
        $("#password").blur(function(){
            validatePassword(this.value, 'passwordError')
        });
        $("#confirmPassword").blur(function(){
            validatePasswords('passwordError')
        })

        function validateEmail() {
            var email = $("#email").val();
            var emailError = $("#emailError");

            // 简单的邮箱格式校验
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                emailError.text("邮箱格式错误");
                return false;
            } else {
                emailError.text(""); // 清空错误消息
                return true;
            }
        }
        function validatePassword(value, errorElementId) {
            var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$/;
            var errorElement = document.getElementById(errorElementId);

            if (!passwordRegex.test(value)) {
                errorElement.innerHTML = "密码至少包含一个大写字母、一个小写字母和一个数字";
            } else {
                errorElement.innerHTML = "";
            }
        }
        function validatePasswords() {
        var password = document.getElementById('password').value;
        var confirmPassword = document.getElementById('confirmPassword').value;

        var confirmPasswordError = document.getElementById('confirmPasswordError');
        if (password !== confirmPassword) {
            confirmPasswordError.innerHTML = "两次输入的密码不一致";
        } else {
            confirmPasswordError.innerHTML = "";
        }
    }
    });

</script>
<style>

    .left{
        display: inline-block;
        width: 100px; /* 设置Label的宽度 */
        text-align: left; /* 设置文本右对齐，可以根据需要修改 */
        margin-right: 10px; /* 设置Label和Input之间的间距，可以根据需要修改 */
    }

    .right{
        width: 200px; /* 设置Input的宽度，可以根据需要修改 */
        border-radius: 10px; /* 可以根据需要调整圆角的半径 */
        padding: 8px;
    }

</style>
</html>
