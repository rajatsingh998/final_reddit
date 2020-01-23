<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Rajat
  Date: 18/01/2020
  Time: 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>new Category</title>
</head>
<body>
<form:form action="/newCategory" method="POST" modelAttribute="category" >
    <form:input path="subReddit" placeholder="Enter Category"/>
    <button type="submit" >Submit</button>
</form:form>
</body>
</html>
