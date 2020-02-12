(function () {
    // trim polyfill : https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim
    if (!String.prototype.trim) {
        (function () {
            // Make sure we trim BOM and NBSP
            var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
            String.prototype.trim = function () {
                return this.replace(rtrim, '');
            };
        })();
    }
})();

function login() {//登录

    var username = $("#login-username").val(),
        password = $("#login-password").val();

    //登录
    //调用后台登录验证的方法
    $.ajax({
        url: contextPath + "/admin/loginAdmin",
        data: {
            "phone": username,
            "password": password
        },
        success: function (data) {
            console.log("登录成功", data);
            window.location.href = contextPath + "/seller/order/list";
        },
        error: function (err) {
            console.log("登录失败,用户名或者密码不正确", err);
            alert("登录失败,手机号或者密码不正确");
            toastr.error("error!");
        }
    });

}

//注册
function register() {
    var username = $("#register-username").val(),
        phone = $("#register-phone").val(),
        password = $("#register-password").val(),
        repassword = $("#register-repassword").val(),
        code = $("#register-code").val(),
        flag = false,
        validatecode = null;
    //判断用户名密码是否为空
    if (username == "") {
        $.pt({
            target: $("#register-username"),
            position: 'r',
            align: 't',
            width: 'auto',
            height: 'auto',
            content: "用户名不能为空"
        });
        flag = true;
    }

    if (phone == "") {
        $.pt({
            target: $("#register-phone"),
            position: 'r',
            align: 't',
            width: 'auto',
            height: 'auto',
            content: "手机号不能为空"
        });
        flag = true;
    }

    if (password == "") {
        $.pt({
            target: $("#register-password"),
            position: 'r',
            align: 't',
            width: 'auto',
            height: 'auto',
            content: "密码不能为空"
        });
        flag = true;
    } else {
        if (password != repassword) {
            $.pt({
                target: $("#register-repassword"),
                position: 'r',
                align: 't',
                width: 'auto',
                height: 'auto',
                content: "两次输入的密码不一致"
            });
            flag = true;
        }
    }
    //用户名只能是15位以下的字母或数字
    var regExp = new RegExp("^1(3|4|5|7|8)\\d{9}$");
    if (!regExp.test(phone)) {
        $.pt({
            target: $("#register-phone"),
            position: 'r',
            align: 't',
            width: 'auto',
            height: 'auto',
            content: "手机号不正确"
        });
        flag = true;
    }
    //检查用户名是否已经存在
    //调后台代码检查用户名是否已经被注册

    //检查注册码是否正确
    //调后台方法检查注册码，这里写死为1111
    if (code != '1111') {
        $.pt({
            target: $("#register-code"),
            position: 'r',
            align: 't',
            width: 'auto',
            height: 'auto',
            content: "注册码不正确"
        });
        flag = true;
    }


    if (flag) {
        return false;
    } else {//注册

        $.ajax({
            url: contextPath + "/admin/regAdmin",
            data: {
                "phone": phone,
                "username": username,
                "password": password,
                "repassword": repassword,
            },
            success: function (data) {
                spop({
                    template: '<h4 class="spop-title">注册成功</h4>即将于3秒后返回登录',
                    position: 'top-center',
                    style: 'success',
                    autoclose: 3000,
                    onOpen: function () {
                        var second = 2;
                        var showPop = setInterval(function () {
                            if (second == 0) {
                                clearInterval(showPop);
                            }
                            $('.spop-body').html('<h4 class="spop-title">注册成功</h4>即将于' + second + '秒后返回登录');
                            second--;
                        }, 1000);
                    },
                    onClose: function () {
                        goto_login();
                    }
                });
            },
            error: function (err) {
                console.log("注册失败,用户名或者密码不正确", err);
                alert("注册失败,手机号或者密码不正确");
                toastr.error("error!");
            }
        });

    }
}

//重置密码
function forget() {
    var username = $("#forget-username").val(),
        password = $("#forget-password").val(),
        code = $("#forget-code").val(),
        flag = false,
        validatecode = null;
    //判断用户名密码是否为空
    if (username == "") {
        $.pt({
            target: $("#forget-username"),
            position: 'r',
            align: 't',
            width: 'auto',
            height: 'auto',
            content: "用户名不能为空"
        });
        flag = true;
    }
    if (password == "") {
        $.pt({
            target: $("#forget-password"),
            position: 'r',
            align: 't',
            width: 'auto',
            height: 'auto',
            content: "密码不能为空"
        });
        flag = true;
    }
    //用户名只能是15位以下的字母或数字
    var regExp = new RegExp("^[a-zA-Z0-9_]{1,15}$");
    if (!regExp.test(username)) {
        $.pt({
            target: $("#forget-username"),
            position: 'r',
            align: 't',
            width: 'auto',
            height: 'auto',
            content: "用户名必须为15位以下的字母或数字"
        });
        flag = true;
    }
    //检查用户名是否存在
    //调后台方法

    //检查注册码是否正确
    if (code != '11111111') {
        $.pt({
            target: $("#forget-code"),
            position: 'r',
            align: 't',
            width: 'auto',
            height: 'auto',
            content: "注册码不正确"
        });
        flag = true;
    }


    if (flag) {
        return false;
    } else {//重置密码
        spop({
            template: '<h4 class="spop-title">重置密码成功</h4>即将于3秒后返回登录',
            position: 'top-center',
            style: 'success',
            autoclose: 3000,
            onOpen: function () {
                var second = 2;
                var showPop = setInterval(function () {
                    if (second == 0) {
                        clearInterval(showPop);
                    }
                    $('.spop-body').html('<h4 class="spop-title">重置密码成功</h4>即将于' + second + '秒后返回登录');
                    second--;
                }, 1000);
            },
            onClose: function () {
                goto_login();
            }
        });
        return false;
    }
}