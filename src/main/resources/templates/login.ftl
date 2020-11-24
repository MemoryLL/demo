<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="assets/css/layui.css">
    <link rel="stylesheet" href="assets/css/login.css">
    <link rel="icon" href="/favicon.ico">
    <title>管理后台</title>
</head>
<body class="login-wrap">
    <div class="login-container">
        <p style="color: red" align="center">${msg}</p>
        <form class="login-form" method="post" action="/login.json">
            <div class="input-group">
                <input type="text" id="username" name="username" required="required" class="input-field">
                <label for="username" class="input-label">
                    <span class="label-title">用户名</span>
                </label>
            </div>
            <div class="input-group">
                <input type="password" id="password" name="password" required="required" class="input-field">
                <label for="password" class="input-label">
                    <span class="label-title">密码</span>
                </label>
            </div>
            <div class="input-group">
                <input type="text" id="imgcode" name="imgcode" required="required" class="input-field" style="width: 30px">
                <img src="/getImageCode.json" style="width: 80px; height: 30px;" alt="验证码"  id="checkcode"/>
                <#--<label for="imgcode" class="input-label">-->
                    <#--<span class="label-title">验证码</span>-->
                <#--</label>-->

            </div>
            <button type="submit" class="login-button">登录<i class="ai ai-enter"></i></button>
        </form>
    </div>
</body>
<script src="assets/layui.js"></script>
<script type="text/javascript" src="assets/jquery-3.5.0.js"></script>
<script src="assets/js/index.js" data-main="assets/js/login"></script>
<script>

    $(document).ready(function () {
        $('#checkcode').click(function () {
            $.ajax({
                url: '/getImageCode.json',
                type: 'get',
                success: function (data, status, xhr) {
                    $('#checkcode').attr('src', '/getImageCode.json');
                },
            });
        });
    });
</script>
</html>