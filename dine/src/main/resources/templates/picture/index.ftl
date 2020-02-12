<#include "../common/common.ftl">
<@contentWrapper>
<div class="ms-content-wrapper">
    <div class="row">
        <!-- Total Earnings -->
        <!-- Recent Placed Orders< -->
        <div class="col-12">
            <div class="col-md-12 column">
                <form role="form" method="post" action="${springMacroRequestContext.contextPath}/picture/save">
                    <div class="form-group">
                        <label>图片url</label>
                        <input name="picUrl" type="text" class="form-control"
                               value="${(category.picUrl)!''}"/>
                    </div>
                    <div class="form-group">
                        <label>图片描述</label>
                        <input name="picMessage" type="text" class="form-control"
                               value="${(category.picMessage)!''}"/>
                    </div>
                    <input hidden type="text" name="picId"
                           value="${(category.picId)!''}">
                    <button type="submit" class="btn btn-default">提交</button>
                </form>
            </div>
        </div>
    </div>
</div>
</@contentWrapper>