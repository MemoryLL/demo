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
            <h2 class="title">用户组</h2>
        </div>
    </div>
    <div class="layui-row">
        <div class="layui-card">
            <div class="layui-card-body">
                <div class="form-box">
                    <div class="layui-form layui-form-item">
                        <form id="selectForm" class="layui-form">
                            <div class="layui-inline">
                                <div class="layui-form-mid">用户名:</div>
                                <div class="layui-input-inline" style="width: 100px;">
                                    <input id="name" name="name" type="text" autocomplete="off" class="layui-input"
                                           value="">
                                </div>
                                <div class="layui-form-mid">性别:</div>
                                <div class="layui-input-inline" style="width: 100px;">
                                    <select id="sex" name="sex">
                                        <option value="">全部</option>
                                        <option value="男">男</option>
                                        <option value="女">女</option>
                                    </select>
                                </div>
                                <button id="findUser_btn" class="layui-btn layui-btn-blue">查询</button>
                                <button id="restFindUser_btn" class="layui-btn layui-btn-primary">重置
                                </button>
                            </div>
                        </form>
                    </div>
                    <button id="btn-add" class="layui-btn layui-btn-blue"><i class="layui-icon">&#xe654;</i>新增
                    </button>
                    <table id="userTable" lay-filter="test1">
                        <script type="text/html" id="barDemo">
                            <a class="layui-btn layui-btn-primary layui-btn-mini" lay-event="user_detail">查看</a>
                            <a class="layui-btn layui-btn-mini" lay-event="user_edit">编辑</a>
                            <a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="user_del">删除</a>
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
    //查询按钮点击
    $("#findUser_btn").click(function () {
        var name = $("#name").val();
        var sex = $("#sex option:selected").val();
        userResult.reload({
            url: '/userList.json'
            , where: {name: name, sex: sex}
            ,page:{curr:1}
        });
        isSearch = true;
        return false;
    });
    //重置按钮点击
    $("#restFindUser_btn").click(function () {
        $("#name").val("");
        $("#sex").val("");
        form.render();
        userResult.reload({
            url: '/userList.json'
            , where: {name: "", sex: ""}
            ,page:{curr:1}
        });
        isSearch = true;
        return false;
    });
    //添加用户按钮点击
    $('#btn-add').on('click', function () {
        layer.open({
            type: 2,
            title: '添加用户',
            maxmin: true,
            area: ['650px', '480px'],
            shadeClose: false, //点击遮罩关闭
            content: '/addUserModel.html',
        });
    });
    //展示已知数据
    userResult = table.render({
        elem: '#userTable'
        , cols: [[ //标题栏
            {checkbox: true, fixed: true}
            , {field: 'id', title: 'ID', width: 80, sort: true, align: 'center'}
            , {field: 'name', title: '用户名', width: 80, align: 'center'}
            , {field: 'age', title: '年龄', width: 80, sort: true, align: 'center'}
            , {field: 'email', title: '邮箱', width: 150, align: 'center'}
            , {field: 'file', title: '文件', width: 150, align: 'center'}
            , {field: 'sex', title: '性别', width: 80, align: 'center'}
            , {field: 'city', title: '城市', width: 80, align: 'center'}
            , {field: 'right', title: '操作', width: 280, toolbar: "#barDemo", align: 'center'}
        ]]
        , url: '/userList.json'
        , where: {name: "", sex: ""}
        , skin: 'line' //表格风格
        , even: true
        , page: true //是否显示分页
        , limits: [5, 10]
        , limit: 5 //每页默认显示的数量
    });
    //监听工具条
    table.on('tool(test1)', function (obj) {
        var data = obj.data;
        if (obj.event === 'user_detail') {
            layer.msg('ID：' + data.id + ' 的查看操作');
        } else if (obj.event === 'user_del') {
            layer.confirm('真的删除行么', function (index) {
                // console.log(data);
                // layer.msg("删除成功", {icon: 6});
                $.ajax({
                    url: "/delUserById.json",
                    type: "POST",
                    data: {"id": data.id},
                    dataType: "json",
                    success: function (res) {
                        if (res.status == 0) {
                            //删除这一行
                            obj.del();
                            //关闭弹框
                            layer.close(index);
                            layer.msg(res.message, {icon: 6});
                        } else {
                            layer.msg("删除失败", {icon: 5});
                        }
                    }
                });
            });
        } else if (obj.event === 'user_edit') {
            layer.prompt({
                formType: 2
                , title: '修改 ID 为 [' + data.id + '] 的年龄'
                , value: data.age
            }, function (value, index) {
                console.log(data, value, index)
                //发送修改的Ajax请求
                //EidtAge(data,value,index,obj);
                $.ajax({
                    url: "/updateAgeById.json",
                    type: "POST",
                    data: {"id": data.id, "age": value},
                    dataType: "json",
                    success: function (res) {
                        if (res.status == 0) {
                            //关闭弹框
                            layer.close(index);
                            //同步更新表格和缓存对应的值
                            // obj.update({
                            //     age: value
                            // });
                            layer.msg(res.message, {icon: 6});
                            window.location.reload();
                        } else {
                            layer.msg(res.message, {icon: 5});
                        }
                    }
                });
            });
        }
    });
</script>
</body>
</html>