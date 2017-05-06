<%@ Page Title="" Language="C#" MasterPageFile="~/common.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Mc.UI.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
联系我们
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="news_content_left fl">
        <div class="content_left_title">
            <p class="content_left_title_1">
            联系我们
            </p>
            <p class="content_left_title_2">
                CONTACT US</p>
        </div>
        <div class="content_left_nav">
            <a href="about.html">联系方式</a> <a class="content_left_nav_one" href="about.html">公司地址</a>
        </div>
    </div>
<div class="news_content_right">
    	<div class="news_content_right_title">
        	<span class="fl">联系我们</span>
            <p class="fr">您当前的位置：联系我们 > 公司地址</p>
            <div class="clear"></div>
        </div>
        
        <div class="contact_fangshi">
        	<div class="contact_fangshi_L fl">
            	<p class="contact_fangshi_L_title"><%: coName %></p>
                <p>售后服务热线：<%: servicePhone %></p>
                <p>公司传真：<%: coFax %></p>
                <p>公司邮箱：<%: coEmail %></p>
                <p>公司地址：<%: coAddress %></p>
            </div>
            
            <div class="clear"></div>
        </div>
        <div class="contact_ditu">
        	<img src="/libs/images/ditu.jpg" />
        </div>
    	
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
