<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>管理后台登录</title>
    <link href="login3/css/login.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all"/>
    <link rel="icon" href="/favicon.ico">
</head>

<body>
<!-----header---->
<div class="header">
    <h1 class="headerLogo"><a title="" target="_blank" href="#"><img src="login3/images/logo.png" class="logo"/></a>
    </h1>
</div>
<!-----banner---->
<div class="banner">
    <div class="login-aside">
        <div id="o-box-down">
            <div class="login-name">用户登录</div>
            <p style="color: red" align="center">${msg}</p>
            <form class="registerform" action="/login.json" method="post">
                <#--<div class="fm-item">-->
                    <#--角色：<select id="role_id" name="role_id">-->
                    <#--<option value="0">学生</option>-->
                    <#--<option value="1">教师</option>-->
                    <#--<option value="2">管理员</option>-->
                <#--</select>-->
                <#--</div>-->
                <div class="fm-item">
                    <input type="text" placeholder="请输入账号" maxlength="100" id="username" name="username">
                </div>

                <div class="fm-item">
                    <input type="password" placeholder="请输入密码" maxlength="100" id="password" name="password">
                </div>

                <div class="fm-item yzm">
                    <input type="text" placeholder="验证码" id="imgCode" name="imgCode">
                    <img src="/getImageCode.json" style="width: 80px; height: 30px;" alt="验证码" id="checkImageCode"/>
                <#--<div class="yzm-img left">-->
                <#--<img src="/getImageCode.json" alt="验证码" id="imgCode"/>-->
                <#--&lt;#&ndash;<a href="javascript:void(0)" id="clickCheck">点击切换</a>&ndash;&gt;-->
                <#--</div>-->
                </div>
                <div class="clearfix"></div>
                <div class="fm-item remember">
                    <input class="left" type="checkbox" id="rememberMe" name="rememberMe">
                    <p class="left">记住我</p>
                </div>
                <div class="clearfix"></div>
                <div class="login-btn">
                    <button type="submit"
                            style="font-size: 20px;width: 100%;color: color: #fff;height: 100%;background:#f9a705;">登录
                    </button>
                </div>

        </div>
        </form>
    </div>
</div>

</div>

<#--<div class="footer"><p>Copyright © 2019-2020</p></div>-->
</body>
<script type="text/javascript" src="assets/jquery-3.5.0.js"></script>
<script>
    $(document).ready(function () {
        $('#checkImageCode').click(function () {
            $.ajax({
                url: '/getImageCode.json',
                type: 'get',
                success: function (data, status, xhr) {
                    $('#checkImageCode').attr('src', '/getImageCode.json');
                },
            });
        });
    });
</script>
</html>
