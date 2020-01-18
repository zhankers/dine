// pages/register/register.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    disabled: !0,
    zh: "",
    mm: "",
    confirmm: "",
    regtext: "注册"
  },

  /**
   * 输入账号
   */
  srzh: function(t) {
    console.log(t.detail.value), this.setData({
      zh: t.detail.value
    }), "" != this.data.zh && "" != this.data.mm && "" != this.data.confirmm ? this.setData({
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
    }), "" != this.data.zh && "" != this.data.mm && "" != this.data.confirmm ? this.setData({
      disabled: !1
    }) : this.setData({
      disabled: !0
    });
  },

  /**
   * 确认密码
   */
  qrmm: function(t) {
    console.log(t.detail.value), this.setData({
      confirmm: t.detail.value
    }), "" != this.data.zh && "" != this.data.mm && "" != this.data.confirmm ? this.setData({
      disabled: !1
    }) : this.setData({
      disabled: !0
    });
  },

  register: function() {
    var zh = this.data.zh,
      mm = this.data.mm,
      confirmm = this.data.confirmm;
    
    if (mm !== confirmm){
      wx.showToast({
        title: '两次密码输入不一致',
      })
      return;
    }



    console.log("------")
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function(options) {

  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function() {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function() {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function() {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function() {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function() {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function() {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function() {

  }
})