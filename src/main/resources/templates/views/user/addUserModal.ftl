<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../assets/css/layui.css">
    <link rel="stylesheet" href="../assets/css/view.css"/>
    <script src="assets/layui.all.js"></script>
    <script src="assets/layui.js"></script>
    <script src="assets/jquery-3.5.0.js"></script>
    <title></title>
</head>
<body class="layui-view-body">
<form id="addUserFrom" class="layui-form layui-card-body">
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-block">
            <input type="text" id="name" name="name" required lay-verify="required" placeholder="请输入用户名"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-block">
            <input type="password" id="password" name="password" required lay-verify="required" placeholder="请输入密码"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">年龄</label>
        <div class="layui-input-block">
            <input type="text" id="age" name="age" required lay-verify="required" placeholder="请输入年龄" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-block">
            <input type="text" id="email" name="email" required lay-verify="required" placeholder="请输入邮箱"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">上传(pdf)</label>
        <div class="layui-input-block">
            <button type="button" class="layui-btn" id="up">
            <i class="layui-icon">&#xe67c;</i>上传文件
            </button>
            <input type="text" id="filename" name="filename" required lay-verify="required" readonly="readonly"
                   value="">
            <button type="button" class="layui-btn" id="delfile" onclick="delFile();">删除</button>
            <button type="button" class="layui-btn" id="previewfile" onclick="previewFile();">预览</button>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">城市</label>
        <div class="layui-input-block">
            <select id="city" name="city" lay-verify="required">
                <option value=""></option>
                <option value="北京">北京</option>
                <option value="上海">上海</option>
                <option value="广州">广州</option>
                <option value="深圳">深圳</option>
                <option value="杭州">杭州</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">角色</label>
        <div class="layui-input-block">
            <select id="roldId" name="roldId" lay-verify="required">

            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">单选框</label>
        <div class="layui-input-block">
            <input type="radio" name="sex" value="男" title="男" checked>
            <input type="radio" name="sex" value="女" title="女">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn layui-btn-blue" lay-submit lay-filter="formDemo">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script>

    $(document).ready(function () {
        $.ajax({
            type: "GET",
            url: "/getRole.json",
            dataType: "json",
            success: function (res) {
                if (res.status == 0) {
                    $("#roldId").empty();//清空下拉框内容
                    $.each(res.data, function (index, item) {
                        //$('#pId').append(new Option(item.title, item.id));// 下拉菜单里添加元素
                        $("#roldId").append("<option value='" + item.id + "'>" + item.roleName + "</option>");// 下拉菜单里添加元素
                    });
                    layui.form.render("select");
                }
            }
        });
    });

    layui.use('form', function () {
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        //……
        //但是，如果你的HTML是动态生成的，自动渲染就会失效
        //因此你需要在相应的地方，执行下述方法来手动渲染，跟这类似的还有 element.init();
        form.render();
    });

    //文件上传
    layui.use('upload', function () {
        //执行实例
        var upload = layui.upload;
        var uploadInst = upload.render({
            elem: '#up' //绑定元素
            , url: '/uploadFile.json' //上传接口
            , accept: 'file' //指定允许上传时校验的文件类型，可选值有：images（图片）、file（所有文件）、video（视频）、audio（音频）
            , exts: 'jpg|png|gif|bmp|jpeg' //指定后缀名 更多参数请到这里https://www.layui.com/doc/modules/upload.html
            , done: function (res) {
                if (res.status == 0) {
                    layer.msg(res.message, {icon: 6});
                    //上传后的文件名回显到input框
                    document.getElementById("filename").value = res.data;
                    document.getElementById("filename").defaultValue = res.data;
                } else {
                    layer.msg(res.message, {icon: 5});
                }
            }
            , error: function () {
                //请求异常回调
            }
        });
    });

    //文件删除方法
    delFile = function () {
        var filename = $("#filename").val();
        if (filename == "") {
            layer.msg("还未上传文件！", {icon: 5});
        } else {
            layer.confirm('确定要删除吗?', function (index) {
                $.ajax({
                    type: "POST",
                    url: "/delFile.json",
                    data: {filename: $("#filename").val()},
                    dataType: "json",
                    success: function (res) {
                        if (res.status == 0) {
                            layer.close(index);
                            layer.msg(res.message, {icon: 6});
                            $("#filename").val("");
                        } else {
                            layer.msg(res.message, {icon: 5});
                        }
                    }
                });
            });
        }
    }

    //文件预览方法
    previewFile = function () {
        var filename = $("#filename").val();
        if (filename == "") {
            layer.msg("还未上传文件！", {icon: 5});
        } else {
            var src = "pdfjs/web/viewer.html?file=" + encodeURIComponent("/previewFile.json?filename=" + filename);
            window.open(src);
        }
    }

    //添加用户方法
    layui.use('layer', function () {
        var layer = layui.layer;
        // 这个是在iframe里面的js代码
        var url = '/addUser.json';
        var frameindex = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
        $(document).on('click', '[type=submit]', function () {
            if ($("#name").val() != ""&&$("#password").val() != ""&&$("#filename").val() != ""&&$("#age").val() != ""&&$("#email").val() != ""&&$("#city").val() != "") {
                var index = layer.load(1, {
                    shade: [0.1, '#fff'] //0.1透明度的白色背景
                });
                var data = $("#addUserFrom").serialize();
                $.post(url, data, function (res) {
                    if (res.status == 0) {
                        layer.alert(res.message, {icon: 6}, function (index) {
                            parent.location.href = "/user.html";
                        });
                    } else {
                        layer.close(index);
                        layer.msg(res.message, {icon: 5});
                    }
                }, 'json');
            } else{
                layer.alert("请将信息填写完整！",{icon: 5});
            }
            return false;
        });
    })
</script>
</body>
</html>