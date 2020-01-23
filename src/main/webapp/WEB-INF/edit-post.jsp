<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">--%>
<%--    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">--%>
<%--    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>--%>
<%--    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">--%>

<%--    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>--%>
<%--    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>--%>
<%--    <script type="text/javascript">--%>
<%--        $(function () {--%>
<%--            $("#name").autocomplete({--%>
<%--                <%--%>
<%--                System.out.println("hello");--%>
<%--                %>--%>
<%--                source : "/ashish",--%>
<%--                minLength : 2,--%>
<%--            });--%>
<%--        });--%>
<%--    </script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<form:form action="/new" method="POST" modelAttribute="post" enctype="multipart/form-data">--%>
<%--    <div class="form-group">--%>


<%--        <form:input class="form-control" id="exampleFormControlInput1" path="title" placeholder="Enter tite"/>--%>
<%--    </div>--%>
<%--    <div class="form-group">--%>
<%--        <label for="exampleFormControlTextarea1">Example textarea</label>--%>
<%--        <form:textarea  class="form-control" id="exampleFormControlTextarea1" rows="3" path="content" placeholder="Enter Content"/>--%>
<%--    </div>--%>
<%--    <div class="form-group">--%>

<%--        <form:input class="form-control" id="exampleFormControlInput1" path="link" placeholder="Enter link"/>--%>
<%--    </div>--%>

<%--    <div class="form-group">--%>
<%--        <label>Choose Image</label>--%>
<%--&lt;%&ndash;        <form  method="post" enctype="multipart/form-data">&ndash;%&gt;--%>
<%--            <input id="singleFileUploadInput" type="file" name="file" class="file-input" />--%>
<%--    <form:form modelAttribute="category" >--%>
<%--        <form:input path="subReddit" id="name"/>--%>
<%--            <button type="submit" class="primary submit-btn">Submit</button>--%>
<%--&lt;%&ndash;        </form>&ndash;%&gt;--%>
<%--    </div>--%>
<%--        </form:form>--%>
<%--</form:form>--%>
<%--&lt;%&ndash;<jsp:include page="nav.jsp" />&ndash;%&gt;--%>
<%--&lt;%&ndash;<form:form action="/new" method="POST" modelAttribute="post">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <br><br>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <form:input class="form-control" id="exampleFormControlInput1" path="title" placeholder="Enter tite"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <br><br>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <form:textarea  id="summernote" cssStyle="width: 50%" path="content"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <input type="submit" value="Submit"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;</form:form>&ndash;%&gt;--%>
<%--&lt;%&ndash;<script>&ndash;%&gt;--%>
<%--&lt;%&ndash;    $(document).ready(function() {&ndash;%&gt;--%>
<%--&lt;%&ndash;        $('#summernote').summernote();&ndash;%&gt;--%>
<%--&lt;%&ndash;    });&ndash;%&gt;--%>
<%--&lt;%&ndash;</script>&ndash;%&gt;--%>
<%--</body>--%>
<%--</html>--%>

<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="com.example.demo.Service.ImagePostService" %>
<%@ page import="javax.validation.constraints.Max" %>
<%@ page import="com.example.demo.Model.*" %>
<%@ page import="com.example.demo.Service.CommentService" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

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
    <title>All Blogs</title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#name").autocomplete({
                <%
                System.out.println("hello");
                %>
                source : "/ashish",
                minLength : 2,
            });
        });
    </script>
    <script type="text/javascript">
        function validateForm() {
            var a = document.getElementById("exampleFormControlInput1").value;


            if (a == null || a == "") {
                alert("Please Fill All Required Field");
                return false;
            }
        }
    </script>
    <style>
        .button {
            position: absolute;
            top: 50%;
        }
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
<security:authorize access="!isAuthenticated()">
    <%
        response.sendRedirect("/login");
    %>
</security:authorize>
<jsp:include page="nav.jsp" />



<div class="container" style="float: left">

    <div class="well"  style="width:80%" style="margin-left: 5%" style="background-color: white !important">
        <form:form onsubmit="return validateForm()"  action="/edit-save" method="POST" modelAttribute="post" enctype="multipart/form-data">
            <div class="form-group">
                <form:hidden path="id"></form:hidden>

                <label for="exampleFormControlTextarea1">Enter Title</label>
                <form:input class="form-control" requiredpattern="[0-9a-zA-Z_.-]*" id="exampleFormControlInput1" path="title" placeholder="Enter title"/>
            </div>
            <div class="form-group">
                <label for="exampleFormControlTextarea1">Enter Your Content</label>
                <form:textarea  class="form-control" id="exampleFormControlTextarea1" rows="3" path="content" placeholder="Enter Content"/>
            </div>


            <div class="form-group">
            <label>Choose Image</label>
            <%--        <form  method="post" enctype="multipart/form-data">--%>
            <input id="singleFileUploadInput" type="file" name="file" class="file-input" />
            <form:form modelAttribute="category" >
                <br>
                <label for="exampleFormControlTextarea1">Enter Sub-reddit</label>
                <form:input  class="form-control" id="exampleFormControlInput1" path="subReddit" />
                <br>
                <button type="submit" class="btn btn-success">Submit</button>
                <%--        </form>--%>
                </div>
            </form:form>
        </form:form>
        <%--<jsp:include page="nav.jsp" />--%>
        <%--<form:form action="/new" method="POST" modelAttribute="post">--%>
        <%--    <br><br>--%>
        <%--    <form:input class="form-control" id="exampleFormControlInput1" path="title" placeholder="Enter tite"/>--%>
        <%--    <br><br>--%>
        <%--    <form:textarea  id="summernote" cssStyle="width: 50%" path="content"/>--%>
        <%--    <input type="submit" value="Submit"/>--%>
        <%--</form:form>--%>
        <%--<script>--%>
        <%--    $(document).ready(function() {--%>
        <%--        $('#summernote').summernote();--%>
        <%--    });--%>
        <%--</script>--%>

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