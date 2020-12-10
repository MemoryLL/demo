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
            <h2 class="title">学生管理</h2>
        </div>
    </div>
    <div class="layui-row">
        <div class="layui-card">
            <div class="layui-card-body">
                <div class="form-box">
                    <div class="layui-form layui-form-item">
                        <form id="studentForm" class="layui-form">
                            <div class="layui-inline">
                                <div class="layui-form-mid">姓名:</div>
                                <div class="layui-input-inline" style="width: 100px;">
                                    <input id="stuName" name="stuName" type="text" autocomplete="off"
                                           class="layui-input"
                                           value="">
                                </div>
                                <div class="layui-form-mid">系部:</div>
                                <div class="layui-input-inline" style="width: 130px;">
                                    <select id="depId" name="depId" lay-filter="depChange">
                                        <option value=""></option>
                                    </select>
                                </div>
                                <div class="layui-form-mid">专业:</div>
                                <div class="layui-input-inline" style="width: 140px;">
                                    <select id="majorId" name="majorId" lay-filter="majorChange">
                                        <option value=""></option>
                                    </select>
                                </div>
                                <div class="layui-form-mid">班级:</div>
                                <div class="layui-input-inline" style="width: 100px;">
                                    <select id="classId" name="classId">
                                        <option value=""></option>
                                    </select>
                                </div>
                                <div class="layui-form-mid">状态:</div>
                                <div class="layui-input-inline" style="width: 100px;">
                                    <select id="status" name="status">
                                        <option value=""></option>
                                        <option value="0">在校生</option>
                                        <option value="1">已毕业</option>
                                        <option value="2">休学</option>
                                    </select>
                                </div>
                                <button id="findStudent_btn" class="layui-btn layui-btn-blue">查询</button>
                                <button id="restFindStudent_btn" class="layui-btn layui-btn-primary">重置
                                </button>
                            </div>
                        </form>
                    </div>
                    <@shiro.hasPermission name="/addStudent_btn">
                    <button id="btn_add_student" class="layui-btn layui-btn-blue"><i class="layui-icon">&#xe654;</i>新增
                    </button>
                    </@shiro.hasPermission>
                    <@shiro.hasPermission name="/exportStudent_btn">
                    <button id="btn_export_student" class="layui-btn layui-btn-blue"><i class="layui-icon">&#xe654;</i>导出
                    </button>
                    </@shiro.hasPermission>
                    <table id="studentTable" lay-filter="student_filter">
                        <script type="text/html" id="barDemo">
                            <@shiro.hasPermission name="/checkStudent_btn">
                            <a class="layui-btn layui-btn-sm layui-btn-primary layui-btn-mini"
                               lay-event="student_detail">详情</a>
                            </@shiro.hasPermission>
                            <@shiro.hasPermission name="/editStudent_btn">
                            <a class="layui-btn layui-btn-sm layui-btn-mini" lay-event="student_edit">编辑</a>
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

    $(function () {
        $.ajax({
            type: "GET",
            url: "/getAllDepartment.json",
            dataType: "json",
            success: function (res) {
                if (res.status == 0) {
                    //$("#depId").empty();//清空下拉框内容
                    $.each(res.data, function (index, item) {
                        //$('#depId').append(new Option(item.title, item.id));// 下拉菜单里添加元素
                        $("#depId").append("<option value='" + item.depId + "'>" + item.depName + "</option>");// 下拉菜单里添加元素
                    });
                    layui.form.render("select");
                }
            }
        });
    });

    layui.use(['form'], function () {
        var form = layui.form;
        form.on('select(depChange)', function (data) {
            var depId = data.value;
            $.ajax({
                type: "GET",
                url: "/getMajorByDepId.json",
                data: {depId: depId},
                dataType: "json",
                success: function (res) {
                    if (res.status == 0) {
                        $("#majorId").empty();//清空下拉框内容
                        $('#majorId').append(new Option("", ""));
                        $("#classId").empty();//清空下拉框内容
                        $('#classId').append(new Option("", ""));
                        $.each(res.data, function (index, item) {
                            //$('#majorId').append(new Option(item.title, item.id));// 下拉菜单里添加元素
                            $("#majorId").append("<option value='" + item.majorId + "'>" + item.majorName + "</option>");// 下拉菜单里添加元素
                        });
                        layui.form.render("select");
                    }
                }
            });
        });
        form.on('select(majorChange)', function (data) {
            var majorId = data.value;
            $.ajax({
                type: "GET",
                url: "/getClassByMajorId.json",
                data: {majorId: majorId},
                dataType: "json",
                success: function (res) {
                    if (res.status == 0) {
                        $("#classId").empty();//清空下拉框内容
                        $('#classId').append(new Option("", ""));
                        $.each(res.data, function (index, item) {
                            //$('#classId').append(new Option(item.title, item.id));// 下拉菜单里添加元素
                            $("#classId").append("<option value='" + item.classId + "'>" + item.className + "</option>");// 下拉菜单里添加元素
                        });
                        layui.form.render("select");
                    }
                }
            });
        });
    });

    //导出按钮点击
    $("#btn_export_student").click(function () {
        var stuName = $("#stuName").val();
        var depId = $("#depId option:selected").val();
        var majorId = $("#majorId option:selected").val();
        var classId = $("#classId option:selected").val();
        var status = $("#status option:selected").val();

        parent.location.href = encodeURI("/exportStu.json?stuName="+stuName+"&depId="+depId+"&majorId="+majorId+"&classId="+classId+"&status="+status);
        //可以根据条件查询后再导出
        //var data = $("#studentForm").serialize();
    });

    //查询按钮点击
    $("#findStudent_btn").click(function () {
        var stuName = $("#stuName").val();
        var depId = $("#depId option:selected").val();
        var majorId = $("#majorId option:selected").val();
        var classId = $("#classId option:selected").val();
        var status = $("#status option:selected").val();
        studentResult.reload({
            url: '/studentList.json'
            , where: {stuName: stuName, depId: depId, majorId: majorId, classId: classId, status: status}
            , page: {curr: 1}
        });
        isSearch = true;
        return false;
    });
    //重置按钮点击
    $("#restFindStaff_btn").click(function () {
        $("#stuName").val("");
        $("#depId").val("");
        $("#majorId").val("");
        $("#classId").val("");
        $("#status").val("");
        form.render();
        studentResult.reload({
            url: '/studentList.json'
            , where: {stuName: "", depId: "", majorId: "", classId: "", status: ""}
            , page: {curr: 1}
        });
        isSearch = true;
        return false;
    });
    //添加按钮点击
    $('#btn_add_student').on('click', function () {
        layer.open({
            type: 2,
            title: '添加学生',
            maxmin: true,
            area: ['850px', '480px'],
            shadeClose: false, //点击遮罩关闭
            content: '/addStudentModel.html',
        });
    });
    //展示已知数据
    studentResult = table.render({
        elem: '#studentTable'
        , cols: [[ //标题栏
            {field: 'stuNumber', title: '学号', width: 110, sort: true, align: 'center'}
            , {field: 'stuName', title: '姓名', width: 80, align: 'center'}
            , {field: 'telephone', title: '电话', width: 120, align: 'center'}
            , {field: 'address', title: '地址', width: 200, align: 'center'}
            , {
                field: 'status', title: '状态', width: 80, align: 'center',
                templet: function (res) {
                    if (res.status == 0) {
                        return '<span class="layui-badge layui-bg-green">在校生</span>';
                    } else if (res.status == 1) {
                        return '<span class="layui-badge">已毕业</span>';
                    } else if (res.status == 2) {
                        return '<span class="layui-badge layui-bg-blue">休学</span>';
                    }
                }
            }
            , {
                field: 'createTime', title: '创建时间', width: 160, align: 'center', templet: function (d) {
                    return util.toDateString(d.createTime, "yyyy-MM-dd HH:mm:ss");
                }
            }
            , {field: 'right', title: '操作', width: 250, toolbar: "#barDemo", align: 'center'}
        ]]
        , url: '/studentList.json'
        , where: {stuName: "", depId: "", majorId: "", classId: "", status: ""}
        , skin: 'line' //表格风格
        , even: true
        , page: true //是否显示分页
        , limits: [5, 10]
        , limit: 5 //每页默认显示的数量
    });
    //监听工具条
    table.on('tool(student_filter)', function (obj) {
        var data = obj.data;
        if (obj.event === 'student_detail') {
            layer.open({
                type: 2,
                title: '学生详情',
                maxmin: true,
                area: ['650px', '480px'],
                shadeClose: false, //点击遮罩关闭
                content: '/detailStudentModel.html?stuNumber=' + data.stuNumber
            });
            //layer.msg('学号：' + data.stuNumber + ' 的查看操作');
        } else if (obj.event === 'student_edit') {
            layer.msg('学号：' + data.stuNumber + ' 的修改操作');
        }
    });
</script>
</body>
</html>