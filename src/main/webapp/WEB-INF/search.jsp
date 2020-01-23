<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page import="java.util.ArrayList" %>--%>


<%--<%@ page import="com.example.demo.Model.Post" %>--%>
<%--<%@ page import="com.example.demo.Model.Vote" %>--%>
<%--<%@ page import="com.example.demo.Model.ImagePost" %>--%>
<%--<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>--%>
<%--<%@ page import="com.example.demo.Service.ImagePostService" %>--%>
<%--<%@ page import="com.example.demo.Model.Category" %>--%>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>

<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ page isELIgnored="false" %>--%>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01--%>
<%--Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">--%>
<%--<html>--%>
<%--<head>--%>
<%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">--%>
<%--    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">--%>
<%--    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>--%>
<%--    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>--%>
<%--    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>--%>
<%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>--%>
<%--    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>--%>
<%--    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">--%>
<%--    <title>All Blogs</title>--%>
<%--    <style>--%>
<%--        .vote {--%>
<%--            display: inline-block;--%>
<%--            overflow: hidden;--%>
<%--            width: 40px;--%>
<%--            height: 25px;--%>
<%--            cursor: pointer;--%>
<%--            background: url('http://i.stack.imgur.com/iqN2k.png');--%>
<%--            background-position: 0 -25px;--%>
<%--        }--%>
<%--        .vote.on {--%>
<%--            background-position: 0 2px;--%>
<%--        }--%>
<%--        .myheading{--%>
<%--            font-family:Verdana;--%>
<%--            color: black;--%>
<%--        }--%>
<%--        .well{--%>
<%--            margin-left: 8%;--%>
<%--        }--%>
<%--        .geeks {--%>
<%--            margin-left: 15%;--%>
<%--            width:60%;--%>
<%--            height:300px;--%>
<%--        }--%>
<%--        img {--%>
<%--            width:100%;--%>
<%--            height:100%;--%>
<%--        }--%>
<%--    </style>--%>

<%--</head>--%>
<%--<body body style="background-color: lightgray">--%>
<%--<jsp:include page="nav.jsp" />--%>
<%--<div style="width: 100%; height: 100%; background-color: black">--%>
<%--<div class="container" style="float: left !important; ">--%>

<%--<%--%>
<%--    Iterable<ImagePost> allImages= (ArrayList<ImagePost>) request.getAttribute("images");--%>
<%--    ArrayList<Post> allPost = (ArrayList<Post>) request.getAttribute("listPost");--%>
<%--    ArrayList<Vote> allVote= (ArrayList<Vote>) request.getAttribute("votes");--%>
<%--    for (Post post : allPost) {--%>
<%--        int flag;--%>
<%--        ImagePost image=post.getImagePost();--%>
<%--        if (image.getFileName().length()<1){--%>
<%--            flag=0;--%>
<%--        }--%>
<%--        else{--%>
<%--            flag=1;--%>
<%--        }--%>
<%--        System.out.println("this is image :"+image.getFileName());--%>
<%--        Category subReddit=post.getCategory();--%>
<%--%>--%>
<%--&lt;%&ndash;<h2>Title:</h2><%=post.getTitle()%>&ndash;%&gt;--%>
<%--&lt;%&ndash;<br>&ndash;%&gt;--%>
<%--&lt;%&ndash;<h3>Content:</h3> <%=post.getContent()%>&ndash;%&gt;--%>
<%--&lt;%&ndash;<li><a href="/showcomment?id=<%=post.getId()%>">Show Comments </a></li>&ndash;%&gt;--%>
<%--&lt;%&ndash;<li><a href="/addcomment?id=<%=post.getId()%>">Add Comments </a></li>&ndash;%&gt;--%>
<%--&lt;%&ndash;<li><a href="/upVote?id=<%=post.getId()%>">Up-vote </a></li>&ndash;%&gt;--%>
<%--&lt;%&ndash;<li><a href="/downVote?id=<%=post.getId()%>">Down-vote </a></li>&ndash;%&gt;--%>





<%--    <div class="well"  style="width:50%" style="margin-left: 5%" style="border-color: white  !important">--%>
<%--        <div class="media">--%>

<%--            <div class="media-body">--%>
<%--                <div>--%>
<%--                    <h6><p style="color: black">r/<%=subReddit.getSubReddit()%></p><p>Posted by u/<%=post.getUser().getName()%></p></h6></div>--%>
<%--                <h3 class="myheading" ><a class="myheading" href="/view?id=<%=(post.getId())%>"%><%=post.getTitle()%>--%>
<%--                </a></h3>--%>
<%--&lt;%&ndash;                <p class="text-right">By <%=post.getUser().getName()%></p>&ndash;%&gt;--%>
<%--                <% if (flag!=0)--%>
<%--                { %>--%>
<%--                <div class = "geeks">--%>
<%--                <a> <img class="media-object" src="/imageDisplay?id=<%=image.getId()%>"/> </a>--%>

<%--                </div>--%>
<%--                <% }--%>
<%--                %>--%>
<%--                <br>--%>
<%--                <h4><p><%=post.getContent()%></p></h4>--%>
<%--                <ul class="list-inline list-unstyled">--%>
<%--&lt;%&ndash;                    <li><span><i class="glyphicon glyphicon-calendar"></i><%=postpublic.getCreatedAt()%> </span></li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <li>|</li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <span><i class="glyphicon glyphicon-calendar"></i> <%=post.getUpdatedAt()%></span>&ndash;%&gt;--%>

<%--&lt;%&ndash;                    <li>|</li>&ndash;%&gt;--%>


<%--                    <li>|</li>--%>
<%--                    <li><a href="/upVote?id=<%=post.getId()%>">Up-vote </a></li>--%>
<%--                    <li><a href="/downVote?id=<%=post.getId()%>">Down-vote </a></li>--%>

<%--                </ul>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--    </div>--%>
<%--    <%}%>--%>
<%--</div>--%>


