var app = getApp();

Page({
  data: {},
  onLoad: function (e) { },

  draws: function (e) { },

  gotoUse: function (e) {
    var that = this
    console.log(e.target.dataset.id)
    wx.navigateTo({
      url: '../buy/buy',
    })

  },

  onReady: function () { },
  onShow: function () {
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
    wx.request({
      url: app.globalData.baseUrl + '/buyer/product/mine-coupon/list',
      header: {token: token},
      success: function (res) {
        if (res && res.data && res.data.data) {
          var resultData = res.data.data
          console.log(resultData)
          that.setData({
            mineCoupon: res.data.data,
          });
        }
      }
    })
  },
  onHide: function () { },
  onPullDownRefresh: function () {
    this.onLoad(), wx.stopPullDownRefresh();
  },
  onUnload: function () { },
  onReachBottom: function () { },
  onShareAppMessage: function () { }
});