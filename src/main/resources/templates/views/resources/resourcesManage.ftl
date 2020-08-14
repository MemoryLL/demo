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
                    <@shiro.hasPermission name="/addResource_btn">
                    <button id="btn_add_resource" class="layui-btn layui-btn-blue"><i class="layui-icon">&#xe654;</i>新增
                    </button>
                    </@shiro.hasPermission>
                    <table id="resourcesTable" lay-filter="resource_filter">
                        <script type="text/html" id="barDemo">
                            <@shiro.hasPermission name="/checkResource_btn">
                            <a class="layui-btn layui-btn-sm layui-btn-primary layui-btn-mini" lay-event="resource_detail">查看</a>
                            </@shiro.hasPermission>
                            <@shiro.hasPermission name="/editResource_btn">
                            <a class="layui-btn layui-btn-sm layui-btn-mini" lay-event="resource_edit">编辑</a>
                            </@shiro.hasPermission>
                            <@shiro.hasPermission name="/updateResourceStatus_btn">
                            <a class="layui-btn layui-btn-sm layui-btn-danger layui-btn-mini" lay-event="resource_update_status">修改状态</a>
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
    //展示已知数据
    resourcesTable = table.render({
                elem: '#resourcesTable'
                , cols: [[ //标题栏
                    {field: 'id', title: 'ID', width: 80, sort: true, align: 'center'}
                    , {field: 'title', title: '标题', width: 120, align: 'center'}
                    , {field: 'href', title: '地址', width: 150, align: 'center'}
                    , {field: 'description', title: '描述', width: 145, align: 'center'}
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
    $('#btn_add_resource').on('click', function () {
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
    //监听工具条
    table.on('tool(resource_filter)', function (obj) {
        var data = obj.data;
        if (obj.event === 'resource_detail') {
            layer.msg('ID：' + data.id + ' 的查看操作');
        } else if (obj.event === 'resource_update_status') {
            layer.confirm('真的要修改状态么?', function (index) {
                var s = data.status;
                var status;
                if (s==0){
                    status=1;
                }else if (s==1){
                    status=0;
                }
                $.ajax({
                    url: "/updateResourceStatusById.json",
                    type: "POST",
                    data: {"id": data.id,"status":status},
                    dataType: "json",
                    success: function (res) {
                        if (res.status == 0) {
                            //关闭弹框
                            layer.close(index);
                            layer.alert(res.message, {icon: 6}, function (index) {
                                location.href = "/resources.html";
                            });
                        } else {
                            layer.msg("删除失败", {icon: 5});
                        }
                    }
                });
            });
        } else if (obj.event === 'resource_edit') {
            //console.log(data.id);
            layer.open({
                type: 2,
                title: '修改资源',
                maxmin: true,
                area: ['650px', '480px'],
                shadeClose: false, //点击遮罩关闭
                content: '/updateResourceModel.html?id='+data.id+'',
                //content: '/updateResourceModel.html/'+data.id+'',
            });
        }
    });
</script>
</body>
</html>