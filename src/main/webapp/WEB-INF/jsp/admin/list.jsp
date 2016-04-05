<%--
  Created by IntelliJ IDEA.
  User: wangbin
  Date: 2015/8/17
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../inc/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="../inc/meta.jsp" %>
    <meta name="description" content="">
    <meta name="author" content="">
    <title>修改密码</title>
    <%@ include file="../inc/css.jsp" %>
</head>

<body>
<div id="posts" class="wrapper">

    <%@ include file="../inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">修改密码</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <form class="navbar-form navbar-right" role="search">
                        <div class="panel-body">
                            <form id="productForm" method="post" enctype="multipart/form-data"
                                  action="admin/admin/save" class="form-horizontal" role="form">
                                <input type="hidden" id="id" name="id" value="${admin.id}">

                                <div class="form-group">
                                    <label  class="col-sm-2 control-label">原始密码:</label>
                                    <div class="col-sm-3">
                                        <input type="password" class="form-control" id="password"
                                               name="password" data-rule="required" value="${admin.password}" placeholder="请输入原始密码">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label  class="col-sm-2 control-label">新密码:</label>
                                    <div class="col-sm-3">
                                        <input id="password1" class="form-control" placeholder="新密码"
                                               data-rule="新密码: required; !digits; length[6~15]" maxlength="15" data-msg-digits="{0}不能使用纯数字"
                                               data-msg-length="{0}请输入6~15位" name="password" type="password" value="${admin.password}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label  class="col-sm-2 control-label">确认新密码:</label>
                                    <div class="col-sm-3">
                                        <input data-rule="确认新密码: required;match(password1);"
                                               class="form-control" placeholder="确认新密码" data-rule="required" type="password"
                                               value="${admin.password}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="button" id="submitProduct" class="btn btn-primary">提交</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </form>


                    <!-- /.panel-heading -->
                    <%--<div class="panel-body">--%>

                        <%--<div class="table-responsive">--%>

                            <%--<table class="table table-striped table-bordered table-hover" id="dataTables">--%>
                                <%--<colgroup>--%>
                                    <%--<col class="gradeA even"/>--%>
                                    <%--<col class="gradeA odd"/>--%>
                                    <%--<col class="gradeA even"/>--%>
                                    <%--<col class="gradeA odd"/>--%>
                                    <%--<col class="gradeA even"/>--%>
                                    <%--<col class="gradeA odd"/>--%>
                                    <%--<col class="gradeA even"/>--%>
                                <%--</colgroup>--%>
                                <%--<thead>--%>
                                <%--<tr>--%>
                                    <%--<th><input type="checkbox" onclick="$bluemobi.checkAll(this)" class="checkall"/>--%>
                                    <%--</th>--%>
                                    <%--<th>用户组</th>--%>
                                    <%--<th>姓名</th>--%>
                                    <%--<th>账号</th>--%>
                                    <%--<th>电话号码</th>--%>
                                    <%--<th>添加时间</th>--%>
                                    <%--<th>操作</th>--%>
                                <%--</tr>--%>
                                <%--</thead>--%>
                                <%--<tbody>--%>
                                <%--</tbody>--%>
                            <%--</table>--%>
                        <%--</div>--%>

                    <%--</div>--%>
                    <!-- /.panel-body -->

                </div>
                <!-- /.panel -->
            </div>
        </div>


    </div>
    <!-- /#page-wrapper -->


</div>
<!-- /#wrapper -->

<%@ include file="../inc/footer.jsp" %>
</body>
<script type="text/javascript">
    Date.prototype.format = function (format) {
        var o = {
            "M+": this.getMonth() + 1, // month
            "d+": this.getDate(), // day
            "h+": this.getHours(), // hour
            "m+": this.getMinutes(), // minute
            "s+": this.getSeconds(), // second
            "q+": Math.floor((this.getMonth() + 3) / 3), // quarter
            "S": this.getMilliseconds()
        };
        if (/(y+)/.test(format)) {
            format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        }
        ;
        for (var k in o) {
            if (new RegExp("(" + k + ")").test(format)) {
                format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
            }
        }
        ;
        return format;
    };
