<%--
  Created by IntelliJ IDEA.
  User: savior
  Date: 2021/4/4
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>社团列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/metro.min.css" />
    <script src="${pageContext.request.contextPath }/static/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath }/static/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
        /*点击按钮
        * 弹出模态框显示社团信息，通过表单内的stunum查询出社长信息返回，在模态框中显示
        * */
        function showorg_ma(num) {
            $.ajax({
                type:"GET",
                data:{num:num},
                url:"/comm/showMa",
                success:function (msg) {
                    if (msg){

                        //将后端传出的数据进行存储放入模态框中
                        $("#org_name").val(msg.org.name);
                        $("#manager_num").val(msg.manager.num);
                        $("#manager_name").val(msg.manager.name);
                        $("#manager_clasroom").val(msg.manager.classroom);
                        $("#org_info").val(msg.org.info);
                        $("#org_stu_num").val(msg.count);
                        $("#org_id").val(msg.org.id);


                        $("#orginfo").modal("show");
                    }else {
                        alert("操作失败，请稍后再试！")
                    }
                }
            })
        }

        function joinorg() {
            var org_id=$("#org_id").val();
            $.ajax({
                url:"/comm/joinorg",
                data:{org_id:org_id},
                type: "POST",
                success:function (msg) {
                    if (msg){
                        if (msg=="success"){
                            alert("申请成功，请等待管理员审核！");
                            window.location.href="/comm/orglist";
                        }else if (msg=="wrong"){
                            alert("申请失败，请稍后再试");
                            window.location.href="/comm/orglist";
                        }
                    }else {
                        alert("你已申请或已经加入该社团");
                        window.location.href="/comm/orglist";
                    }
                }
            })
        }

        function findorg(orgname,stu_name) {
            //alert(orgname);
            $.ajax({
                url:"/comm/orglist",
                data:{name:orgname,stu_name:stu_name},
                type: "GET",
                /*success:function (msg) {
                    if (msg){
                        $('#findactname').val('');
                        $('#findactstuname').val('');
                        alert("查找成功了！")
                    }else {
                        alert("未查到有用信息！");
                        window.location.href="/comm/orglist";
                    }
                }*/
            })
        }


    </script>
</head>
<body style="background:transparent;">
<h1 style="text-align: center;font-family: '微软雅黑', '宋体';color: #2e6da4">社团列表</h1>

<div class="container-fluid">
    <div class="row">

        <div class="col-md-12 input-group input-group-lg">
            <form action="/comm/orglist">

                <input class="text form-control" placeholder="请输入社团名字" id="name" name="name" style="width: 450px" value="${name}">
                <input class="text form-control" placeholder="请输入社团管理员名字" id="stu_name" name="stu_name" style="width: 450px;margin-left: 10px" value="${stu_name}">
                <button class="btn btn-info" role="group" <%--onclick="findorg($('#findorgname').val(),$('#stu_name').val())"--%>
                type="submit"
                >查询</button>
            </form>

        </div>
        <div class="col-md-12">
            <table class="table table-hover">
                <thead>
                <tr>
                    <td>社团编号</td>
                    <td>社团名称</td>
                    <td>社团负责人</td>
                    <td>ss</td>
                    <td>社团状态</td>
                    <td>创建社团时间</td>
                    <td>操作</td>
                </tr>
                </thead>
                <c:forEach items="${orglist.list}" var="org">
                    <tr>
                        <td>${org.id}</td>
                        <td>${org.name}</td>
                        <td>${org.manager.name}</td>
                        <td>${org.managernum}</td>
                        <td>${org.statu==1?"正常":"审核中"}</td>
                        <td>${org.create_time}</td>
                        <td><button type="button" class="btn btn-primary" onclick="showorg_ma(${org.managernum})" <c:if test="${org.statu==0}">disabled</c:if>>
                            查看详情
                        </button></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
          当前第${orglist.pageNum}页，总共${orglist.pages}页，共${orglist.total}条记录。
        </div>
        <div class="col-md-6">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="/comm/orglist?pn=1&name=${name}&stu_name=${stu_name}">首页</a> </li>
                    <c:if test="${orglist.hasPreviousPage}">
                        <li class="page-item">
                            <a class="page-link" href="/comm/orglist?pn=${orglist.pageNum-1}&name=${name}&stu_name=${stu_name}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach items="${orglist.navigatepageNums}" var="page">
                        <li class="page-item"><a class="page-link" href="/comm/orglist?pn=${page}&name=${name}&stu_name=${stu_name}">${page}</a></li>
                    </c:forEach>
                    <c:if test="${orglist.hasNextPage}">
                        <li class="page-item">
                            <a class="page-link" href="/comm/orglist?pn=${orglist.pageNum+1}&name=${name}&stu_name=${stu_name}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <li class="page-item"><a class="page-link" href="/comm/orglist?pn=${orglist.pages}&name=${name}&stu_name=${stu_name}">末页</a> </li>

                </ul>
            </nav>
        </div>
    </div>
</div>



<%--社团详情模态框--%>
<div class="modal fade" id="orginfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">社团详情</h4>
            </div>
            <div class="modal-body">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-block">
                            <form class="form-horizontal form-material">
                                <div class="form-group">
                                    <label class="col-md-12">社团名字</label>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control form-control-line" id="org_name" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-6">管理员学号</label>
                                    <label class="col-md-6">管理员姓名</label>
                                    <div class="col-md-6">
                                        <input type="test" class="form-control form-control-line" id="manager_num" readonly>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="test" class="form-control form-control-line" id="manager_name" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">管理员班级</label>
                                    <div class="col-md-12">
                                        <input type="test" class="form-control form-control-line" id="manager_clasroom" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">社团简介</label>
                                    <div class="col-md-12">
                                        <input type="test" class="form-control form-control-line" id="org_info" style="height: 150px" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-6">社团人数</label>
                                    <label class="col-md-6">社团编号</label>
                                    <div class="col-md-6">
                                        <input type="test" class="form-control form-control-line" id="org_stu_num" readonly>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="test" class="form-control form-control-line" id="org_id" readonly>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="joinorg()">申请加入社团</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>
