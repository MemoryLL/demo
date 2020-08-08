<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="assets/css/layui.css">
    <link rel="stylesheet" href="assets/css/view.css"/>
    <script src="assets/layui.all.js"></script>
    <script src="assets/layui.js"></script>
    <script src="assets/jquery-3.5.0.js"></script>
    <title></title>
</head>
<body class="layui-view-body">
<form id="updateResourceFrom" class="layui-form layui-card-body">
    <input type="hidden" id="id" name="id" value="${resource.id}">
    <div class="layui-form-item">
        <label class="layui-form-label">类型</label>
        <div class="layui-input-block">
            <input type="radio" disabled="disabled" lay-filter="rt" name="resourceType" value="0" title="菜单" checked>
            <input type="radio" disabled="disabled" lay-filter="rt" name="resourceType" value="1" title="页面">
            <input type="radio" disabled="disabled" lay-filter="rt" name="resourceType" value="2" title="按钮">
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
            <input type="text" id="description" required lay-verify="required" name="description" placeholder="请输入描述"
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

        function getPid1(rType){
            $.ajax({
                type: "GET",
                url: "/getPid.json",
                data: {resourceType: rType},
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
        function getPid2(rType){
            $.ajax({
                type: "GET",
                url: "/getPid.json",
                data: {resourceType: rType},
                dataType: "json",
                success: function (res) {
                    if (res.status == 0) {
                        $("#pId").empty();//清空下拉框内容
                        $.each(res.data, function (index, item) {
                            //$('#pId').append(new Option(item.title, item.id));// 下拉菜单里添加元素
                            $("#pId").append("<option value='" + item.id + "'>" + item.title + "</option>");// 下拉菜单里添加元素
                        });
                        // 遍历select
                        $("#pId").each(function() {
                            // this代表的是<option></option>，对option再进行遍历
                            $(this).children("option").each(function() {
                                // 判断需要对那个选项进行回显
                                if (this.value == ${resource.pId}) {
                                    // 进行回显
                                    $(this).attr("selected","selected");
                                }
                            });
                        });
                        layui.form.render("select");
                    }
                }
            });
        };

        layer.ready(function () {
            if (${resource.resourceType}==0){
                $("#title").val("${resource.title}");
                $("#description").val("${resource.description}");
                $("#url_div").hide();
                $("#pid_div").hide();
            }else if (${resource.resourceType}==1){
                $("input[name=resourceType][value=0]").attr("checked", false);
                $("input[name=resourceType][value=1]").attr("checked", true);
                $("input[name=resourceType][value=2]").attr("checked", false);
                $("#title").val("${resource.title}");
                $("#description").val("${resource.description}");
                $("#href").val("${resource.href}");
                getPid2(0);
                $("#url_div").show();
                $("#pid_div").show();
            }else if (${resource.resourceType}==2) {
                $("input[name=resourceType][value=0]").attr("checked", false);
                $("input[name=resourceType][value=1]").attr("checked", false);
                $("input[name=resourceType][value=2]").attr("checked", true);
                $("#title").val("${resource.title}");
                $("#description").val("${resource.description}");
                $("#href").val("${resource.href}");
                getPid2(1);
                $("#url_div").show();
                $("#pid_div").show();
            }

        });
        form.render();
    });

    //修改资源方法
    layui.use('layer', function () {
        var layer = layui.layer;
        // 这个是在iframe里面的js代码
        var url = '/updateResource.json';
        var frameindex = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
        $(document).on('click', '[type=submit]', function () {
            if (${resource.resourceType}==0) {
                if ($("#title").val()!=""&&$("#description").val()!="") {
                    updateResourceMethod();
                }
            }else if (${resource.resourceType}==1||${resource.resourceType}==2){
                if ($("#title").val()!=""&&$("#description").val()!=""&&$("#href").val()!=""){
                    updateResourceMethod();
                }
            }
            function updateResourceMethod(){
                var index = layer.load(1, {
                    shade: [0.1, '#fff'] //0.1透明度的白色背景
                });
                var data = $("#updateResourceFrom").serialize();
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
            };
            return false;
        });
    })
</script>
</body>
</html>