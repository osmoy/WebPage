<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Mc.UI.admin.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>后台登陆</title>
    <script src="js/jquery-2.14-min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        用户名：<input id="txtName" type="text" name="loginName" /><span id="ckName"></span></div>
    <div>
        密码：<input type="password" name="loginPwd" /><span id="ckPwd"></span></div>
    <div>
        验证码：<input id="vcode" style="width:60px" type="text" name="vCode" />
        <img id="img1" style=" cursor:pointer;" src="/admin/ashx/CreateValidateCode.ashx" title="看不清，换一张" alt="验证码" />
    </div>
    <div>
        <input id="btnLogin" type="button" name="btnLogin" value="登陆" />
    </div>
    </form>

    <script type="text/javascript">
        $(function () {

            $('#img1').click(function () {
                var src = $('#img1').attr('src');
                $('#img1').attr('src', src + '?time=' + new Date());
            })
            //校验非空
            //            $("#form1 input:first").blur(function () {
            //                var loginName = $("#form1 input:first").val();
            //                if (loginName == '' || loginName == null) {
            //                    $('#ckName').css('color', 'red');
            //                    $('#ckName').text('请输入用户名');
            //                    return;
            //                } else {
            //                    $('#ckName').text('');
            //                }
            //            });
            //校验非空
            $('#txtName').blur(function () {
                var val = $("#txtName").val();
                if (val == '' || val == null) {
                    $('#ckName').css('color', 'red');
                    $('#ckName').text('请输入用户名');
                    return;
                } else {
                    $('#ckName').text('');
                }
            })

            //校验非空
            $("#form1 input[type='password']").blur(function () {
                var loginPwd = $("#form1 input[type='password']").val();
                if (loginPwd == '' || loginPwd == null) {
                    $('#ckPwd').css('color', 'red');
                    $('#ckPwd').text('请输入密码');
                    return;
                } else {
                    $('#ckPwd').text('');
                }
            })

            $('#txtName').keydown(function () {
                $('#ckName').text('');
            })

            $("#form1 input[type='password']").keydown(function () {
                $('#ckPwd').text('');
            });

            //提交登陆
            $('#btnLogin').click(function () {
                var loginName = $('#txtName').val();
                var loginPwd = $("#form1 input[type='password']").val();
                var vCode = $("#vcode").val();
                $.post('/admin/ashx/CheckLogin.ashx', { LoginName: loginName, LoginPwd: loginPwd, Vcode: vCode }, function (res) {
                    if (res == 'ok') {
                        window.location.href = "/Admin/Main.aspx";
                    } else if (res == '1') {
                        $('#ckName').css('color', 'red');             
                        $('#txtName').val("");
                        $('#txtName').focus();
                        $('#ckName').text('用户名错误');
                    } else if (res == '2') {
                        $('#ckPwd').css('color', 'red');
                        $('#ckPwd').text('密码错误');
                    } else if (res == '3') {
                        alert('验证码不正确');
                    } else {
                        alert("系统繁忙，请稍后重试");
                    }
                });
            });
        })

    </script>
</body>
</html>