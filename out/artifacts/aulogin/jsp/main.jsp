<%@ page import="com.domain.User" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023/11/2
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>欢迎管理员<%=((User)session.getAttribute("user")).getLoginName()%></h1>
<br class="href">
<a href="#">查看用户列表</a>
</body>
<style>
    .href{
        text-decoration: none;
    }
</style>
</html>
