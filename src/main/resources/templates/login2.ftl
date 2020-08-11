<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录界面</title>
    <link rel="stylesheet" href="assets/css/index.css">
    <link rel="stylesheet" href="assets/css/layui.css">
    <link rel="icon" href="/favicon.ico">
</head>
<body>
<script>
</script>
<div class="main">
    <div class="header">
        <div class="header-center fl">
            <div class="header-title">
                后台登录界面
            </div>
            <div class="header-img"></div>
        </div>
        <div class="header-bottom fl"></div>
    </div>
    <div class="content">
        <div class="content-left">
            <!--<img src="images/d.png" alt="">-->
        </div>
        <div class="content-right">
            <div class="right-infp">
                <form method="post" action="/login.json">
                    <p style="color: red" align="center">${msg}</p>
                    <div class="right-infp-name">
                        <input type="text" id="username" name="username" placeholder="请输入用户名" maxlength="12"
                               required value="" autocomplete="off">
                    </div>
                    <div class="right-infp-name">
                        <input type="password" id="password" name="password" required="required" placeholder="请输入密码"
                               autocomplete="off" value="">
                    </div>
                    <div class="right-infp-btn">
                        <button class="btn" type="submit">登录</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="assets/jquery-3.5.0.js"></script>
<script type="text/javascript" src="assets/layui.js"></script>
<script>
    $(document).ready(function () {
        var whei = $(window).width();
        $("html").css({fontSize: whei / 24});
        $(window).resize(function () {
            var whei = $(window).width();
            $("html").css({fontSize: whei / 24})
        });
    });

    // layui.use(['form', 'jquery', 'layer'], function () {
    //     var layer = layui.layer;
    //     var $ = layui.$;
    //     $(document).on('click', '[type=submit]', function () {
    //         var username = $("#username").val();
    //         var password = $("#password").val();
    //         //alert(username+password);
    //         if (username == "") {
    //             layer.alert("未填写用户名！", {icon: 5});
    //         } else if (password == "") {
    //             layer.alert("未填写密码！", {icon: 5});
    //         } else if (username != "" && password != "") {
    //             $.ajax({
    //                 type: "POST",
    //                 url: "/login.json",
    //                 data: {username: username, password: password},
    //                 dataType: "json",
    //                 success: function (res) {
    //                     if (res.status == 0) {
    //                         layer.alert(res.message, {icon: 6});
    //                         location.href = "/index.html";
    //                     } else {
    //                         layer.alert(res.message, {icon: 6});
    //                         location.href = "/login.html";
    //                     }
    //                 }
    //             })
    //         }
    //     });
    // });
</script>
</body>
</html>