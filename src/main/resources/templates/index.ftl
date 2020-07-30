<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="assets/css/layui.css">
    <link rel="stylesheet" href="assets/css/admin.css">
    <link rel="icon" href="/favicon.ico">
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
                <a href="javascript:;">Admin</a>
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
            <ul id="Nav" class="layui-nav layui-nav-tree">
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <i class="layui-icon">&#xe609;</i>
                        <em>主页</em>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="/console.html">控制台</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <i class="layui-icon">&#xe857;</i>
                        <em>页面</em>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="/form.html">表单</a></dd>

                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <i class="layui-icon">&#xe612;</i>
                        <em>用户</em>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="/user.html">用户组</a></dd>
                        <dd><a href="/operaterule.html">权限配置</a></dd>
                    </dl>
                </li>
            </ul>

        </div>
    </div>

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
<script src="assets/layui.js"></script>
<script src="assets/jQuery.js"></script>
<script src="assets/js/index.js" data-main="assets/js/home"></script>
<#--<script>-->
    <#--//注意：导航 依赖 element 模块，否则无法进行功能性操作-->
    <#--layui.use('element', function(){-->
        <#--var $ = layui.jquery-->
                <#--,element = layui.element;-->

        <#--element.on('nav(demo)', function(elem){-->
            <#--//console.log(elem.getAttribute("meun_id")); //得到当前点击的DOM对象-->
            <#--var id=$(this).attr("meun_id");-->
            <#--if(typeof(id)!="undefined"){-->
                <#--console.log('进入方法');-->
                <#--element.tabAdd('demo1', {-->
                    <#--title: '新选项'+ (Math.random()*1000|0) //用于演示-->
                    <#--,content: '<iframe src="test.html" style="width:100%;height:491px;" scrolling="auto" frameborder="0"></iframe>'-->
                    <#--,id: id//实际使用一般是规定好的id，这里以时间戳模拟下z-->
                <#--})-->
                <#--element.tabChange('demo1', id);-->
            <#--}-->
        <#--});-->
        <#--//获取所有的菜单-->
        <#--$.ajax({-->
            <#--type:"GET",-->
            <#--url:"/menuInfo.json",-->
            <#--dataType:"json",-->
            <#--success:function(data){-->
                <#--//先添加所有的主材单-->
                <#--$.each(data.data,function(i,obj){-->
                    <#--var content='<li class="layui-nav-item">';-->
                    <#--content+='<a href="javascript:;">'+obj.title+'</a>';-->
                    <#--//这里是添加所有的子菜单-->
                    <#--content+=loadchild(obj);-->
                    <#--content+='</li>';-->
                    <#--$(".layui-nav-tree").append(content);-->
                <#--});-->
                <#--element.init();-->
            <#--},-->
            <#--error:function(jqXHR){-->
                <#--aler("发生错误："+ jqXHR.status);-->
            <#--}-->
        <#--});-->

        <#--//组装子菜单的方法-->
        <#--function loadchild(obj){-->
            <#--if(obj==null){-->
                <#--return;-->
            <#--}-->

            <#--var content='';-->
            <#--if(obj.children!=null && obj.children.length>0){-->
                <#--content+='<dl class="layui-nav-child">';-->
            <#--}else{-->
                <#--content+='<dl>';-->
            <#--}-->

            <#--if(obj.children!=null && obj.children.length>0){-->
                <#--$.each(obj.children,function(i,note){-->
                    <#--content+='<dd>';-->
                    <#--content+='<a href="javascript:;">'+note.title+'</a>';-->
                    <#--if(note.children==null){-->
                        <#--return;-->
                    <#--}-->
                    <#--content+=loadchild(note);-->
                    <#--content+='</dd>';-->
                <#--});-->

                <#--content+='</dl>';-->
            <#--}-->
            <#--console.log(content);-->
            <#--return content;-->
        <#--}-->
    <#--});-->
<#--</script>-->
<#--<script>-->
    <#--//注意：导航 依赖 element 模块，否则无法进行功能性操作-->
    <#--layui.use('element', function () {-->
        <#--var $ = layui.jquery-->
                <#--, element = layui.element;-->

        <#--element.on('nav(demo)', function (elem) {-->
            <#--//console.log(elem.getAttribute("meun_id")); //得到当前点击的DOM对象-->
            <#--console.log(elem);-->
            <#--var id = $(this).attr("meun_id");-->
            <#--console.log("sdfsdf====" + id);-->
            <#--if (typeof(id)!= "undefined") {-->
                <#--console.log('进入方法');-->
                <#--element.tabAdd('tabs', {-->
                    <#--title: '新选项' + (Math.random() * 1000 | 0) //用于演示-->
                    <#--,-->
                    <#--content: '<iframe src="/user.html" style="width:100%;height:491px;" scrolling="auto" frameborder="0"></iframe>'-->
                    <#--,-->
                    <#--id: id//实际使用一般是规定好的id，这里以时间戳模拟下z-->
                <#--})-->
                <#--element.tabChange('demo1', id);-->
            <#--}-->
        <#--});-->


        <#--//获取所有的菜单-->
        <#--$.ajax({-->
            <#--type: "GET",-->
            <#--url: "/menuInfo.json",-->
            <#--dataType: "json",-->
            <#--success: function (res) {-->
                <#--//先添加所有的主材单-->
                <#--console.log(res.data);-->
                <#--$.each(res.data, function (index, obj) {-->
                    <#--console.log(index);-->
                    <#--var content = '<li class="layui-nav-item">';-->
                    <#--content += '<a href="javascript:;">' + obj.title + '</a>';-->
                    <#--//这里是添加所有的子菜单-->
                    <#--content += loadchild(obj);-->
                    <#--content += '</li>';-->
                    <#--$(".layui-nav-tree").append(content);-->
                <#--});-->
                <#--//$("#nav").html(content);-->
                <#--element.init();-->
            <#--},-->
            <#--error: function (jqXHR) {-->
                <#--aler("发生错误：" + jqXHR.status);-->
            <#--}-->
        <#--});-->

        <#--//组装子菜单的方法-->
        <#--function loadchild(obj) {-->
            <#--if (obj == null) {-->
                <#--return;-->
            <#--}-->
            <#--var content = '';-->
            <#--if (obj.children != null && obj.children.length > 0) {-->
                <#--content += '<dl class="layui-nav-child">';-->
            <#--} else {-->
                <#--content += '<dl>';-->
            <#--}-->

            <#--if (obj.children != null && obj.children.length > 0) {-->
                <#--$.each(obj.children, function (i, note) {-->
                    <#--content += '<dd>';-->
                    <#--content += '<a href="javascript:;">' + note.title + '</a>';-->
                    <#--if (note.children == null) {-->
                        <#--return;-->
                    <#--}-->
                    <#--content += loadchild(note);-->
                    <#--content += '</dd>';-->
                <#--});-->

                <#--content += '</dl>';-->
            <#--}-->
            <#--//console.log(content);-->
            <#--return content;-->
        <#--}-->


    <#--});-->
<#--</script>-->
</body>
</html>