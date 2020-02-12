<!-- Sidebar Navigation Left -->
  <aside id="ms-side-nav" class="side-nav fixed ms-aside-scrollable ms-aside-left">
      <!-- Logo -->
      <div class="logo-sn ms-d-block-lg">
          <a class="pl-0 ml-0 text-center" href="#">
              <img src="${springMacroRequestContext.contextPath}/images/costic/costic-logo-216x62.png" alt="logo">
          </a>
      </div>
      <!-- Navigation -->
      <ul class="accordion ms-main-aside fs-14" id="side-nav-accordion">
          <!-- Dashboard -->
          <#--<li class="menu-item">
              <a href="#" class="has-chevron" data-toggle="collapse" data-target="#dashboard" aria-expanded="false"
                 aria-controls="dashboard"> <span><i class="material-icons fs-16">dashboard</i>Dashboard </span>
              </a>
              <ul id="dashboard" class="collapse" aria-labelledby="dashboard" data-parent="#side-nav-accordion">
                  <li><a href="index.html">Costic</a>
                  </li>
              </ul>
          </li>-->
          <!-- /Dashboard -->
          <!-- orders -->
          <li class="menu-item">
              <a href="${springMacroRequestContext.contextPath}/seller/order/list"> <span>
                  <i class="fas fa-clipboard-list fs-16"></i>订单</span>
              </a>
          </li>
          <!-- orders end -->

          <!-- product -->
          <li class="menu-item">
              <a href="#" class="has-chevron" data-toggle="collapse" data-target="#product" aria-expanded="false"
                 aria-controls="product"> <span><i class="fas fa-file-invoice fs-16"></i>商品 </span>
              </a>
              <ul id="product" class="collapse" aria-labelledby="product" data-parent="#side-nav-accordion">
                  <li><a href="${springMacroRequestContext.contextPath}/seller/product/list">列表</a></li>
                  <li><a href="${springMacroRequestContext.contextPath}/seller/product/index">新增</a></li>
              </ul>
          </li>
          <!-- product end -->
          <!-- 营销-->
          <li class="menu-item">
              <a href="#" class="has-chevron" data-toggle="collapse" data-target="#customer" aria-expanded="false"
                 aria-controls="customer"> <span><i class="fas fa-user-friends fs-16"></i>营销 </span>
              </a>
              <ul id="customer" class="collapse" aria-labelledby="customer" data-parent="#side-nav-accordion">
                  <li><a href="${springMacroRequestContext.contextPath}/seller/coupon/list">列表</a>
                  </li>
                  <li><a href="${springMacroRequestContext.contextPath}/seller/coupon/index">新增</a>
                  </li>
              </ul>
          </li>
          <!-- 营销  end -->
          <!-- 类目 -->
          <li class="menu-item">
              <a href="#" class="has-chevron" data-toggle="collapse" data-target="#classify" aria-expanded="false"
                 aria-controls="classify"> <span><i class="fas fa-user-friends fs-16"></i>类目 </span>
              </a>
              <ul id="classify" class="collapse" aria-labelledby="classify" data-parent="#side-nav-accordion">
                  <li><a href="${springMacroRequestContext.contextPath}/seller/category/list">列表</a>
                  </li>
                  <li><a href="${springMacroRequestContext.contextPath}/seller/category/index">新增</a>
                  </li>
              </ul>
          </li>
          <!-- 类目 end  -->

          <!-- 管理员 -->
          <li class="menu-item">
              <a href="#" class="has-chevron" data-toggle="collapse" data-target="#admins" aria-expanded="false"
                 aria-controls="admins"> <span><i class="fas fa-user-friends fs-16"></i>管理员 </span>
              </a>
              <ul id="admins" class="collapse" aria-labelledby="admins" data-parent="#side-nav-accordion">
                  <li><a href="${springMacroRequestContext.contextPath}/admin/list">列表</a>
                  </li>
                  <li><a href="${springMacroRequestContext.contextPath}/admin/index">新增</a>
                  </li>
              </ul>
          </li>
          <!-- 管理员 end  -->

          <!-- 轮播图 -->
          <li class="menu-item">
              <a href="#" class="has-chevron" data-toggle="collapse" data-target="#carousel" aria-expanded="false"
                 aria-controls="carousel"> <span><i class="fas fa-user-friends fs-16"></i>轮播图 </span>
              </a>
              <ul id="carousel" class="collapse" aria-labelledby="carousel" data-parent="#side-nav-accordion">
                  <li><a href="${springMacroRequestContext.contextPath}/picture/list">列表</a>
                  </li>
                  <li><a href="${springMacroRequestContext.contextPath}/picture/index">新增</a>
                  </li>
              </ul>
          </li>
          <!-- 轮播图 end  -->
          <!-- /Apps -->
      </ul>
  </aside>