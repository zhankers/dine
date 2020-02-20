<#include "../common/common.ftl">
<@contentWrapper>
<div class="ms-content-wrapper">
    <div class="row">
        <!-- Total Earnings -->
        <!-- Recent Placed Orders< -->
        <div class="col-12">
            <div class="ms-panel">
                <div class="ms-panel-header">
                    <h6>优惠券</h6>
                </div>
                <div class="ms-panel-body">
                    <div class="table-responsive">

                        <table class="table table-hover thead-primary">
                            <thead>
                            <tr>
                                <th scope="col">优惠券ID</th>
                                <th scope="col">名称</th>
                                <th scope="col">类型</th>
                                <th scope="col">满减价格</th>
                                <th scope="col">优惠价格</th>
                                <th scope="col">数量</th>
                                <th scope="col">描述</th>
                                <th scope="col">开始时间</th>
                                <th scope="col">过期时间</th>
                                <th scope="col">创建时间</th>
                                <th  scope="col" colspan="2">操作</th>
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
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12 col-md-5">
            <div class="dataTables_info" id="data-table-6_info" role="status" aria-live="polite">
                Showing ${currentPage} to ${couponPage.getTotalPages()} of ${couponPage.totalElements} entries
            </div>
        </div>
        <div class="col-sm-12 col-md-7">
            <div class="dataTables_paginate paging_simple_numbers" id="data-table-6_paginate">
                <ul class="pagination has-gap">
                    <#if currentPage lte 1>
                        <li class="paginate_button page-item previous" id="data-table-6_previous">
                            <a href="#" aria-controls="data-table-6" data-dt-idx="0" tabindex="0" class="page-link">上一页</a>
                        </li>
                    <#else>
                        <li class="paginate_button page-item previous" id="data-table-6_previous">
                            <a href="${springMacroRequestContext.contextPath}/seller/coupon/list?page=${currentPage - 1}&size=${size}" a
                               ria-controls="data-table-6" data-dt-idx="0" tabindex="0" class="page-link">上一页</a>
                        </li>
                    </#if>

                    <#list 1..couponPage.getTotalPages() as index>
                        <#if currentPage == index>
                            <li class=" paginate_button page-item ">
                                <a href="#" aria-controls="data-table-6" data-dt-idx="3" tabindex="0" class="page-link">${index}</a>
                            </li>
                        <#else>
                            <li class=" paginate_button page-item ">
                                <a href="${springMacroRequestContext.contextPath}/seller/coupon/list?page=${index}&size=${size}"
                                   aria-controls="data-table-6" data-dt-idx="3" tabindex="0" class="page-link">${index}</a>
                            </li>
                        </#if>
                    </#list>

                    <#if currentPage gte couponPage.getTotalPages()>
                        <li class=" paginate_button page-item previous" id="data-table-6_previous">
                            <a href="#" aria-controls="data-table-6" data-dt-idx="0" tabindex="0" class="page-link">下一页</a>
                        </li>
                    <#else>
                        <li class="paginate_button page-item next disabled" id="data-table-6_next">
                            <a href="${springMacroRequestContext.contextPath}/seller/coupon/list?page=${currentPage + 1}&size=${size}"
                               aria-controls="data-table-6" data-dt-idx="5" tabindex="0" class="page-link">下一页</a>
                        </li>
                    </#if>
                </ul>
            </div>
        </div>
    </div>
</div>
</@contentWrapper>