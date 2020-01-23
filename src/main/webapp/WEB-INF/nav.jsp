

<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Rajat
  Date: 03/01/2020
  Time: 06:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <%--    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Nav</title>
    <style>
        .logo{
            width:100%;
        }
    </style>
</head>
<body style="background-color: white">

<nav class="navbar navbar-expand-lg navbar-light bg-info" style="background-color: white !important">
    <a>
        <img style="width:15%" src="https://logos-download.com/wp-content/uploads/2016/06/Reddit_logo_full_1-700x227.png" >
    </a>


    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#demo-navbar" aria-controls="demo-navbar" aria-expanded="false" aria-label="Toggle navigation">

        <span class="navbar-toggler-icon"></span>

    </button>

    <form action="/filter">
        <input type="text"  name="search" id="search" placeholder="Search reddit"/>
        <input type="submit" value="search" style="border: none">
    </form>

    <div class="collapse navbar-collapse" id="demo-navbar">

        <ul class="navbar-nav mr-auto">
            <div class="btn-group open">
                <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#" style="background-color: white;">
                    <input type="text" placeholder="Home"  style="border: none"/>
                    <span class="fa fa-caret-down" title="Toggle dropdown menu" style="color: darkslateblue"></span>
                </a>
                <ul class="dropdown-menu" style="width: 100%">
                    <li><input  placeholder="Filter"/></li>
                    <li><a href="/"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
                    <li><a href="/filter1?sortby=totlevote"><i class="fa fa-line-chart" aria-hidden="true"></i> Popular</a></li>
                    <li><a href="/"><i class="fa fa-bar-chart" aria-hidden="true"></i> All </a></li>
<%--                    <li><button style="border: none;width: 100%;text-align: left;" id="catfil"><i class="fa fa-list-ol" aria-hidden="true"></i> Top Communities </button></li>--%>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $('#catfil').click(function () {
                                $.get('/filtercat',function (data,status) {
                                    $('#post').html(data);
                                })
                            });
                        });
                    </script>
                </ul>
            </div>

            <li class="nav-item active">

                <a class="list-group-item" href="/" class="nav-link text-light" style="border: hidden;font-size: 20px"><i class="fa fa-home fa-fw" aria-hidden="true"></i></a>

                <%--                <a  style="color: black !important" href="/">Home<span class="sr-only">(current)</span></a>--%>

            </li>

            <li class="nav-item">
                <a class="list-group-item" href="/new" class="nav-link text-light" style="border: hidden"><i class="fa fa-pencil-square-o" aria-hidden="true" ></i></a>

                <%--                <a class="nav-link text-light" style="color: black !important" href="/new">New Blog</a>--%>

            </li>
            <sec:authorize access="!hasAnyRole('ROLE_ADMIN')&& !hasAnyRole('ROLE_USER')  ">
                <li class="nav-item">

                    <a class="nav-link text-light" style="color: black !important" href="/register">Registration</a>

                </li>
            </sec:authorize>




            <li class="nav-item">
                <sec:authorize access="hasAnyRole('ROLE_ADMIN') || hasAnyRole('ROLE_USER')">
                    <a class="nav-link text-light" style="color: black !important;font-size: 20px" href="/logout"><i class="fa fa-sign-out" aria-hidden="true"></i></a>
                </sec:authorize>
                <sec:authorize access="!hasAnyRole('ROLE_ADMIN')&& !hasAnyRole('ROLE_USER')  ">
                    <a class="nav-link text-light" style="color: black !important;font-size: 20px" href="/login"><i class="fa fa-sign-in" aria-hidden="true"></i></a>
                </sec:authorize>

            </li>

        </ul>

        <%--        <form method="get" action="/search" class="form-inline my-2 my-lg-0">--%>

        <%--            <input name="keyword" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">--%>

        <%--            <button class="btn btn-outline-warning my-2 my-sm-0" type="submit">Search</button>--%>

        <%--        </form>--%>

    </div>

</nav>

</body>
</html>

<%--<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>--%>
<%--<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>--%>
<%--<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>--%>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<%--<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>--%>
<%--<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>--%>
<%--<!DOCTYPE html>--%>
<%--<meta charset="UTF-8">--%>
<%--<meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--<meta http-equiv="X-UA-Compatible" content="ie=edge">--%>
<%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">--%>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>--%>
<%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>--%>
<%--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">--%>

<%--<style>--%>
<%--    @media only screen and (max-width: 700px) {--%>
<%--        body {--%>
<%--            background-color: #63bce5;--%>
<%--        }--%>
<%--        #nav_bar {--%>
<%--            background-color: #63bce5;--%>
<%--        }--%>
<%--        #div1 {--%>
<%--            float: left;--%>
<%--        }--%>
<%--        #admin {--%>
<%--            float: right;--%>
<%--        }--%>

