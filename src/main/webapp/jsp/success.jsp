<%--
  Created by IntelliJ IDEA.
  User: savior
  Date: 2021/3/31
  Time: 0:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>成功</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/bootstrap.min.css" />
    <script src="${pageContext.request.contextPath }/static/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <style type="text/css">
        #div-bgimg {
            width: 100%;
            height: 100%;
            z-index: -1;
            position: absolute;
            left: 0px;
        }

        #bgimg {
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body style="background-color: #9d9d9d">
<div id="div-bgimg">
    <img src="${pageContext.request.contextPath }/static/img/mainbg.jpg"
         id="bgimg" />
</div>
<p style="text-align: center"><img src="/static/img/success.jpg" class="img-circle" width="300" height="300" align="middle" style="margin-top: 150px"></p>
<div class="container" style="text-align: center">
    <div class="row" style="text-align: center">
        <div class="col-xs-6 col-md-4">
        </div>
        <div class="col-xs-6 col-md-4">

            <h3>
                <h1 style="text-align: center">${sessionScope.msg}</h1>
            </h3>


        </div>
        <div class="col-xs-6 col-md-4"></div>
    </div>
    <button class="btn btn-large btn-success" type="button" style="text-align: center; font-size: 1.5em;margin-top: 20px" onclick=window.location="${sessionScope.url}">确定</button>
</div>

</body>
</html>