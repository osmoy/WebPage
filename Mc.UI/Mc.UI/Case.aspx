<%@ Page Title="" Language="C#" MasterPageFile="~/common.Master" AutoEventWireup="true"
    CodeBehind="Case.aspx.cs" Inherits="Mc.UI.Case" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    项目案例
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="news_content_left fl">
        <div class="content_left_title">
            <p class="content_left_title_1">
                项目案例
            </p>
            <p class="content_left_title_2">
                PROJECT CASE</p>
        </div>
        <div class="content_left_nav">
            <a href="about.html">酒店设计</a> <a class="content_left_nav_one" href="about.html">室内设计</a>
        </div>
    </div>
    <div class="news_content_right fr hidden">
        <div class="news_content_right_title">
            <span class="fl">项目案例</span>
            <p class="fr">
                您当前的位置：项目案例 > 酒店设计</p>
            <div class="clear">
            </div>
        </div>
        <ul class="case_ul">
            <asp:Repeater ID="caseLi" runat="server">
                <ItemTemplate>
                    <li><a href='/CaseDetail.aspx?id=<%# Eval("Id") %>'>
                        <%--<img src="/libs/images/case_1.jpg"--%>
                        <img src='<%# Eval("ImgPath")  %>' width="217" height="200" /></a> <a href='/CaseDetail.aspx?id=<%# Eval("Id") %>'>
                            <%# Eval("Title") %></a> </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
        <div class="clear">
        </div>
        <div class="page center mt30">
        <%: new HtmlString(pageBar) %>
            <%--<a href="#" class="current2">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a>
            <a href="#">...</a> <a href="#">&gt;</a>--%>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
