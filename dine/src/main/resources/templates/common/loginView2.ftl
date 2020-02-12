<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>登录</title>
    <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/css/normalize.css">
    <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/css/login.css">
    <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/css/sign-up-login.css">
    <link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/font-awesome/4.6.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/css/inputEffect.css"/>
    <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/css/tooltips.css"/>
    <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/css/spop.min.css"/>

    <script>var contextPath = "${springMacroRequestContext.contextPath}"; </script>
    <script src="${springMacroRequestContext.contextPath}/js/jquery.min.js"></script>
    <script src="${springMacroRequestContext.contextPath}/js/snow.js"></script>
    <script src="${springMacroRequestContext.contextPath}/js/jquery.pure.tooltips.js"></script>
    <script src="${springMacroRequestContext.contextPath}/js/spop.min.js"></script>

    <style type="text/css">
        html {
            width: 100%;
            height: 100%;
        }

        body {

            background-repeat: no-repeat;

            background-position: center center #2D0F0F;

            background-color: #00BDDC;

            background-image: url(${springMacroRequestContext.contextPath}/images/snow.jpg);

            background-size: 100% 100%;

        }

        .snow-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 100001;
        }

    </style>
</head>
<body>
<!-- 雪花背景 -->
<div class="snow-container"></div>
<!-- 登录控件 -->
<div id="login">
    <input id="tab-1" type="radio" name="tab" class="sign-in hidden" checked/>
    <input id="tab-2" type="radio" name="tab" class="sign-up hidden"/>
    <input id="tab-3" type="radio" name="tab" class="sign-out hidden"/>
    <div class="wrapper">
        <!-- 登录页面 -->
        <div class="login sign-in-htm">
            <form class="container offset1 loginform">
                <!-- 猫头鹰控件 -->
                <div id="owl-login" class="login-owl">
                    <div class="hand"></div>
                    <div class="hand hand-r"></div>
                    <div class="arms">
                        <div class="arm"></div>
                        <div class="arm arm-r"></div>
                    </div>
                </div>
                <div class="pad input-container">
                    <section class="content">
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" id="login-username"
                                       name="username"
                                       autocomplete="off" placeholder="请输入手机号" tabindex="1" maxlength="15"/>
								<label class="input__label input__label--hideo" for="login-username">
									<i class="fa fa-fw fa-user icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                        <span class="input input--hideo">
								<input class="input__field input__field--hideo" type="password" name="password"
                                       id="login-password" placeholder="请输入密码" tabindex="2" maxlength="15"/>
								<label class="input__label input__label--hideo" for="login-password">
									<i class="fa fa-fw fa-lock icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                    </section>
                </div>
                <div class="form-actions">
                    <a tabindex="4" class="btn pull-left btn-link text-muted" onClick="goto_forget()">忘记密码?</a>
                    <a tabindex="5" class="btn btn-link text-muted" onClick="goto_register()">注册</a>
                    <input class="btn btn-primary" type="button" tabindex="3" onClick="login()" value="登录"
                           style="color:white;"/>
                </div>
            </form>
        </div>
        <!-- 忘记密码页面 -->
        <div class="login sign-out-htm">
            <form action="#" method="post" class="container offset1 loginform">
                <!-- 猫头鹰控件 -->
                <div id="owl-login" class="forget-owl">
                    <div class="hand"></div>
                    <div class="hand hand-r"></div>
                    <div class="arms">
                        <div class="arm"></div>
                        <div class="arm arm-r"></div>
                    </div>
                </div>
                <div class="pad input-container">
                    <section class="content">
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" id="forget-username"
                                       autocomplete="off" placeholder="请输入用户名"/>
								<label class="input__label input__label--hideo" for="forget-username">
									<i class="fa fa-fw fa-user icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                        <span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" id="forget-code"
                                       autocomplete="off" placeholder="请输入注册码"/>
								<label class="input__label input__label--hideo" for="forget-code">
									<i class="fa fa-fw fa-wifi icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                        <span class="input input--hideo">
								<input class="input__field input__field--hideo" type="password" id="forget-password"
                                       placeholder="请重置密码"/>
								<label class="input__label input__label--hideo" for="forget-password">
									<i class="fa fa-fw fa-lock icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                    </section>
                </div>
                <div class="form-actions">
                    <a class="btn pull-left btn-link text-muted" onClick="goto_login()">返回登录</a>
                    <input class="btn btn-primary" type="button" onClick="forget()" value="重置密码"
                           style="color:white;"/>
                </div>
            </form>
        </div>
        <!-- 注册页面 -->
        <div class="login sign-up-htm">
            <form action="#" method="post" class="container offset1 loginform">
                <!-- 猫头鹰控件 -->
                <div id="owl-login" class="register-owl">
                    <div class="hand"></div>
                    <div class="hand hand-r"></div>
                    <div class="arms">
                        <div class="arm"></div>
                        <div class="arm arm-r"></div>
                    </div>
                </div>
                <div class="pad input-container">
                    <section class="content">
                        <span class="input input--hideo">
                            <input class="input__field input__field--hideo" type="text" id="register-username"
                                   autocomplete="off" placeholder="请输入用户名" maxlength="15"/>
                            <label class="input__label input__label--hideo" for="register-username">
                                <i class="fa fa-fw fa-user icon icon--hideo"></i>
                                <span class="input__label-content input__label-content--hideo"></span>
                            </label>
                        </span>
                        <span class="input input--hideo">
                            <input class="input__field input__field--hideo" type="text" id="register-phone"
                                   autocomplete="off" placeholder="请输入手机号" maxlength="15"/>
                            <label class="input__label input__label--hideo" for="register-phone">
                                <i class="fa fa-fw fa-user icon icon--hideo"></i>
                                <span class="input__label-content input__label-content--hideo"></span>
                            </label>
                        </span>
                        <span class="input input--hideo">
                            <input class="input__field input__field--hideo" type="password" id="register-password"
                                   placeholder="请输入密码" maxlength="15"/>
                            <label class="input__label input__label--hideo" for="register-password">
                                <i class="fa fa-fw fa-lock icon icon--hideo"></i>
                                <span class="input__label-content input__label-content--hideo"></span>
                            </label>
                        </span>
                        <span class="input input--hideo">
                            <input class="input__field input__field--hideo" type="password" id="register-repassword"
                                   placeholder="请确认密码" maxlength="15"/>
                            <label class="input__label input__label--hideo" for="register-repassword">
                                <i class="fa fa-fw fa-lock icon icon--hideo"></i>
                                <span class="input__label-content input__label-content--hideo"></span>
                            </label>
                        </span>
                        <span class="input input--hideo">
                            <input class="input__field input__field--hideo" type="text" id="register-code"
                                   autocomplete="off" placeholder="请输入注册码"/>
                            <label class="input__label input__label--hideo" for="register-code">
                                <i class="fa fa-fw fa-wifi icon icon--hideo"></i>
                                <span class="input__label-content input__label-content--hideo"></span>
                            </label>
                        </span>
                    </section>
                </div>
                <div class="form-actions">
                    <a class="btn pull-left btn-link text-muted" onClick="goto_login()">返回登录</a>
                    <input class="btn btn-primary" type="button" onClick="register()" value="注册"
                           style="color:white;"/>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<#--自动机定义的本地js请求-->
<script src="../../js/login.js" th:src="@{/js/login.js}"></script>
</html>