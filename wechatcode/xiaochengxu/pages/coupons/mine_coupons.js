var _Page;

function _defineProperty(e, o, t) {
  return o in e ? Object.defineProperty(e, o, {
    value: t,
    enumerable: !0,
    configurable: !0,
    writable: !0
  }) : e[o] = t, e;
}

var app = getApp();

Page((_defineProperty(_Page = {
  data: {
    close: !1,
    current_time: ""
  },
  onLoad: function (e) {
    var o = wx.getStorageSync("bqxx");
    if ("1" == o.more) var t = wx.getStorageSync("bqxx").color;
    if ("2" == o.more) t = wx.getStorageSync("nbcolor");
    wx.setNavigationBarColor({
      frontColor: "#ffffff",
      backgroundColor: t
    }), this.setData({
      color: t,
      options: e
    }), console.log(e);
    var n = this;
    if (null == e.totalPrice) var a = 0; else a = Number(e.totalPrice);
    if (null == e.state) {
      console.log("状态是空的");
      var r = 0;
    } else {
      console.log("有状态");
      var i = e.state;
    }
    console.log(i), n.setData({
      state: i,
      states: r,
      totalPrice: a
    });
    var s = wx.getStorageSync("users").id, l = function () {
      var e = new Date(), o = e.getMonth() + 1, t = e.getDate();
      o >= 1 && o <= 9 && (o = "0" + o);
      t >= 0 && t <= 9 && (t = "0" + t);
      return e.getFullYear() + "-" + o + "-" + t + " " + e.getHours() + ":" + e.getMinutes() + ":" + e.getSeconds();
    }().slice(0, 10);
    console.log(l), n.setData({
      current_time: l
    }), app.util.request({
      url: "entry/wxapp/Coupons",
      cachetime: "0",
      data: {
        user_id: s
      },
      success: function (o) {
        console.log(o);
        for (var t = o.data.ok, a = [], r = 0; r < t.length; r++) t[r].conditions = Number(t[r].conditions),
          l <= t[r].end_time && 2 == t[r].state && a.push(t[r]);
        if (null == e.dnjr && null == e.state) console.log("从个人中心进入"), n.setData({
          coupon: a
        }); else {
          console.log("从门店进入");
          for (var i = [], s = 0; s < a.length; s++) a[s].store_id == getApp().sjid && i.push(a[s]);
          n.setData({
            coupon: i
          });
        }
      }
    }), app.util.request({
      url: "entry/wxapp/Voucher",
      cachetime: "0",
      data: {
        user_id: s
      },
      success: function (o) {
        console.log(o);
        for (var t = o.data.ok, a = [], r = 0; r < t.length; r++) t[r].conditions = Number(t[r].conditions),
          l <= t[r].end_time && 2 == t[r].state && (console.log(), a.push(t[r]));
        if (null == e.dnjr && null == e.state) console.log("从个人中心进入"), n.setData({
          Vouchers: a
        }); else {
          console.log("从门店进入");
          for (var i = [], s = 0; s < a.length; s++) a[s].store_id == getApp().sjid && i.push(a[s]);
          n.setData({
            Vouchers: i
          });
        }
      }
    });
  },
  select: function (e) {
    "2" == this.data.state ? wx.redirectTo({
      url: "../order/order?&tableid=" + this.data.options.tableid,
      success: function (e) { },
      fail: function (e) { },
      complete: function (e) { }
    }) : wx.redirectTo({
      url: "../pay/pay",
      success: function (e) { },
      fail: function (e) { },
      complete: function (e) { }
    });
  },
  use: function (e) {
    var o = e.currentTarget.id;
    console.log(e), console.log(this.data);
    for (var t = this.data.coupon, n = 0; n < t.length; n++) if (o == t[n].id) {
      console.log(t[n]);
      var a = t[n];
      "2" == this.data.state ? wx.redirectTo({
        url: "../order/order?coupons_id=" + a.coupons_id + "&preferential=" + a.preferential + "&tableid=" + this.data.options.tableid,
        success: function (e) { },
        fail: function (e) { },
        complete: function (e) { }
      }) : wx.redirectTo({
        url: "../pay/pay?coupons_id=" + a.coupons_id + "&preferential=" + a.preferential,
        success: function (e) { },
        fail: function (e) { },
        complete: function (e) { }
      });
    }
    console.log(e), console.log(this.data);
  },
  user: function (e) {
    console.log(this.data);
    for (var o = e.currentTarget.id, t = this.data.Vouchers, n = 0; n < t.length; n++) if (o == t[n].id) {
      console.log(t[n]);
      var a = t[n];
      "2" == this.data.state ? wx.redirectTo({
        url: "../order/order?vouchers_id=" + a.vouchers_id + "&preferential=" + a.preferential + "&tableid=" + this.data.options.tableid,
        success: function (e) { },
        fail: function (e) { },
        complete: function (e) { }
      }) : wx.redirectTo({
        url: "../pay/pay?vouchers_id=" + a.vouchers_id + "&preferential=" + a.preferential,
        success: function (e) { },
        fail: function (e) { },
        complete: function (e) { }
      });
    }
    console.log(e), console.log(this.data);
  },
  tzsj: function (e) {
    var o = e.currentTarget.dataset.sjid;
    console.log(o, this.data.options), null == this.data.options.dnjr ? (console.log("从个人中心进入"),
      wx.switchTab({
        url: "../home/home"
      })) : (console.log("从门店进入"), wx.navigateBack({
        delta: 1
      }));
  },
  details: function (e) {
    console.log(e);
    var o = e.currentTarget.id;
    wx.navigateTo({
      url: "coupons_details?id=" + o + "&type=1&state=2"
    });
  },
  detail: function (e) {
    console.log(e);
    var o = e.currentTarget.id;
    wx.navigateTo({
      url: "coupons_details?id=" + o + "&type=2&state=2"
    });
  },
  onPullDownRefresh: function () {
    this.onLoad(), wx.stopPullDownRefresh();
  },
  onReady: function () { },
  onShow: function () { },
  onHide: function () { },
  onUnload: function () { }
}, "onPullDownRefresh", function () {
  this.onLoad(), wx.stopPullDownRefresh();
}), _defineProperty(_Page, "onReachBottom", function () { }), _defineProperty(_Page, "onShareAppMessage", function () { }),
  _Page));