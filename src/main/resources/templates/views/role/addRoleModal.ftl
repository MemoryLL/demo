<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="assets/css/layui.css">
    <link rel="stylesheet" href="assets/css/view.css"/>
    <title></title>
</head>
<body class="layui-view-body">
<form id="addRoleFrom" class="layui-form layui-card-body">
    <div class="layui-form-item">
        <label class="layui-form-label">类型</label>
        <div class="layui-input-block">
            <input type="radio" name="roleLevel" value="0" title="系统" checked>
            <input type="radio" name="roleLevel" value="1" title="普通">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">角色名称</label>
        <div class="layui-input-block">
            <input type="text" id="roleName" name="roleName" required lay-verify="required" placeholder="请输入名称"
                   autocomplete="off" class="layui-input" value="">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">描述</label>
        <div class="layui-input-block">
            <input type="text" id="description" name="description" placeholder="请输入描述"
                   autocomplete="off" class="layui-input" value="">
        </div>
    </div>
</form>
    <div class="layui-form-item" id="resource_div">
        <label class="layui-form-label">资源</label>
        <div class="layui-input-block">
            <div id="add_role_resource" class="demo-tree-more"></div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn layui-btn-blue" lay-submit lay-filter="formDemo">立即提交</button>
        <#--<button type="reset" class="layui-btn layui-btn-primary">重置</button>-->
        </div>
    </div>

<#--<script src="assets/layui.all.js" charset="utf-8"></script>-->
<script src="assets/layui.js"></script>
<script src="assets/jquery-3.5.0.js"></script>
<script>
    layui.use(['tree', 'layer', 'form', 'util'], function () {
        var util = layui.util;
        var tree = layui.tree;
        var layer = layui.layer;
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        //……
        //但是，如果你的HTML是动态生成的，自动渲染就会失效
        //因此你需要在相应的地方，执行下述方法来手动渲染，跟这类似的还有 element.init();
        layer.ready(function () {
            $("#resource_div").hide();
        });
        form.on("radio", function (data) {
            if (data.value == 0) {
                $("#resource_div").hide();
            } else if (data.value == 1) {
                $("#resource_div").show();
            }
        });
        form.render();

        var nodes = "";
        $.ajax({
            url: "/getAllResource.json",
            type: "GET",
            datatype: "json",
            async: false,
            success: function (res) {
                if (res.status == 0) {
                    var list = res.data;
                    if (list != null) {
                        nodes = list;
                    }
                }
            }
        });
        //tree.render() 方法指定一个元素，便可快速创建一个 tree 实例
        tree.render({
            elem: '#add_role_resource'
            , data: nodes
            , showCheckbox: true  //是否显示复选框
            , id: 'id'
        });
    })

    //添加角色方法
    layui.use(['layer', 'tree'], function () {
        var layer = layui.layer;
        var tree = layui.tree;
        // 这个是在iframe里面的js代码
        var url = '/addRole.json';
        var frameindex = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
        $(document).on('click', '[type=submit]', function () {
            if ($("#roleName").val != "" && $("#description").val() != "") {
                var index = layer.load(1, {
                    shade: [0.1, '#fff'] //0.1透明度的白色背景
                });
                var checkData = tree.getChecked('id');//获得选中的节点
                if (checkData.length == 0) { //判断复选框是否被选中
                    layer.msg("请至少选择一个节点", {icon: 6});
                    return false;
                } else {
                    var roleName = $("#roleName").val();
                    var description = $("#description").val();
                    var roleLevel = $('input[name="roleLevel"]:checked').val();
                    var nodeIds = new Array();
                    nodeIds = getCheckedId(checkData);
                    var resourceList = nodeIds;
                    //获取节点
                    function getCheckedId(jsonObj) {
                        var id = "";
                        $.each(jsonObj, function (index, item) {
                            if (id != "") {
                                id = id + "," + item.id;
                            }
                            else {
                                id = item.id;
                            }
                            var i = getCheckedId(item.children);
                            if (i != "") {
                                id = id + "," + i;
                            }
                        });
                        return id;
                    }
                    $.ajax({
                        type: "POST",
                        url: "/addRole.json",
                        data: {roleName: roleName,description: description,roleLevel:roleLevel,roleIds: resourceList},
                        dataType: "json",
                        success: function (res) {
                            if (res.status == 0) {
                                layer.alert(res.message, {icon: 6}, function (index) {
                                    parent.location.href = "/role.html";
                                });
                            } else {
                                layer.alert(res.message, {icon: 5});
                            }
                        }
                    });
                    return false;
                }
            } else {
                layer.msg("请将信息填写完整！", {icon: 6});
            }
        });
    })
</script>
</body>
</html>