</script>
<script type="text/javascript">

    var kuserList = {
        v: {
            id: "kuserList",
            list: [],
            dTable: null
        },
        fn: {
            init: function () {
                kuserList.fn.dataTableInit();
                // 查询
                $("#c_search").click(function () {
                    kuserList.v.dTable.ajax.reload();
                })
                //删除
                $("#delete").click(function () {
                    var checkBox = $("#dataTables tbody tr").find('input[type=checkbox]:checked');
                    var ids = checkBox.getInputId();
                    kuserList.fn.deleteRow(checkBox, ids)
                })
            },
            dataTableInit: function () {
                kuserList.v.dTable = $bluemobi.dataTable($('#dataTables'), {
                    "processing": true,
                    "serverSide": true,
                    "searching": false,
                    "ordering": false,
                    "ajax": {
                        "url": "admin/admin/list",
                        "type": "POST"
                    },
//                    "columns": [
//                        {"data": "id"},
//                        {
//                            "data": "username",
//                            render: function (data) {
//                                return "管理员";
//                            }
//                        },
//                        {"data": "name"},
//                        {"data": "username"},
//                        {"data": "mobile"},
//                        {
//                            "data": "createDate", render: function (data) {
//                            return new Date(data).format("yyyy-MM-dd")
//                        }
//                        },
//                        {"data": ""}
//                    ],
//                    "columnDefs": [
//                        {
//
//                            "data": null,
//                            "defaultContent": "<a  title='查看'  class='btn btn-primary btn-circle add'>" +
//                            "<i class='fa fa-eye'></i>" +
//                            "</a>"
//                            +
//                            "&nbsp;&nbsp;"
//                            +
//                            "<a  title='编辑' class='btn btn-primary btn-circle edit'>" +
//                            "<i class='fa fa-edit'></i>" +
//                            "</a>"
//                            +
//                            "&nbsp;&nbsp;"
//                            +
//                            "<a  title='删除' class='btn btn-primary btn-circle settingAdded'>" +
//                            "<i class='fa fa-trash'></i>" +
//                            "</a>",
//                            "targets": -1
//                        }
//                    ],
                    "createdRow": function (row, data, index) {
//                        kuserList.v.list.push(data);
                        $('td', row).eq(0).html("<input type='checkbox' value=" + data.id + ">");
//                        if(data.status == 0){
//                            $(row).addClass("success")
//
//                            $('td', row).last().find(".settingAdded").addClass("btn-default");
//                            $('td', row).last().find(".settingAdded").attr("title", "禁用")
//                        }else{
//                            $('td', row).last().find(".settingAdded").addClass("btn-info");
//                            $('td', row).last().find(".settingAdded").attr("title", "启用");
//                        }
                    },
                    rowCallback: function (row, data) {
                        var items = kuserList.v.list;
                        $('td', row).last().find(".add").attr("href", 'admin/hadmin/detail?id=' + data.id);
                        $('td', row).last().find(".edit").attr("href", 'admin/hadmin/add?id=' + data.id);

                        if (data.username == 'admin') {
                            $('td', row).last().find(".settingAdded").css('display', 'none');
                        }

                        $('td', row).last().find(".settingAdded").click(function () {
                            kuserList.fn.settingAdded(data);

                        });
                    },
                    "fnServerParams": function (aoData) {
                        aoData.name = $("#name").val();
                        aoData.username = $("#username").val();
                    },
                    "fnDrawCallback": function (row) {
                        $bluemobi.uiform();
                    }
                });
            },
//            settingAdded: function (data) {
//                $bluemobi.optNotify(function () {
//                    $bluemobi.ajax("admin/hadmin/delete", {id: JSON.stringify(data.id)}, function (result) {
//                        kuserList.fn.responseComplete(result);
//                    })
//                }, "你确定要删除吗？", "确定");
//            },
            responseComplete: function (result) {
                if (result == 1) {
                    kuserList.v.dTable.ajax.reload(null, false);
                    $bluemobi.notify(result.msg, "success");
                } else {
                    $bluemobi.notify(result.msg, "error");
                }
            }
        }
    }
    $(document).ready(function () {
        kuserList.fn.init();
    });
</script>
</html>