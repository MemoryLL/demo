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
            <h2 class="title">宿舍管理</h2>
        </div>
    </div>
    <div class="layui-row">
        <div class="layui-card">
            <div class="layui-card-body">
                <div class="form-box">
                    <div class="layui-form layui-form-item">
                        <form id="roomForm" class="layui-form">
                            <div class="layui-inline">
                                <div class="layui-form-mid">宿舍名:</div>
                                <div class="layui-input-inline" style="width: 100px;">
                                    <input id="roomName" name="roomName" type="text" autocomplete="off" class="layui-input"
                                           value="">
                                </div>
                                <div class="layui-form-mid">宿舍楼名:</div>
                                <div class="layui-input-inline" style="width: 100px;">
                                    <select id="floorId" name="floorId">
                                        <option value="">全部</option>
                                    </select>
                                </div>
                                <button id="findRoom_btn" class="layui-btn layui-btn-blue">查询</button>
                                <button id="restFindRoom_btn" class="layui-btn layui-btn-primary">重置
                                </button>
                            </div>
                        </form>
                    </div>
                    <@shiro.hasPermission name="/addRoom_btn">
                    <button id="btn_add_room" class="layui-btn layui-btn-blue"><i class="layui-icon">&#xe654;</i>新增
                    </button>
                    </@shiro.hasPermission>
                    <table id="roomTable" lay-filter="room_filter">
                        <script type="text/html" id="barDemo">
                            <@shiro.hasPermission name="/checkRoom_btn">
                            <a class="layui-btn layui-btn-sm layui-btn-primary layui-btn-mini" lay-event="room_detail">详情</a>
                            </@shiro.hasPermission>
                            <@shiro.hasPermission name="/editRoom_btn">
                            <a class="layui-btn layui-btn-sm layui-btn-mini" lay-event="room_edit">编辑</a>
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

    $( function() {
        $.ajax({
            type: "GET",
            url: "/getAllFloor.json",
            dataType: "json",
            success: function (res) {
                if (res.status == 0) {
                    //$("#floorId").empty();//清空下拉框内容
                    $.each(res.data, function (index, item) {
                        //$('#floorId').append(new Option(item.title, item.id));// 下拉菜单里添加元素
                        $("#floorId").append("<option value='" + item.id + "'>" + item.floorName + "</option>");// 下拉菜单里添加元素
                    });
                    layui.form.render("select");
                }
            }
        });
    } );


    //查询按钮点击
    $("#findRoom_btn").click(function () {
        var roomName = $("#roomName").val();
        var floorId = $("#floorId option:selected").val();
        roomResult.reload({
            url: '/roomList.json'
            , where: {roomName: roomName,floorId: floorId}
            , page: {curr: 1}
        });
        isSearch = true;
        return false;
    });
    //重置按钮点击
    $("#restFindRoom_btn").click(function () {
        $("#roomName").val("");
        $("#floorId").val("");
        form.render();
        roomResult.reload({
            url: '/roomList.json'
            , where: {roomName: "",floorId: ""}
            , page: {curr: 1}
        });
        isSearch = true;
        return false;
    });
    //添加按钮点击
    $('#btn_add_room').on('click', function () {
        layer.open({
            type: 2,
            title: '添加宿舍',
            maxmin: true,
            area: ['650px', '480px'],
            shadeClose: false, //点击遮罩关闭
            content: '/addRoomModel.html',
        });
    });
    //展示已知数据
    roomResult = table.render({
        elem: '#roomTable'
        , cols: [[ //标题栏
            {field: 'id', title: 'ID', width: 70, sort: true, align: 'center'}
            , {field: 'roomName', title: '宿舍名', width: 180, align: 'center'}
            , {field: 'floorId', title: '所属楼ID', width: 150, align: 'center'}
            , {field: 'createTime', title: '创建时间', width: 200, align: 'center', templet:function(d){return util.toDateString(d.createTime, "yyyy-MM-dd HH:mm:ss");}}
            , {field: 'right', title: '操作', width: 250, toolbar: "#barDemo", align: 'center'}
        ]]
        , url: '/roomList.json'
        , where: {roomName: "",floorId: ""}
        , skin: 'line' //表格风格
        , even: true
        , page: true //是否显示分页
        , limits: [5, 10]
        , limit: 5 //每页默认显示的数量
    });
    //监听工具条
    table.on('tool(room_filter)', function (obj) {
        var data = obj.data;
        if (obj.event === 'room_detail') {
            layer.msg('ID：' + data.id + ' 的查看操作');
        } else if (obj.event === 'room_edit') {
            layer.msg('ID：' + data.id + ' 的修改操作');
        }
    });
</script>
</body>
</html>