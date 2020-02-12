<#include "../common/common.ftl">
<@contentWrapper>
<div class="ms-content-wrapper">
    <div class="row">
        <!-- Total Earnings -->
        <!-- Recent Placed Orders< -->
        <div class="col-12">
            <div class="col-md-12 column">
                <form role="form" method="post" action="${springMacroRequestContext.contextPath}/admin/save">
                    <div class="form-group">
                        <label>名字</label>
                        <input name="username" type="text" class="form-control"
                               value="${(category.username)!''}"/>
                    </div>
                    <div class="form-group">
                        <label>密码</label>
                        <input name="password" type="text" class="form-control"
                               value="${(category.password)!''}"/>
                    </div>
                    <div class="form-group">
                        <label>手机号</label>
                        <input name="phone" type="text" class="form-control"
                               value="${(category.phone)!''}"/>
                    </div>
                    <input hidden type="text" name="sellerId"
                           value="${(category.sellerId)!''}">
                    <button type="submit" class="btn btn-default">提交</button>
                </form>
            </div>
        </div>
    </div>
</div>
</@contentWrapper>