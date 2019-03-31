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
            <form action="${ctx}/app/add" class="layui-form" method="post">
                <div class="layui-form-item">
                    <label class="layui-form-label">软件名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="softwareName" lay-verify="title" autocomplete="off" placeholder="请输入软件名称" class="layui-input">
                    </div>
                    <label class="layui-form-label">APK名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="apkName" lay-verify="title" autocomplete="off" placeholder="请输入APK名称" class="layui-input">
                    </div>
                    <label class="layui-form-label">支持ROM</label>
                    <div class="layui-input-inline">
                        <input type="text" name="supportRom" lay-verify="title" autocomplete="off" placeholder="请输入ROM名称" class="layui-input">
                    </div>
                    <label class="layui-form-label">界面语言</label>
                    <div class="layui-input-inline">
                        <input type="text" name="interfaceLanguage" lay-verify="title" autocomplete="off" placeholder="请输入界面语言" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">应用简介</label>
                    <div class="layui-input-inline">
                        <input type="text" name="appInfo" lay-verify="title" autocomplete="off" placeholder="请输入应用简介" class="layui-input">
                    </div>
                    <label class="layui-form-label">软件大小</label>
                    <div class="layui-input-inline">
                        <input type="text" name="softwareSize" lay-verify="title" autocomplete="off" placeholder="请输入软件大小" class="layui-input">
                    </div>
                    <label class="layui-form-label">APP状态</label>
                    <div class="layui-input-inline">
                        <select name="status" lay-filter="status">
                            <option value="">-请选择-</option>
                            <c:forEach items="${appStatuses}" var="obj">
                                <option value="${obj.valueId}">${obj.valueName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <label class="layui-form-label">所属平台</label>
                    <div class="layui-input-inline">
                        <select lay-filter="aihao" name="flatform.valueId">
                            <option value="">-请选择-</option>
                            <c:forEach items="${appFlatforms}" var="obj">
                                <option value="${obj.valueId}">${obj.valueName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">一级分类</label>
                    <div class="layui-input-inline">
                        <select name="categoryLevel1.id" id="levelOne" lay-filter="levelOne">
                            <option value="">-请选择-</option>
                            <c:forEach items="${levelOne}" var="obj">
                                <option value="${obj.id}">${obj.categoryName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <label class="layui-form-label">二级分类</label>
                    <div class="layui-input-inline">
                        <select name="categoryLevel2.id" id="levelTwo" lay-filter="levelTwo">
                            <option value="">-请选择-</option>
                        </select>
                    </div>
                    <label class="layui-form-label">三级分类</label>
                    <div class="layui-input-inline">
                        <select name="categoryLevel3.id" id="levelThree" lay-filter="levelThree">
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
        form.render();
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
    });
</script>
</body>

</html>

