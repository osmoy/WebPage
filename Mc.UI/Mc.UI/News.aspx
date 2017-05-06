<%@ Page Title="" Language="C#" MasterPageFile="~/common.Master" AutoEventWireup="true"
    CodeBehind="News.aspx.cs" Inherits="Mc.UI.News" %>

<%@ Import Namespace="Mc.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    新闻中心
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="news_content_left fl">
        <div class="content_left_title">
            <p class="content_left_title_1">
                新闻中心
            </p>
            <p class="content_left_title_2">
                NEWA CENTER</p>
        </div>
        <div class="content_left_nav">
            <a href="about.html">行业新闻</a> <a class="content_left_nav_one" href="about.html">公司新闻</a>
        </div>
    </div>
    <div class="news_content_right fr hidden">
        <div class="news_content_right_title">
            <span class="fl">公司新闻</span>
            <p class="fr">
                您当前的位置：新闻中心 > 公司新闻</p>
            <div class="clear">
            </div>
        </div>
        <ul class="news_content_right_ul">
            <%--  <% foreach (News n in allNews) { %>
               <li>
            	<p class="news_p_1 fl">
                	<span class="news_span_1"><% n.Addtime.ToString("yyyy-MM-dd") %></span>
                </p>
                <a href="<% n.LinkAddress %>" class="news_a fl"><% n.Title %></a>
            </li>
              <% } %>--%>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <li>
                        <p class="news_p_1 fl">
                            <span class="news_span_1"><%# Eval("addtime", "{0:yyyy-MM-dd}") %></span>
                        </p>
                        <a href="<%# Eval("LinkAddress") %>" class="news_a fl">
                            <%# Eval("title") %></a>
                   </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
        <div class="page center mt30">
            <a href="#" class="current2">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a>
            <a href="#">...</a> <a href="#">&gt;</a>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>