<%--        #user {--%>
<%--            float: right;--%>
<%--        }--%>
<%--        #catdiv{--%>
<%--            display: none;--%>
<%--        }--%>
<%--    }--%>
<%--</style>--%>
<%--<body>--%>
<%--<nav class="navbar navbar-default" id="nav_bar" style="width: 100%">--%>
<%--    <div class="container" id="header">--%>
<%--        <div class="navbar-header" style="float: left" id="div1">--%>
<%--            <ul class="nav navbar-nav navbar-right" id="nav_list">--%>
<%--                <li id="signin"><a href="/" style="font-size: 25px"><i class="fa fa-reddit" aria-hidden="true" style="float: left"></i>reddit</a></li>--%>
<%--                <li>--%>
<%--                    <div class="btn-group open">--%>
<%--                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#" style="background-color: white;">--%>
<%--                            <input type="text" placeholder="Home"  style="border: none"/>--%>
<%--                            <span class="fa fa-caret-down" title="Toggle dropdown menu" style="color: darkslateblue"></span>--%>
<%--                        </a>--%>
<%--                        <ul class="dropdown-menu" style="width: 100%">--%>
<%--                            <li><input  placeholder="Filter"/></li>--%>
<%--                            <li><a href="/"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>--%>
<%--                            <li><a href="/filter1?sortby=totlevote"><i class="fa fa-line-chart" aria-hidden="true"></i> Popular</a></li>--%>
<%--                            <li><a href="/"><i class="fa fa-bar-chart" aria-hidden="true"></i> All </a></li>--%>
<%--                            <li><button style="border: none;width: 100%;text-align: left;" id="catfil"><i class="fa fa-list-ol" aria-hidden="true"></i> Top Communities </button></li>--%>
<%--                            <script type="text/javascript">--%>
<%--                                $(document).ready(function () {--%>
<%--                                    $('#catfil').click(function () {--%>
<%--                                        $.get('/filtercat',function (data,status) {--%>
<%--                                            $('#post').html(data);--%>
<%--                                        })--%>
<%--                                    });--%>
<%--                                });--%>
<%--                            </script>--%>
<%--                        </ul>--%>
<%--                    </div>--%>

<%--                </li>--%>


<%--                <li id="signup" style="float: left ;margin-top: 5px">--%>
<%--                    <form action="/filter">--%>
<%--                        <input type="text" name="search" id="search" placeholder="Search reddit"/>--%>
<%--                        <input type="submit" value="search" style="display: none">--%>
<%--                    </form>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </div>--%>

<%--        <ul>--%>
<%--            <div class="nav navbar-nav navbar-right" id="user" style="float: left;margin-left: -50px">--%>

<%--                <li id="homeico"><a class="list-group-item" href="/" class="nav-link text-light" style="border: hidden;font-size: 20px"><i class="fa fa-home fa-fw" aria-hidden="true"><h5> Home</h5></i></a>--%>
<%--                </li>--%>
<%--                <li id="vpost"><a class="list-group-item" href="/new" class="nav-link text-light" style="border: hidden ;font-size: 20px" ><i class="fa fa-pencil-square-o" aria-hidden="true" ><h5>New Post</h5></i></a>--%>
<%--                </li>--%>
<%--                <sec:authorize access="!hasAnyRole('ROLE_ADMIN')&& !hasAnyRole('ROLE_USER')  ">--%>
<%--                    <li id="showC"><a class="nav-link text-light" style="color: black !important" href="/register"><i class="fa fa-user-plus" aria-hidden="true"></i><h5>Sign Up</h5></a>--%>
<%--                    </li>--%>
<%--                    <li><a class="nav-link text-light" style="color: black !important;font-size: 20px" href="/login"><i class="fa fa-sign-in" aria-hidden="true"><h5>Sign In</h5></i></a>--%>
<%--                    </li>--%>
<%--                </sec:authorize>--%>
<%--                <li class="nav-item">--%>
<%--                    <sec:authorize access="hasAnyRole('ROLE_ADMIN') || hasAnyRole('ROLE_USER')">--%>
<%--                        <a class="nav-link text-light" style="color: black !important;font-size: 20px" href="/logout"><i class="fa fa-sign-out" aria-hidden="true"><h5>log out</h5></i></a>--%>
<%--                    </sec:authorize>--%>

<%--                </li>--%>

<%--            </div>--%>
<%--        </ul>--%>
<%--    </div>--%>
<%--</nav>--%>
<%--<style>--%>

<%--    /*#home{*/--%>
<%--    /*    display: none;*/--%>
<%--    /*}*/--%>
<%--    /*.fa-home fa-fw:hover ~ #home {*/--%>
<%--    /*    display: block;*/--%>
<%--    /*}*/--%>

<%--</style>--%>

