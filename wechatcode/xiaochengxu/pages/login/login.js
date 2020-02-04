var app = getApp();

Page({
  data: {
    disabled: !0,
    sjh: "",
    mm: "",
    logintext: "登录"
  },

  /**
   * 微信授权登录
   */
  wxAuthLogin: function() {
    // wx.makePhoneCall({
    //   phoneNumber: this.data.tel
    // });
    wx.showToast({
      title: '微信授权登录',
    })
  },

  /**
   * 输入手机号
   */
  srsjh: function(t) {
    console.log(t.detail.value), this.setData({
      sjh: t.detail.value
    }), "" != this.data.sjh && "" != this.data.mm ? this.setData({
      disabled: !1
    }) : this.setData({
      disabled: !0
    });
  },

  /**
   * 输入密码
   */
  srmm: function(t) {
    console.log(t.detail.value), this.setData({
      mm: t.detail.value
    }), "" != this.data.sjh && "" != this.data.mm ? this.setData({
      disabled: !1
    }) : this.setData({
      disabled: !0
    });
  },

  /**
   * 登录
   */
  login: function() {
    var sjh = this.data.sjh,
      mm = this.data.mm;
    console.log(sjh, mm), this.setData({
      logintext: "登录中...",
      disabled: !0
    });

    var that = this;

    wx.request({
      url: app.globalData.baseUrl + '/user/login',
      data: {
        username: sjh,
        password: mm
      },
      success: function(t) {
        console.log(t),

          that.setData({
            logintext: "登录",
            disabled: !1
          })

        if (500 == t.data.status) {
          wx.showModal({
            title: "提示",
            content: "您的帐号或密码错误，请重新输入"
          })
        } else {
          var resultData = t.data.data

          if ("1" == t.data.data.state) {
            var openId = resultData.openid
            var token = resultData.token
            var userInfo = resultData.userInfo
            app.globalData.openid = openId
            app.globalData.token = token
            app.globalData.userInfo = userInfo

            wx.setStorageSync("token", token),
            wx.setStorageSync('openid', openId),
            wx.setStorageSync('user', userInfo);
            wx.redirectTo({
              url: "../buy/buy"
            })
          } else {
            wx.showModal({
              title: "提示",
              content: "该帐号已禁用"
            })
          }

        }

        // 2 == t.data ? wx.showModal({
        //   title: "提示",
        //   content: "您的帐号或密码错误，请重新输入"
        // }) : "1" == t.data.state ? (wx.setStorageSync("sjdsjid", t.data.store_id), wx.redirectTo({
        //   url: "gzt"
        // })) : wx.showModal({
        //   title: "提示",
        //   content: "该帐号已禁用"
        // });
      }
    });
  },

  register: function() {
    wx.navigateTo({
      url: '../register/register'
    })
  },

  onLoad: function(t) {

  },

  onReady: function() {},
  onShow: function() {},
  onHide: function() {},
  onUnload: function() {},
  onPullDownRefresh: function() {},
  onReachBottom: function() {},
  onShareAppMessage: function() {}
});