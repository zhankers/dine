var app = getApp();

Page({
  data: {},
  onLoad: function(e) {},

  draws: function(e) {},

  /**
   * 领取购物券
   */
  receive: function(e) {
    var that = this
    var token = app._checkToken()

    if (!token) {
      wx.showToast({
        title: "请先登录",
        icon: "success",
        duration: 1e3
      });
      return
    }

    console.log(e.target.dataset.id)
    wx.request({
      url: app.globalData.baseUrl + '/buyer/product/coupon/receive?couponId=' + e.target.dataset.id,
      method: "post",
      header: {
        token: token
      },
      success: function(res) {
        if (res && res.data && res.data.code == 2) {
          wx.showToast({
            title: "已领取该购物券",
            icon: "success",
            duration: 1e3
          });
          return
        }

        if (res && res.data && res.data.data) {
          var resultData = res.data.data
          wx.showToast({
            title: "领取成功",
            icon: "success",
            duration: 1e3
          });

        }
      }
    })

  },

  onReady: function() {},
  onShow: function() {
    var that = this
    wx.request({
      url: app.globalData.baseUrl + '/buyer/product/coupon/list',
      success: function(res) {
        if (res && res.data && res.data.data) {
          var resultData = res.data.data
          console.log(resultData)
          that.setData({
            unreceive: res.data.data,
            undraw: res.data.data
          });
        }
      }
    })
  },
  onHide: function() {},
  onPullDownRefresh: function() {
    this.onLoad(), wx.stopPullDownRefresh();
  },
  onUnload: function() {},
  onReachBottom: function() {},
  onShareAppMessage: function() {}
});