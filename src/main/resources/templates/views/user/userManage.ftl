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
        {# 设置table每一行的height #}
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
                                <input type="text" autocomplete="off" class="layui-input">
                            </div>
                            <div class="layui-form-mid">邮箱:</div>
                            <div class="layui-input-inline" style="width: 100px;">
                                <input type="text" autocomplete="off" class="layui-input">
                            </div>
                            <div class="layui-form-mid">性别:</div>
                            <div class="layui-input-inline" style="width: 100px;">
                                <select name="sex">
                                    <option value="1">男</option>
                                    <option value="2">女</option>
                                </select>
                            </div>
                            <button class="layui-btn layui-btn-blue">查询</button>
                            <button class="layui-btn layui-btn-primary">重置</button>
                        </div>
                        </form>
                    </div>
                    <button id="btn-add" class="layui-btn layui-btn-blue"><i class="layui-icon">&#xe654;</i>新增
                    </button>
                    <table id="userTable" lay-filter="test">
                        <script type="text/html" id="barDemo">
                            <a class="layui-btn layui-btn-primary layui-btn-mini" lay-event="detail">查看</a>
                            <a class="layui-btn layui-btn-mini" lay-event="edit">编辑</a>
                            <a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del">删除</a>
                        </script>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="assets/layui.all.js"></script>
<script src="assets/jQuery.js"></script>
<script>
    //添加采集设备
    $('#btn-add').on('click', function () {
        layer.open({
            type: 2,
            title: '添加用户',
            maxmin: true,
            area: ['650px', '500px'],
            shadeClose: false, //点击遮罩关闭
            content: '/addUserModel.html',
        });
    });

    var element = layui.element;
    var table = layui.table;
    var form = layui.form;

    //展示已知数据
    table.render({
        elem: '#userTable'
        , cols: [[ //标题栏
            {checkbox: true, fixed: true}
            , {field: 'id', title: 'ID', width: 80, sort: true,align:'center'}
            , {field: 'username', title: '用户名', width: 80,align:'center'}
            , {field: 'age', title: '年龄', width: 80, sort: true,align:'center'}
            , {field: 'email', title: '邮箱', width: 150,align:'center'}
            , {field: 'file', title: '文件', width: 150,align:'center'}
            , {field: 'sex', title: '性别', width: 80,align:'center'}
            , {field: 'city', title: '城市', width: 80,align:'center'}
            , {field: 'right', title: '操作', width:280,toolbar:"#barDemo",align:'center'}
        ]]
        , url:'/userList.json'
        , skin: 'line' //表格风格
        , even: true
        , page: true //是否显示分页
        , limits: [2]
        , limit: 2 //每页默认显示的数量
    });

    //监听工具条
    table.on('tool(test)', function(obj){
        var data = obj.data;
        if(obj.event === 'detail'){
            layer.msg('ID：'+ data.id + ' 的查看操作');
        } else if(obj.event === 'del'){
            layer.confirm('真的删除行么', function(index){
                console.log(data);
                layer.msg("删除成功", {icon: 6});
                // $.ajax({
                //     url: "UVServlet",
                //     type: "POST",
                //     data:{"uvid":data.id,"memthodname":"deleteuv","aid":data.aid},
                //     dataType: "json",
                //     success: function(data){
                //
                //         if(data.state==1){
                //             //删除这一行
                //             obj.del();
                //             //关闭弹框
                //             layer.close(index);
                //             layer.msg("删除成功", {icon: 6});
                //         }else{
                //             layer.msg("删除失败", {icon: 5});
                //         }
                //     }
                //
                // });
            });
        } else if(obj.event === 'edit'){
            layer.prompt({
                formType: 2
                ,title: '修改 ID 为 ['+ data.id +'] 的年龄'
                ,value: data.age
            }, function(value, index){
                console.log(data,value,index)
                //发送修改的Ajax请求
                //EidtAge(data,value,index,obj);
                $.ajax({
                    url: "/updateAgeById.json",
                    type: "POST",
                    data:{"id":data.id,"age":value},
                    dataType: "json",
                    success: function(data){
                        if(data.status==0){
                            //关闭弹框
                            layer.close(index);
                            //同步更新表格和缓存对应的值
                            // obj.update({
                            //     age: value
                            // });
                            window.location.reload();
                            layer.msg(data.message, {icon: 6});
                        }else{
                            layer.msg(data.message, {icon: 5});
                        }
                    }

                });
            });
        }
    });
</script>
</body>
</html>