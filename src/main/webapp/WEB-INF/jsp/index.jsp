<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>考研复习</title>
   <%-- <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">--%>
    <%--<meta name="keywords" content="fly,layui,前端社区">
    <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/global.css">
</head>
<body onload="getPagedTopic();">  <%--加载热门帖子页面--%>

<%@include file="common/header.jsp"%>

<div class="fly-panel fly-column">
    <div class="layui-container">
        <ul class="layui-clear">
            <li class="layui-hide-xs layui-this"><a href="/">首页</a></li>
            <li><a href="/jie/gojieindex/1/0">提问</a></li>
            <li><a href="/jie/gojieindex/2/0">分享<span class="layui-badge-dot"></span></a></li>
            <li><a href="/jie/gojieindex/3/0">讨论</a></li>
            <li><a href="/jie/gojieindex/5/0">公告</a></li>
            <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><span class="fly-mid"></span></li>
            <c:choose>
                <c:when test="${userinfo==null}"></c:when>
                <c:otherwise><!-- 用户登入后显示 -->
                    <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><a href="/user/goUserIndex">我发表的贴</a></li>
                    <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><a href="/user/goUserIndex#collection">我收藏的贴</a></li>
                </c:otherwise>

            </c:choose>
        </ul>

        <div class="fly-column-right layui-hide-xs">
            <span class="fly-search"><i class="layui-icon"></i></span>
            <a href="/jie/add" class="layui-btn">发表新帖</a>
        </div>
        <div class="layui-hide-sm layui-show-xs-block" style="margin-top: -10px; padding-bottom: 10px; text-align: center;">
            <a href="/jie/add" class="layui-btn">发表新帖</a>
        </div>
    </div>
</div>

