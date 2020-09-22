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
            <h2 class="title">系统日志</h2>
        </div>
    </div>
    <div class="layui-row">
        <div class="layui-card">
            <div class="layui-card-body">
                <div class="form-box">
                    <div class="layui-form layui-form-item">
                        <form id="selectForm" class="layui-form">
                            <div class="layui-inline">
                                <table id="systemLogTable" lay-filter="systemLog_filter"/>
                            </div>
                    </div>
                </div>
            </div>
        </div>
<script src="assets/layui.all.js"></script>
<script src="assets/jquery-3.5.0.js"></script>
<script>
            var table = layui.table;
            var util = layui.util;
            //展示已知数据
            systemLogTable = table.render({
                elem: '#systemLogTable'
                , cols: [[ //标题栏
                    {field: 'sysId', title: 'ID', width: 80, sort: true, align: 'center'}
                    , {field: 'ipAddress', title: 'IP地址', width: 120, align: 'center'}
                    , {field: 'resourceName', title: '资源名称', width: 145, align: 'center'}
                    , {field: 'remark', title: '备注', width: 250, align: 'center'}
                    , {field: 'createdUserId', title: '操作Id', width: 90, align: 'center'}
                    , {field: 'createDate', title: '时间', width: 250, align: 'center', templet:function(d){return util.toDateString(d.createDate, "yyyy-MM-dd HH:mm:ss");}}
                ]]
                ,url: '/systemLogList.json'
                ,skin: 'line' //表格风格
                ,even: true
                ,page: true //是否显示分页
                ,limits: [10, 20]
                ,limit: 10 //每页默认显示的数量
            });
        </script>
</body>
</html>