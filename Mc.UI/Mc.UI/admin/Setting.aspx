<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Setting.aspx.cs" Inherits="Mc.UI.admin.Setting" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/tableStyle.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-2.14-min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server" method="post">
    <table>
        <tr>
            <td>
                售后服务热线：
            </td>
            <td>
                <input type="text" name="txtPhone" value="<%: servicePhone %>" />
            </td>
        </tr>
        <tr>
            <td>
                公司传真：
            </td>
            <td>
                <input type="text" name="txtFax" value="<%: coFax %>" />
            </td>
        </tr>
        <tr>
            <td>
                公司邮箱：
            </td>
            <td>
                <input type="text" name="txtMail" value="<%: coEmail %>" />
            </td>
        </tr>
        <tr>
            <td>
                公司地址：
            </td>
            <td>
                <input type="text" name="txtAddress" value="<%: coAddress %>" />
            </td>
        </tr>
        <tr>
            <td>
                公司名称：
            </td>
            <td>
                <input type="text" name="txtName" value="<%: coName %>" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;">
                <input type="submit" id="save" value="保存" />
            </td>
        </tr>
    </table>
    </form>
    <iframe style="display: none" name="rfFrame" src="about:blank"></iframe>

    <script type="text/javascript">
        $('#save').click(function () {
            document.forms[0].target = "rfFrame";
        }); 
    </script>
</body>
</html>
