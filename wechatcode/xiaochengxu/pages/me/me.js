// pages/me/me.js
const app = getApp();
Page({

  // 页面的初始数据
  data: {
    isShowUserName: false,
    userInfo: null,
    isLogining: false,
  },

  // button获取用户信息
  onGotUserInfo: function(e) {
    if (e.detail.userInfo) {
      var user = e.detail.userInfo;
      this.setData({
        isShowUserName: true,
        userInfo: e.detail.userInfo,
      })
      user.openid = app.globalData.openid;
      app._saveUserInfo(user);
    } else {
      app._showSettingToast('登陆需要允许授权');
    }
  },

  goToMyOrder: function() {
    wx.navigateTo({
      url: '../myOrder/myOrder',
    })
  },

  goToMyComment: function() {
    wx.navigateTo({
      url: '../mycomment/mycomment?type=1',
    })
  },
  change() {
    wx.navigateTo({
      url: '../change/change',
    })
  },


  onShow(options) {
    console.log("个人show", options)
    var user = app.globalData.userInfo;
    if (user) {
      this.setData({
        isShowUserName: true,
        userInfo: user,
      })
    }
  },

  goToLogin: function() {
    wx.navigateTo({
      url: '../login/login',
    })
  },

  logout: function() {
    console.log("退出登录")
    app.globalData.userInfo = null
    app.globalData.token = null
    app.globalData.openid = null

    wx.removeStorageSync('openid')
    wx.removeStorageSync('token')
    wx.removeStorageSync('user')

    this.setData({
      isShowUserName: false,
      userInfo: null,
      isLogining: false,
    })

    wx.redirectTo({
      url: "../login/login"
    })
  },

  //生命周期函数--监听页面加载
  onLoad: function(options) {
    console.log("个人onLoad")

  },

  onShow: function onShow() {
    console.log("个人onShow")
    var that = this;
    var token = app.globalData.token ? app.globalData.token : (app.globalData.token = wx.getStorageSync('token'), wx.getStorageSync('token'));
    var openid = app.globalData.openid ? app.globalData.openid : (app.globalData.openid = wx.getStorageSync('openid'), wx.getStorageSync('openid'));
    var user = app.globalData.userInfo ? app.globalData.userInfo : (app.globalData.userInfo = wx.getStorageSync('user'), wx.getStorageSync('user'));
    if (token) {
      that.setData({
        isShowUserName: true,
        userInfo: user,
        isLogining: true,
      })
    } else {
      // 由于 getUserInfo 是网络请求，可能会在 Page.onLoad 之后才返回
      // 所以此处加入 callback 以防止这种情况
      // app.userInfoReadyCallback = res => {
      //   that.setData({
      //     userInfo: res.userInfo,
      //     isShowUserName: true,
      //     isLogining: false,
      //   })
      // }

      that.setData({
        userInfo: null,
        isShowUserName: false,
        isLogining: false,
      })
    }
  },
})