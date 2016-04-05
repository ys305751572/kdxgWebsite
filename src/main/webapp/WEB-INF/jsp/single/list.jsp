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
    <title>单页列表</title>
    <%@ include file="../inc/css.jsp" %>
</head>

<body>
<div id="posts" class="wrapper">

    <%@ include file="../inc/nav.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">单页列表</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <%--<div class="panel-heading">--%>
                        <%--<a href="admin/infows/add" class="btn btn-outline btn-primary btn-lg" role="button">添加资讯</a>--%>
                    <%--</div>--%>
                    <%--<form class="navbar-form navbar-right" role="search">--%>
                        <%--<div class="form-group">--%>
                            <%--<label>资讯名称：</label>--%>
                            <%--<input type="text" class="form-control" value="" id="title" name="title" maxlength="20"--%>
                                   <%--placeholder="请输入资讯名称">--%>
                        <%--</div>--%>
                        <%--<div class="form-group">--%>
                            <%--<label>资讯分类：</label>--%>
                            <%--<select class="form-control input-sm" id="type">--%>
                                <%--<option value="" selected="selected">全部</option>--%>
                                <%--<option value="0">行业动态</option>--%>
                                <%--<option value="1">热点新闻</option>--%>
                                <%--<option value="2">今日话题</option>--%>
                            <%--</select>--%>
                        <%--</div>--%>
                        <%--<button type="button" id="c_search" class="btn btn-info btn-sm">查询</button>--%>
                    <%--</form>--%>


                    <!-- /.panel-heading -->
                    <div class="panel-body">

                        <div class="table-responsive">

                            <table class="table table-striped table-bordered table-hover" id="dataTables">
                                <colgroup>
                                    <col class="gradeA even"/>
                                    <col class="gradeA odd"/>
                                    <col class="gradeA even"/>
                                    <col class="gradeA odd"/>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th><input type="checkbox" onclick="$bluemobi.checkAll(this)" class="checkall"/>
                                    </th>
                                    <th>资讯名称</th>
                                    <th>更新时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>

                    </div>
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

                $("#delete").click(function () {
                    var checkBox = $("#dataTables tbody tr").find('input[type=checkbox]:checked');
                    var ids = checkBox.getInputId();
                    kuserList.fn.deleteRow(checkBox, ids)
                })

                $("#publish").click(function() {
                    var checkBox = $("#dataTables tbody tr").find('input[type=checkbox]:checked');
                    var ids = checkBox.getInputId();
                    kuserList.fn.publish(ids);
                })
            },
            dataTableInit: function () {
                kuserList.v.dTable = $bluemobi.dataTable($('#dataTables'), {
                    "processing": true,
                    "serverSide": true,
                    "searching": false,
                    "ordering": false,
                    "ajax": {
                        "url": "admin/single/list",
                        "type": "POST"
                    },
                    "columns": [
                        {"data": "id"},

                        {"data": "type",
                            render : function(data ) {
                                if(data == 1){
                                    return "关于我们";
                                }
                                if(data == 2) {
                                    return "公司发展";
                                }
                                if(data == 3) {
                                    return "加入我们";
                                }else if(data == 4) {
                                    return "联系我们";
                                }
                            }
                        },
                        {
                            "data": "createDate", render: function (data) {
                            return new Date(data).format("yyyy-MM-dd hh:mm:ss")
                        }
                        },
                        {"data": ""}
                    ],
                    "columnDefs": [
                        {

                            "data": null,
                            "defaultContent":
                            "<a  title='查看'  class='btn btn-primary btn-circle add'>" +
                            "<i class='fa fa-eye'></i>" +
                            "</a>"
                            +
                            "&nbsp;&nbsp;"
                            +
                            "<a  title='编辑' class='btn btn-primary btn-circle edit'>" +
                            "<i class='fa fa-edit'></i>" +
                            "</a>",
                            "targets": -1
                        }
                    ],
                    "createdRow": function (row, data, index) {
                        kuserList.v.list.push(data);
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
                        $('td', row).last().find(".add").attr("href", 'admin/single/detail?id=' + data.id);
                        $('td', row).last().find(".edit").attr("href", 'admin/single/add?id=' + data.id);

//                        if (data.username == 'admin') {
//                            $('td', row).last().find(".settingAdded").css('display', 'none');
//                        }

                        $('td', row).last().find(".settingAdded").click(function () {
                            kuserList.fn.settingAdded(data);

                        });
                    },
                    "fnServerParams": function (aoData) {
                        aoData.title = $("#title").val();
                        aoData.type = $("#type").val();
                    },
                    "fnDrawCallback": function (row) {
                        $bluemobi.uiform();
                    }
                });
            },
            settingAdded: function (data) {
                $bluemobi.optNotify(function () {
                    $bluemobi.ajax("admin/single/delete", {id: JSON.stringify(data.id)}, function (result) {
                        kuserList.fn.responseComplete(result);
                    })
                }, "你确定要删除吗？", "确定");
            },
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