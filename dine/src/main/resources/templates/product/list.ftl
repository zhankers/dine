<#include "../common/common.ftl">
<@contentWrapper>
<div class="ms-content-wrapper">
    <div class="row">
        <!-- Total Earnings -->
        <!-- Recent Placed Orders< -->
        <div class="col-12">
            <div class="ms-panel">
                <div class="ms-panel-header">
                    <h6>商品列表</h6>
                </div>
                <div class="ms-panel-body">
                    <div class="table-responsive">

                        <table class="table table-hover thead-primary">
                            <thead>
                            <tr>
                                <th scope="col">商品id</th>
                                <th scope="col">名称</th>
                                <th scope="col">图片</th>
                                <th scope="col">单价</th>
                                <th scope="col">库存</th>
                                <th scope="col">描述</th>
                                <th scope="col">类目</th>
                                <th scope="col">创建时间</th>
                                <th scope="col">修改时间</th>
                                <th  scope="col" colspan="2">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list productInfoPage.content as productInfo>
                                <tr>
                                    <th scope="row">${productInfo.productId}</th>
                                    <td>${productInfo.productName}</td>
                                    <td><img height="100" width="100" src="${productInfo.productIcon}" alt=""></td>
                                    <td>￥${productInfo.productPrice}</td>
                                    <td>${productInfo.productStock}</td>
                                    <td>${productInfo.productDescription}</td>
                                    <td>${productInfo.categoryType}</td>
                                    <td>${productInfo.createTime}</td>
                                    <td>${productInfo.updateTime}</td>
                                    <td><a href="${springMacroRequestContext.contextPath}/seller/product/index?productId=${productInfo.productId}">修改</a></td>
                                    <td>
                                    <#if productInfo.getProductStatusEnum().message == "在架">
                                        <a href="${springMacroRequestContext.contextPath}/seller/product/off_sale?productId=${productInfo.productId}">下架</a>
                                    <#else>
                                        <a href="${springMacroRequestContext.contextPath}/seller/product/on_sale?productId=${productInfo.productId}">上架</a>
                                    </#if>
                                    </td>
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
                Showing ${currentPage} to ${productInfoPage.getTotalPages()} of ${productInfoPage.totalElements} entries
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
                            <a href="${springMacroRequestContext.contextPath}/seller/product/list?page=${currentPage - 1}&size=${size}" a
                               ria-controls="data-table-6" data-dt-idx="0" tabindex="0" class="page-link">上一页</a>
                        </li>
                    </#if>

                    <#list 1..productInfoPage.getTotalPages() as index>
                        <#if currentPage == index>
                            <li class="disabled paginate_button page-item ">
                                <a href="#" aria-controls="data-table-6" data-dt-idx="3" tabindex="0" class="page-link">${index}</a>
                            </li>
                        <#else>
                            <li class="disabled paginate_button page-item ">
                                <a href="${springMacroRequestContext.contextPath}/seller/product/list?page=${index}&size=${size}"
                                   aria-controls="data-table-6" data-dt-idx="3" tabindex="0" class="page-link">${index}</a>
                            </li>
                        </#if>
                    </#list>

                    <#if currentPage gte productInfoPage.getTotalPages()>
                        <li class="disabled paginate_button page-item previous" id="data-table-6_previous">
                            <a href="#" aria-controls="data-table-6" data-dt-idx="0" tabindex="0" class="page-link">下一页</a>
                        </li>
                    <#else>
                        <li class="paginate_button page-item next disabled" id="data-table-6_next">
                            <a href="${springMacroRequestContext.contextPath}/seller/product/list?page=${currentPage + 1}&size=${size}"
                               aria-controls="data-table-6" data-dt-idx="5" tabindex="0" class="page-link">下一页</a>
                        </li>
                    </#if>
                </ul>
            </div>
        </div>
    </div>
</div>
</@contentWrapper>