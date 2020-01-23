<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="com.example.demo.Service.ImagePostService" %>
<%@ page import="javax.validation.constraints.Max" %>
<%@ page import="com.example.demo.Model.*" %>
<%@ page import="com.example.demo.Service.CommentService" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01
Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Delete- Confirm</title>
    <style>
        .vote {
            display: inline-block;
            overflow: hidden;
            width: 40px;
            height: 25px;
            cursor: pointer;
            background: url('http://i.stack.imgur.com/iqN2k.png');
            background-position: 0 -25px;
        }


        .vote.on {
            background-position: 0 2px;
        }
        .myheading{
            font-family:Verdana;
            color: black;
        }
        .well{
            margin-left: 8%;
            background-color: white !important
        }
        .geeks {
            margin-left: 15%;
            width:60%;
            height:500px;
        }
        img {
            width:100%;
            height:100%;
        }
    </style>
</head>
<body style="background-color: #101010">
<jsp:include page="nav.jsp" />


<%

    Post post =  (Post)request.getAttribute("post");






    System.out.println("in jsp testing");


    int flag;
    ImagePost image=post.getImagePost();

    if (image.getFileName().length()<1){
        flag=0;
    }
    else{
        flag=1;
    }
    Category subReddit=post.getCategory();
%>
<div class="container" style="float: left">

    <div class="well"  style="width:80%" style="margin-left: 5%" style="background-color: white !important">
        <div class="media">

            <div class="media-body">
                <div>
                    <h6><p style="color: black">r/<%=subReddit.getSubReddit()%></p><nobr><p>Posted by <a href="/profile?name=<%=post.getUser().getName()%>"> u/<%=post.getUser().getName()%></p></h6></div>
                <h3 class="myheading" ><a class="myheading" href="/view?id=<%=(post.getId())%>"%><%=post.getTitle()%>
                </a></h3>
                <%--                <p class="text-right">By <%=post.getUser().getName()%></p>--%>
                <% if (flag!=0)
                { %>
                <div class = "geeks">
                    <a> <img class="media-object" src="/imageDisplay?id=<%=image.getId()%>"/> </a>

                </div>
                <% }
                %>
                <br>
                <h4><p><%=post.getContent()%></p></h4>
                <ul class="list-inline list-unstyled">
                <form:form action="delete" method="POST" modelAttribute="post">
                    <form:hidden path="id"></form:hidden>
                    <input type="submit" value="Delete"/>
                </form:form>

                </ul>
                <br>


            </div>
        </div>
    </div>

</div>


<br>

</body>
</html>
<%!
    private Comment myFun(ArrayList<Comment> commentsPost, Integer integer) {
        for (Comment cmnt : commentsPost){
            if (cmnt.getId()== integer){
                return cmnt;
            }
        }
        return new Comment();
    }
%>