<nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
<div class="lsm-scroll">
    <div class="lsm-sidebar">
        <ul class="nav sidebar-nav">
            <li class="sidebar-brand">
                <a href="#">
                    卖家管理系统
                </a>
            </li>
            <li class="lsm-sidebar-item">
                <a href="${springMacroRequestContext.contextPath}/seller/order/list" style="font-size: 18px;line-height:18px"> 订单</a>
            </li>
            <li class="dropdown open">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true" style="font-size: 18px;line-height:18px">
                    商品 <i class="my-icon lsm-sidebar-more"></i></a>
                <ul class="dropdown-menu" role="menu">
                    <li class="dropdown-header"></li>
                    <li><a href="${springMacroRequestContext.contextPath}/seller/product/list">列表</a></li>
                    <li><a href="${springMacroRequestContext.contextPath}/seller/product/index">新增</a></li>
                </ul>
            </li>
            <li class="dropdown open lsm-sidebar-item">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true"  style="font-size: 18px;line-height:18px">
                    <i class="fa fa-fw fa-plus"></i> 类目 <i class="my-icon lsm-sidebar-more"></i></a>
                <ul class="dropdown-menu" role="menu">
                    <li class="dropdown-header"></li>
                    <li><a href="${springMacroRequestContext.contextPath}/seller/category/list">列表</a></li>
                    <li><a href="${springMacroRequestContext.contextPath}/seller/category/index">新增</a></li>
                </ul>
            </li>

            <li class="dropdown open lsm-sidebar-item">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true" style="font-size: 18px;line-height:18px"><i
                        class="fa fa-fw fa-plus"></i> 管理员 <i class="my-icon lsm-sidebar-more"></i></a>
                <ul class="dropdown-menu" role="menu">
                    <li class="dropdown-header"></li>
                    <li><a href="${springMacroRequestContext.contextPath}/admin/list">管理员列表</a></li>
                    <li><a href="${springMacroRequestContext.contextPath}/admin/index">新增管理员</a></li>
                </ul>
            </li>
            <li class="dropdown open lsm-sidebar-item">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true" style="font-size: 18px;line-height:18px">
                    <i class="fa fa-fw fa-plus"></i> 轮播图 <i class="my-icon lsm-sidebar-more"></i></a>
                <ul class="dropdown-menu" role="menu">
                    <li class="dropdown-header"></li>
                    <li><a href="${springMacroRequestContext.contextPath}/picture/list">列表</a></li>
                    <li><a href="${springMacroRequestContext.contextPath}/picture/index">新增</a></li>
                </ul>
            </li>

            <li class="lsm-sidebar-item">
                <a href="${springMacroRequestContext.contextPath}/admin/logout" style="font-size: 18px;line-height:18px">
                    <i class="fa fa-fw fa-list-alt"></i> 登出</a>
            </li>
        </ul>
    </div>
</div>
</nav>