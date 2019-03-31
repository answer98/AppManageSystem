<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>App管理系统</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="/jsp/common/header.jsp"/>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <h2>软件基本信息</h2>
                <input type="hidden" name="id" value="${app.id}">
                <div class="layui-form-item">
                    <label class="layui-form-label">软件名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="softwareName" lay-verify="title" autocomplete="off" placeholder="请输入软件名称" class="layui-input" value="${app.softwareName}">
                    </div>
                    <label class="layui-form-label">APK名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="apkName" lay-verify="title" autocomplete="off" placeholder="请输入APK名称" class="layui-input" value="${app.apkName}">
                    </div>
                    <label class="layui-form-label">支持ROM</label>
                    <div class="layui-input-inline">
                        <input type="text" name="supportRom" lay-verify="title" autocomplete="off" placeholder="请输入ROM名称" class="layui-input" value="${app.supportRom}">
                    </div>
                    <label class="layui-form-label">界面语言</label>
                    <div class="layui-input-inline">
                        <input type="text" name="interfaceLanguage" lay-verify="title" autocomplete="off" placeholder="请输入界面语言" class="layui-input" value="${app.interfaceLanguage}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">应用简介</label>
                    <div class="layui-input-inline">
                        <input type="text" name="appInfo" lay-verify="title" autocomplete="off" placeholder="请输入应用简介" class="layui-input" value="${app.appInfo}">
                    </div>
                    <label class="layui-form-label">软件大小</label>
                    <div class="layui-input-inline">
                        <input type="text" name="softwareSize" lay-verify="title" autocomplete="off" placeholder="请输入软件大小" class="layui-input" value="${app.softwareSize}">
                    </div>

                </div>
            <h2>历史版本信息</h2>
            <table class="layui-table">
                <thead>
                    <tr>
                        <th>版本编号</th>
                        <th>APK文件名称</th>
                        <th>APK位置</th>
                        <th>下载链接</th>
                        <th>版本大小</th>
                        <th>版本信息</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${app.appVersions}" var="obj">
                        <tr>
                            <td>${obj.versionNo}</td>
                            <td>${obj.apkFilename}</td>
                            <td>${obj.apklocPath}</td>
                            <td><a href="${obj.downloadLink}">下载</a></td>
                            <td>${obj.versionSize}</td>
                            <td>${obj.versionInfo}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <jsp:include page="/jsp/common/footer.jsp"/>
</div>
<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use(['element','form','jquery'], function(){
        var element = layui.element;
        var form = layui.form;
        var $ = layui.jquery;
    });
</script>
</body>

</html>

