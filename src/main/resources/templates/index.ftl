<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="assets/css/layui.css">
    <link rel="stylesheet" href="assets/css/admin.css">
    <link rel="icon" href="/favicon.ico">
    <script type="text/javascript" src="assets/layui.js"></script>
    <script type="text/javascript" src="assets/jquery-3.5.0.js"></script>
    <script type="text/javascript" src="assets/js/index.js" data-main="assets/js/home"></script>
    <title>管理后台</title>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header custom-header">

        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item slide-sidebar" lay-unselect>
                <a href="javascript:;" class="icon-font"><i class="ai ai-menufold"></i></a>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;"><b>${username}</b></a>
                <dl class="layui-nav-child">
                    <dd><a href="">帮助中心</a></dd>
                    <dd><a href="/exit.html">退出</a></dd>
                </dl>
            </li>
        </ul>
    </div>

    <div class="layui-side custom-admin">
        <div class="layui-side-scroll">

            <div class="custom-logo">
                <img src="/assets/images/logo.jpg" alt=""/>
                <h1>Admin Pro</h1>
            </div>
        <#--<ul id="Nav" class="layui-nav layui-nav-tree">-->
        <#--<li class="layui-nav-item">-->
        <#--<a href="javascript:;">-->
        <#--<i class="layui-icon">&#xe609;</i>-->
        <#--<em>主页</em>-->
        <#--</a>-->
        <#--<dl class="layui-nav-child">-->
        <#--<dd><a href="/console.html">控制台</a></dd>-->
        <#--</dl>-->
        <#--</li>-->
        <#--<li class="layui-nav-item">-->
        <#--<a href="javascript:;">-->
        <#--<i class="layui-icon">&#xe857;</i>-->
        <#--<em>页面</em>-->
        <#--</a>-->
        <#--<dl class="layui-nav-child">-->
        <#--<dd><a href="/form.html">表单</a></dd>-->

        <#--</dd>-->
        <#--</dl>-->
        <#--</li>-->
        <#--<li class="layui-nav-item">-->
        <#--<a href="javascript:;">-->
        <#--<i class="layui-icon">&#xe612;</i>-->
        <#--<em>用户</em>-->
        <#--</a>-->
        <#--<dl class="layui-nav-child">-->
        <#--<dd><a href="/user.html">用户组</a></dd>-->
        <#--<dd><a href="/operaterule.html">权限配置</a></dd>-->
        <#--</dl>-->
        <#--</li>-->
        <#--</ul>-->
            <ul class="layui-nav layui-nav-tree" lay-filter="demo"></ul>
        </div>
    </div>

<#--<div class="layui-body">-->
<#--<div class="layui-tab app-container" lay-allowClose="true" lay-filter="tabs">-->
<#--<ul id="appTabs" class="layui-tab-title custom-tab"></ul>-->
<#--<div id="appTabPage" class="layui-tab-content"></div>-->
<#--</div>-->
<#--</div>-->

    <!--页面选项卡-->
    <div class="layui-body">
        <div class="layui-tab app-container" lay-allowClose="true" lay-filter="tabs">
            <ul id="appTabs" class="layui-tab-title custom-tab"></ul>
            <div id="appTabPage" class="layui-tab-content"></div>
        </div>
    </div>

    <div class="layui-footer">
        <p>© 2018 更多模板：<a href="http://www.mycodes.net/" target="_blank">源码之家</a></p>
    </div>

    <div class="mobile-mask"></div>
</div>

<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function () {
        var $ = layui.jquery;
        var element = layui.element;
        //定义ids数组，用来记录已经打开的tab选项卡
        var ids = [];

        element.on('nav(demo)', function () {
            var id = $(this).attr("data-id");
            var title = $(this).attr("data-title");
            var url = $(this).attr("data-url");
            // console.log(id);
            // console.log(title);
            //判断是否为以及菜单，如果不是一级菜单则创建tab
            if (typeof(id) != "undefined") {
                //判断选项卡是否已经被打开 下标为-1则未打开
                if (ids.indexOf(id) == -1) {
                    element.tabAdd('tabs', {
                        title: title
                        // ,content: '<iframe src="/console.html" scrolling="auto" frameborder="0"></iframe>'
                        , content: createIframe(url)
                        , id: id
                    });
                    ids.push(id);
                    //console.log(ids.indexOf(id));
                }
                //已经打开的tab直接切换
                element.tabChange('tabs', id);
                //删除tab时，从ids中将该tab的id删除，如果不删除会打不开该tab
                element.on('tabDelete(tabs)', function (elem) {
                    var index = elem.index;
                    ids.splice(index, 1);
                });
            }

            //创建iframe
            function createIframe(url) {
                return '<iframe src="' + url + '" scrolling="auto" frameborder="0" ></iframe>'
            }
        });
        //获取所有的菜单
        $.ajax({
            type: "GET",
            url: "/menuInfo.json",
            dataType: "json",
            success: function (data) {
                //先添加所有的主材单
                $.each(data.data, function (i, obj) {
                    var content = '<li class="layui-nav-item">';
                    content += '<a href="javascript:;">' + obj.title + "</a>";
                    //这里是添加所有的子菜单
                    content += loadchild(obj);
                    content += "</li>";
                    $(".layui-nav-tree").append(content);
                });
                element.init();
            },
            error: function (jqXHR) {
                aler("发生错误：" + jqXHR.status);
            }
        });

        //组装子菜单的方法
        function loadchild(obj) {
            if (obj == null) {
                return;
            }

            var content = "";
            if (obj.children != null && obj.children.length > 0) {
                content += '<dl class="layui-nav-child">';
            } else {
                content += '<dl>';
            }

            if (obj.children != null && obj.children.length > 0) {
                $.each(obj.children, function (i, note) {
                    //console.log(note.title);
                    content += '<dd>';
                    content += "<a href=\"javascript:;\" data-id=\"" + note.id + "\" data-title=\"" + note.title + "\" data-url=\"" + note.href + "\">" + note.title + "</a>";
                    //subStr += "<a href=\"javascript:;\" data-src=\"" + note.url + "\" data-menuid=\"" + subMenu.menuId + "\" data-title=\"" + subMenu.name + "\">" + subMenu.name + "</a>";
                    if (note.children == null) {
                        return;
                    }
                    content += loadchild(note);
                    content += '</dd>';
                });
                content += '</dl>';
            }
            console.log(content);
            return content;
        }
    });
</script>
</body>
</html>