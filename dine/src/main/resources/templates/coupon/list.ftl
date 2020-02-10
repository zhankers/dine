<html>
<#include "../common/header.ftl">

<body>
<div id="wrapper" class="toggled">

<#--边栏sidebar-->
    <#include "../common/nav.ftl">

<#--主要内容content-->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <table class="table table-bordered table-condensed">
                        <thead>
                        <tr>
                            <th>优惠券ID</th>
                            <th>名称</th>
                            <th>类型</th>
                            <th>满减价格</th>
                            <th>优惠价格</th>
                            <th>数量</th>
                            <th>描述</th>
                            <th>开始时间</th>
                            <th>过期时间</th>
                            <th>创建时间</th>
                            <th colspan="2">操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        <#list couponPage.content as coupon>
                        <tr>
                            <td>${coupon.id}</td>
                            <td>${coupon.name}</td>
                            <td>${coupon.type}></td>
                            <td>${coupon.fullMoney}</td>
                            <td>${coupon.money}</td>
                            <td>${coupon.number}</td>
                            <td>${(coupon.remarks)!''}</td>
                            <td>${coupon.startTime}</td>
                            <td>${coupon.endTime}</td>
                            <td>${coupon.createTime}</td>
                            <td><a href="${springMacroRequestContext.contextPath}/seller/coupon/index?couponId=${coupon.id}">修改</a></td>
                        </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>

            <#--分页-->
                <div class="col-md-12 column">
                    <ul class="pagination pull-right">
                    <#if currentPage lte 1>
                        <li class="disabled"><a href="#">上一页</a></li>
                    <#else>
                        <li><a href="${springMacroRequestContext.contextPath}/seller/coupon/list?page=${currentPage - 1}&size=${size}">上一页</a></li>
                    </#if>

                    <#list 1..couponPage.getTotalPages() as index>
                        <#if currentPage == index>
                            <li class="disabled"><a href="#">${index}</a></li>
                        <#else>
                            <li><a href="${springMacroRequestContext.contextPath}/seller/coupon/list?page=${index}&size=${size}">${index}</a></li>
                        </#if>
                    </#list>

                    <#if currentPage gte couponPage.getTotalPages()>
                        <li class="disabled"><a href="#">下一页</a></li>
                    <#else>
                        <li><a href="${springMacroRequestContext.contextPath}/seller/coupon/list?page=${currentPage + 1}&size=${size}">下一页</a></li>
                    </#if>
                    </ul>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>