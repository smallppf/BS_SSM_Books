<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.small.pojo.AdminBean,com.small.dao.AdminDao" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN" class="ax-vertical-centered">
<head>
    <meta charset="UTF-8">
    <title>"蜂源"图书馆管理系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../../static/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../static/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="../../static/css/bootstrap-admin-theme.css">
    <link rel="stylesheet" href="../../static/css/bootstrap-admin-theme.css">
    <link rel="stylesheet" href="../../static/css/body.css">
    <script src="../../static/jQuery/jquery-3.1.1.min.js"></script>
    <script src="../../static/js/bootstrap.min.js"></script>
    <script src="../../static/js/bootstrap-dropdown.min.js"></script>
    <script src="../../static/js/reader.js"></script>
    <script src="../../static/js/readerUpdateInfo.js"></script>
    <script src="../../static/js/readerUpdatePwd.js"></script>

</head>


<body class="bootstrap-admin-with-small-navbar bj1" style="padding-top: 10px">
<!-- 判断是否已经登录 -->
<%
    AdminBean admin = (AdminBean) session.getAttribute("admin");
%>
<div class="nav">
    <div class="container-fluid">
        <div class="navbar-header" style="margin-left: 8%;margin-right: 1%">
            <a class="navbar-brand" href="/index2"
               style="font-family: 华文行楷; font-size: 250%; color: white">"蜂源"图书管理系统</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-left">
                <li>
                    <a href="/select" style="color: white">
                        图书查询
                    </a>
                </li>
                <li>
                    <a href="/borrow" style="color: white">
                        借阅信息
                    </a>
                </li>
                <li>
                    <a href="/history" style="color: white">
                        借阅历史
                    </a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: white">
                        欢迎${admin.name}, 已登录
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#updateinfo" data-toggle="modal">个人资料</a></li>
                        <li role="presentation" class="divider"></li>
                        <li><a href="#updatepwd" data-toggle="modal">修改密码</a></li>
                        <li role="presentation" class="divider"></li>
                        <li><a href="/login">退出</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>

<div class="container">
    <!-- left, vertical navbar & content -->
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="row">
            <div class="col-lg-12">
                <div class="col-lg-offset-1">
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <img src="../../static/img/book1.png" alt="..." style="height: 600px;width: 1000px">
                            <div class="carousel-caption">
                                <a class="navbar-brand"
                                   style="font-family: 华文行楷; font-size: 300%; color: white">"蜂源"出品</a>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../static/img/book2.png" alt="..." style="height: 600px;width: 1000px">
                            <div class="carousel-caption">
                                <a class="navbar-brand"
                                   style="font-family: 华文行楷; font-size: 300%; color: white">"蜂源"出品</a>
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../static/img/book4.png" alt="..." style="height: 600px;width: 1000px">
                            <div class="carousel-caption">
                                <a class="navbar-brand"
                                   style="font-family: 华文行楷; font-size: 300%; color: white">"蜂源"出品</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- content -->
</div>
</div>


<!-------------------------------------------------------------->

<form class="form-horizontal" method="post" action="AdminServlet1">   <!--保证样式水平不混乱-->
    <!-- 模态框（Modal） -->
    <div class="modal fade" id="updatepwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content bj1">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        修改密码
                    </h4>
                </div>
                <div class="modal-body">

                    <!--正文-->
                    <input type="hidden" name="tip" value="1">
                    <input type="hidden" name="url" value="index">
                    <div class="form-group">
                        <label for="oldPwd" class="col-sm-3 control-label">原密码</label>
                        <div class="col-sm-7">
                            <input type="password" class="form-control" name="password" id="oldPwd"
                                   placeholder="请输入原密码">
                            <label class="control-label" for="oldPwd" style="display: none"></label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="newPwd" class="col-sm-3 control-label">新密码</label>
                        <div class="col-sm-7">
                            <input type="password" class="form-control" name="password2" id="newPwd"
                                   placeholder="请输入新密码">
                            <label class="control-label" for="newPwd" style="display: none"></label>
                        </div>
                    </div>

                    <!--正文-->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="submit" class="btn btn-primary">
                        修改
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

</form>
<!-------------------------------------------------------------->

<!-------------------------个人资料模糊框------------------------------------->

<form class="form-horizontal" method="post" action="AdminServlet2">   <!--保证样式水平不混乱-->
    <!-- 模态框（Modal） -->
    <div class="modal fade" id="updateinfo" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content bj1">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="ModalLabel">
                        个人资料
                    </h4>
                </div>

                <div class="modal-body">
                    <!--正文-->
                    <input type="hidden" name="tip" value="2">
                    <input type="hidden" name="url" value="index">
                    <div class="form-group">
                        <label for="name" class="col-sm-3 control-label">真实姓名</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="name" name="name" placeholder="请输入您的真实姓名"
                                   value='${admin.name}'>
                            <label class="control-label" for="name" style="display: none"></label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="phone" class="col-sm-3 control-label">手机号</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="phone" name="phone" placeholder="请输入您的手机号"
                                   value='${admin.phone}'>
                            <label class="control-label" for="phone" style="display: none"></label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email" class="col-sm-3 control-label">邮箱</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="email" name="email" placeholder="请输入您的邮箱"
                                   value='${admin.email}'>
                            <label class="control-label" for="email" style="display: none"></label>
                        </div>
                    </div>
                    <!--正文-->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="submit" class="btn btn-info">
                        修改
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

</form>
<!-------------------------------------------------------------->

<div class="modal fade" id="modal_info" tabindex="-1" role="dialog" aria-labelledby="addModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="infoModalLabel">提示</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-12" id="div_info"></div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btn_info_close" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>


</body>
</html>