<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="Mc.UI.admin.AddUser" %>

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
                登录名：
            </td>
            <td>
                <input type="text" name="loginId" id="loginId" />
            </td>
        </tr>
        <tr>
            <td>
                密码：
            </td>
            <td>
                <input type="password" name="loginPwd" id="loginPwd" />
            </td>
        </tr>
        <tr>
            <td>
                确认密码：
            </td>
            <td>
                <input type="password" name="confirmPwd" />
            </td>
        </tr>
        <tr>
            <td>
                真实姓名：
            </td>
            <td>
                <input type="text" name="realName" id="realName" />
            </td>
        </tr>
        <tr>
            <td>
                电话：
            </td>
            <td>
                <input type="text" name="tel" id="tel" />
            </td>
        </tr>
        <tr>
            <td>
                生日：
            </td>
            <td>
                <input type="text" name="birthday" id="birthday" />
            </td>
        </tr>
    </table>
    </form>
    <script type="text/javascript">
        $('#birthday').click(function () {
            new WdatePicker({ 'skin': 'whyGreen' });
        })
        //提交表单..
        function subForm() {
            $('#form1').ajaxSubmit({
                type: 'post',
                url: '/admin/ashx/ProcessUser.ashx?Action=add',
                success: function (data) {
                    if (data == 'ok') {
                        $.messager.alert('提示', '添加成功', 'info');
                        //添加成功，****调用父窗体中的方法..
                        setTimeout(closeWindw, 3000);
                        setTimeout(refrash, 3000);
                    } else if (data == 'error') {
                        alert("两次输入的密码不一致");
                    } else if (data == 'empty') {
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
