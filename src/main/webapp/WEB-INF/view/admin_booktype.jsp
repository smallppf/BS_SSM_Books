<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="static/css/body.css">
    <script src="../../static/jQuery/jquery-3.1.1.min.js"></script>
    <script src="../../static/js/bootstrap.min.js"></script>
    <script src="../../static/js/bootstrap-dropdown.min.js"></script>
    <script src="../../static/js/adminUpdateInfo.js"></script>
    <script src="../../static/js/adminUpdatePwd.js"></script>

</head>


<body class="bootstrap-admin-with-small-navbar bj1" style="padding-top: 10px">

<div class="nav">
    <div class="container-fluid">
        <div class="navbar-header" style="margin-left: 8%;margin-right: 1%">
            <a class="navbar-brand" href="/admin"
               style="font-family: 华文行楷; font-size: 250%; color: white">"蜂源"图书管理系统</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-left">
                <li>
                    <a href="/admin_book" style="color: white">
                        图书管理
                    </a>
                </li>
                <li>
                    <a href="/admin_user" style="color: white">
                        用户管理
                    </a>
                </li>
                <li>
                    <a href="/admin_booktype" style="color: white">
                        图书分类管理
                    </a>
                </li>
                <li>
                    <a href="/admin_borrow" style="color: white">
                        图书借阅信息
                    </a>
                </li>
                <li>
                    <a href="/admin_history" style="color: white">
                        图书归还信息
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
    <div class="row">
        <!-- left, vertical navbar -->

        <!-- content -->
        <div class="col-md-12">

            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-warning bootstrap-admin-no-table-panel">
                        <div class="panel-heading">
                            <div class="text-muted bootstrap-admin-box-title">图书分类管理</div>
                        </div>
                        <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in bj1">
                            <form class="form-horizontal" action="selectServlet" method="post">

                                <div class="col-lg-12 form-group">
                                    <button type="button" class="btn btn-warning right" id="btn_add" data-toggle="modal"
                                            data-target="#addModal">添加分类
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-lg-12">
                    <table id="data_list" class="table table-hover table-bordered" cellspacing="0" width="100%">
                        <thead>
                        <tr>
                            <th>图书分类名称</th>
                            <th>操作</th>

                        </tr>
                        </thead>


                        <!---在此插入信息-->

                        <c:forEach items="${bookdata}" var="i">
                        <tbody>
                        <td>${i.name}
                        </td>

                        <td>
                            <button type="button" class="btn btn-info btn-xs" data-toggle="modal"
                                    data-target="#updateModal"
                                    id="btn_update" onclick="showInfo2('${i.tid}','${i.name}')">
                                修改
                            </button>
                            <button type="button" class="btn btn-danger btn-xs"
                                    onclick="deletebook('${i.tid}')">删除
                            </button>
                        </td>
                        </tbody>

                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function showInfo2(tid, name) {
            document.getElementById("updatetid").value = tid;
            document.getElementById("updatename").value = name;
        }

        function deletebook(tid) {
            con = confirm("是否删除?");
            if (con == true) {
                location.href = "deleteTypeServlet/" + tid;
            }
        }
    </script>


    <!-- 修改模态框（Modal） -->
    <!-------------------------------------------------------------->

    <!-- 修改模态框（Modal） -->
    <form class="form-horizontal" method="post" action="updateBookTypeServlet">   <!--保证样式水平不混乱-->
        <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="updateModalLabel">
                            修改图书分类
                        </h4>
                    </div>
                    <div class="modal-body">

                        <!---------------------表单-------------------->

                        <div class="form-group">
                            <label class="col-sm-3 control-label">图书名称</label>
                            <div class="col-sm-7">
                                <input type="hidden" name="tid" id="updatetid">
                                <input type="text" class="form-control" id="updatename" name="name"
                                       placeholder="请输入图书分类名称">
                                <label class="control-label" style="display: none;"></label>
                            </div>
                        </div>

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


    <!--------------------------------------添加的模糊框------------------------>
    <form class="form-horizontal" method="post" action="/AddBookTypeServlet">   <!--保证样式水平不混乱-->
        <!-- 模态框（Modal） -->
        <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel1">
                            添加新图书分类
                        </h4>
                    </div>
                    <div class="modal-body">

                        <!---------------------表单-------------------->

                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="addBookName">分类名称</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="addBookName" required="required" name="name" placeholder="请输入图书分类名称">
                                <label class="control-label" for="addBookName" style="display: none;"></label>
                            </div>
                        </div>

                        <!---------------------表单-------------------->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-primary">
                            添加
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>

    </form>
    <!--------------------------------------添加的模糊框------------------------>


    <!-------------------------------------------------------------->

    <form class="form-horizontal" method="post" action="AdminServlet1">   <!--保证样式水平不混乱-->
        <!-- 模态框（Modal） -->
        <div class="modal fade" id="updatepwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
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
                        <input type="hidden" name="url" value="admin_booktype">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">原密码</label>
                            <div class="col-sm-7">
                                <input type="password" class="form-control" name="password" id="oldPwd"
                                       placeholder="请输入原密码">
                                <label class="control-label" for="oldPwd" style="display: none"></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">新密码</label>
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
        <div class="modal fade" id="updateinfo" tabindex="-1" role="dialog" aria-labelledby="ModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
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
                        <input type="hidden" name="url" value="admin_booktype">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">真实姓名</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="name" name="name" placeholder="请输入您的真实姓名"/>
                                <label class="control-label" for="name" style="display: none"></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">手机号</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="phone" name="phone" placeholder="请输入您的手机号"
                                       value='${admin.phone}'>
                                <label class="control-label" for="phone" style="display: none"></label>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-sm-3 control-label">邮箱</label>
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
                        <button type="submit" class="btn btn-primary">
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
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
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
</div>

</body>
</html>