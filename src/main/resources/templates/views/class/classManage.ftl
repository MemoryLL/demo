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
            <h2 class="title">班级管理</h2>
        </div>
    </div>
    <div class="layui-row">
        <div class="layui-card">
            <div class="layui-card-body">
                <div class="form-box">
                    <div class="layui-form layui-form-item">
                        <form id="classForm" class="layui-form">
                            <div class="layui-inline">
                                <div class="layui-form-mid">班级名:</div>
                                <div class="layui-input-inline" style="width: 100px;">
                                    <input id="className" name="className" type="text" autocomplete="off" class="layui-input"
                                           value="">
                                </div>
                                <div class="layui-form-mid">状态:</div>
                                <div class="layui-input-inline" style="width: 100px;">
                                    <select id="status" name="status">
                                        <option value="">全部</option>
                                        <option value="0">正常</option>
                                        <option value="1">已毕业</option>
                                    </select>
                                </div>
                                <button id="findClass_btn" class="layui-btn layui-btn-blue">查询</button>
                                <button id="restFindClass_btn" class="layui-btn layui-btn-primary">重置
                                </button>
                            </div>
                        </form>
                    </div>
                    <@shiro.hasPermission name="/addClass_btn">
                    <button id="btn_add_class" class="layui-btn layui-btn-blue"><i class="layui-icon">&#xe654;</i>新增
                    </button>
                    </@shiro.hasPermission>
                    <table id="classTable" lay-filter="class_filter">
                        <script type="text/html" id="barDemo">
                            <@shiro.hasPermission name="/checkClass_btn">
                            <a class="layui-btn layui-btn-sm layui-btn-primary layui-btn-mini" lay-event="class_detail">详情</a>
                            </@shiro.hasPermission>
                            <@shiro.hasPermission name="/editClass_btn">
                            <a class="layui-btn layui-btn-sm layui-btn-mini" lay-event="class_edit">编辑</a>
                            </@shiro.hasPermission>
                            <@shiro.hasPermission name="/updateClassStatus_btn">
                            <a class="layui-btn layui-btn-sm layui-btn-danger layui-btn-mini" lay-event="class_update_status">修改状态</a>
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
    $("#findClass_btn").click(function () {
        var className = $("#className").val();
        var status = $("#status option:selected").val();
        classResult.reload({
            url: '/classList.json'
            , where: {className: className,status: status}
            , page: {curr: 1}
        });
        isSearch = true;
        return false;
    });
    //重置按钮点击
    $("#restFindClass_btn").click(function () {
        $("#className").val("");
        $("#status").val("");
        form.render();
        classResult.reload({
            url: '/classList.json'
            , where: {className: "",status: ""}
            , page: {curr: 1}
        });
        isSearch = true;
        return false;
    });
    //添加按钮点击
    $('#btn_add_class').on('click', function () {
        layer.open({
            type: 2,
            title: '添加班级',
            maxmin: true,
            area: ['650px', '480px'],
            shadeClose: false, //点击遮罩关闭
            content: '/addClassModel.html',
        });
    });
    //展示已知数据
    classResult = table.render({
        elem: '#classTable'
        , cols: [[ //标题栏
            {field: 'id', title: 'ID', width: 70, sort: true, align: 'center'}
            , {field: 'className', title: '班级名', width: 180, align: 'center'}
            , {field: 'majorId', title: '所属专业ID', width: 150, align: 'center'}
            , {
                field: 'status', title: '状态', width: 110, align: 'center',
                templet: function (res) {
                    if (res.status == 0) {
                        return '<span class="layui-badge layui-bg-blue">在校</span>';
                    } else if (res.status == 1) {
                        return '<span class="layui-badge layui-bg-orange">已毕业</span>';
                    }
                }
            }
            , {field: 'createTime', title: '创建时间', width: 200, align: 'center', templet:function(d){return util.toDateString(d.createTime, "yyyy-MM-dd HH:mm:ss");}}
            , {field: 'right', title: '操作', width: 250, toolbar: "#barDemo", align: 'center'}
        ]]
        , url: '/classList.json'
        , where: {className: "",status: ""}
        , skin: 'line' //表格风格
        , even: true
        , page: true //是否显示分页
        , limits: [5, 10]
        , limit: 5 //每页默认显示的数量
    });
    //监听工具条
    table.on('tool(class_filter)', function (obj) {
        var data = obj.data;
        if (obj.event === 'class_detail') {
            layer.msg('ID：' + data.id + ' 的查看操作');
        } else if (obj.event === 'class_edit') {
            layer.msg('ID：' + data.id + ' 的修改操作');
        } else if (obj.event === 'class_update_status') {
            layer.msg('ID：' + data.id + ' 的状态操作');
        }
    });
</script>
</body>
</html>