<div class="layui-container">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md8">
            <div class="fly-panel">
                <div class="fly-panel-title fly-filter">
                    <a>置顶</a>
                    <a href="#signin" class="layui-hide-sm layui-show-xs-block fly-right" id="LAY_goSignin" style="color: #FF5722;">去签到</a>
                </div>
                <ul class="fly-list">
                    <c:forEach items="${topTopic}" var="topTopic">
                        <c:choose>
                            <%--<c:when test="${topTopics.size()>0}">to do--%>
                            <c:when test="${topTopic.isDelete!=-10}">
                                <c:if test="${topTopic.isDelete==1}">
                                    <li>
                                        <a href="/goUserHome/${topTopic.userId}" class="fly-avatar">
                                            <c:choose>
                                                <c:when test="${topTopic.userPicUrl==null}">
                                                    <img src="https://thirdqq.qlogo.cn/g?b=oidb&k=es6g9kQfVQrGkltCKI9uicw&s=100" alt="贤心">
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="${pageContext.request.contextPath}/res/uploadImgs/${topTopic.userPicUrl}">
                                                </c:otherwise>
                                            </c:choose>
                                        </a>
                                        <h2>
                                            <a class="layui-badge">${topTopic.topicCategoryName}</a>
                                            <a href="/jie/godetail/${topTopic.id}">${topTopic.title}</a>
                                        </h2>
                                        <div class="fly-list-info">
                                            <a href="/goUserHome/${topTopic.userId}" link>
                                                <cite>${topTopic.userNickname}</cite>
                                            </a>
                                            <span><fmt:formatDate value="${topTopic.createTime}" pattern="yyyy-MM-dd"/></span>
                                            <c:choose>
                                            <c:when test="${topTopic.isEnd==0}"><span class="fly-list-nums"></c:when>
                                            <c:otherwise><span class="layui-badge fly-badge-accept layui-hide-xs">已结</span></c:otherwise>
                                        </c:choose>
                                        <span class="fly-list-nums">
                                            <i class="iconfont icon-pinglun1" title="回答"></i> ${topTopic.commentNum}
                                        </span>
                                        </div>
                                        <div class="fly-list-badge">
                                            <span class="layui-badge layui-bg-black">置顶</span>
                                            <c:if test="${topTopic.isGood==0}">
                                               <span class="layui-badge layui-bg-red">精帖</span>
                                            </c:if>
                                        </div>
                                    </li>
                                </c:if>
                            </c:when>
                            <c:otherwise>
                                <div class="fly-list-badge">
                                    <span class="layui-badge layui-bg-black">置顶</span>
                                    <span class="layui-badge layui-bg-red">精帖</span>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </ul>
            </div>

            <div class="fly-panel" style="margin-bottom: 0;">

                <div class="fly-panel-title fly-filter" id="topic_fenlei">
                    <a href="/jie/gojieindex/0/0" class="layui-this">综合</a>
                    <span class="fly-mid"></span>
                    <a href="/jie/gojieindex/0/3">精华</a>

                </div>
                <ul class="fly-list" id="fenye_data" ><%--要js动态添加代码--%>

                </ul>
                <div style="text-align: center" id="fenye_page">

                </div>
            </div>
        </div>
        <div class="layui-col-md4">

            <div class="fly-panel">
                <h3 class="fly-panel-title">温馨通道</h3>
                <ul class="fly-panel-main fly-list-static">
                    <li>
                        <a href="http://fly.layui.com/jie/4281/" target="_blank">layui 的 GitHub 及 Gitee (码云) 仓库，欢迎Star</a>
                    </li>
                    <li>
                        <a href="http://fly.layui.com/jie/5366/" target="_blank">
                            layui 常见问题的处理和实用干货集锦
                        </a>
                    </li>
                    <li>
                        <a href="http://fly.layui.com/jie/4281/" target="_blank">layui 的 GitHub 及 Gitee (码云) 仓库，欢迎Star</a>
                    </li>
                    <li>
                        <a href="http://fly.layui.com/jie/5366/" target="_blank">
                            layui 常见问题的处理和实用干货集锦
                        </a>
                    </li>
                    <li>
                        <a href="http://fly.layui.com/jie/4281/" target="_blank">layui 的 GitHub 及 Gitee (码云) 仓库，欢迎Star</a>
                    </li>
                </ul>
            </div>


            <div class="fly-panel fly-signin">
                <div class="fly-panel-title">
                    签到
                    <i class="fly-mid"></i>
                    <a href="javascript:;" class="fly-link" id="LAY_signinHelp">说明</a>
                    <i class="fly-mid"></i>
                   <%-- &lt;%&ndash;<a href="javascript:;" class="fly-link" id="LAY_signinTop">活跃榜<span class="layui-badge-dot"></span></a>&ndash;%&gt;--%>
                    <c:if test="${userinfo!=null}">
                        <span class="fly-signin-days">已连续签到
                            <cite>
                                <c:if test="${qiandao==null}">
                                    0
                                </c:if>
                                <c:if test="${qiandao!=null}">
                                    ${qiandao.total}
                                </c:if>
                            </cite>天</span>
                    </c:if>
                </div>
                <div class="fly-panel-main fly-signin-main">
                    <c:choose>
                        <c:when test="${userinfo ==null or qiandao.today!=qiandao.signday or qiandao==null}">
                            <button class="layui-btn layui-btn-danger" id="LAY_signin" >今日签到</button>
                            <c:if test="${userinfo!=null}">
                                <span>可获得<cite>${feiwen}</cite>飞吻</span>
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <button class="layui-btn layui-btn-disabled">今日已签到</button>
                            <span>获得了<cite>${feiwen}</cite>飞吻</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="fly-panel fly-rank fly-rank-reply" id="LAY_replyRank">
                <h3 class="fly-panel-title">回贴周榜</h3>
                <dl>
                    <c:forEach items="${list1}" var="map2">
                        <dd>
                            <a href="/goUserHome/${map2.id}">
                                <c:choose>
                                    <c:when test="${map2.pic_path==''}">
                                        <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg" alt="贤心">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${pageContext.request.contextPath}/res/uploadImgs/${map2.pic_path}">
                                    </c:otherwise>
                                </c:choose><cite>${map2.nickname}</cite><i>${map2.count}次回答</i>
                            </a>
                        </dd>
                    </c:forEach>
                    <!--<i class="layui-icon fly-loading">&#xe63d;</i>-->
                </dl>
            </div>

            <dl class="fly-panel fly-list-one">
                <dt class="fly-panel-title">本周热议</dt>
                    <c:if test="${list2.size()==0}">
                        <!-- 无数据时 -->
                        <div class="fly-none">没有相关数据</div>
                    </c:if>
                    <c:forEach items="${list2}" var="topic">
                        <dd>
                            <a href="/jie/godetail/${topic.id}">${topic.title}</a>
                            <span><i class="iconfont icon-pinglun1"></i> ${topic.commentNum}</span>
                        </dd>
                    </c:forEach>
            </dl>

            <div class="fly-panel">
                <div class="fly-panel-title">
                    这里可作为广告区域
                </div>
                <div class="fly-panel-main">
                    <a href="http://layim.layui.com/?from=fly" target="_blank" class="fly-zanzhu" time-limit="2017.09.25-2099.01.01" style="background-color: #5FB878;">LayIM 3.0 - layui 旗舰之作</a>
                </div>
            </div>

            <div class="fly-panel fly-link">
                <h3 class="fly-panel-title">友情链接</h3>
                <dl class="fly-panel-main">
                    <dd><a href="http://www.layui.com/" target="_blank">layui</a><dd>
                    <dd><a href="http://layim.layui.com/" target="_blank">WebIM</a><dd>
                    <dd><a href="http://layer.layui.com/" target="_blank">layer</a><dd>
                    <dd><a href="http://www.layui.com/laydate/" target="_blank">layDate</a><dd>
                    <dd><a href="mailto:xianxin@layui-inc.com?subject=%E7%94%B3%E8%AF%B7Fly%E7%A4%BE%E5%8C%BA%E5%8F%8B%E9%93%BE" class="fly-link">申请友链</a><dd>
                </dl>
            </div>

        </div>
    </div>
