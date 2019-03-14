<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>考研复习</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/global.css">
    <script src="${pageContext.request.contextPath}/res/jquery-3.3.1.js"></script>
    <script>
        $(function () {
           var x=$("#jieda").find("i[title=最佳答案]").length;
           if(x>0){
               $("span[type=accept]").hide();
           }
        })
    </script>
</head>
<script>


</script>
<body onload="getPagedTopic(1,10);" >

<%@include file="../common/header.jsp"%>

<div class="fly-panel fly-column">
    <div class="layui-container">
        <ul class="layui-clear">
            <li class="layui-hide-xs layui-this"><a href="/">首页</a></li>
            <li><a href="/jie/gojieindex/1/0">提问</a></li>
            <li><a href="/jie/gojieindex/2/0">分享<span class="layui-badge-dot"></span></a></li>
            <li><a href="/jie/gojieindex/3/0">讨论</a></li>
            <li><a href="/jie/gojieindex/4/0">公告</a></li>
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
        <div class="layui-col-md8 content detail">
            <div class="fly-panel detail-box">
                <h1>${topic.title}</h1>
                <div class="fly-detail-info">
                    <span class="layui-badge layui-bg-green fly-detail-column">${topic.topicCategoryName}</span>
                    <c:choose>
                        <c:when test="${topic.isEnd==1}"><span class="layui-badge" style="background-color: #999;">未结</span></c:when>
                        <c:otherwise><span class="layui-badge" style="background-color: #5FB878;">已结</span></c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${topic.isTop==1}"></c:when>
                        <c:otherwise><span class="layui-badge layui-bg-black">置顶</span></c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${topic.isGood==1}"></c:when>
                        <c:otherwise><span class="layui-badge layui-bg-red">精帖</span></c:otherwise>
                    </c:choose>
                    <div class="fly-admin-box" data-id="${topic.id}">
                        <c:if test="${userinfo != null}">
                            <c:if test="${userinfo.id == topic.userId}"><%--是楼主本人了--%>
                                <span class="layui-btn layui-btn-xs jie-admin" type="del">删除</span>
                            </c:if>
                        </c:if>

                        <c:if test="${userinfo.id==1}"><%--管理员（id=1就为管理员）--%>
                            <span class="layui-btn layui-btn-xs jie-admin" type="del">删除</span>
                            <c:choose>
                                <c:when test="${topic.isTop==0}">
                                    <span class="layui-btn layui-btn-xs jie-admin" type="set" field="stick" rank="1">置顶</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="layui-btn layui-btn-xs jie-admin" type="set" field="stick" rank="0" style="background-color:#ccc;">取消置顶</span>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${topic.isGood==0}">
                                    <span class="layui-btn layui-btn-xs jie-admin" type="set" field="status" rank="1">加精</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="layui-btn layui-btn-xs jie-admin" type="set" field="status" rank="0" style="background-color:#ccc;">取消加精</span>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                    </div>
                    <span class="fly-topic-nums">
            <a href="#comment"><i class="iconfont" title="回答">&#xe60c;</i> ${topic.commentNum}</a>
          </span>
                </div>
                <div class="detail-about">
                    <a class="fly-avatar" href="/goUserHome/${topic.userId}">
                        <c:choose>
                            <c:when test="${topic.userPicUrl==null}"><img src="https://thirdqq.qlogo.cn/g?b=oidb&k=es6g9kQfVQrGkltCKI9uicw&s=100" alt="贤心"></c:when>
                            <c:otherwise><img src="${pageContext.request.contextPath}/res/uploadImgs/${topic.userPicUrl}"></c:otherwise>
                        </c:choose>
                    </a>
                    <div class="fly-detail-user">
                        <a href="/goUserHome/${topic.userId}" class="fly-link">
                            <cite>${topic.userNickname}</cite>
                        </a>
                        <span><fmt:formatDate value="${topic.createTime}" pattern="yyyy-MM-dd"/></span>
                    </div>
                    <div class="detail-hits" id="LAY_jieAdmin" data-id="${topic.id}">
                        <span style="padding-right: 10px; color: #FF7200"></span>
                        <c:if test="${userinfo != null}">
                            <c:if test="${userinfo.id == topic.userid and topic.isEnd==0}">
                                <span class="layui-btn layui-btn-xs jie-admin" type="edit"><a href="/jie/bianjiadd/${topic.id}">编辑此贴</a></span>
                            </c:if>
                        </c:if>
                        <c:if test="${userinfo!=null and userinfo.id!=topic.userid}">
                            <c:choose>
                                <c:when test="${collectMap==null}">
                                    <span class="layui-btn layui-btn-xs jie-admin" type="collect" data-type="add">收藏</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="layui-btn layui-btn-xs jie-admin layui-btn-danger" type="collect" data-type="remove">取消收藏</span>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                    </div>
                </div>
                <div class="detail-body photos">
                    ${topic.content}
                </div>
            </div>

            <div class="fly-panel detail-box" id="flyReply">
                <fieldset class="layui-elem-field layui-field-title" style="text-align: center;">
                    <legend>回帖</legend>
                </fieldset>

                <ul class="jieda" id="fenye_data">
                    <c:if test="${comment.list.size()==0}">
                        <!-- 无数据时 -->
                        <li class="fly-none">消灭零回复</li>
                    </c:if>
                </ul>
                <div style="text-align: center" id="fenye_page">

                </div>

                <div class="layui-form layui-form-pane">
                    <form action="/jie/reply" method="post">
                        <div class="layui-form-item layui-form-text">
                            <a name="comment"></a>
                            <div class="layui-input-block">
                                <textarea id="L_content" name="commentContent" required lay-verify="required" placeholder="请输入内容"  class="layui-textarea fly-editor" style="height: 150px;"></textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <input type="hidden" name="topicId" value="${topic.id}">
                            <button class="layui-btn" lay-filter="*" lay-submit>提交回复</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="layui-col-md4">
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

            <div class="fly-panel" style="padding: 20px 0; text-align: center;">
                <img src="${pageContext.request.contextPath}/res/images/weixin.jpg" style="max-width: 100%;" alt="layui">
                <p style="position: relative; color: #666;">微信扫码关注 layui 公众号</p>
            </div>

        </div>
    </div>
