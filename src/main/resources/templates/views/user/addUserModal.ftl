<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../assets/css/layui.css">
    <link rel="stylesheet" href="../assets/css/view.css"/>
    <script src="assets/layui.all.js"></script>
    <script src="assets/layui.js"></script>
    <script src="assets/jQuery.js"></script>
    <title></title>
</head>
<body class="layui-view-body">
<div class="layui-content">
    <div class="layui-row">
        <div class="layui-card">
            <div class="layui-card-body">
                <form id="addUserFrom" class="layui-form">
                    <div class="layui-form-item">
                        <label class="layui-form-label">用户名</label>
                        <div class="layui-input-block">
                            <input type="text" id="username" name="username" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">上传(pdf)</label>
                        <div class="layui-input-block">
                            <button type="button" class="layui-btn" id="up">
                                <i class="layui-icon">&#xe67c;</i>上传文件
                            </button>
                            <input type="text" id="filename" name="filename" required  lay-verify="required" readonly="readonly" value="">
                            <button type="button" class="layui-btn" id="delfile" onclick="delFile();">删除</button>
                            <button type="button" class="layui-btn" id="previewfile" onclick="previewFile();">预览</button>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button type="submit" class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                            <button onclick="rest();" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>


<script>

    rest = function(){
        $("#username").val("");
    }

    //文件上传
    layui.use('upload', function(){
        var upload = layui.upload;
        //执行实例
        var uploadInst = upload.render({
            elem: '#up' //绑定元素
            ,url: '/uploadFile.json' //上传接口
            ,accept: 'file' //指定允许上传时校验的文件类型，可选值有：images（图片）、file（所有文件）、video（视频）、audio（音频）
            ,exts: 'pdf' //指定后缀名 更多参数请到这里https://www.layui.com/doc/modules/upload.html
            ,done: function(res){
               if (res.status==0){
                   layer.msg(res.message,{icon: 6});
                   //上传后的文件名回显到input框
                   document.getElementById("filename").value=res.data;
               }else{
                   layer.msg(res.message,{icon: 5});
               }

            }
            ,error: function(){
                //请求异常回调
            }
        });
    });

    //文件删除方法
    delFile = function (){
        var filename = $("#filename").val();
        if (filename=="") {
            layer.msg("还未上传文件！",{icon: 5});
        }  else{
            layer.confirm('确定要删除吗?', function(index){
                $.ajax({
                            type:"POST",
                            url:"/delFile.json",
                            data:{filename:$("#filename").val()},
                            dataType:"json",
                            success:function (res) {
                                if (res.status==0) {
                                    layer.close(index);
                                    layer.msg(res.message,{icon: 6});
                                    $("#filename").val("");
                                }else{
                                    layer.msg(res.message,{icon: 5});
                                }
                            }
                        });
            });
        }
    }

    //文件预览方法
    previewFile = function () {
        var filename = $("#filename").val();
        if (filename=="") {
            layer.msg("还未上传文件！",{icon: 5});
        }else {
             var src="pdfjs/web/viewer.html?file="+encodeURIComponent("/previewFile.json?filename="+filename);
             window.open(src);
        }
    }

    //添加用户方法
    layui.use('layer', function () {
        var layer = layui.layer;
        // 这个是在iframe里面的js代码
        var url = '/addUser.json';
        var frameindex = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
        $(document).on('click', '[type=submit]', function () {
            var uname = $("#username").val();
            var fname = $("#filename").val();
            if (uname==""){
                layer.msg("用户名不能为空！");
            } else if (fname==""){
                layer.msg("请上传文件！");
            }else{
                var index = layer.load(1, {
                    shade: [0.1, '#fff'] //0.1透明度的白色背景
                });
                var data = $("#addUserFrom").serialize();
                $.post(url, data, function (data) {
                    if (data.status == 0) {
                        layer.msg(data.message,{icon: 6});
                        parent.location.href = "/user.html";
                    } else {
                        layer.close(index);
                        layer.msg(data.message,{icon: 5});
                    }
                }, 'json')
            }
            return false;
        });

    })
</script>
</body>
</html>