</div>

<div class="fly-footer">
    <p><a href="http://fly.layui.com/" target="_blank">考研复习社区</a> 2019 &copy; <a href="http://www.layui.com/" target="_blank">layui.com 出品</a></p>
    <p>
        <a href="http://fly.layui.com/jie/3147/" target="_blank">付费计划</a>
        <a href="http://www.layui.com/template/fly/" target="_blank">获取Fly社区模版</a>
        <a href="http://fly.layui.com/jie/2461/" target="_blank">微信公众号</a>
    </p>
</div>

<script src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<script id="demo" type="text/html">
    {{# console.log(d); }}
            {{# layui.each(d,function(index, item){ }}
            {{# if(item.isDelete==1){  }}
            <li>
                <a href="/goUserHome/{{item.userId}}" class="fly-avatar">
                    {{# if(item.userPicUrl==null){ }}
                            <img src="https://thirdqq.qlogo.cn/g?b=oidb&k=es6g9kQfVQrGkltCKI9uicw&s=100" alt="贤心">
                    {{# }else{  }}
                            <img src="${pageContext.request.contextPath}/res/uploadImgs/{{item.userPicUrl}}">
                    {{#  }   }}
                </a>
                <h2>
                    <a class="layui-badge">{{item.topicCategoryName}}</a>
                    <a href="/jie/godetail/{{item.id}}">{{item.title}}</a>
                </h2>
                <div class="fly-list-info">
                    <a href="/goUserHome/{{item.userId}}" link>
                        <cite>{{item.userNickname}}</cite>
                    </a>
                    <span>{{item.passTime}}</span>
                    {{#  if(item.isEnd==1){  }}
                    <span class="fly-list-nums"></span>
                    {{#   }else{   }}
                    <span class="layui-badge fly-badge-accept layui-hide-xs">已结</span>
                    {{#  }   }}

                    <span class="fly-list-nums">
                        <i class="iconfont icon-pinglun1" title="回答"></i> {{item.commentNum}}
                    </span>
                </div>
                <div class="fly-list-badge">
                    {{#if(item.isGood==0){}}
                        <span class="layui-badge layui-bg-red">精帖</span>
                    {{#}}}
                </div>
            </li>
             {{#  }   }}
            {{#  }); }}
</script>

<script type="text/javascript">
    function getPagedTopic(pageIndex,pageSize) {
        $.ajax({
            url:"http://localhost:8080/page_hot_topic",
            data:{pageIndex:pageIndex,pageSize:pageSize},
            dataType:'json',
            type:'post',
            async:true,
            success:function(data){
                        showPagedTopic(data);
                    }
        });

        /*layui.cache.page = '';
        layui.cache.user = {
            username: '游客'
            ,uid: -1
            ,avatar: '${pageContext.request.contextPath}/res/images/avatar/00.jpg'
            ,experience: 83
            ,sex: '男'
        };
        layui.config({
            version: "3.0.0"
            ,base: '${pageContext.request.contextPath}/res/mods/' //这里实际使用时，建议改成绝对路径
        }).extend({
            fly: 'index'
        }).use(['fly','laypage','laytpl'],function () {
            var jq = layui.jquery;
            var $ = layui.jquery;
            //请求第一页的数据（每页2条）
            getPagedTopic(null,jq);
            $('#topic_fenlei').find('a').eq(${typeid}).addClass('layui-this').siblings().removeClass('layui-this');
        });*/
    }

    function showPagedTopic(pageInfo){
        var total = pageInfo.pageInfo.total;//页总数
        var pageNum = pageInfo.pageInfo.pageNum;//页号
        var pageSize = pageInfo.pageInfo.pageSize;//页大小
        var pagedTopic = pageInfo.pageInfo.list;//页数据
        $("#fenye_data").html("");//清空表格中数据并重新填充数据
        layui.use('laypage', function(){
            var laypage = layui.laypage;
            //执行一个laypage实例
            laypage.render({
                elem: 'fenye_page' //注意，这里的 test1 是 ID，不用加 # 号
                ,limit:pageSize
                ,curr:pageNum
                ,count:total//数据总数，从服务端得到
                ,first:"首页"
                ,last:"尾页"
                ,jump:function (obj,fisrt) {
                    if(!fisrt)
                    {
                        console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                        console.log(obj.limit); //得到每页显示的条数
                        getPagedTopic(obj.curr,20);
                    }}
            });
        });
        //2.渲染帖子列表
        var getTpl = demo.innerHTML;
        var view = document.getElementById('fenye_data'); //插到页面上去
        layui.use('laytpl', function() {
            var laytpl = layui.laytpl;
            laytpl(getTpl).render(pagedTopic, function (html) {
                view.innerHTML = html;
            });
        });
    }


</script>

<%--<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_30088308'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "w.cnzz.com/c.php%3Fid%3D30088308' type='text/javascript'%3E%3C/script%3E"));</script>--%>

</body>
</html>
