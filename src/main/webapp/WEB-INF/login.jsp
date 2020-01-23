<%--
  Created by IntelliJ IDEA.
  User: Rajat
  Date: 23/01/2020
  Time: 12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body style="background-color: lightgray">

<jsp:include page="nav.jsp" />
<br>
<div style="text-align: center">
    <%
        String msg = (String) request.getAttribute("msg");
        if (msg != null) {%>
    <h3 style="text-align: center;color: red"><%=msg%>
    </h3>
    <%}%>
    <%--    <div style="text-align: left">--%>
    ${SPRING_SECURITY_LAST_EXCEPTION.message}
    <center><h1>Login Form</h1></center>                 <br>
    <form action="login" method="post">
        <label>User Name:</label>
        <input type="text" name="username"> <br> <br>
        <label>Password:</label>
        <input type="password" name="password"> <br> <br>
        <input type="submit" value="login">
    </form>
</div>
<div class="col-sm-3">
</div>
</div>
</body>
</html>
