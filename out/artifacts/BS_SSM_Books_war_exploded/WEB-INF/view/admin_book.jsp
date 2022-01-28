<%@ page import="com.small.pojo.TypeBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.small.pojo.AdminBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<nav class="navbar navbar-default navbar-fixed-bottom bj2">
    <div class="container">
        <span class="glyphicon glyphicon-thumbs-up"></span><i>蜂源出品</i>
    </div>
</nav>

<div class="container">
    <!-- left, vertical navbar & content -->
    <div class="row">

        <!-- content -->
        <div class="col-md-12">
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-success bootstrap-admin-no-table-panel">
                        <div class="panel-heading">
                            <div class="text-muted bootstrap-admin-box-title">图书管理</div>
                        </div>
                        <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in bj1">
                            <form class="form-horizontal" action="/selectServlet" method="post">
                                <input type="hidden" name="tip" value="1">
                                <div class="col-lg-6 form-group">
                                    <label class="col-lg-4 control-label">图书名称</label>
                                    <div class="col-lg-8">
                                        <input class="form-control" id="bookName" name="name" type="text" value="">
                                        <label class="control-label" style="display: none;"></label>
                                    </div>
                                </div>
                                <div class="col-lg-3 form-group">
                                    <button type="submit" class="btn btn-primary" id="btn_query" onclick="">&nbsp;&nbsp;<span
                                            class="glyphicon glyphicon-search"></span>&nbsp;&nbsp;
                                    </button>
                                </div>
                                <div class="col-lg-2">
                                    <div class="dropdown">
                                        <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenu1"
                                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                            选择图书类型
                                            <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                            <c:forEach items="${data}" var="i">
                                                <li><a href="/select/${i.name}">${i.name}</a></li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-lg-1 form-group">
                                    <button type="button" class="btn btn-warning" id="btn_add" data-toggle="modal"
                                            data-target="#addModal">添加图书
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
                            <th>序号</th>
                            <th>图书名称</th>
                            <th>作者名称</th>
                            <th>出版社</th>
                            <th>图书类型</th>
                            <th>总数量</th>
                            <th>操作</th>

                        </tr>
                        </thead>
                        <!---在此插入信息-->
                        <c:forEach items="${book}" var="i" varStatus="vs">
                            <tbody>
                            <td>${vs.count}
                            </td>
                            <td>${i.name}
                            </td>
                            <td>${i.autho}
                            </td>
                            <td>${i.press}
                            </td>
                            <td>${i.type}
                            </td>
                            <td>${i.num}
                            </td>
                            <td>
                                <button type="button" class="btn btn-info btn-xs" data-toggle="modal"
                                        data-target="#imgModal"
                                        id="btn_update1"
                                        onclick="img('${i.address}')">
                                    查看图片
                                </button>
                                <button type="button" class="btn btn-info btn-xs " data-toggle="modal"
                                    data-target="#updateModal"
                                    id="btn_update"
                                    onclick="showInfo2('${i.bid}','${i.card}','${i.type}','${i.name}'
                                    ,'${i.autho}','${i.press}','${i.num}')">
                                    修改
                                    </button>
                                <button type="button" class="btn btn-danger btn-xs right"
                                        onclick="deletebook(${i.bid})">删除
                                </button>
                            </td>
                            </tbody>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="text-center">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li>
                    <a href="/admin_book/1" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <c:forEach var="i" begin="1" end="${pages}">
                    <li class='${i==pageNum ?"active":""}'><a href="/admin_book/${i}">${i}</a></li>
                </c:forEach>
                <li>
                    <a href="/admin_book/${pages}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
    <script type="text/javascript">
        function showInfo2(bid, card, type, name, autho, press, num) {
            document.getElementById("updateISBN").value = card;
            document.getElementById("updateBookName").value = name;
            document.getElementById("updateAutho").value = autho;
            document.getElementById("updatePress").value = press;
            document.getElementById("updateBookType").value = type;
            document.getElementById("updateNum").value = num;
            document.getElementById("updateBookId").value = bid;
        }

        function deletebook(bid) {
            con = confirm("是否删除?");
            if (con == true) {
                location.href = "/deleteServlet/" + bid;
            }
        }

        function img(address) {
            document.getElementById("bookimg").src = "../../static/img/bookimg/" + address;
        }
    </script>


    <!-- 图片查看模态框（Modal） -->
    <!-------------------------------------------------------------->
    <form class="form-horizontal" method="post" action="updateBookServlet">   <!--保证样式水平不混乱-->
        <div class="modal fade" id="imgModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content bj1">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="imgModalLabel">
                            浏览图书封面
                        </h4>
                    </div>
                    <div class="modal-body center-block">

                        <!---------------------表单-------------------->
                        <p class="text-center">
                            <img id="bookimg" style="width:400px;height: 600px" src="../../static/img/bookimg/${i.address}" alt="图片失效">
                        </p>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>

    </form>

    <!-------------------------------------------------------------->


    <!-- 修改模态框（Modal） -->
    <!-------------------------------------------------------------->

    <!-- 修改模态框（Modal） -->
    <form class="form-horizontal" method="post" action="updateBookServlet" enctype="multipart/form-data">    <!--保证样式水平不混乱-->
        <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content bj1">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="updateModalLabel">
                            修改图书信息
                        </h4>
                    </div>
                    <div class="modal-body">

                        <!---------------------表单-------------------->

                        <div class="form-group">
                            <label class="col-sm-3 control-label">图书号</label>
                            <div class="col-sm-7">
                                <input type="hidden" id="updateBookId" name="bid">
                                <input type="text" class="form-control" id="updateISBN" name="card" placeholder="请输入书号">
                                <label class="control-label" for="updateISBN" style="display: none;"></label>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-sm-3 control-label">图书名称</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="updateBookName" name="name"
                                       placeholder="请输入图书名称">
                                <label class="control-label" for="updateBookName" style="display: none;"></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">图书类型</label>
                            <div class="col-sm-7">
                                <select class="form-control" id="updateBookType" name="type"
                                        onPropertyChange="showValue(this.value)">
                                    <option value="-1">请选择</option>
                                    <%
                                        ArrayList<TypeBean> data = (ArrayList<TypeBean>) request.getAttribute("data");
                                        for (TypeBean bean : data) {
                                    %>
                                    <option value="<%= bean.getName() %>"><%= bean.getName() %>
                                    </option>
                                    <%} %>
                                </select>
                                <label class="control-label" for="updateBookType" style="display: none;"></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">作者名称</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="updateAutho" name="autho"
                                       placeholder="请输入作者名称">
                                <label class="control-label" for="updateAutho" style="display: none;"></label>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-sm-3 control-label">出版社</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="updatePress" name="press"
                                       placeholder="请输入出版社">
                                <label class="control-label" for="updatePress" style="display: none;"></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">总数量</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="updateNum" name="num" placeholder="请输入总数量">
                                <label class="control-label" for="updatePress" style="display: none;"></label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">图片更改</label>
                        <div class="col-sm-7">
                            <input type="file" class="form-control" id="updateaddress" name="file" >
                            <label class="control-label" for="updateaddress" style="display: none;"></label>
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

    </form>
    <!-------------------------------------------------------------->


    <!--------------------------------------添加的模态框------------------------>
    <form class="form-horizontal" method="post" action="AddBookServlet" enctype="multipart/form-data">
        <!--保证样式水平不混乱-->
        <!-- 模态框（Modal） -->
        <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content bj1">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel1">
                            添加新图书
                        </h4>
                    </div>
                    <div class="modal-body">

                        <!---------------------表单-------------------->

                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="addISBN">图书号</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="addISBN" required="required" name="card"
                                       placeholder="请输入书号">
                                <label class="control-label" for="addISBN" style="display: none;"></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="addBookName">图书名称</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="addBookName" required="required" name="name"
                                       placeholder="请输入图书名称">
                                <label class="control-label" for="addBookName" style="display: none;"></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="addBookType">图书类型</label>
                            <div class="col-sm-7">
                                <select class="form-control" id="addBookType" name="type">
                                    <option value="无分类">请选择</option>
                                        <% for (TypeBean bean : data) { %>
                                    <option value="<%= bean.getName() %>"><%= bean.getName() %>
                                    </option>
                                        <% } %>
                                    <label class="control-label" for="addBookType" style="display: none;"></label>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="null">空</label>
                            <div class="col-sm-7">
                                <input type="hidden" class="form-control" id="null" required="null" name="null">
                                <label class="control-label" for="null" style="display: none;"></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="addAutho">作者名称</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="addAutho" required="required" name="autho"
                                       placeholder="请输入作者名称">
                                <label class="control-label" for="addAutho" style="display: none;"></label>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="addPress">出版社</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="addPress" required="required" name="press"
                                       placeholder="请输入出版社">
                                <label class="control-label" for="addPress" style="display: none;"></label>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="addNum">总数量</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="addNum" required="required" name="num"
                                       placeholder="请输入图书总数量">
                                <label class="control-label" for="addNum" style="display: none;"></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="address">请选择图片</label>
                            <div class="col-sm-7">
                                <input type="file" class="form-control" id="address" required="required" name="file">
                                <label class="control-label" for="address" style="display: none;"></label>
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
    <!--------------------------------------添加的模态框------------------------>


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
                        <input type="hidden" name="url" value="admin_book">
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="oldPwd">原密码</label>
                            <div class="col-sm-7">
                                <input type="password" class="form-control" name="password" id="oldPwd"
                                       placeholder="请输入原密码">
                                <label class="control-label" for="oldPwd" style="display: none"></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="newPwd">新密码</label>
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
    <!--------------------------------------------------------想·------>

    <!-------------------------个人资料模态框------------------------------------->

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
                        <input type="hidden" name="url" value="admin_book">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">真实姓名</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="name" name="name" placeholder="请输入您的真实姓名"
                                       value='${admin.name}'>
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