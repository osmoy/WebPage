<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CaseList.aspx.cs" Inherits="Mc.UI.admin.CaseList" %>

<%@ Import Namespace="Mc.Model" %>
<%@ Import Namespace="Mc.Common" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/tableStyle.css" rel="stylesheet" type="text/css" />
    <link href="css/easyui.css" rel="stylesheet" type="text/css" />
    <link href="css/icon.css" rel="stylesheet" type="text/css" />
    <link href="css/pageBar.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-2.14-min.js" type="text/javascript"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="js/MyAjaxForm.js" type="text/javascript"></script>
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
        <a href="javascript:;" id="addNews">添加案例</a>
    </p>
    <form id="form1" method="post" action="/admin/NewsList.aspx">
        <table>
            <thead>
                <tr>
                    <td style="width: 6%;">标题
                    </td>
                    <td style="width: 6%;">内容简介
                    </td>
                    <td style="width: 6%;">案例预览
                    </td>
                    <td style="width: 6%;">编辑
                    </td>
                    <td style="width: 6%;">删除
                    </td>
                </tr>
            </thead>
            <tbody>
                <%if (allCase != null)
                  {
                      foreach (CaseInfo c in allCase)
                      {%>
                <tr>
                    <td>
                        <%: c.Title %>
                    </td>
                    <td>
                        <%: c.Content %>
                    </td>
                    <td>
                        <img style="width: 50px; height: 50px;" src="<%: c.ImgPath %>" title='<%: c.Title %>' alt='<%: c.Title %>' />
                    </td>
                    <td>
                        <a uid='<%: c.Id %>' class="edit" href="javascript:;">编辑</a>
                    </td>
                    <td>
                        <a uid='<%: c.Id %>' class="del" href="javascript:;">删除</a>
                    </td>
                </tr>
                <% }
                  }%>
            </tbody>
        </table>
        <%--分页条 --%>
        <p class="page_nav">
            <%: new HtmlString(pageBar) %>
        </p>
    </form>

    <!-- 编辑信息 -->
    <div id="div1">
        <form id="formedit" enctype="multipart/form-data">
            <table class="caption" id="tb1">
                <tr>
                    <td>标题：
                    </td>
                    <td>
                        <input type="text" name="title" id="title" value="" />
                    </td>
                </tr>
                <tr>
                    <td>内容简介：
                    </td>
                    <td>
                        <textarea id="content" name="content" cols="30" rows="5"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>案例预览：
                    </td>
                    <td>
                        <img style="width: 50px; height: 50px;" id="caseImg" />
                        <input type="file" name="uploadfile" id="uploadfile" />
                        <input type="button" name="btnupload" id="btnUpload" value="上传图片" />
                    </td>
                </tr>
            </table>
            <input type="hidden" id="hidImgPath" name="hidImgPath" />
        </form>
    </div>
    <!-- 添加案例 -->
    <div id="divAdd" style="overflow: hidden;">
        <iframe id="ifram1" framborder="0" width="100%" height="100%"></iframe>
    </div>

    <script type="text/javascript">
        $(function () {
            $('#div1').css('display', 'none');
            $('.edit').click(function () {
                var uId = $(this).attr('uid');
                showInfo(uId);
            })
            $('#divAdd').css('display', 'none');
            $('#addNews').click(function () {
                Add();
            })
            $('#btnUpload').click(function () {
                upload();
            })
        })

        //编辑详情
        function showInfo(uid) {
            $.post('/admin/ashx/ProcessCase.ashx', { Action: 'detail', Uid: uid }, function (resData) {
                var data = JSON.parse(resData);
                $('#title').val(data.Title);
                $('#content').text(data.Content);
                $('#caseImg').attr('src', data.ImgPath);
                $('#hidImgPath').val(data.ImgPath);    //赋值隐藏域，提交服务器..
            })
            $('#div1').css('display', 'block');
            $('#div1').dialog({
                modal: true,    //有阴影
                resizable: true,
                maximizable: true,
                collapsible: true,
                tilte: '用户详情',
                width: 480,
                height: 330,
                buttons: [{
                    text: '保存',
                    iconCls: 'icon-ok',
                    handler: function () {
                        var formData = $('#div1 form').serialize();   //增加一个表单，将表单序列化，一起提交服务器..
                        //发送修改请求
                        $.post('/admin/ashx/ProcessCase.ashx?Action=modify&Uid=' + uid, formData, function (data) {
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
                        $.post('/admin/ashx/ProcessCase.ashx', { Action: 'delete', Uid: uid }, function (data) {
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

        //添加案例
        function Add() {
            $('#ifram1').attr('src', '/admin/AddCase.aspx'); //指定src..
            $('#divAdd').css('display', 'block');   //显示..

            $('#divAdd').dialog({
                modal: true,
                resizable: true,
                maximizable: true,
                collapsible: true,
                tilte: '添加案例',
                width: 500,
                height: 330,
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
        //修改图片
        function upload() {
            if ($("#uploadfile").val() == '') {
                $.messager.alert('提示', '请选择上传图片', 'info');
                return;
            }
            $('#formedit').ajaxSubmit({
                type: 'post',
                url: '/admin/ashx/ProcessUpload.ashx',
                success: function (data) {
                    if (data == 'empyt') {
                        $.messager.alert('提示', '请选择上传图片', 'info');
                    } else if (data == 'error') {
                        $.messager.alert('提示', '图片的格式有误', 'warning');
                    } else {
                        data = data.replace("<pre>", "").replace("</pre>", ""); //会默认加上<pre></pre>标签
                        $('#caseImg').attr('src', data);
                        $('#hidImgPath').val(data);  //赋值隐藏域，提交服务器..
                        $.messager.alert('提示', '上传成功', 'info');
                    }
                }
            });
        }
    </script>
</body>
</html>
