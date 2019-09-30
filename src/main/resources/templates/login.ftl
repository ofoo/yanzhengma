<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>首页</title>

    <!-- Bootstrap -->
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/verify-code/font-awesome_4.4.0/font-awesome.min.css" rel="stylesheet"/>
    <link href="/verify-code/verify.css" rel="stylesheet"/>

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="/bootstrap/js/html5shiv.min.js"></script>
    <script src="/bootstrap/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<input type="hidden" name="gapLeft" value="0"/>
<input type="hidden" name="moveLeft" value="0"/>
<div id="verifyWrap"></div>
<button class="btn btn-primary" id="loginBtn">验证</button>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="/bootstrap/js/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/verify-code/verify-code.js"></script>
<script>
    $(function(){
        //执行滑动验证码方法
        verifyFn('320','160','320',function (gapLeft,moveLeft) {//回调
            $("[name='gapLeft']").val(gapLeft);
            $("[name='moveLeft']").val(moveLeft);
            $(".errorMessage").hide();
        });
        $("#loginBtn").on("click",function(){
            var gapLeft = $('input[name="gapLeft"]').val();
            var moveLeft = $('input[name="moveLeft"]').val();
            $.ajax({
                url:"/doLogin",
                data:{
                    "gapLeft":gapLeft,
                    "moveLeft":moveLeft
                },
                dataType:"json",
                type:"post",
                success:function (result) {
                    if (result) {
                        alert("验证成功");
                    } else {
                        alert("验证失败");
                    }
                },
                error:function (error) {

                }
            });
        })
    })
</script>
</body>
</html>