<nav class="navbar ms-navbar">
    <div class="ms-aside-toggler ms-toggler pl-0" data-target="#ms-side-nav" data-toggle="slideLeft"> <span class="ms-toggler-bar bg-primary"></span>
        <span class="ms-toggler-bar bg-primary"></span>
        <span class="ms-toggler-bar bg-primary"></span>
    </div>
    <div class="logo-sn logo-sm ms-d-block-sm">
        <a class="pl-0 ml-0 text-center navbar-brand mr-0" href="#"><img src="${springMacroRequestContext.contextPath}/images/costic/costic-logo-84x41.png" alt="logo"> </a>
    </div>
    <ul class="ms-nav-list ms-inline mb-0" id="ms-nav-options">
        <li class="ms-nav-item ms-search-form pb-0 py-0">
            <form class="ms-form" method="post">
                <div class="ms-form-group my-0 mb-0 has-icon fs-14">
                    <input type="search" class="ms-form-input" name="search" placeholder="Search here..." value=""> <i class="flaticon-search text-disabled"></i>
                </div>
            </form>
        </li>
        <#--<li class="ms-nav-item dropdown"> <a href="#" class="text-disabled ms-has-notification" id="mailDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="flaticon-mail"></i></a>
            <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="mailDropdown">
                <li class="dropdown-menu-header">
                    <h6 class="dropdown-header ms-inline m-0"><span class="text-disabled">Mail</span></h6><span class="badge badge-pill badge-success">3 New</span>
                </li>
                <li class="dropdown-divider"></li>
                <li class="ms-scrollable ms-dropdown-list">
                    <a class="media p-2" href="#">
                        <div class="ms-chat-status ms-status-offline ms-chat-img mr-2 align-self-center">
                            <img src="${springMacroRequestContext.contextPath}/images/costic/customer-3.jpg" class="ms-img-round" alt="people">
                        </div>
                        <div class="media-body"> <span>Hey man, looking forward to your new project.</span>
                            <p class="fs-10 my-1 text-disabled"><i class="material-icons">access_time</i> 30 seconds ago</p>
                        </div>
                    </a>
                    <a class="media p-2" href="#">
                        <div class="ms-chat-status ms-status-online ms-chat-img mr-2 align-self-center">
                            <img src="${springMacroRequestContext.contextPath}/images/costic/customer-2.jpg" class="ms-img-round" alt="people">
                        </div>
                        <div class="media-body"> <span>Dear John, I was told you bought Costic! Send me your feedback</span>
                            <p class="fs-10 my-1 text-disabled"><i class="material-icons">access_time</i> 28 minutes ago</p>
                        </div>
                    </a>
                    <a class="media p-2" href="#">
                        <div class="ms-chat-status ms-status-offline ms-chat-img mr-2 align-self-center">
                            <img src="${springMacroRequestContext.contextPath}/images/costic/customer-1.jpg" class="ms-img-round" alt="people">
                        </div>
                        <div class="media-body"> <span>How many people are we inviting to the dashboard?</span>
                            <p class="fs-10 my-1 text-disabled"><i class="material-icons">access_time</i> 6 hours ago</p>
                        </div>
                    </a>
                </li>
                <li class="dropdown-divider"></li>
                <li class="dropdown-menu-footer text-center"> <a href="pages/apps/email.html">Go to Inbox</a>
                </li>
            </ul>
        </li>-->
        <#--提醒-->
        <li class="ms-nav-item dropdown"> <a href="#" class="text-disabled ms-has-notification" id="notificationDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="flaticon-bell"></i></a>
            <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="notificationDropdown">
                <li class="dropdown-menu-header">
                    <h6 class="dropdown-header ms-inline m-0"><span class="text-disabled">Notifications</span></h6><span class="badge badge-pill badge-info">4 New</span>
                </li>
                <#--<li class="dropdown-divider"></li>
                <li class="ms-scrollable ms-dropdown-list">
                    <a class="media p-2" href="#">
                        <div class="media-body">
                            <span>12 ways to improve your crypto dashboard</span>
                            <p class="fs-10 my-1 text-disabled"><i class="material-icons">access_time</i> 30 seconds ago</p>
                        </div>
                    </a>
                    <a class="media p-2" href="#">
                        <div class="media-body"> <span>You have newly registered users</span>
                            <p class="fs-10 my-1 text-disabled"><i class="material-icons">access_time</i> 45 minutes ago</p>
                        </div>
                    </a>
                    <a class="media p-2" href="#">
                        <div class="media-body"> <span>Your account was logged in from an unauthorized IP</span>
                            <p class="fs-10 my-1 text-disabled"><i class="material-icons">access_time</i> 2 hours ago</p>
                        </div>
                    </a>
                    <a class="media p-2" href="#">
                        <div class="media-body"> <span>An application form has been submitted</span>
                            <p class="fs-10 my-1 text-disabled"><i class="material-icons">access_time</i> 1 day ago</p>
                        </div>
                    </a>
                </li>
                <li class="dropdown-divider"></li>-->
                <li class="dropdown-menu-footer text-center"> <a href="#">View all Notifications</a>
                </li>
            </ul>
        </li>

        <li class="ms-nav-item ms-nav-user dropdown">
            <a href="#" id="userDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <img class="ms-user-img ms-img-round float-right" src="${springMacroRequestContext.contextPath}/images/costic/customer-6.jpg" alt="people">
            </a>
            <ul class="dropdown-menu dropdown-menu-right user-dropdown" aria-labelledby="userDropdown">
                <#--<li class="dropdown-menu-header">
                    <h6 class="dropdown-header ms-inline m-0"><span class="text-disabled">Welcome, Anny Farisha</span></h6>
                </li>
                <li class="dropdown-divider"></li>-->
                <#--<li class="ms-dropdown-list">
                    <a class="media fs-14 p-2" href="#"> <span><i class="flaticon-user mr-2"></i> Profile</span>
                    </a>
                    <a class="media fs-14 p-2" href="#"> <span><i class="flaticon-mail mr-2"></i> Inbox</span> <span class="badge badge-pill badge-info">3</span>
                    </a>
                    <a class="media fs-14 p-2" href="#"> <span><i class="flaticon-gear mr-2"></i> Account Settings</span>
                    </a>
                </li>-->
                <li class="dropdown-divider"></li>
                <li class="dropdown-menu-footer">
                    <a class="media fs-14 p-2" href="${springMacroRequestContext.contextPath}/admin/logout"> <span><i class="flaticon-shut-down mr-2"></i> Logout</span>
                    </a>
                </li>
            </ul>
        </li>
    </ul>
    <div class="ms-toggler ms-d-block-sm pr-0 ms-nav-toggler" data-toggle="slideDown" data-target="#ms-nav-options"> <span class="ms-toggler-bar bg-primary"></span>
        <span class="ms-toggler-bar bg-primary"></span>
        <span class="ms-toggler-bar bg-primary"></span>
    </div>
</nav>