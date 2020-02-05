//app.js
App({
  //创建towxml对象，供小程序页面使用
  globalData: {
    userInfo: null,
    openid: null,
    token: null,
    baseUrl: 'http://localhost:8080/sell' //本地调试
    //baseUrl: 'http://zhanke.site:8080/sell/' //真机调试,这里的ip地址一定是你电脑的ip
  },
  onLaunch: function() {
    //云开发初始化
    wx.cloud.init({
      env: 'dine-dev-8bhtb',
      traceUser: true,
    })
    this.db = wx.cloud.database(); //云数据库初始化
    // this.getOpenid();
  },
  // 获取用户openid
  getOpenid: function() {
    var app = this;
    var openidStor = wx.getStorageSync('openid');
    if (openidStor) {
      console.log('本地获取openid:' + openidStor);
      app.globalData.openid = openidStor;
      app._getUserInfo();
    } else {
      wx.cloud.callFunction({
        name: 'getOpenid',
        success(res) {
          console.log('云函数获取成功', res)
          var openid = res.result.openid;
          wx.setStorageSync('openid', openid)
          app.globalData.openid = openid;
          app._getUserInfo();
        },
        fail(res) {
          console.log('云函数获取失败', res)
        }
      })
    }
  },
  // 获取用户信息，如果用户没有授权，就获取不到
  _getUserInfo: function() {
    var app = this;

    wx.getUserInfo({ //从网络获取最新用户信息
      success: function(res) {
        var user = res.userInfo;
        user.openid = app.globalData.openid;
        app.globalData.userInfo = user;
        console.log('请求获取user成功')
        console.log(user)
        app._saveUserInfo(user);
        // 由于 getUserInfo 是网络请求，可能会在 Page.onLoad 之后才返回
        // 所以此处加入 callback 以防止这种情况
        if (app.userInfoReadyCallback) {
          app.userInfoReadyCallback(res)
        }
      },
      fail: function(res) { //请求网络失败时，再读本地数据
        console.log('请求获取user失败')
        var userStor = wx.getStorageSync('user');
        if (userStor) {
          console.log('本地获取user')
          app.globalData.userInfo = userStor;
        }
      }
    })
  },

  _checkOpenid() {
    let openid = this.globalData.openid;
    if (!openid) {
      app.getOpenid();
      wx.showLoading({
        title: 'openid不能为空，请重新登录',
      })
      return null;
    } else {
      return openid;
    }
  },
  // 保存userinfo
  _saveUserInfo: function(user) {
    this.globalData.userInfo = user;
    this._getMyUserInfo();
  },
  //获取自己后台的user信息
  _getMyUserInfo(user) {
    let app = this
    let userInfo = app.globalData.userInfo;
    wx.request({
      url: app.globalData.baseUrl + '/user/getUserInfo',
      data: {
        openid: app.globalData.openid
      },
      success: function(res) {
        if (res && res.data && res.data.data) {
          // userInfo.realname = res.data.data.username;
          // userInfo.realphone = res.data.data.phone;
          // userInfo.realzhuohao = res.data.data.zhuohao;
          // userInfo.realrenshu = res.data.data.renshu;
          userInfo = res.data.data;
          app.globalData.userInfo = userInfo;
        }
      }
    })
    console.log("我的后台", userInfo)
    //缓存到sd卡里
    wx.setStorageSync('user', userInfo);
  },
  //获取今天是本月第几周
  _getWeek: function() {
    // 将字符串转为标准时间格式
    let date = new Date();
    let month = date.getMonth() + 1;
    let week = this.getWeekFromDate(date);
    if (week === 0) { //第0周归于上月的最后一周
      month = date.getMonth();
      let dateLast = new Date();
      let dayLast = new Date(dateLast.getFullYear(), dateLast.getMonth(), 0).getDate();
      let timestamp = new Date(new Date().getFullYear(), new Date().getMonth() - 1, dayLast);
      week = this.getWeekFromDate(new Date(timestamp));
    }
    let time = month + "月第" + week + "周";
    return time;
  },

  getWeekFromDate: function(date) {
    // 将字符串转为标准时间格式
    let w = date.getDay(); //周几
    if (w === 0) {
      w = 7;
    }
    let week = Math.ceil((date.getDate() + 6 - w) / 7) - 1;
    return week;
  },
  // 获取当前时间
  _getCurrentTime() {
    var d = new Date();
    var month = d.getMonth() + 1;
    var date = d.getDate();
    var day = d.getDay();
    var hours = d.getHours();
    var minutes = d.getMinutes();
    var seconds = d.getSeconds();
    var ms = d.getMilliseconds();

    var curDateTime = d.getFullYear() + '年';
    if (month > 9)
      curDateTime += month + '月';
    else
      curDateTime += month + '月';

    if (date > 9)
      curDateTime = curDateTime + date + "日";
    else
      curDateTime = curDateTime + date + "日";
    if (hours > 9)
      curDateTime = curDateTime + hours + "时";
    else
      curDateTime = curDateTime + hours + "时";
    if (minutes > 9)
      curDateTime = curDateTime + minutes + "分";
    else
      curDateTime = curDateTime + minutes + "分";
    return curDateTime;
  }
})