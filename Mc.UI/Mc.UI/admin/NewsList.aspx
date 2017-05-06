<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewsList.aspx.cs" Inherits="Mc.UI.admin.NewsList" %>

<%@ Import Namespace="Mc.Model" %>
<%@ Import Namespace="Mc.Common" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/tableStyle.css" rel="stylesheet" type="text/css" />
    <link href="css/easyui.css" rel="stylesheet" type="text/css" />
    <link href="css/icon.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-2.14-min.js" type="text/javascript"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="libs/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="js/datapattern2.js" type="text/javascript"></script>
    <style type="text/css">
        #form1 table td
        {
            text-align: center;
            border: 1px soild black;
        }
    </style>
</head>
<body>
    <p>
        <a href="javascript:;" id="addNews">添加新闻</a>
    </p>
    <form id="form1" method="post" action="/admin/NewsList.aspx">
        <table>
            <thead>
                <tr>
                    <td style="width: 6%;">标题
                    </td>
                    <td style="width: 6%;">作者
                    </td>
                    <td style="width: 6%;">添加日期
                    </td>
                    <td style="width: 6%;">内容简介
                    </td>
                    <td style="width: 6%;">信息来源
                    </td>
                    <td style="width: 6%;">编辑
                    </td>
                    <td style="width: 6%;">删除
                    </td>
                </tr>
            </thead>
            <tbody>
                <% if (allNews != null)
                   {
                       foreach (News n in allNews)
                       {%>
                <tr>
                    <td>
                        <%: n.Title %>
                    </td>
                    <td>
                        <%: n.Author %>
                    </td>
                    <td>
                        <%: string.Format("{0:yyyy-MM-dd}", n.Addtime)%>
                    </td>
                    <td>
                        <%: CommonHelper.GetDefault(n.Content, 30)  %>
                    </td>
                    <td>
                        <%: n.Source %>
                    </td>
                    <td>
                        <a uid='<%: n.Id %>' class="edit" href="javascript:;">编辑</a>
                    </td>
                    <td>
                        <a uid='<%: n.Id %>' class="del" href="javascript:;">删除</a>
                    </td>
                </tr>
                <%  }
                   } %>
            </tbody>
        </table>
    </form>
    <!-- 编辑信息 -->
    <div id="div1">
        <form>
            <table class="caption" id="tb1">
                <tr>
                    <td>标题：
                    </td>
                    <td>
                        <input type="text" name="title" id="title" value="" />
                    </td>
                </tr>
                <tr>
                    <td>作者：
                    </td>
                    <td>
                        <input type="text" name="author" id="author" value="" />
                    </td>
                </tr>
                <tr>
                    <td>添加日期：
                    </td>
                    <td>
                        <input type="text" name="addTime" id="addTime" />
                    </td>
                </tr>
                <tr>
                    <td>内容简介：
                    </td>
                    <td>
                        <input type="text" name="content" id="content" />
                    </td>
                </tr>
                <tr>
                    <td>信息来源：
                    </td>
                    <td>
                        <input type="text" name="source" id="source" />
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <!-- 添加新闻 -->
    <div id="divAdd" style="overflow: hidden;">
        <iframe id="ifram1" framborder="0" width="100%" height="100%"></iframe>
    </div>
    <script type="text/javascript">
        $(function () {
            //日历控件..
            $('#addTime').click(function () {
                new WdatePicker({ 'skin': 'whyGreen' });
            })
            $('#div1').css('display', 'none');
            $('.edit').click(function () {
                var uId = $(this).attr('uid');
                showInfo(uId);
            })
            $('#divAdd').css('display', 'none');
            $('#addNews').click(function () {
                Add();
            })
        })

        //编辑详情
        function showInfo(uid) {
            $.post('/admin/ashx/ProcessNews.ashx', { Action: 'detail', Uid: uid }, function (resData) {
                var data = JSON.parse(resData);
                $('#title').val(data.Title);
                $('#author').val(data.Author);
                $('#addTime').val((eval(data.Addtime.replace(/\/Date\((\d+)\)\//gi, "new Date($1)"))).pattern("yyyy-MM-dd"));
                $('#content').val(data.Content);
                $('#source').val(data.Source);
            })
            $('#div1').css('display', 'block');
            $('#div1').dialog({
                modal: true,    //有阴影
                resizable: true,
                maximizable: true,
                collapsible: true,
                tilte: '用户详情',
                width: 400,
                height: 300,
                buttons: [{
                    text: '保存',
                    iconCls: 'icon-ok',
                    handler: function () {
                        var formData = $('#div1 form').serialize();   //增加一个表单，将表单序列化，一起提交服务器..
                        //发送修改请求
                        $.post('/admin/ashx/ProcessNews.ashx?Action=modify&Uid=' + uid, formData, function (data) {
                            if (data == 'yes') {
                                showMsg('信息', '修改成功', 2000, 'slide');
                                $('#div1').dialog('close');
                                setTimeout(refreshTb, 2000);
                            } else {
                                showMsg('信息', '修改失败', 5000, 'fade');
                            }
                        });
                    }
                }, {
                    text: '取消',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        //alert('cancel');;
                        $('#div1').dialog('close')
                    }
                }]
            });
        }

        //删除
        var aDel = document.getElementsByClassName('del');
        for (var i = 0; i < aDel.length; i++) {
            aDel[i].onclick = function () {
                var uid = $(this).attr('uid');
                var that = $(this);
                $.messager.confirm('提示', '确定要删除此记录？', function (res) {
                    if (res) {
                        $.post('/admin/ashx/ProcessNews.ashx', { Action: 'delete', Uid: uid }, function (data) {
                            if (data == 'ok') {
                                that.parent().parent().remove();     //删除行
                                showMsg('信息', '删除成功', 5000, 'slide');
                            } else {
                                showMsg('信息', '删除失败', 5000, 'fade');
                            }
                        });
                    };
                });
            };
        }

        //添加信息
        function Add() {
            $('#ifram1').attr('src', '/admin/AddNews.aspx'); //指定src..
            $('#divAdd').css('display', 'block');   //显示..

            $('#divAdd').dialog({
                modal: true,
                resizable: true,
                maximizable: true,
                collapsible: true,
                tilte: '添加用户',
                width: 400,
                height: 360,
                buttons: [{
                    text: '保存',
                    iconCls: 'icon-ok',
                    handler: function () {
                        //调用子窗体的表单提交方法..
                        var childWindow = $('#ifram1')[0].contentWindow;   //****获取子窗体的window对象.
                        childWindow.subForm();     //****调用子窗体中的方法..
                    }
                }, {
                    text: '取消',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        //alert('cancel');
                        $('#divAdd').dialog('close')
                    }
                }]
            });
        }

        //显示信息.
        function showMsg(t, m, time, type) {
            $.messager.show({
                title: t,
                msg: m,
                timeout: time,
                showType: type
            });
        }
        //刷新表格
        function refreshTb() {
            window.parent.frames[0].location.reload();    //考虑如何加载当前页??
        }
        //关闭对话框
        function onSuccess() {
            $('#divAdd').dialog('close');
        }
    </script>
</body>
</html>
