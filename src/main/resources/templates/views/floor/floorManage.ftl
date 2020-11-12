<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="assets/css/layui.css">
    <link rel="stylesheet" href="assets/css/view.css"/>
    <link rel="icon" href="favicon.ico">
    <title>管理后台</title>
    <style>
        {
            # 设置table每一行的height #
        }
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
            <h2 class="title">宿舍楼管理</h2>
        </div>
    </div>
    <div class="layui-row">
        <div class="layui-card">
            <div class="layui-card-body">
                <div class="form-box">
                    <div class="layui-form layui-form-item">
                        <form id="floorForm" class="layui-form">
                            <div class="layui-inline">
                                <div class="layui-form-mid">宿舍楼名:</div>
                                <div class="layui-input-inline" style="width: 100px;">
                                    <input id="floorName" name="floorName" type="text" autocomplete="off" class="layui-input"
                                           value="">
                                </div>
                                <button id="findFloor_btn" class="layui-btn layui-btn-blue">查询</button>
                                <button id="restFindFloor_btn" class="layui-btn layui-btn-primary">重置
                                </button>
                            </div>
                        </form>
                    </div>
                    <@shiro.hasPermission name="/addFloor_btn">
                    <button id="btn_add_floor" class="layui-btn layui-btn-blue"><i class="layui-icon">&#xe654;</i>新增
                    </button>
                    </@shiro.hasPermission>
                    <table id="floorTable" lay-filter="floor_filter">
                        <script type="text/html" id="barDemo">
                            <@shiro.hasPermission name="/checkFloor_btn">
                            <a class="layui-btn layui-btn-sm layui-btn-primary layui-btn-mini" lay-event="floor_detail">详情</a>
                            </@shiro.hasPermission>
                            <@shiro.hasPermission name="/editFloor_btn">
                            <a class="layui-btn layui-btn-sm layui-btn-mini" lay-event="floor_edit">编辑</a>
                            </@shiro.hasPermission>
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
    var util = layui.util;
    //查询按钮点击
    $("#findFloor_btn").click(function () {
        var floorName = $("#floorName").val();
        floorResult.reload({
            url: '/floorList.json'
            , where: {floorName: floorName}
            , page: {curr: 1}
        });
        isSearch = true;
        return false;
    });
    //重置按钮点击
    $("#restFindFloor_btn").click(function () {
        $("#floorName").val("");
        form.render();
        floorResult.reload({
            url: '/floorList.json'
            , where: {floorName: ""}
            , page: {curr: 1}
        });
        isSearch = true;
        return false;
    });
    //添加按钮点击
    $('#btn_add_floor').on('click', function () {
        layer.open({
            type: 2,
            title: '添加宿舍楼',
            maxmin: true,
            area: ['650px', '480px'],
            shadeClose: false, //点击遮罩关闭
            content: '/addFloorModel.html',
        });
    });
    //展示已知数据
    floorResult = table.render({
        elem: '#floorTable'
        , cols: [[ //标题栏
            {field: 'id', title: 'ID', width: 70, sort: true, align: 'center'}
            , {field: 'floorName', title: '宿舍楼名', width: 180, align: 'center'}
            , {field: 'descr', title: '描述', width: 150, align: 'center'}
            , {field: 'createTime', title: '创建时间', width: 200, align: 'center', templet:function(d){return util.toDateString(d.createTime, "yyyy-MM-dd HH:mm:ss");}}
            , {field: 'right', title: '操作', width: 250, toolbar: "#barDemo", align: 'center'}
        ]]
        , url: '/floorList.json'
        , where: {floorName: ""}
        , skin: 'line' //表格风格
        , even: true
        , page: true //是否显示分页
        , limits: [5, 10]
        , limit: 5 //每页默认显示的数量
    });
    //监听工具条
    table.on('tool(floor_filter)', function (obj) {
        var data = obj.data;
        if (obj.event === 'floor_detail') {
            layer.msg('ID：' + data.id + ' 的查看操作');
        } else if (obj.event === 'floor_edit') {
            layer.msg('ID：' + data.id + ' 的修改操作');
        }
    });
</script>
</body>
</html>