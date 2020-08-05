<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="../assets/css/layui.css">
    <link rel="stylesheet" href="../assets/css/view.css"/>
    <title></title>
    <style>
        .layui-table-cell {
            height: auto;
            line-height: 28px;
        }
    </style>
</head>
<body class="layui-view-body">
<div class="layui-content">
    <div class="layui-page-header">
        <div class="pagewrap">
            <h2 class="title">资源配置</h2>
        </div>
    </div>
    <div class="layui-row">
        <div class="layui-card">
            <div class="layui-card-body">
                <div class="form-box">
                    <div class="layui-form layui-form-item">
                        <form id="selectForm" class="layui-form">
                            <div class="layui-inline">
                                <div class="layui-form-mid">标题:</div>
                                <div class="layui-input-inline" style="width: 100px;">
                                    <input id="title" name="title" type="text" autocomplete="off" class="layui-input"
                                           value="">
                                </div>
                                <div class="layui-form-mid">状态:</div>
                                <div class="layui-input-inline" style="width: 100px;">
                                    <select id="status" name="status">
                                        <option value="">全部</option>
                                        <option value="0">正常</option>
                                        <option value="1">禁用</option>
                                    </select>
                                </div>
                                <div class="layui-form-mid">类型:</div>
                                <div class="layui-input-inline" style="width: 100px;">
                                    <select id="resourceType" name="resourceType">
                                        <option value="">全部</option>
                                        <option value="0">菜单</option>
                                        <option value="1">页面</option>
                                        <option value="2">按钮</option>
                                    </select>
                                </div>
                                <button id="findResource_btn" class="layui-btn layui-btn-blue">查询</button>
                                <button id="restResource_btn" class="layui-btn layui-btn-primary">重置
                                </button>
                            </div>
                        </form>
                    </div>
                    <button id="btn-add-resource" class="layui-btn layui-btn-blue"><i class="layui-icon">&#xe654;</i>新增
                    </button>
                    <table id="resourcesTable" lay-filter="test2">
                        <script type="text/html" id="barDemo">
                            <a class="layui-btn layui-btn-primary layui-btn-mini" lay-event="resource_detail">查看</a>
                            <a class="layui-btn layui-btn-mini" lay-event="resource_edit">编辑</a>
                            <a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="resource_update_status">修改状态</a>
                        </script>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="assets/layui.all.js"></script>
<script src="assets/jquery-3.5.0.js"></script>
<script>
    var element = layui.element;
    var table = layui.table;
    var form = layui.form;
    //展示已知数据
    resourcesTable = table.render({
                elem: '#resourcesTable'
                , cols: [[ //标题栏
                    {field: 'id', title: 'ID', width: 80, sort: true, align: 'center'}
                    , {field: 'title', title: '标题', width: 120, align: 'center'}
                    , {field: 'href', title: '地址', width: 140, sort: true, align: 'center'}
                    , {field: 'description', title: '描述', width: 140, align: 'center'}
                    , {field: 'pId', title: '父节点ID', width: 90, align: 'center'}
                    , {
                        field: 'status', title: '状态', width: 80, align: 'center',
                        templet: function (res) {
                            if (res.status == 0) {
                                return '<span class="layui-badge layui-bg-green">正常</span>';
                            } else if (res.status == 1) {
                                return '<span class="layui-badge">禁用</span>';
                            }
                        }
                    }
                    , {
                        field: 'resourceType', title: '类型', width: 80, align: 'center',
                        templet: function (res) {
                            if (res.resourceType == 0) {
                                return '<span class="layui-badge layui-bg-blue">菜单</span>';
                            } else if (res.resourceType == 1) {
                                return '<span class="layui-badge layui-bg-orange">页面</span>';
                            } else if (res.resourceType == 2) {
                                return '<span class="layui-badge layui-bg-cyan">按钮</span>';
                        }
                    }
            }
            , {field: 'right', title: '操作', width: 280, toolbar: "#barDemo", align: 'center'}
    ]]
    ,url: '/resourcesList.json'
    ,where:{
        title: "", status:"",resourceType:""
    }
    ,skin: 'line' //表格风格
    ,even: true
    ,page: true //是否显示分页
    ,limits: [5, 10]
    ,limit: 5 //每页默认显示的数量
    });
    //添加资源按钮点击
    $('#btn-add-resource').on('click', function () {
        layer.open({
            type: 2,
            title: '添加资源',
            maxmin: true,
            area: ['650px', '480px'],
            shadeClose: false, //点击遮罩关闭
            content: '/addResourceModel.html',
        });
    });

    //查询按钮点击
    $("#findResource_btn").click(function () {
        var title = $("#title").val();
        var status = $("#status option:selected").val();
        var resourceType = $("#resourceType option:selected").val();
        resourcesTable.reload({
            url: '/resourcesList.json'
            ,where: {title: title, status: status,resourceType:resourceType}
            ,page:{curr:1}
        });
        isSearch = true;
        return false;
    });
    //重置按钮点击
    $("#restResource_btn").click(function () {
        $("#title").val("");
        $("#status").val("");
        $("#resourceType").val("");
        form.render();
        resourcesTable.reload({
            url: '/resourcesList.json'
            , where: {title: "", status: "",resourceType:""}
            ,page:{curr:1}
        });
        isSearch = true;
        return false;
    });
</script>
</body>
</html>