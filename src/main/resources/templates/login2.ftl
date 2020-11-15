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
                <form action="/login.json" method="post">
                    <p style="color: red" align="center">${msg}</p>
                    <div class="right-infp-name">
                        <input type="text" id="username" name="username" placeholder="请输入用户名" maxlength="12"
                               required value="" autocomplete="off">
                    </div>
                    <div class="right-infp-name">
                        <input type="password" id="password" name="password" required="required" placeholder="请输入密码"
                               autocomplete="off" value="">
                    </div>
                    <div class="layui-form-item">
                        <input type="checkbox" id="rememberMe" name="rememberMe" />  记住我<br>
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
    // $(document).on('click','[type=submit]',function () {
    //     var username = $("#username").val();
    //     var password = $("#password").val();
    //     var rememberMe = $("#rememberMe").is(":checked");
        // $.post('/login.json', {username:username,password:password,rememberMe:rememberMe}, function (result) {
        //     console.log(result);
        //     if(result.status==0){
        //         window.location.href="http://localhost:8083/index.html" ;
        //     }
        // }, "JSON");
    //     $.ajax({
    //         type: "POST",
    //         url: "/login.json",
    //         data: {username:username,password:password,rememberMe:rememberMe},
    //         dataType: "json",
    //         async: false,
    //         success:function (res) {
    //             console.log(res);
    //             if (res.status==0){
    //                 window.location.href="http://localhost:8083/index.html";
    //             }else {
    //                 window.location.href="http://localhost:8083";
    //             }
    //         }
    //     });
    // });
</script>
</body>
</html>