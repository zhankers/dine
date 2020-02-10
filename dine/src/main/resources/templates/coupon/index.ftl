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
                    <form role="form" method="post" action="${springMacroRequestContext.contextPath}/seller/coupon/save">
                        <div class="form-group">
                            <label>优惠券名字</label>
                            <input name="couponName" type="text" class="form-control" value="${(coupon.name)!''}"/>
                        </div>
                        <div class="form-group">
                            <label>面额</label>
                            <input name="couponMoney" type="text" class="form-control" value="${(coupon.money)!''}"/>
                        </div>
                        <div class="form-group">
                            <label>发放数量</label>
                            <input name="couponNumber" type="text" class="form-control" value="${(coupon.number)!''}"/>
                        </div>

                        <div class="form-group">
                            <label>满多少元使用</label>
                            <input name="fullMoney" type="text" class="form-control" value="${(coupon.fullMoney)!''}"/>
                        </div>

                        <div class="form-group">
                            <label>生效时间</label>
                            <input name="couponStartTime" type="text" class="form-control" value="${(coupon.startTime)!''}"/>
                        </div>
                        <div class="form-group">
                            <label>过期时间</label>
                            <input name="couponEndTime" type="text" class="form-control" value="${(coupon.endTime)!''}"/>
                        </div>


                        <#--<div class="form-group">
                            <label>type</label>
                            <input name="categoryType" type="number" class="form-control" value="${(coupon.type)!''}"/>
                        </div>-->
                        <input hidden type="text" name="couponId" value="${(coupon.id)!''}">
                        <button type="submit" class="btn btn-default">提交</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>