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
    <link rel="stylesheet" href="../../static/css/body.css">
    <script src="../../static/jQuery/jquery-3.1.1.min.js"></script>
    <script src="../../static/js/bootstrap.min.js"></script>
    <script src="../../static/js/bootstrap-dropdown.min.js"></script>
    <script src="../../static/js/reader.js"></script>
    <script src="../../static/js/readerUpdateInfo.js"></script>
    <script src="../../static/js/readerUpdatePwd.js"></script>

</head>

<body class="bootstrap-admin-with-small-navbar bj1" style="padding-top: 10px">
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
    <div class="row">
        <!-- left, vertical navbar -->
        <!-- content -->
        <div class="col-md-12">
            <div class="row">
                <div class="col-lg-12">
                    <div class="text-muted bootstrap-admin-box-title ">
                        <ol class="breadcrumb">
                            <li class="active">借阅信息</li>
                        </ol>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">

                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <table id="data_list" class="table table-hover table-bordered" cellspacing="0" width="100%">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>图书名称</th>
                            <th>用户账号</th>
                            <th>用户名称</th>
                            <th>借阅日期</th>
                            <th>截止还书日期</th>
                            <th>操作</th>
                        </tr>
                        </thead>

                        <c:forEach items="${book}" var="i" varStatus="vs">
                        <tbody>
                        <td>${vs.count}
                        </td>
                        <td>${i.bookname}
                        </td>
                        <td>${i.adminname}
                        </td>
                        <td>${i.username}
                        </td>
                        <td>${i.begintime}
                        </td>
                        <td>${i.endtime}
                        </td>
                        <td>
                            <button type="button" class="btn btn-info btn-xs" data-toggle="modal"
                                    onclick="haibook('${i.hid}')">还书
                            </button>
                        </td>
                        </tbody>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <script type="text/javascript">
                function haibook(hid) {
                    con = confirm("是否还书?");
                    if (con == true) {
                        location.href = "borrowServlet/2/1/" + hid;
                    }
                }
            </script>
        </div>
    </div>
</div>


<!--------------------------------------查看的模糊框------------------------>
<form class="form-horizontal">   <!--保证样式水平不混乱-->
    <!-- 模态框（Modal） -->
    <div class="modal fade" id="findBackModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel1">
                        查看归还信息
                    </h4>
                </div>
                <div class="modal-body">

                    <!---------------------表单-------------------->
                    <div class="form-group">
                        <label for="borrowId" class="col-sm-3 control-label">借阅编号</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="borrowId" readonly="readonly">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="ISBN" class="col-sm-3 control-label">借阅书籍ISBN号</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="ISBN" readonly="readonly">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="bookName" class="col-sm-3 control-label">借阅书籍名称</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="bookName" readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="bookType" class="col-sm-3 control-label">借阅书籍类型</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="bookType" readonly="readonly">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="paperNO" class="col-sm-3 control-label">用户证件号</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="paperNO" readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="readerName" class="col-sm-3 control-label">用户名称</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="readerName" readonly="readonly">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="readerType" class="col-sm-3 control-label">用户类型</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="readerType" readonly="readonly">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="overday" class="col-sm-3 control-label">逾期天数</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="overday" readonly="readonly">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="admin" class="col-sm-3 control-label">操作管理员</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="admin" readonly="readonly">
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="state" class="col-sm-3 control-label">归还状态</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="state" readonly="readonly">

                        </div>
                    </div>


                    <!---------------------表单-------------------->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

</form>
<!--------------------------------------查看的模糊框------------------------>


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
                    <input type="hidden" name="url" value="borrow">
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
                    <input type="hidden" name="url" value="borrow">
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