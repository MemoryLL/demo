<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="assets/css/layui.css">
    <link rel="stylesheet" href="assets/css/view.css"/>
    <link rel="stylesheet" href="assets/jquery-ui.css"/>
    <script src="assets/layui.all.js"></script>
    <script src="assets/layui.js"></script>
    <script src="assets/jquery-3.5.0.js"></script>
    <script src="assets/jquery-ui.js"></script>
    <title></title>
</head>
<body class="layui-view-body">
<form id="addFloorFrom" class="layui-form layui-card-body">
    <div class="layui-form-item">
        <label class="layui-form-label">宿舍楼名</label>
        <div class="layui-input-block">
            <input type="text" id="floorName" name="floorName" required lay-verify="required" placeholder="请输入宿舍名"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">描述</label>
        <div class="layui-input-block">
            <input type="text" id="descr" name="descr" required lay-verify="required" placeholder="请输入描述"
                   autocomplete="off" class="layui-input">
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
    layui.use('form', function () {
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        //……
        //但是，如果你的HTML是动态生成的，自动渲染就会失效
        //因此你需要在相应的地方，执行下述方法来手动渲染，跟这类似的还有 element.init();
        form.render();
    });


    //添加方法
    layui.use('layer', function () {
        var layer = layui.layer;
        // 这个是在iframe里面的js代码
        var url = '/addFloor.json';
        $(document).on('click', '[type=submit]', function () {
            if ($("#floorName").val() != "" && $("#descr").val() != "") {
                var index = layer.load(1, {
                    shade: [0.1, '#fff'] //0.1透明度的白色背景
                });
                var data = $("#addFloorFrom").serialize();
                $.post(url, data, function (res) {
                    if (res.status == 0) {
                        layer.alert(res.message, {icon: 6}, function (index) {
                            parent.location.href = "/floor.html";
                        });
                    } else {
                        layer.close(index);
                        layer.msg(res.message, {icon: 5});
                    }
                }, 'json');
            } else {
                layer.alert("请将信息填写完整！", {icon: 5});
            }
            return false;
        });
    })
</script>
</body>
</html>