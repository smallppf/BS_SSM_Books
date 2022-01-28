<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="static/css/stack-interface.css" rel="stylesheet" type="text/css" media="all">
    <link href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
    <link href="static/css/stack-interface.css" rel="stylesheet" type="text/css" media="all" />
    <link href="static/css/theme.css" rel="stylesheet" type="text/css" media="all" />
    <link href="static/css/custom.css" rel="stylesheet" type="text/css" media="all" />
</head>

<body data-smooth-scroll-offset="77">
<div class="nav-container">
    <div>
        <div class="bar bar--sm visible-xs">
            <div class="container">
                <div class="row">
                    <div class="col-3 col-md-2">
                    </div>
                    <div class="col-9 col-md-10 text-right">
                        <a href="#" class="hamburger-toggle" data-toggle-class="#menu2;hidden-xs hidden-sm"> <i class="icon icon--sm stack-interface stack-menu"></i> </a>
                    </div>
                </div>
            </div>
        </div>
        <nav id="menu2" class="bar bar-2 hidden-xs">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5 text-center text-left-sm hidden-xs order-lg-2">
                        <div class="bar__module">
                            <a class="navbar-brand" href="#"
                               style="font-family: 华文行楷; font-size: 250%; color: pink">"蜂源"图书管理系统</a>
                        </div>
                    </div>
                    <div class="col-lg-5 order-lg-1">

                    </div>
                    <div class="col-lg-5 text-right text-left-xs text-left-sm order-lg-3">
                        <div class="bar__module">
                            <a class="btn btn--sm type--uppercase" href="/register"> <span class="btn__text">
                                    注册
                                </span> </a>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
    </div>
</div>
<div class="main-container">
    <section class="text-center imagebg" data-gradient-bg="#4876BD,#5448BD,#8F48BD,#BD48B1">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-10 col-lg-8">
                    <div class="boxed boxed--lg bg--dark subscribe-form-1">
                        <h3>欢迎来到“蜂源”图书这里有你们想看的书</h3>
                        <h5>Welcome to the bee source book,There are books you want to read</h5>
                        <div class="row justify-content-center no-gutters">
                            <div class="col-md-8 text-left">
                                <form method="post" action="LoginServlet">
                                    <label class="control-label" for="username" style="color: red">
                                        <c:if test="${state!=null}">
                                            ${state}&nbsp;
                                        </c:if>
                                        <c:if test="${state==null}">
                                            &nbsp;&nbsp;
                                        </c:if>
                                    </label>
                                    <input class="validate-required"id="username" type="text" name="username" placeholder="请输入账号">
                                    <input class="validate-required " type="password" name="password" placeholder="请输入密码">
                                    <span>&nbsp;&nbsp;</span>
                                    <button type="submit" class="btn btn--primary type--uppercase">登录</button>
                                    <div style="position: absolute; left: -5000px" aria-hidden="true"> <input type="text" name="b_77142ece814d3cff52058a51f_f300c9cce8" tabindex="-1" value=""> </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<script src="static/jQuery/jquery-3.1.1.min.js"></script>
<script src="static/js/parallax.js"></script>
<script src="static/js/granim.min.js"></script>
<script src="static/js/smooth-scroll.min.js"></script>
<script src="static/js/scripts.js"></script>
</body>

</html>