<!DOCTYPE html>
<html lang="en">
<#include "header.ftl">
<body class="ms-body ms-primary-theme ms-logged-out">
<!-- Main Content -->
<main class="body-content">
    <!-- Body Content Wrapper -->
    <div class="ms-content-wrapper ms-auth">
        <div class="ms-auth-container">
            <div class="ms-auth-col">
                <div class="ms-auth-bg"></div>
            </div>
            <div class="ms-auth-col">
                <div class="ms-auth-form">
                    <form class="needs-validation" method="post" action="${springMacroRequestContext.contextPath}/admin/loginAdmin" novalidate="">
                        <h3>登录</h3>
                        <p><#--Please enter your telephone and password to continue--></p>
                        <div class="mb-3">
                            <label for="login-username">手机号</label>
                            <div class="input-group">
                                <input type="tel" class="form-control" id="login-username" name="phone"
                                       placeholder="请输入手机号" required="" pattern="^1(3|4|5|7|8)\d{9}$">
                                <div class="invalid-feedback">请输入正确的手机号</div>
                            </div>
                        </div>
                        <div class="mb-2">
                            <label for="login-password">密码</label>
                            <div class="input-group">
                                <#--密码至少包含 数字和英文，长度6-20 ^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$-->
                                <input type="password" class="form-control" id="login-password" name="password" placeholder="请输入密码" required="" pattern="^[0-9A-Za-z]{6,20}$">
                                <div class="invalid-feedback">密码包含 数字或英文，长度6-20</div>
                            </div>
                        </div>
                        <#--<div class="form-group">
                            <label class="ms-checkbox-wrap">
                                <input class="form-check-input" type="checkbox" value=""> <i class="ms-checkbox-check"></i>
                            </label> <span> Remember Password </span>
                            <label class="d-block mt-3"><a href="#" class="btn-link" data-toggle="modal" data-target="#modal-12">Forgot Password?</a>
                            </label>
                        </div>-->
                        <button class="btn btn-primary mt-4 d-block w-100" type="submit" <#--onClick="login()"-->>登录</button>
                        <#--<p class="mb-0 mt-3 text-center">没有账号? <a class="btn-link" href="#">注册账号</a>-->
                        </p>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Forgot Password Modal -->
    <#--<div class="modal fade" id="modal-12" tabindex="-1" role="dialog" aria-labelledby="modal-12">
        <div class="modal-dialog modal-dialog-centered modal-min" role="document">
            <div class="modal-content">
                <div class="modal-body text-center">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                    </button> <i class="flaticon-secure-shield d-block"></i>
                    <h1>Forgot Password?</h1>
                    <p>Enter your email to recover your password</p>
                    <form method="post">
                        <div class="ms-form-group has-icon">
                            <input type="text" placeholder="Email Address" class="form-control" name="forgot-password" value=""> <i class="material-icons">email</i>
                        </div>
                        <button type="submit" class="btn btn-primary shadow-none">Reset Password</button>
                    </form>
                </div>
            </div>
        </div>
    </div>-->
</main>
<#include "script.ftl">
<script src="${springMacroRequestContext.contextPath}/js/login/login-reg.js"></script>
</body>

</html>