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
<form id="addResourceFrom" class="layui-form layui-card-body">
    <div class="layui-form-item">
        <label class="layui-form-label">类型</label>
        <div class="layui-input-block">
            <input type="radio" lay-filter="rt" name="resourceType" value="0" title="菜单" checked>
            <input type="radio" lay-filter="rt" name="resourceType" value="1" title="页面">
            <input type="radio" lay-filter="rt" name="resourceType" value="2" title="按钮">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">标题</label>
        <div class="layui-input-block">
            <input type="text" id="title" name="title" required lay-verify="required" placeholder="请输入标题"
                   autocomplete="off" class="layui-input" value="">
        </div>
    </div>
    <div class="layui-form-item" id="url_div">
        <label class="layui-form-label">Url</label>
        <div class="layui-input-block">
            <input type="text" id="href" name="href" placeholder="请输入Url" autocomplete="off"
                   class="layui-input" value="">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">描述</label>
        <div class="layui-input-block">
            <input type="text" id="description" name="description" placeholder="请输入描述"
                   autocomplete="off" class="layui-input" value="">
        </div>
    </div>
    <div class="layui-form-item" id="pid_div">
        <label class="layui-form-label">父ID</label>
        <div class="layui-input-block">
            <select id="pId" name="pId">
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn layui-btn-blue" lay-submit lay-filter="formDemo">立即提交</button>
        <#--<button type="reset" class="layui-btn layui-btn-primary">重置</button>-->
        </div>
    </div>
</form>
<script>

    layui.use(['form', 'jquery', 'layer'], function () {
        var layer = layui.layer;
        var $ = layui.$;
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        //……
        //但是，如果你的HTML是动态生成的，自动渲染就会失效
        //因此你需要在相应的地方，执行下述方法来手动渲染，跟这类似的还有 element.init();


        function getPid(tType) {
            $.ajax({
                type: "GET",
                url: "/getPid.json",
                data: {resourceType: tType},
                dataType: "json",
                success: function (res) {
                    if (res.status == 0) {
                        $("#pId").empty();//清空下拉框内容
                        $.each(res.data, function (index, item) {
                            //$('#pId').append(new Option(item.title, item.id));// 下拉菜单里添加元素
                            $("#pId").append("<option value='" + item.id + "'>" + item.title + "</option>");// 下拉菜单里添加元素
                        });
                        layui.form.render("select");
                    }
                }
            });
        };

        layer.ready(function () {
            $("#url_div").hide();
            $("#pid_div").hide();
        });

        form.on("radio", function (data) {
            if (data.value == 0) {
                $("#url_div").hide();
                $("#pid_div").hide();
            } else if (data.value == 1) {
                getPid(0);
                $("#url_div").show();
                $("#pid_div").show();
            } else if (data.value == 2) {
                getPid(1);
                $("#url_div").show();
                $("#pid_div").show();
            }
        });
        form.render();
    });

    //添加资源方法
    layui.use('layer', function () {
        var layer = layui.layer;
        // 这个是在iframe里面的js代码
        var url = '/addResource.json';
        var frameindex = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
        $(document).on('click', '[type=submit]', function () {
            if ($("#title").val() != "" && $("#description").val() != "" && $('input[name="resourceType"]:checked').val() == 0) {
                addRresource();
            } else if ($("#title").val() != "" && $("#description").val() != "" && $("#href").val() != "") {
                addRresource();
            } else {
                layer.alert("请将信息填写完整！", {icon: 5});
            }

            function addRresource() {
                var index = layer.load(1, {
                    shade: [0.1, '#fff'] //0.1透明度的白色背景
                });
                var data = $("#addResourceFrom").serialize();
                $.post(url, data, function (res) {
                    if (res.status == 0) {
                        layer.alert(res.message, {icon: 6}, function (index) {
                            parent.location.href = "/resources.html";
                        });
                    } else {
                        layer.close(index);
                        layer.msg(res.message, {icon: 5});
                    }
                }, 'json');
            }

            return false;
        });

    })
</script>
</body>
</html>