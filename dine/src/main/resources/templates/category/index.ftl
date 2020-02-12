<#include "../common/common.ftl">
<@contentWrapper>
<div class="ms-content-wrapper">
    <div class="row">
        <!-- Total Earnings -->
        <!-- Recent Placed Orders< -->
        <div class="col-12">
            <div class="col-md-12 column">
                <form role="form" method="post" action="${springMacroRequestContext.contextPath}/seller/category/save">
                    <div class="form-group">
                        <label>名字</label>
                        <input name="categoryName" type="text" class="form-control" value="${(category.categoryName)!''}"/>
                    </div>
                    <div class="form-group">
                        <label>type</label>
                        <input name="categoryType" type="number" class="form-control" value="${(category.categoryType)!''}"/>
                    </div>
                    <input hidden type="text" name="categoryId" value="${(category.categoryId)!''}">
                    <button type="submit" class="btn btn-default">提交</button>
                </form>
            </div>
        </div>
    </div>
</div>
</@contentWrapper>