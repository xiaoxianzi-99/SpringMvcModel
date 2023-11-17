<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>注册</title>
    <script src="../js/jquery-3.7.1.min.js"></script>
    <script src="../js/address.js"></script>
</head>
<body>

<form:form modelAttribute="ResignUser" method="post" action="useradd" id="form">
    <fieldset style="position:absolute;width: 30%;margin: 0  auto;top:20%;left: 35%;
    background-color: rgba(226, 157, 224, 0.1);border-radius: 5px;">
        <p>
            <label for="username" class="left">用户名： </label>
            <form:input  class="right" id="username" path="username" placeholder="请输入用户名"/><br>
        </p>
        <p>
            <label  class="left">邮箱地址：</label>
            <form:input  class="right" id="email" path="email" placeholder="请输入邮箱地址" />
            <span class="error-message" id="emailError"  style=" color: red;font-size: smaller;"></span><br>
        </p>
        <p>
            <label  class="left">设置密码：</label>
            <form:password class="right" id="password" path="password"  />
            <span  id="passwordError" class="error" style=" color: red;font-size: smaller;"></span><br>
        </p>
        <p>
            <label class="left">确认密码：</label>
            <input class="right" type="password" id="confirmPassword">
            <span id="confirmPasswordError" class="error" style=" color: red;font-size: smaller;"></span><br>
        </p>
        <p>
            <label class="left">真实姓名：</label>
            <form:input class="right" id="realname" path="realname" placeholder="请输入真实姓名"/>
        </p>
        <p>
            <label class="left">性别：</label>
            <form:radiobutton value="男" path="gender"/>男
            <form:radiobutton  value="女" path="gender"/>女
        </p>
        <p>
            <label class="left">上传头像</label>
            <input class="right" type="file" name="imge">
        </p>
        <p>
            <label class="left">您的手机号：</label>
            <form:input class="right" id="phone" path="phone" placeholder="请输入手机号"/>
        </p>
        <p>
            <label class="left">单位名称：</label>
            <form:input class="right" id="working" path="working" placeholder="请输入单位名称"/>
        </p>
        <p>
            <label class="left">单位地址：</label>
            <form:select path="province" id="sel1"><option value="">请选择省份</option></form:select>
            <form:select path="city" id="sel2"><option value="">请选择城市</option></form:select>
            <form:select path="county" id="sel3"><option value="">请选择区</option></form:select>
            <br>
            <form:input path="street"  placeholder="请输入详细地址" cssStyle="margin-left: 115px;margin-top: 10px"/>
        </p>
        <p>
            <label class="left">您的爱好：</label>
            <form:checkboxes path="hobby" items="${hobbys}"/>

        </p>
        <p>
            <label class="left" >协议内容：</label>
            <form:textarea class="right" id="content" path="content" cols="30" rows="2" />
        </p>

        <input type="reset" style="margin-left: 40px"><input type="submit" value="提交" style="margin-left: 40px">
    </fieldset>
</form:form>
</body>

<script>

    $(document).ready(function() {
        document.getElementById("content").value="在使用我们的服务之前，您需要注册一个账户。您应该提供真实、准确、完整的个人信息，并对您的账户和密码负有保密责任。任何使用您账户的活动均视为由您本人进行。";
        // 当邮箱输入框失焦时触发
        $("#email").blur(function() {
            validateEmail();
        });

        // 表单提交时进行整体校验
        $("#form").submit(function(event) {
            var username=$("#username").val();

            // 在提交前进行整体校验
            if (!validateEmail()||!validatePasswords()||!validatePassword()||!validateUsername()||!validateRealname()||!validatePhone()) {
                event.preventDefault(); // 阻止表单提交
            }
            function validateUsername(){
                var username=$("#username").val();

                if(username.trim() ===""){

                    return false;
                }else {
                    return true;
                }
            }
            function validateRealname(){
                var realname=$("#realname").val();

                if(realname.trim() ===""){

                    return false;
                }else {
                    return true;
                }
            }
            function validatePhone(){
                var phone=$("#phone").val();

                if(phone.trim() ===""){

                    return false;
                }else {
                    return true;
                }
            }
        });
        $("#password").blur(function(){
            validatePassword()
        });
        $("#confirmPassword").blur(function(){
            validatePasswords()
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
        function validatePassword() {
            var password = document.getElementById('password').value;
            var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$/;
            var errorElement = document.getElementById("passwordError");

            if (!passwordRegex.test(password)) {
                errorElement.innerHTML = "密码至少包含一个大写字母、一个小写字母和一个数字";
                return false
            } else {
                errorElement.innerHTML = "";
                return true
            }
        }
        function validatePasswords() {
        var password = document.getElementById('password').value;
        var confirmPassword = document.getElementById('confirmPassword').value;

        var confirmPasswordError = document.getElementById('confirmPasswordError');
        if (password !== confirmPassword) {
            confirmPasswordError.innerHTML = "两次输入的密码不一致";
            return false
        } else {
            confirmPasswordError.innerHTML = "";
            return true
        }
        }
        var sel1 = document.getElementById("sel1")
        var sel2 = document.getElementById("sel2")
        var sel3 = document.getElementById("sel3")
        var address = document.getElementById("address")
        var cityArr = []; //市级数组
        var areaArr = []; //区级数组

        //省级遍历
        citys.forEach(v => {
            var option = new Option(v.name);
            sel1.options.add(option);//省
        })

        var sel1Index = 0;
        sel1.onchange = function () {
            // console.log(this.selectedIndex);//请选择和省级下标 (这里的请选择下标为0，省级下标从1开始)

            sel1Index = this.selectedIndex - 1;// 设定数组省级下标从0开始
            //  console.log(sel1Index);
            sel2.options.length = 0;//点击省选项改变清空之前市级选项
            sel3.options.length = 0;
            if (sel1Index != -1) {
                cityArr = citys[sel1Index].city
                //console.log(cityArr);
                //市级遍历
                cityArr.forEach(v => {
                    var option = new Option(v.name);
                    sel2.options.add(option);//市
                })

                areaArr = cityArr[0].area;
                sel3.options.length = 0;
                //区级遍历
                areaArr.forEach(v => {
                    var option = new Option(v);
                    sel3.options.add(option);//区
                })

                address.innerText = citys[sel1Index].name + cityArr[0].name + areaArr[0];
            }
            else{
                address.innerText = "";
            }
        }

        var sel2Index = 0;
        sel2.onchange = function(){
            sel2Index = this.selectedIndex;
            console.log(sel2Index);
            areaArr = cityArr[sel2Index].area;

            sel3.options.length = 0;
            //区级遍历
            areaArr.forEach(v => {
                var option = new Option(v);
                sel3.options.add(option);//区
            })
            address.innerText = citys[sel1Index].name + cityArr[sel2Index].name + areaArr[0];
        }
        var sel3Index = 0;
        sel3.onchange = function(){
            sel3Index = this.selectedIndex;
            address.innerText = citys[sel1Index].name + cityArr[sel2Index].name + areaArr[sel3Index];

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
