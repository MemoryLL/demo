<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="assets/css/layui.css">
    <link rel="stylesheet" href="assets/css/view.css"/>
    <link rel="stylesheet" href="assets/jquery-ui.css"/>
    <script src="assets/layui.all.js"></script>
    <script src="assets/layui.js"></script>
    <script src="assets/jquery-3.5.0.js"></script>
    <script src="assets/jquery-ui.js"></script>
    <title></title>
</head>
<body class="layui-view-body">
<form id="addStudentFrom" class="layui-form layui-card-body">
    <div class="layui-form-item">
        <label class="layui-form-label">学号</label>
        <div class="layui-input-block">
            <input type="text" id="stuNumber" name="stuNumber" required lay-verify="required" placeholder="请输入学号"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-block">
            <input type="text" id="stuName" name="stuName" required lay-verify="required" placeholder="请输入姓名"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">电话</label>
        <div class="layui-input-block">
            <input type="text" id="telephone" name="telephone" required lay-verify="required" placeholder="请输入电话"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="departmentHeadName" class="layui-form-label">地址</label>
        <div class="layui-input-block">
            <input type="text" id="address" name="address" required lay-verify="required" placeholder="请输入地址"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">选择系/专业/班级</label>
        <div class="layui-form-mid">系部:</div>
        <div class="layui-input-inline" style="width: 160px;">
            <select id="depId" name="depId" lay-filter="depChange">
                <option value=""></option>
            </select>
        </div>
        <div class="layui-form-mid">专业:</div>
        <div class="layui-input-inline" style="width: 160px;">
            <select id="majorId" name="majorId" lay-filter="majorChange">
                <option value=""></option>
            </select>
        </div>
        <div class="layui-form-mid">班级:</div>
        <div class="layui-input-inline" style="width: 160px;">
            <select id="classId" name="classId">
                <option value=""></option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">选择楼/宿舍</label>
        <div class="layui-form-mid">楼:</div>
        <div class="layui-input-inline" style="width: 150px;">
            <select id="floorId" name="floorId" lay-filter="floorChange">
                <option value=""></option>
            </select>
        </div>
        <div class="layui-form-mid">宿舍:</div>
        <div class="layui-input-inline" style="width: 120px;">
            <select id="roomId" name="roomId">
                <option value=""></option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="radio" lay-filter="rt" name="sex" value="男" title="男" checked>
            <input type="radio" lay-filter="rt" name="sex" value="女" title="女">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn layui-btn-blue" lay-submit lay-filter="formDemo">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script>
    layui.use('form', function () {
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        //……
        //但是，如果你的HTML是动态生成的，自动渲染就会失效
        //因此你需要在相应的地方，执行下述方法来手动渲染，跟这类似的还有 element.init();
        form.render();
    });

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
    $(function () {
        $.ajax({
            type: "GET",
            url: "/getAllFloor.json",
            dataType: "json",
            success: function (res) {
                if (res.status == 0) {
                    //$("#floorId").empty();//清空下拉框内容
                    $.each(res.data, function (index, item) {
                        //$('#floorId').append(new Option(item.title, item.id));// 下拉菜单里添加元素
                        $("#floorId").append("<option value='" + item.floorId + "'>" + item.floorName + "</option>");// 下拉菜单里添加元素
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
                        $("#classId").empty();//清空下拉框内容
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
                        $.each(res.data, function (index, item) {
                            //$('#classId').append(new Option(item.title, item.id));// 下拉菜单里添加元素
                            $("#classId").append("<option value='" + item.classId + "'>" + item.className + "</option>");// 下拉菜单里添加元素
                        });
                        layui.form.render("select");
                    }
                }
            });
        });
        form.on('select(floorChange)', function (data) {
            var floorId = data.value;
            $.ajax({
                type: "GET",
                url: "/getRoomByFloorId.json",
                data: {floorId: floorId},
                dataType: "json",
                success: function (res) {
                    if (res.status == 0) {
                        $("#roomId").empty();//清空下拉框内容
                        $.each(res.data, function (index, item) {
                            //$('#roomId').append(new Option(item.title, item.id));// 下拉菜单里添加元素
                            $("#roomId").append("<option value='" + item.roomId + "'>" + item.roomName + "</option>");// 下拉菜单里添加元素
                        });
                        layui.form.render("select");
                    }
                }
            });
        });
    });

    //添加用户方法
    layui.use('layer', function () {
        var layer = layui.layer;
        // 这个是在iframe里面的js代码
        var url = '/addStudent.json';
        $(document).on('click', '[type=submit]', function () {
            if ($("#stuNumber").val() != "" && $("#stuName").val() != "" && $("#telephone").val() != "" && $("#address").val() != ""
                    && $("#depId option:selected").val() != "" && $("#majorId option:selected").val() != "" && $("#classId option:selected").val() != "" && $("#roomId option:selected").val() != "") {
                var index = layer.load(1, {
                    shade: [0.1, '#fff'] //0.1透明度的白色背景
                });
                var data = $("#addStudentFrom").serialize();
                $.post(url, data, function (res) {
                    if (res.status == 0) {
                        layer.alert(res.message, {icon: 6}, function (index) {
                            parent.location.href = "/student.html";
                        });
                    } else {
                        layer.close(index);
                        layer.msg(res.message, {icon: 5});
                    }
                }, 'json');
            } else {
                layer.alert("请将信息填写完整！", {icon: 5});
            }
            return false;
        });
    })
</script>
</body>
</html>