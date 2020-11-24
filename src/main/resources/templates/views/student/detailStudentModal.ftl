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
        <label class="layui-form-label">学号:</label>
    ${stu.stuNumber}
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">姓名:</label>
    ${stu.stuName}
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">电话:</label>
    ${stu.telephone}
    </div>
    <div class="layui-form-item">
        <label for="departmentHeadName" class="layui-form-label">地址:</label>
    ${stu.address}
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别:</label>
    ${stu.sex}
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">系/专业/班级:</label>
        <div class="layui-form-mid">系部:${stu.depName}</div>

        <div class="layui-form-mid">专业:${stu.majorName}</div>

        <div class="layui-form-mid">班级:${stu.className}</div>

    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">楼/宿舍</label>
        <div class="layui-form-mid">楼:${stu.floorName}</div>

        <div class="layui-form-mid">宿舍:${stu.roomName}</div>

    </div>


</form>

</body>
</html>