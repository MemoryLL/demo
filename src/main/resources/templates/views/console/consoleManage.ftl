<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="../assets/css/layui.css">
    <link rel="stylesheet" href="../assets/css/view.css"/>
    <title></title>
</head>
<body class="layui-view-body">
    <div class="layui-content">
        <div class="layui-row layui-col-space20">
            <div class="layui-col-sm6 layui-col-md3">
                <div class="layui-card">
                    <div class="layui-card-body chart-card">
                        <div class="chart-header">
                            <div class="metawrap">
                                <div class="meta">
                                    <span>总用户数</span>
                                </div>
                                <div class="total">${user}</div>
                            </div>
                        </div>
                        <div class="chart-body">
                            <div class="contentwrap">
                                床前明月光
                            </div>
                        </div>
                        <div class="chart-footer">
                            <div class="field">
                                <span>日注册量</span>
                                <span>0</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-col-sm6 layui-col-md3">
                <div class="layui-card">
                    <div class="layui-card-body chart-card">
                        <div class="chart-header">
                            <div class="metawrap">
                                <div class="meta">
                                    <span>总菜单数</span>
                                </div>
                                <div class="total">${caidan}</div>
                            </div>
                        </div>
                        <div class="chart-body">
                            <div class="contentwrap">
                                疑是地上霜
                            </div>
                        </div>
                        <div class="chart-footer">
                            <div class="field">
                                <span>日注册量</span>
                                <span>0</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-col-sm6 layui-col-md3">
                <div class="layui-card">
                    <div class="layui-card-body chart-card">
                        <div class="chart-header">
                            <div class="metawrap">
                                <div class="meta">
                                    <span>总页面数</span>
                                </div>
                                <div class="total">${yemian}</div>
                            </div>
                        </div>
                        <div class="chart-body">
                            <div class="contentwrap">
                                举头望明月
                            </div>
                        </div>
                        <div class="chart-footer">
                            <div class="field">
                                <span>日注册量</span>
                                <span>0</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-col-sm6 layui-col-md3">
                <div class="layui-card">
                    <div class="layui-card-body chart-card">
                        <div class="chart-header">
                            <div class="metawrap">
                                <div class="meta">
                                    <span>总按钮数</span>
                                </div>
                                <div class="total">${anniu}</div>
                            </div>
                        </div>
                        <div class="chart-body">
                            <div class="contentwrap">
                                低头思故乡
                            </div>
                        </div>
                        <div class="chart-footer">
                            <div class="field">
                                <span>日注册量</span>
                                <span>0</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-col-sm12 layui-col-md12">
                <div class="layui-card">
                    <div class="layui-tab layui-tab-brief">
                        <ul class="layui-tab-title">
                            <li class="layui-this">新增数</li>
                            <li>活跃度</li>
                        </ul>
                        <div class="layui-tab-content">
                            <div class="layui-tab-item layui-show">
                                0
                            </div>
                            <div class="layui-tab-item">
                                0
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../assets/layui.all.js"></script>
    <script>
     var element = layui.element;
    </script>
</body>
</html>