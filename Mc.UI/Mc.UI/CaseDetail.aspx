<%@ Page Title="" Language="C#" MasterPageFile="~/common.Master" AutoEventWireup="true"
    CodeBehind="CaseDetail.aspx.cs" Inherits="Mc.UI.CaseDetail" %>
<%@ Import Namespace="Mc.Model" %>

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
    <div class="news_content_right news_xiangqing">
        <div class="news_content_right_title">
            <span class="fl">项目案例</span>
            <p class="fr">
                您当前的位置：项目案例 > <%: caseInfo.Title %></p>
            <div class="clear">
            </div>
        </div>
        <div class="news_xiangqing_title">
            <%: caseInfo.Title %> </div>
        <div class="news_xiangqing_shijian">
            更新时间：2014-11-11</div>
        <p class="news_xiangqing_pic">
            <%--<img src="/libs/images/news_xiangqing_1.jpg" /></p>--%>
            <img src='<%: caseInfo.ImgPath %>' style=" width:200px; height:200px;" /></p>
        <div class="news_xiangqing_p">
            <%: caseInfo.Content %>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
