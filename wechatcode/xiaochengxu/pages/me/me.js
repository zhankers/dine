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

  address: function() {
    if (wx.chooseAddress) {

      let token = app._checkToken()

      // let openid = app._checkOpenid()

      if(!token) {
        wx.showToast({
          title: '请先登录',
        })
        return
      }

      wx.chooseAddress({
        success: function(res) {
          wx.request({
            url: app.globalData.baseUrl + '/user/address',
            header: {
              token : token
            },
            method: "post",
            data: res,
            success: function(response) {
              console.log(responese.data.data)
              wx.setStorageSync('address', responese.data.data)
            }
          })
        },
        fail: function(err) {
          console.log(JSON.stringify(err))
        }
      })
    } else {
      console.log('当前微信版本不支持chooseAddress');
    }
  
  },

  getCoupon: function() {
    wx.navigateTo({
      url: '../coupons/shop_coupons',
    })
  },

  myCoupon: function() {
    wx.navigateTo({
      url: '../coupons/mine_coupons',
    })
  },

  goToMyOrder: function() {
    wx.switchTab({
      url: '../myOrder/myOrder',
    })
  },
  goToMyInfo:function(){
    wx.navigateTo({
      url: '../myInfo/myInfo',
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

  onShow: function() {
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