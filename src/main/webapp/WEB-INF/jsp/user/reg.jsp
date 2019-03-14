<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/6
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content="fly,layui,前端社区">
    <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/global.css">
    <script src="${pageContext.request.contextPath}/res/jquery-3.3.1.js"></script>
    <script src="${pageContext.request.contextPath}/res/mods/util.js"></script>
    <script>
        function checkEmail() {
            var a=$("#form1").serialize();
            if($("#L_email").val().length==0){
                $("#span_return_checkEmail").text("输入邮箱为空，请重新输入");
                return
            }
            $.post({
                url:"${pageContext.request.contextPath}/user/checkEmail",
                data:a,
                dataType:"json",
                success:function (data) {
                    $("#span_return_checkEmail").text(data.msg);
                }
            })
        }

        $(function () {
            $("#L_repass").blur(function () {
                var L_pass=$("#L_pass").val();
                var L_repass=$("#L_repass").val();
                if(L_pass == L_repass){
                    $(".check_password").text("");
                }else{
                    $("#L_pass").val("");
                    $("#L_repass").val("");
                    $(".check_password").text("密码不一致");
                }
            })
        });
        function checkNickname(name) {
            var patt = /^[0-9\u4e00-\u9fa5]{1,10}$/;
            return patt.test(name);
        }

        $(function () {
            $("#L_username").blur(function () {
                if(!checkNickname($(this).val())){
                    alert("昵称只能10位内，只能包含汉字和数字");
                    $(this).val("");
                }else{
                    $.get({
                        url:"${pageContext.request.contextPath}/user/checkNickname/"+$("#L_username").val(),
                        dataType:"json",
                        success:function (data) {
                            $("#check_nickname").text(data.msg);
                            if(data.msg=="昵称重复，请重新输入"){
                                $("#L_username").val("");
                            }
                        }
                    })
                }
            })
        })



    </script>
</head>
<body>

<%@include file="../common/header.jsp"%>

<div class="layui-container fly-marginTop">
    <div class="fly-panel fly-panel-user" pad20>
        <div class="layui-tab layui-tab-brief" lay-filter="user">
            <ul class="layui-tab-title">
                <li><a href="login.html">登入</a></li>
                <li class="layui-this">注册</li>
            </ul>
            <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
                <div class="layui-tab-item layui-show">
                  <div class="layui-form layui-form-pane">
                        <form id="form1" method="post" action="${pageContext.request.contextPath}/user/doreg">
                            <div class="layui-form-item">
                                <label for="L_email" class="layui-form-label">邮箱</label>
                                <div class="layui-input-inline">
                                    <input type="text" id="L_email" name="email" required lay-verify="email" autocomplete="off" class="layui-input" onblur="checkEmail()">
                                    <span id="span_return_checkEmail"></span>
                                </div>
                                <div class="layui-form-mid layui-word-aux">将会成为您唯一的登入名</div>
                            </div>
                            <div class="layui-form-item">
                                <label for="L_username" class="layui-form-label">昵称</label>
                                <div class="layui-input-inline">
                                    <input type="text" id="L_username" name="nickname" required lay-verify="required" autocomplete="off" class="layui-input">
                                    <span id="check_nickname"></span>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="L_pass" class="layui-form-label">密码</label>
                                <div class="layui-input-inline">
                                    <input type="password" id="L_pass" name="passwd" required lay-verify="required" autocomplete="off" class="layui-input">
                                    <span class="check_password"></span>
                                </div>
                                <div class="layui-form-mid layui-word-aux">6到16个字符</div>
                            </div>
                            <div class="layui-form-item">
                                <label for="L_repass" class="layui-form-label">确认密码</label>
                                <div class="layui-input-inline">
                                    <input type="password" id="L_repass" name="repass" required lay-verify="required" autocomplete="off" class="layui-input">
                                    <span class="check_password"></span>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="L_vercode" class="layui-form-label">人类验证</label>
                                <div class="layui-input-inline">
                                    <input type="text" id="L_vercode" name="vercode" required lay-verify="required" placeholder="请回答后面的问题" autocomplete="off" class="layui-input">
                                    <span id="checkRenlei"></span>
                                </div>
                                <div class="layui-form-mid">
                                    <span style="color: #c00;" id="spanRenlei"></span>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <button class="layui-btn" lay-filter="*" lay-submit>立即注册</button>
                            </div>
                            <div class="layui-form-item fly-form-app">
                                <span>或者直接使用社交账号快捷注册</span>
                                <a href="" onclick="layer.msg('正在通过QQ登入', {icon:16, shade: 0.1, time:0})" class="iconfont icon-qq" title="QQ登入"></a>
                                <a href="" onclick="layer.msg('正在通过微博登入', {icon:16, shade: 0.1, time:0})" class="iconfont icon-weibo" title="微博登入"></a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<div class="fly-footer">
    <p><a href="http://fly.layui.com/" target="_blank">Fly社区</a> 2017 &copy; <a href="http://www.layui.com/" target="_blank">layui.com 出品</a></p>
    <p>
        <a href="http://fly.layui.com/jie/3147/" target="_blank">付费计划</a>
        <a href="http://www.layui.com/template/fly/" target="_blank">获取Fly社区模版</a>
        <a href="http://fly.layui.com/jie/2461/" target="_blank">微信公众号</a>
    </p>
</div>

<script src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<script>
    layui.cache.page = 'user';
    layui.cache.user = {
        username: '游客'
        ,uid: -1
        ,avatar: '../../res/images/avatar/00.jpg'
        ,experience: 83
        ,sex: '男'
    };
    layui.config({
        version: "3.0.0"
        ,base: '../../res/mods/'
    }).extend({
        fly: 'index'
    }).use('fly');
</script>

</body>
</html>