</div>

<input type="hidden" value="${topic.id}" id="getTopicId">

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
        {{# layui.each(d[0],function(index, item){ }}
        {{# if(item.isDelete==1){  }}

        <li data-id="${item.id}" class="jieda-daan">
            <a name="item-1111111111"></a>
        <div class="detail-about detail-about-reply">
        <a class="fly-avatar" href="/goUserHome/{{item.userId}}">
            {{# if(item.userPicUrl==null){ }}
            <img src="https://thirdqq.qlogo.cn/g?b=oidb&k=es6g9kQfVQrGkltCKI9uicw&s=100" alt="贤心">
            {{# }else{  }}
            <img src="${pageContext.request.contextPath}/res/uploadImgs/{{item.userPicUrl}}">
            {{#  }   }}
        </a>
        <div class="fly-detail-user">
        <a href="/goUserHome/{{item.userNickname}}" class="fly-link">
        <cite>{{item.userId}}</cite>
        </a>
            {{#  if(item.userId==d[1]){  }}
        <span>(楼主)</span>
            {{#  }   }}
    </div>

    <div class="detail-hits">
        <span>{{item.passTime}}</span>
        </div>
        {{#  if(item.isChoose==0){  }}
        <i class="iconfont icon-caina" title="最佳答案"></i>
        {{#  }   }}
        </div>
        <div class="detail-body jieda-body photos">
            {{  item.commentContent   }}
        </div>
        <div class="jieda-reply">
        <span class="jieda-zan" type="zan">
        <i class="iconfont icon-zan"></i>
        {{  item.likeNum   }}
        </span>
        <span type="reply">
        <i class="iconfont icon-svgmoban53"></i>
            回复
        </span>
        <div class="jieda-admin">
        </div>
        </div>
        </li>
        {{#  }   }}
        {{#  }); }}
</script>

<script type="text/javascript">
    function getPagedTopic(pageIndex,pageSize) {
        var topicId = document.getElementById('getTopicId').value;
        $.ajax({
            url: "http://localhost:8080/jie/pagedDetail/"+topicId+"/"+pageIndex+"/"+pageSize,
            type: 'get',
            async: true,
            success: function (data) {
                console.log(data);
                showPagedTopic(data.comment,data.topicId);
            }
        });
    }

    function showPagedTopic(pageInfo,topicId){
        var total = pageInfo.total;//页总数
        var pageNum = pageInfo.pageNum;//页号
        var pageSize = pageInfo.pageSize;//页大小
        var pagedTopic = pageInfo.list;//页数据
        var data = new Array();
        data.push(pagedTopic);
        data.push(topicId);
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
                        getPagedTopic(obj.curr,10);
                    }}
            });
        });
        //2.渲染帖子列表
        var getTpl = demo.innerHTML;
        var view = document.getElementById('fenye_data'); //插到页面上去
        layui.use('laytpl', function() {
            var laytpl = layui.laytpl;
            laytpl(getTpl).render(data, function (html) {
                view.innerHTML = html;
            });
        });
    }

    <%--layui.cache.page = '';--%>
    <%--layui.cache.user = {--%>
    <%--username: '游客'--%>
    <%--,uid: -1--%>
    <%--,avatar: '${pageContext.request.contextPath}/res/images/avatar/00.jpg'--%>
    <%--,experience: 83--%>
    <%--,sex: '男'--%>
    <%--};--%>
    <%--layui.config({--%>
    <%--version: "3.0.0"--%>
    <%--,base: '${pageContext.request.contextPath}/res/mods/' //这里实际使用时，建议改成绝对路径--%>
    <%--}).extend({--%>
    <%--fly: 'index'--%>
    <%--}).use(['fly','laypage','laytpl'],function () {--%>
    <%--var jq = layui.jquery;--%>
    <%--var $ = layui.jquery;--%>
    <%--//请求第一页的数据（每页2条）--%>
    <%--getPagedTopic(null,jq);--%>
    <%--$('#topic_fenlei').find('a').eq(${typeid}).addClass('layui-this').siblings().removeClass('layui-this');--%>
    <%--});--%>
</script>
<%--<script>
        layui.cache.page = 'jie';
        layui.cache.user = {
            username: '游客'
            ,uid: -1
            ,avatar: '${pageContext.request.contextPath}/res/images/avatar/00.jpg'
            ,experience: 83
            ,sex: '男'
        };
    layui.config({
        version: "3.0.0"
        ,base: '${pageContext.request.contextPath}/res/mods/'
    }).extend({
        fly: 'index'
    }).use(['fly', 'face'], function(){
        var $ = layui.$
            ,fly = layui.fly;
        //如果你是采用模版自带的编辑器，你需要开启以下语句来解析。
        $('.detail-body').each(function(){
          var othis = $(this), html = othis.html();
          othis.html(fly.content(html));
        });
    });
</script>--%>

</body>
</html>
