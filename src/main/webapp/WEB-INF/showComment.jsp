
<%@ page isELIgnored="false" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.demo.Model.Comment" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.Model.Post" %><%--
  Created by IntelliJ IDEA.
  User: Rajat
  Date: 13/01/2020
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    Post post= (Post)request.getAttribute("myPost");
%>
<%
    ArrayList<Comment> Allcomment = (ArrayList<Comment>) request.getAttribute("comments");
    int post_idd= (int) request.getAttribute("post_id");
    System.out.println(post_idd);
    for (Comment cmnt: Allcomment){
        if (cmnt.getPosts().getId()==post_idd){
           %>
<h5><%=cmnt.getContent()%></h5>
<br><br>
<%
        }
    }
%>


<%--<div class="card" style="width:80%;margin: auto">--%>
<%--    <div class="card-body">--%>
<%--        <h5 class="card-title">Comments</h5>--%>
<%--        <%--%>
<%--            List<Comment> commentList=post.getComments();--%>
<%--            for(Comment comment:commentList)--%>
<%--            {--%>
<%--        %>--%>
<%--        <h6 class="card-subtitle mb-2 text-muted"><%=comment.getUser().getName()%></h6>--%>
<%--        <p class="card-text">--%>
<%--            <%=comment.getContent()%>--%>
<%--        </p>--%>
<%--&lt;%&ndash;        <label for="created">Commented At</label><p><%=comment.getCreatedAt()%></p>&ndash;%&gt;--%>
<%--        <%--%>
<%--            }--%>
<%--        %>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<br>--%>


</body>
</html>
