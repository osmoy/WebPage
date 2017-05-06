<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Mc.UI.Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>蒙建设计首页</title>
    <link href="/libs/css/style.reset.css" rel="stylesheet" type="text/css" />
    <link href="/libs/css/basic.css" rel="stylesheet" type="text/css" />
    <link href="/libs/css/index.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/libs/js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="/libs/js/nav.js"></script>
    <script type="text/javascript" src="/libs/js/banner.js"></script>
</head>
<body>
    <div class="header w1000">
        <div class="logo fl mt20">
            <img src="/libs/images/logo.jpg" />
        </div>
        <!--nav-->
        <div id="menu" class="fr">
            <div id="midnav">
                <ul id="navc">
                    <li id="moved" style="margin-left: 0;">
                        <img src="/libs/images/nav_bg.png" width="82" height="120" /></li>
                    <li id="navactive" class="navitem"><a href="/index.aspx">
                        <p>
                            &nbsp;
                        </p>
                        <p class="STYLE1">
                            H
                        </p>
                        首页</a> </li>
                    <li class="navfi navitem"><a href="/AboutUs.aspx" title="关于我们">
                        <p>
                            &nbsp;
                        </p>
                        <p class="STYLE1">
                            A
                        </p>
                        关于我们</a> </li>
                    <li class="navitem"><a href="/News.aspx" title="新闻中心">
                        <p>
                            &nbsp;
                        </p>
                        <p class="STYLE1">
                            N
                        </p>
                        新闻中心</a> </li>
                    <li class="navitem"><a href="/Case.aspx" title="项目案例">
                        <p>
                            &nbsp;
                        </p>
                        <p class="STYLE1">
                            C
                        </p>
                        项目案例</a> </li>
                    <li class="navitem"><a href="/Service.aspx" title="真诚服务">
                        <p>
                            &nbsp;
                        </p>
                        <p class="STYLE1">
                            S
                        </p>
                        真诚服务</a> </li>
                    <li class="navitem"><a href="/ContactUs.aspx" title="联系我们">
                        <p>
                            &nbsp;
                        </p>
                        <p class="STYLE1">
                            C
                        </p>
                        联系我们</a> </li>
                </ul>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    <!--banner-->
    <div class="banner">
        <div class="DB_tab25">
            <ul class="DB_bgSet">
                <li style="background: url(/libs/images/01.jpg) top center no-repeat"></li>
                <li style="background: url(/libs/images/02.jpg) top center no-repeat"></li>
                <li style="background: url(/libs/images/03.jpg) top center no-repeat"></li>
                <li style="background: url(/libs/images/04.jpg) top center no-repeat"></li>
            </ul>
            <ul class="DB_imgSet">
                <li>
                    <!--<a href="qtcp_yylz.html"></a>-->
                </li>
                <li>
                    <!--<a href="qtcp_yylz.html"></a>-->
                </li>
                <li>
                    <!--<a href="qtcp_yylz.html"></a>-->
                </li>
                <li>
                    <!--<a href="qtcp_yylz.html"></a>-->
                </li>
            </ul>
            <div class="DB_menuWrap">
                <ul class="DB_menuSet">
                    <li>
                        <img src="/libs/images/btn_off.gif" alt=""></li>
                    <li>
                        <img src="/libs/images/btn_off.gif" alt=""></li>
                    <li>
                        <img src="/libs/images/btn_off.gif" alt=""></li>
                    <li>
                        <img src="/libs/images/btn_off.gif" alt=""></li>
                </ul>
                <div class="DB_next action">
                </div>
                <div class="DB_prev action">
                </div>
            </div>
        </div>
    </div>
    <!--项目案例-->
    <div class="case w1000">
        <div class="case_title">
            <p class="fl">
                项目案例
            </p>
            <a href="/Case.aspx" class="case_more fr">MORE >></a>
            <div class="clear">
            </div>
        </div>
        <div id="wrap" class="wow  fadeInUpBig" data-wow-delay="0.1s">
            <ul class="item1">
                <asp:Repeater ID="RepCase" runat="server">
                    <ItemTemplate>
                        <li><a href="CaseDetail.aspx?id=<%# Eval("Id") %>">
                            <img src="<%# Eval("ImgPath") %>" width="237" height="152" /></a>
                            <div>
                                <a href="CaseDetail.aspx?id=<%# Eval("Id") %>"></a>
                            </div>
                            <h3>
                                <a href="CaseDetail.aspx?id=<%# Eval("Id") %>">通过审核作品</a></h3>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
        <div class="clear">
        </div>
    </div>
    <!--关于我们、新闻中心-->
    <div class="w1000 mt60">
        <div class="about fl">
            <div class="case_title about_title">
                <p class="fl">
                    关于我们<span>ABOUT US</span>
                </p>
                <a href="about.html" class="case_more fr">MORE >></a>
                <div class="clear">
                </div>
            </div>
            <img src="/libs/images/about.jpg" width="475" height="81" />
            <p class="about_jieshao">
                北京上奥时代建筑规划设计有限公司为美国AOA(上奥)建筑规划设计(AOA Design Group Inc.)中国区内资公司，我们以城市规划、城市设计以创造高质量，培养具备规划及建筑专业高度融合的复合型人才，成为在中国领先的研究型设计公司
                ......
            </p>
        </div>
        <div class="about news fr">
            <div class="case_title about_title">
                <p class="fl">
                    新闻中心<span>NEWS CENTER</span>
                </p>
                <a href="news.html" class="case_more fr">MORE >></a>
                <div class="clear">
                </div>
            </div>
            <ul class="news_ul">
                <li><a href="news_1.html" class="fl">创造性的思维方式和理性的逻辑分</a> <span class="fr">2014.10.24</span>
                </li>
                <%--<% foreach (var n in allNews) { %>
                <li><a href="<% n.LinkAddress %>" class="fl"><% n.Title %></a> 
                    <span class="fr"><% n.Addtime.ToString("yyyy-MM-dd") %></span>
                </li>
                  <% } %>--%>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <li><a href='<%# Eval("LinkAddress") %>' class="fl">
                            <%# Eval("title") %></a> <span class="fr">
                                <%# Eval("addtime", "{0:yyyy-MM-dd}") %></span> </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
        <div class="clear">
        </div>
    </div>
    <!--foot-->
    <div class="foot_nav mt70">
        <div class="w1000">
            <div class="foot_nav_1 fl">
                <p class="foot_nav_1_title">
                    关于我们
                </p>
                <p>
                    <a href="#">新闻资讯 </a>
                </p>
                <p>
                    <a href="#">行业新闻 </a>
                </p>
                <p>
                    <a href="#">蒙建观点 </a>
                </p>
                <p>
                    <a href="#">保姆服务 </a>
                </p>
            </div>
            <div class="foot_nav_1 fl">
                <p class="foot_nav_1_title">
                    新闻中心
                </p>
                <p>
                    <a href="#">蒙建新闻 </a>
                </p>
                <p>
                    <a href="#">蒙建文化 </a>
                </p>
                <p>
                    <a href="#">蒙建客户 </a>
                </p>
                <p>
                    <a href="#">蒙建荣誉 </a>
                </p>
            </div>
            <div class="foot_nav_1 fl">
                <p class="foot_nav_1_title">
                    项目案例
                </p>
                <p>
                    <a href="#">蒙建努力 </a>
                </p>
                <p>
                    <a href="#">我们是谁 </a>
                </p>
                <p>
                    <a href="#">蒙建技术 </a>
                </p>
                <p>
                    <a href="#">蒙建实力 </a>
                </p>
            </div>
            <div class="foot_nav_1 fl">
                <p class="foot_nav_1_title">
                    真诚服务
                </p>
                <p>
                    <a href="#">服务方向 </a>
                </p>
                <p>
                    <a href="#">服务类型 </a>
                </p>
                <p>
                    <a href="#">服务态度 </a>
                </p>
                <p>
                    <a href="#">服务要求 </a>
                </p>
            </div>
            <div class="foot_nav_1 fl">
                <p class="foot_nav_1_title">
                    期待关注
                </p>
                <div class="qidai_a">
                    <a class="qidai_a_1" href="#">新浪微博</a> <a class="qidai_a_2" href="#">腾讯微博</a> <a
                        class="qidai_a_3" href="#">官方微信</a>
                    <div class="clear">
                    </div>
                </div>
                <div class="phone">
                    联系我们：<span>0551-12345678</span>
                </div>
            </div>
            <div class="clear">
            </div>
        </div>
    </div>
    <div class="foot_bottom w1000">
        <p>
            经营许可证ICP：皖B1.B2-20100089 备案ICP：皖B2-20060041号-1
        </p>
        <p>
            Copyright © 2004-2015, 八度网络 版权所有
        </p>
    </div>
    <!--banner js-->
    <script type="text/javascript">
        $('.DB_tab25').DB_tabMotionBanner({
            key: 'b28551',
            autoRollingTime: 10000,
            bgSpeed: 500,
            motion: {
                DB_1_1: { left: -50, opacity: 0, speed: 1000, delay: 500 },
                DB_1_2: { left: -50, opacity: 0, speed: 1000, delay: 1000 },
                DB_1_3: { left: 100, opacity: 0, speed: 1000, delay: 1500 },
                DB_2_1: { top: 50, opacity: 0, speed: 1000, delay: 500 },
                DB_2_2: { top: 50, opacity: 0, speed: 1000, delay: 1000 },
                DB_2_3: { top: 100, opacity: 0, speed: 1000, delay: 1500 },
                DB_3_1: { left: -50, opacity: 0, speed: 1000, delay: 500 },
                DB_3_2: { top: 50, opacity: 0, speed: 1000, delay: 1000 },
                DB_3_3: { top: 0, opacity: 0, speed: 1000, delay: 1500 },
                DB_4_1: { top: 50, opacity: 0, speed: 1000, delay: 500 },
                DB_4_2: { top: 0, opacity: 0, speed: 1000, delay: 1000 },
                DB_4_3: { top: 0, opacity: 0, speed: 1000, delay: 1500 },
                DB_4_4: { top: 30, opacity: 0, speed: 1000, delay: 2000 },
                DB_4_5: { top: 100, opacity: 0, speed: 1000, delay: 3000 },
                end: null
            }
        });
    </script>
    <!--case js-->
    <script>
        $(function () {
            $(".item1 li").hover(
	function () {
	    var that = this;
	    item1Timer = setTimeout(function () {
	        $(that).find("div").animate({ "top": 0, "height": 152 }, 300, function () {
	            $(that).find("p").fadeIn(200);
	        });
	    }, 100);
	},
	function () {
	    var that = this;
	    clearTimeout(item1Timer);
	    $(that).find("p").fadeOut(200);
	    $(that).find("div").animate({ "top": 250, "height": 170 }, 300);
	}
)
        });

    </script>
</body>
</html>