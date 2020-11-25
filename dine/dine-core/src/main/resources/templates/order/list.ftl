<#include "../common/common.ftl">
<@contentWrapper>
<div class="ms-content-wrapper">
    <div class="row">
        <!-- Total Earnings -->
        <!-- Recent Placed Orders< -->
        <div class="col-12">
            <div class="ms-panel">
                <div class="ms-panel-header">
                    <h6>订单列表</h6>
                </div>
                <div class="ms-panel-body">
                    <div class="table-responsive">

                        <table class="table table-hover thead-primary">
                            <thead>
                            <tr>
                                <th scope="col">订单id</th>
                                <th scope="col">姓名</th>
                                <th scope="col">手机号</th>
                                <th scope="col">地址</th>
                                <th scope="col">金额</th>
                                <th scope="col">订单状态</th>
                                <#--<th scope="col">支付状态</th>-->
                                <th scope="col">创建时间</th>
                                <th  scope="col" colspan="2">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list orderDTOPage.content as orderDTO>
                                <tr>
                                    <th scope="row">${orderDTO.orderId}</th>
                                    <td>${orderDTO.buyerName}</td>
                                    <td>${orderDTO.buyerPhone}</td>
                                    <td>${orderDTO.buyerAddress}</td>
                                    <td>${orderDTO.orderAmount}</td>
                                    <td>
                                        <#if orderDTO.getOrderStatusEnum().code == 0>
                                            <span class="badge badge-warning">${orderDTO.getOrderStatusEnum().message}<span>
                                        <#elseif orderDTO.getOrderStatusEnum().code == 1>
                                            <span class="badge badge-success">${orderDTO.getOrderStatusEnum().message}<span>
                                        <#elseif orderDTO.getOrderStatusEnum().code == 2>
                                            <span class="badge badge-warning">${orderDTO.getOrderStatusEnum().message}<span>
                                        <#elseif orderDTO.getOrderStatusEnum().code == 3>
                                            <span class="badge badge-primary">${orderDTO.getOrderStatusEnum().message}<span>
                                        <#else>
                                            <span class="badge badge-secondary">${orderDTO.getOrderStatusEnum().message}<span>
                                        </#if>
                                    </td>
                                    <#--<td>${orderDTO.getPayStatusEnum().message}</td>-->
                                    <td>${orderDTO.createTime}</td>
                                    <td><a href="${springMacroRequestContext.contextPath}/seller/order/detail?orderId=${orderDTO.orderId}">详情</a></td>
                                    <td>
                                        <#if orderDTO.getOrderStatusEnum().message == "新订单">
                                            <a href="${springMacroRequestContext.contextPath}/seller/order/cancel?orderId=${orderDTO.orderId}">取消</a>
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
                Showing ${currentPage} to ${orderDTOPage.getTotalPages()} of ${orderDTOPage.totalElements} entries
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
                            <a href="${springMacroRequestContext.contextPath}/seller/order/list?page=${currentPage - 1}&size=${size}" a
                               ria-controls="data-table-6" data-dt-idx="0" tabindex="0" class="page-link">上一页</a>
                        </li>
                    </#if>

                    <#list 1..orderDTOPage.getTotalPages() as index>
                        <#if currentPage == index>
                            <li class="paginate_button page-item ">
                                <a href="#" aria-controls="data-table-6" data-dt-idx="3" tabindex="0" class="page-link">${index}</a>
                            </li>
                        <#else>
                            <li class="paginate_button page-item ">
                                <a href="${springMacroRequestContext.contextPath}/seller/order/list?page=${index}&size=${size}"
                                   aria-controls="data-table-6" data-dt-idx="3" tabindex="0" class="page-link">${index}</a>
                            </li>
                        </#if>
                    </#list>

                    <#if currentPage gte orderDTOPage.getTotalPages()>
                        <li class="paginate_button page-item previous" id="data-table-6_previous">
                            <a href="#" aria-controls="data-table-6" data-dt-idx="0" tabindex="0" class="page-link">下一页</a>
                        </li>
                    <#else>
                        <li class="paginate_button page-item next disabled" id="data-table-6_next">
                            <a href="${springMacroRequestContext.contextPath}/seller/order/list?page=${currentPage + 1}&size=${size}"
                               aria-controls="data-table-6" data-dt-idx="5" tabindex="0" class="page-link">下一页</a>
                        </li>
                    </#if>
                </ul>
            </div>
        </div>
    </div>
</div>

<#--弹窗-->
<div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">
                    提醒
                </h4>
            </div>
            <div class="modal-body">
                你有新的订单
            </div>
            <div class="modal-footer">
                <button onclick="javascript:document.getElementById('notice').pause()" type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button onclick="location.reload()" type="button" class="btn btn-primary">查看新的订单</button>
            </div>
        </div>
    </div>
</div>

<#--播放音乐-->
<audio id="notice" loop="loop">
    <source src="${springMacroRequestContext.contextPath}/mp3/song.mp3" type="audio/mpeg" />
</audio>

<script>
    var websocket = null;
    if('WebSocket' in window) {
        var websocketUrl =  'ws://${webSocket_url}${ctx}/webSocket';
        console.log("websocket url is " + websocketUrl);
        websocket = new WebSocket(websocketUrl);
    }else {
        alert('该浏览器不支持websocket!');
    }

    websocket.onopen = function (event) {
        console.log('建立连接');
    }

    websocket.onclose = function (event) {
        console.log('连接关闭');
    }

    websocket.onmessage = function (event) {
        console.log('收到消息:' + event.data)
        //弹窗提醒, 播放音乐
        $('#myModal').modal('show');

        document.getElementById('notice').play();
    }

    websocket.onerror = function () {
        alert('websocket通信发生错误！');
    }

    window.onbeforeunload = function () {
        websocket.close();
    }

</script>

</@contentWrapper>