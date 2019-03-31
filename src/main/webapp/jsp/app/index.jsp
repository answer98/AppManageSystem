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

            <form class="layui-form" action="${ctx}/app/query" method="post">
                <div class="layui-form-item">
                    <div class="layui-input-inline">
                        <input type="hidden" name="pageNum" lay-verify="title" value="1">
                    </div>
                    <label class="layui-form-label">软件名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="softwareName" lay-verify="title" autocomplete="off" placeholder="请输入软件名称" class="layui-input" value="${appInfoDTO.softwareName}">
                    </div>
                    <label class="layui-form-label">APP状态</label>
                    <div class="layui-input-inline">
                        <select name="appStatus" lay-filter="aihao">
                            <option value="">-请选择-</option>
                            <c:forEach items="${appStatuses}" var="obj">
                                <option value="${obj.id}" <c:if test="${obj.id eq appInfoDTO.appStatus}">
                                        selected
                                    </c:if>>${obj.valueName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <label class="layui-form-label">所属平台</label>
                    <div class="layui-input-inline">
                        <select lay-filter="aihao" name="appFlatform">
                            <option value="">-请选择-</option>
                            <c:forEach items="${appFlatforms}" var="obj">
                                <option value="${obj.id}" <c:if test="${obj.id eq appInfoDTO.appFlatform}">
                                    selected
                                </c:if>>${obj.valueName}</option>
                            </c:forEach>
                        </select>
                    </div>

                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">一级分类</label>
                    <div class="layui-input-inline">
                        <select name="levelOne" id="levelOne" lay-filter="levelOne">
                            <option value="">-请选择-</option>
                            <c:forEach items="${levelOne}" var="obj">
                                <option value="${obj.id}" <c:if test="${obj.id eq appInfoDTO.levelOne}">
                                    selected
                                </c:if>>${obj.categoryName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <label class="layui-form-label">二级分类</label>
                    <div class="layui-input-inline">
                        <select name="levelTwo" id="levelTwo" lay-filter="levelTwo">
                            <option value="">-请选择-</option>
                        </select>
                    </div>
                    <label class="layui-form-label">三级分类</label>
                    <div class="layui-input-inline">
                        <select name="levelThree" id="levelThree" lay-filter="levelThree">
                            <option value="">-请选择-</option>
                        </select>
                    </div>

                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                    </div>
                </div>

            </form>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <a class="layui-btn" href="${ctx}/app/toAdd">新增APP基础信息</a>
                </div>
            </div>
            <table class="layui-table">
                <thead>
                    <tr>
                        <th>软件名称</th>
                        <th>APK名称</th>
                        <th>软件大小（单位M）</th>
                        <th>所属平台</th>
                        <th>所属分类（一级分类，二级分类，三级分类）</th>
                        <th>状态</th>
                        <th>下载次数</th>
                        <th>最新版本号</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${page.list}" var="obj">
                        <tr>
                            <td>${obj.softwareName}</td>
                            <td>${obj.apkName}</td>
                            <td>${obj.softwareSize}</td>
                            <td>${obj.flatform.valueName}</td>
                            <td>
                                ${obj.categoryLevel1.categoryName}->${obj.categoryLevel2.categoryName}->${obj.categoryLevel3.categoryName}
                            </td>
                            <td>${obj.appStatus.valueName}</td>
                            <td>${obj.downloads}</td>
                            <td>${obj.newAppVersion.versionNo}</td>
                            <td>
                                <%--编辑--%>
                                <a href="${ctx}/app/toEdit/${obj.id}" class="layui-btn layui-btn-normal"><i class="layui-icon">&#xe642;</i></a>
                                <%--删除--%>
                                <a href="${ctx}/app/delete/${obj.id}" class="layui-btn layui-btn-danger"><i class="layui-icon">&#xe640;</i></a>
                                <%--详细信息--%>
                                <a href="${ctx}/app/queryById/${obj.id}" class="layui-btn"><i class="layui-icon">&#xe615;</i></a>
                            </td>
                        </tr>
                    </c:forEach>
                <tr>
                    <td>
                        共${page.total}条记录 第${page.pageNum}/${page.pages}页
                    </td>
                    <td colspan="8">
                        <a href="javascript:void(0);"page="first">首页</a>
                        <a href="javascript:void(0);"page="prev">上一页</a>
                        <a href="javascript:void(0);"page="next">下一页</a>
                        <a href="javascript:void(0);"page="last">尾页</a>
                    </td>
                </tr>
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

        //一级分类start--------------------------------
        form.on('select(levelOne)',function () {
            //获取id
            var levelOneId = $('#levelOne').val();
            if(levelOneId == ''){
                //清空levelTwo
                var html = '<option value="">-请选择-</option>';
                //选择levelTwo更新
                $('#levelTwo').html(html);
                form.render();
                return ;
            }else{
                $.ajax({
                    url:'${ctx}/category/queryLevelTwoByLevelOne/'+levelOneId,
                    type:'get',
                    success:function (data) {
                        //根据data修改数据，并重新渲染
                        var html = '<option value="">-请选择-</option>';
                        var len = data.length;
                        var levelTwo = '${appInfoDTO.levelTwo}';
                        for(var i = 0;i < len;i++){
                            html += '<option value="'+data[i].id+'"';
                            if(data[i].id == levelTwo){
                                html += ' selected ';
                            }
                            html+= '>'+data[i].categoryName+'</option>';
                        }
                        //选择levelTwo更新
                        $('#levelTwo').html(html);
                        form.render();
                    }
                })
            }
        });
        //一级分类end----------------------------------

        //二级分类start--------------------------------
        form.on('select(levelTwo)',function () {
            //获取id
            var levelTwoId = $('#levelTwo').val();
            if(levelTwoId == ''){
                //清空levelThree
                var html = '<option value="">-请选择-</option>';
                //选择levelTwo更新
                $('#levelThree').html(html);
                form.render();
                return ;
            }else{
                $.ajax({
                    url:'${ctx}/category/queryLevelThreeByLevelTwo/'+levelTwoId,
                    type:'get',
                    success:function (data) {
                        //根据data修改数据，并重新渲染
                        var html = '<option value="">-请选择-</option>';
                        var len = data.length;
                        for(var i = 0;i < len;i++){
                            html += '<option value="'+data[i].id+'">'+data[i].categoryName+'</option>';
                        }
                        //选择levelThree更新
                        $('#levelThree').html(html);
                        form.render();
                    }
                })
            }
        });
        //二级分类end----------------------------------

        //分页事件start----------------------------------
        $('a[page]').click(function () {
            var pageNum = 1;
            var currPage = '${page.pageNum}';
            var totalPages = '${page.pages}';
            var v = $(this).attr('page');
            switch (v) {
                case "first":
                    pageNum = 1;
                    break;
                case "prev":
                    pageNum = parseInt(currPage) - 1;
                    if(pageNum < 1){
                        pageNum = 1;
                    }
                    break;
                case "next":
                    pageNum = parseInt(currPage) + 1;
                    if(pageNum > totalPages){
                        pageNum = totalPages;
                    }
                    break;
                case "last":
                    pageNum = totalPages;
                    break;
            }

            //更新隐藏域里面的值
            $('input[name=pageNum]').val(pageNum);
            //提交表单
            $('form').submit();
        })
        //分页事件end----------------------------------

        //当非手工改变select值时验证数据
        $(function () {
            //取出一级分类的值
            var levelOne = $('#levelOne').val();
            if(levelOne != '' && levelOne != null){
                var levelTwo = '${appInfoDTO.levelTwo}';
                if(levelTwo != null && levelTwo != undefined && levelTwo != ''){
                    //这里重新渲染二级select
                    $.ajax({
                        url:'${ctx}/category/queryLevelTwoByLevelOne/'+levelOne,
                        type:'get',
                        success:function (data) {
                            //根据data修改数据，并重新渲染
                            var html = '<option value="">-请选择-</option>';
                            var len = data.length;
                            var levelTwo = '${appInfoDTO.levelTwo}';
                            for(var i = 0;i < len;i++){
                                html += '<option value="'+data[i].id+'"';
                                if(data[i].id == levelTwo){
                                    html += ' selected ';
                                }
                                html+= '>'+data[i].categoryName+'</option>';
                            }
                            //选择levelTwo更新
                            $('#levelTwo').html(html);
                            form.render();
                        }
                    })

                    // var levelThree = $('#levelThree').val();
                    var levelThree = '${appInfoDTO.levelThree}';
                    $.ajax({
                            url:'${ctx}/category/queryLevelThreeByLevelTwo/'+levelTwo,
                            type:'get',
                            success:function (data) {
                                //根据data修改数据，并重新渲染
                                var html = '<option value="">-请选择-</option>';
                                var len = data.length;
                                for(var i = 0;i < len;i++){
                                    html += '<option value="'+data[i].id+'"';
                                    if(data[i].id == levelThree){
                                        html += ' selected ';
                                    }
                                    html+= '>'+data[i].categoryName+'</option>';
                                }
                                //选择levelThree更新
                                $('#levelThree').html(html);
                                form.render();
                            }
                        })
                }
            }
        })

    });

</script>
</body>

</html>
