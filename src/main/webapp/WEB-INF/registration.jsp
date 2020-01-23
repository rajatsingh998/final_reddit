<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Rajat
  Date: 02/01/2020
  Time: 19:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>

</head>
<script type="text/javascript">
    function validateForm() {
        var a = document.getElementById("a").value;
        var b = document.getElementById("b").value;
        var c = document.getElementById("c").value;

        if (a == null || a == "", b == null || b == "", c == null || c == "") {
            alert("Please Fill All Required Field");
            return false;
        }
    }
</script>

<body>

<jsp:include page="nav.jsp" />
<%--<%@include file="header.jsp" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
    <%
        String msg = (String) request.getAttribute("msg");
        if (msg != null) {%>
    <h1 style="text-align: center;color: green"><%=msg%>
    </h1>
    <%}%>
</div>
<head>
    <title>create post</title>
</head>
<body style="background-color: lightgray">
<div class="container">
    <center><h1>Registration Form</h1></center>
    <div class="row">
        <div class="col-sm-4">
        </div>
        <div class="col-sm-4">
            <form:form onsubmit="return validateForm()" action="/register" name="Form" method="post" modelAttribute="redditUser">
                <label>User Name:</label>
                <form:input type="text" path="name" placeholder="name" class="form-control"></form:input> <br>
                <label>Email id :</label>
                <form:input type="email" path="email" placeholder="write yur email id"
                            class="form-control"></form:input> <br>
                <label>Password:</label>
                <form:input type="password" path="password" placeholder="password" class="form-control"></form:input>
                <br>
                <br><input type="submit" value="Register" class="btn btn-success">
            </form:form>
        </div>
    </div>
</div>
</body>
</body>
</html>