<%--<div class="container" style="float: right !important; ">--%>
<%--<div class="well"   style="width:30%" style="margin-left: 160%" style="border-color: white  !important">--%>
<%--fine--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>





<%--<script>--%>
<%--    for (const btn of document.querySelectorAll('.vote')) {--%>
<%--        btn.addEventListener('click', event => {event.target.classList.toggle('on');--%>
<%--        });--%>
<%--    }--%>
<%--</script>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>


<%@ page import="com.example.demo.Model.Post" %>
<%@ page import="com.example.demo.Model.Vote" %>
<%@ page import="com.example.demo.Model.ImagePost" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="com.example.demo.Service.ImagePostService" %>
<%@ page import="com.example.demo.Model.Category" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01
Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>All Blogs</title>
    <style>
        a.custom-card,
        a.custom-card:hover {
            color: inherit;
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
            margin-left: 5%;
        }
        .geeks {
            margin-left: 15%;
            width:60%;
            height:300px;
        }
        img {
            width:100%;
            height:100%;
        }
        .spacer1 {

            margin: 60px ;
            margin-left: 0%;
        }
        .spacer2 {
            margin: 60px ;
            margin-left: 0%;
        }
        .card-img-top {
            opacity: 1.0 !important;
            filter: alpha(opacity=100) !important;
            height: 12vw;
            object-fit: cover;
        }
        .card-img-top:hover{
            opacity: 0.5  !important; filter: alpha(opacity=50) !important;
            width: 100%;

        }

    </style>

</head>
<body body style="background-color: lightgray">
<jsp:include page="nav.jsp" />
<%
    ArrayList<Post> latestPost = (ArrayList<Post>) request.getAttribute("latestPost");
    List<Category> categoryList=(List<Category>) request.getAttribute("categoryList");
%>
<div style="margin-top: 5%">
    <a href="/view?id=<%=(latestPost.get(0).getId())%>" class="custom-card">
        <div class="card" style="width: 18rem; float: left ; margin-left: 17.0%">
            <%  ImagePost image=latestPost.get(0).getImagePost();
                int  flag;
                if (image.getFileName().length()<1){ %>
            <img class="card-img-top"   src="https://images.pexels.com/photos/1591447/pexels-photo-1591447.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940" class="card-img-top" alt="...">
            <% }
            else{%>
            <img class="card-img-top"   src="/imageDisplay?id=<%=latestPost.get(0).getImagePost().getId()%>" class="card-img-top" alt="...">
            <%  }%>

            <div class="card-img-overlay">
                <p class="card-text" style="color: white !important;"><%=latestPost.get(0).getTitle()%></p>
            </div>
        </div>
    </a>
    <a href="/view?id=<%=(latestPost.get(1).getId())%>" class="custom-card">
        <div class="card" style="width: 18rem; float: left; margin-left: 4%">
            <%
                image=latestPost.get(1).getImagePost();
                if (image.getFileName().length()<1){ %>
            <img class="card-img-top" src="https://images.pexels.com/photos/1591447/pexels-photo-1591447.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940" class="card-img-top" alt="...">
            <% }
            else{%>
            <img class="card-img-top"  src="/imageDisplay?id=<%=latestPost.get(1).getImagePost().getId()%>" class="card-img-top" alt="...">
            <%  }%>
            <div class="card-img-overlay">
                <p class="card-text" style="color: white !important;"><%=latestPost.get(1).getTitle()%></p>
            </div>
        </div>
    </a>
    <a href="/view?id=<%=(latestPost.get(2).getId())%>" class="custom-card">
        <div class="card" style="width: 18rem; float: left; margin-left: 4%">
            <%
                image=latestPost.get(2).getImagePost();
                if (image.getFileName().length()<1){ %>
            <img class="card-img-top"  src="https://images.pexels.com/photos/1591447/pexels-photo-1591447.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940" class="card-img-top" alt="...">
            <% }
            else{%>
            <img class="card-img-top"  src="/imageDisplay?id=<%=latestPost.get(2).getImagePost().getId()%>" class="card-img-top" alt="...">
            <%  }%>
            <div class="card-img-overlay">
                <p class="card-text" style="color: white !important;"><%=latestPost.get(2).getTitle()%></p>
            </div>
        </div>
    </a>
    <a href="/view?id=<%=(latestPost.get(3).getId())%>" class="custom-card">
        <div class="card" style="width: 18rem; float: left; margin-left: 4%">
            <%
                image=latestPost.get(3).getImagePost();
                if (image.getFileName().length()<1){ %>
            <img class="card-img-top"  src="https://images.pexels.com/photos/1591447/pexels-photo-1591447.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940" class="card-img-top" alt="...">
            <% }
            else{%>
            <img class="card-img-top"  src="/imageDisplay?id=<%=latestPost.get(3).getImagePost().getId()%>" class="card-img-top" alt="...">
            <%  }%>
            <div class="card-img-overlay">
                <p class="card-text" style="color: white !important;"><%=latestPost.get(3).getTitle()%></p>
            </div>
        </div>
    </a>
