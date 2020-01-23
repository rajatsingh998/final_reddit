<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.userdetails.UserDetails" %>

<%@ page import="java.util.ArrayList" %>

<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Rajat
  Date: 09/01/2020
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>


<form:form action="/comment-save" method="POST" modelAttribute="comment" >
    Enter Comment : <form:input path="content"/>
<form:form modelAttribute="post">
    <form:hidden path="id"></form:hidden>
    <input type="submit" value="Submit"/>
</form:form>
</form:form>
</body>
</html>
