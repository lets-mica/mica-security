// 判断时候在Iframe框架内,在则刷新父页面
if (self != top) {
    parent.location.reload(true);
    if (!!(window.attachEvent && !window.opera)) {
        document.execCommand("stop");
    } else {
        window.stop();
    }
}
$(function() {
    //获取焦点样式
    $("#loginform :input").focus(function () {
        $(this).parent().addClass("actived");
    }).blur(function () {
        $(this).parent().removeClass("actived");
    });
    // 刷新验证码
    $("#captcha").click(function() {
        var $this = $(this);
        var url = $this.data("src") + new Date().getTime();
        $this.attr("src", url);
    });
    // 登录
    $('#loginform').form({
        url: basePath + '/session',
        onSubmit : function() {
            progressLoad();
            var isValid = $(this).form('validate');
            if (!isValid) {
                progressClose();
            }
            return isValid;
        },
        success:function(result){
            progressClose();
            result = $.parseJSON(result);
            if (result.code === 1) {
                window.location.href = basePath + '/main';
            }else{
                // 刷新验证码
                $("#captcha")[0].click();
                showWarnMsg(result.msg);
            }
        }
    });
});
//回车登陆
document.onkeydown = function() {
    if (event.keyCode == 13){
        event.returnValue=false;
        event.cancel = true;
        $('#loginform').submit();
    }
}
