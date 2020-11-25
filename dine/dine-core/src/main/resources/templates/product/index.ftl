<#include "../common/common.ftl">
<@contentWrapper>
<div class="ms-content-wrapper">
    <div class="row">
        <!-- Total Earnings -->
        <!-- Recent Placed Orders< -->
        <div class="col-12">
            <div class="col-md-12 column">
                <form role="form" method="post" action="${springMacroRequestContext.contextPath}/seller/product/save">
                    <div class="form-group">
                        <label>名称</label>
                        <input name="productName" type="text" class="form-control" value="${(productInfo.productName)!''}"/>
                    </div>
                    <div class="form-group">
                        <label>价格</label>
                        <input name="productPrice" type="text" class="form-control" value="${(productInfo.productPrice)!''}"/>
                    </div>
                    <div class="form-group">
                        <label>库存</label>
                        <input name="productStock" type="number" class="form-control" value="${(productInfo.productStock)!''}"/>
                    </div>
                    <div class="form-group">
                        <label>描述</label>
                        <input name="productDescription" type="text" class="form-control" value="${(productInfo.productDescription)!''}"/>
                    </div>
                    <div class="form-group">
                        <label>图片</label>
                        <img height="100" width="100" src="${(productInfo.productIcon)!''}" alt="">
                        <input name="productIcon" type="text" class="form-control" value="${(productInfo.productIcon)!''}"/>
                    </div>
                    <div class="form-group">
                        <label>类目</label>
                        <select name="categoryType" class="form-control">
                                <#list categoryList as category>
                                    <option value="${category.categoryType}"
                                            <#if (productInfo.categoryType)?? && productInfo.categoryType == category.categoryType>
                                                selected
                                            </#if>
                                    >${category.categoryName}
                                    </option>
                                </#list>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>口味</label>
                        <select name="tasteType" class="form-control">
                                <option value="0" selected>甜</option>
                                <option value="1" >酸</option>
                                <option value="2" >苦</option>
                                <option value="3" >辣</option>
                        </select>
                    </div>
                    <input hidden type="text" name="productId" value="${(productInfo.productId)!''}">
                    <button type="submit" class="btn btn-default">提交</button>
                </form>
            </div>
        </div>
    </div>
</div>
</@contentWrapper>
