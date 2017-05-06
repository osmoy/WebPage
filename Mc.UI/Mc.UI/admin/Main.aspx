<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="Mc.UI.admin.Main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>后台主页</title>
    <link href="css/easyui.css" rel="stylesheet" type="text/css" />
    <link href="css/icon.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-2.14-min.js" type="text/javascript"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript"></script>
</head>
<body class="easyui-layout">
    <%--上边--%>
    <div data-options="region:'north',border:false" style="height: 60px; background: #B3DFDA; overflow:hidden;
        padding: 2px; text-align: center;">
        <h1 style=" font-size:18px;">xxx后台管理界面</h1>
        <a id="logOut" href="" style=" font-size:16px; position:relative; left:540px; bottom:30px;">退出系统</a>
    </div>
    <%--左边--%>
    <div data-options="region:'west',split:true,title:'编辑列表'" style="width: 150px; padding: 2px;">
        <div class="easyui-accordion" data-options="fit:false,border:false">
            <div title="用户管理" style="padding: 10px;">
                <a class="addTab" href="javascript:;" url='/admin/UserList.aspx'>用户管理</a>
            </div>
            <div title="新闻管理" data-options="selected:true" style="padding: 10px;">
            <a class="addTab" href="javascript:;" url='/admin/NewsList.aspx'>新闻管理</a>
            </div>
            <div title="案例管理" style="padding: 10px;">
                <a class="addTab" href="javascript:;" url='/admin/CaseList.aspx'>案例管理</a>
            </div>
            <div title="系统配置" style="padding: 10px">
            <a class="addTab" href="javascript:;" url='/admin/Setting.aspx'>系统配置</a>
            </div>
        </div>
    </div>
    <%--中间--%>
    <div data-options="region:'center',title:'编辑界面',iconCls:'icon-ok'">
        <div id="tt" class="easyui-tabs" data-options="fit:true,border:false,plain:true">
            <div title="About" style="padding: 10px">
                This is the About content.
            </div>
            <div title="Help" data-options="iconCls:'icon-help',closable:true" style="padding:10px">
			    This is the help content.
		    </div>
                        
        </div>
    </div>
    <%--页脚--%>
    <div data-options="region:'south',border:false" style="height: 30px; background: #A9FACD;
        padding: 8px; text-align: center;">
        xxx版权所有&copy 1998-2015
    </div>
    <script type="text/javascript">
        $(function () {
            //Hover Tabs
            var tabs = $('#tt').tabs().tabs('tabs');
            for (var i = 0; i < tabs.length; i++) {
                tabs[i].panel('options').tab.unbind().bind('mouseenter', { index: i }, function (e) {
                    $('#tt').tabs('select', e.data.index);
                });
            }

            //高亮显示选中
            $('#tt').tabs({
                pill: true
            })

            //添加对应标签
            $('.addTab').click(function () {
                var title = $(this).text();
                var content = $(this).attr('url');
                if ($('#tt').tabs('exists', title)) {   //限制重复添加
                    $('#tt').tabs('select', title);
                    return;
                }
                $('#tt').tabs('add', {
                    title: title,
                    content: '<iframe style="width:100%; height:100%;" frameborder="no" src="' + content + '" border="0" scrolling="no" allowtransparency="yes"></iframe>',
                    closable: true
                });
                return false;
            })
            //退出
            $('#logOut').click(function () {
                $.messager.confirm('提示', '确定要退出？', function (res) {
                    if (res) {
                        $.post('/admin/ashx/ExitSys.ashx', function (state) {
                            if (state == 'ok') {
                                window.location.href = '/admin/Login.aspx';
                            }
                        })
                    }
                })
                return false;
            })

        });
    </script>
</body>
</html>