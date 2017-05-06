<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddNews.aspx.cs" Inherits="Mc.UI.admin.AddUser" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        *
        {
            padding: 0;
            margin: 0;
            font-size: 16px;
        }
    </style>
    <link href="css/easyui.css" rel="stylesheet" type="text/css" />
    <link href="css/icon.css" rel="stylesheet" type="text/css" />
    <link href="css/tableStyle.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-2.14-min.js" type="text/javascript"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="js/MyAjaxForm.js" type="text/javascript"></script>
    <script src="libs/DatePicker/WdatePicker.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1">
    <table class="caption" id="tb1">
        <tr>
            <td>
                标题：
            </td>
            <td>
                <input type="text" name="title" id="title" />
            </td>
        </tr>
        <tr>
            <td>
                作者：
            </td>
            <td>
                <input type="text" name="author" id="author" />
            </td>
        </tr>
        <tr>
            <td>
                内容简介：
            </td>
            <td>
                <input type="text" name="content" id="content" />
            </td>
        </tr>
        <tr>
            <td>
                信息来源：
            </td>
            <td>
                <input type="text" name="source" id="source" />
            </td>
        </tr>
        <tr>
            <td>
                添加日期：
            </td>
            <td>
                <input type="text" name="addTime" id="addTime" />
            </td>
        </tr>
    </table>
    </form>
    <script type="text/javascript">
        $('#addTime').click(function () {
            new WdatePicker({ 'skin': 'whyGreen' });
        })
        //提交表单..
        function subForm() {
            $('#form1').ajaxSubmit({
                type: 'post',
                url: '/admin/ashx/ProcessNews.ashx?Action=add',
                success: function (data) {
                    if (data == 'ok') {
                        $.messager.alert('提示', '添加成功', 'info');
                        //添加成功，****调用父窗体中的方法..
                        setTimeout(closeWindw, 3000);
                        setTimeout(refrash, 3000);
                    } else if (data = 'empty') {
                        alert("请填写完整信息");
                    } else {
                        alert("添加失败");
                    }
                }
            });
        }
        //关闭对话框..
        function closeWindw() {
            window.parent.onSuccess();  //****调用父窗体中的方法
        }
        //刷新
        function refrash() {
            window.parent.refreshTb();
        }
    </script>
</body>
</html>
