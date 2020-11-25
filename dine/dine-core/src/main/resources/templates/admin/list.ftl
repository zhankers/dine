<#include "../common/common.ftl">
<@contentWrapper>
<div class="ms-content-wrapper">
    <div class="row">
        <!-- Total Earnings -->
        <!-- Recent Placed Orders< -->
        <div class="col-12">
            <div class="ms-panel">
                <div class="ms-panel-header">
                    <h6>管理员</h6>
                </div>
                <div class="ms-panel-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-condensed table-hover thead-primary">
                            <thead>
                            <tr>
                                <th scope="col">类目id</th>
                                <th scope="col">名字</th>
                                <th scope="col">密码</th>
                                <th scope="col">手机号</th>
                                <th scope="col">创建时间</th>
                                <th scope="col">修改时间</th>
                                <th scope="col">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list categoryList as category>
                            <tr>
                                <td>${category.sellerId}</td>
                                <td>${category.username}</td>
                                <td>${category.password}</td>
                                <td>${category.phone}</td>
                                <td>${category.createTime}</td>
                                <td>${category.updateTime}</td>
                                <td><a href="${springMacroRequestContext.contextPath}/admin/index?sellerId=${category.sellerId}">修改</a></td>
                            </tr>
                            </#list>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</@contentWrapper>