</div>
<div class="container" style="margin-top:20%;display: flex;flex: 1;justify-content:space-around">
    <div style="width: 50%" id="post">
        <%

            Iterable<ImagePost> allImages= (ArrayList<ImagePost>) request.getAttribute("images");
            ArrayList<Post> allPost = (ArrayList<Post>) request.getAttribute("listPost");
            ArrayList<Category> categories= (ArrayList<Category>) request.getAttribute("categories");
//    ArrayList<Vote> allVote= (ArrayList<Vote>) request.getAttribute("votes");
            for (Post post : allPost) {
                int flag;

               ImagePost image=post.getImagePost();

                if (image.getFileName().length()<1){
                    flag=0;
                }
                else{
                    flag=1;
                }
                System.out.println(image.getFileName());
                Category subReddit=post.getCategory();
        %>


        All Posts:
        <br>
        <div class="well"   style="margin-left: 0%" style="background-color: white  !important">
            <div class="media">
                <div class="media-body">
                    <div>
                        <h6><p style="color: black">r/<%=subReddit.getSubReddit()%></p><p>Posted by <a href="/profile?name=<%=post.getUser().getName()%>"> u/<%=post.getUser().getName()%></p></h6></div>
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

                        <li><i class="fa fa-caret-up" onclick="upvote(<%=post.getId()%>)" aria-hidden="true" ></i></li>
                        <li><div id="postResultDiv<%=post.getId()%>" style="border: 2px darkred;width: 25px;text-align: center"> <%=post.getTotlevote()%> </div>

                        </li>

                        <li><i class="fa fa-caret-down" onclick="downvote(<%=post.getId()%>)" aria-hidden="true" ></i></li>

                    </ul>
                </div>
            </div>
        </div>
        <%}%>
    </div>

    <div style="width: 20%;text-align : center; margin-right: 10% ! important">
        Top Growing Community
        <br>


        <div class="card" style="width: 30rem;">
            <%--            <img class="card-img-top" src="..." alt="Card image cap">--%>
            <ul class="list-group list-group-flush">
                <%  int i=1;
                    for(Category category : categoryList){
                %>

                <a href="/redditpost?subReddit=<%=category.getSubReddit()%>" id="catlist">
                    <div style="color: black;text-align: left;font-size: 20px" class="catdiv">
                        <li class="list-group-item"> <%=i++%>&nbsp;&nbsp;&nbsp;  <i class="fa fa-reddit" aria-hidden="true" style="font-size: 20px">  </i>&nbsp;&nbsp;<%=category.getSubReddit()%></li>
                    </div>
                </a>

                <%}%>

            </ul>
        </div>


    </div>

</div>


<script type="text/javascript">
    function upvote(id) {
        console.log(id)
        div="#postResultDiv"+id;
        $.ajax({
            url: '/upVote?id='+id,
            type : 'GET',
            success : function (result) {
                $(div).html(result.data)
                console.log(result.data);
            }

        });
    }
    function downvote(id) {
        console.log(id)
        div="#postResultDiv"+id;
        $.ajax({
            url: '/downVote?id='+id,
            type : 'GET',
            success : function (result) {
                $(div).html(result.data)
                console.log(result.data);
            }

        });
    }

</script>
</body>
</html>