<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCase.aspx.cs" Inherits="Mc.UI.admin.AddCase" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/easyui.css" rel="stylesheet" type="text/css" />
    <link href="css/icon.css" rel="stylesheet" type="text/css" />
    <link href="css/tableStyle.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-2.14-min.js" type="text/javascript"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="js/MyAjaxForm.js" type="text/javascript"></script>
    <style type="text/css">
        *
        {
            padding: 0;
            margin: 0;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <form id="form1" enctype="multipart/form-data">
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
                案例预览
            </td>
            <td>
                <input type="file" name="uploadfile" id="uploadfile" />
                <input type="button" name="btnupload" id="btnUpload" value="上传图片" />
            </td>
        </tr>
        <tr>
            <td>
                内容简介：
            </td>
            <td>
                <textarea id="content" name="content" cols="30" rows="5"></textarea>
            </td>
        </tr>
    </table>
    <input type="hidden" id="hidContent" name="hidContent" />
    <input type="hidden" id="hidImgPath" name="hidImgPath"/>
    </form>
    <script type="text/javascript">
        $('#btnUpload').click(function () {
            Upload();
        })

        //提交表单..
        function subForm() {
            var content = $('#content').val();
            $('#hidContent').val(content);  //赋值隐藏域，提交服务器..
            $('#form1').ajaxSubmit({
                type: 'post',
                url: '/admin/ashx/ProcessCase.ashx?Action=add',
                success: function (data) {
                    data = data.replace("<pre>", "").replace("</pre>", ""); //看服务器返回的值,
                    if (data == 'empty') {
                        alert("请填写完整信息");
                    } else if (data == 'ok') {
                        $.messager.alert('提示', '添加成功', 'info');
                        //添加成功，****调用父窗体中的方法..
                        setTimeout(closeWindw, 3000);
                        setTimeout(refrash, 3000);
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
        //无刷新上传图片
        function Upload() {
            var file = $('#uploadfile').val();
            if (file == '') {
                $.messager.alert('提示', '请选择上传图片', 'info');
                return;
            }
            $('#form1').ajaxSubmit({
                type: 'post',
                url: '/admin/ashx/ProcessUpload.ashx',
                success: function (data) {
                    if (data == 'empyt') {
                        $.messager.alert('提示', '请选择上传图片', 'info');
                    } else if (data == 'error') {
                        $.messager.alert('提示', '图片的格式有误', 'warning');
                    } else {
                        data = data.replace("<pre>", "").replace("</pre>", ""); //会默认加上<pre></pre>标签
                        $('#hidImgPath').val(data);  //赋值隐藏域，提交服务器..
                        $.messager.alert('提示', '上传成功', 'info');
                    }
                }
            });
        }
    </script>
</body>
</html>