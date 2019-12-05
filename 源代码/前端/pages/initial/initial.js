// pages/inital/initial.js
const app = getApp()
Page({
  /**
   * 页面的初始数据
   */
  data: {
    isShow:true
  },
  //获取全局变量
  

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    //判断用户是否授权
    wx.getSetting({
      success:(data) => {
        if(data.authSetting['scope.userInfo']){
          //用户已经授权
          wx.getUserInfo({
            success(res) {
              console.log("initial用户信息获取成功", res.userInfo),
              app.globalData.userInfo = res.userInfo
              console.log("initial用户信息获取成功", app.globalData.userInfo)
              //向后台返回用户信息
              wx.request({
                url: 'http://123.207.6.17/getuserinfo',
                data:{
                  useropenid: app.data.openid,
                  username: res.userInfo['nickName'],
                  usergender: res.userInfo['gender'],
                  userimg: res.userInfo['avatarUrl'],
                  usercountry: res.userInfo['country'],
                  userprovince: res.userInfo['province'],
                  usercity: res.userInfo['city'],  
                },
                method:'GET',
                header: {
                  "Content-Type": "applciation/json"
                },
                success(res){
                  console.log('登陆信息传输成功')
                },
                fail(){}
              })
            },
            fail() {
              console.log('获取用户信息失败')
            }
          })
          wx.switchTab({
            url: '../index/index',
            success: function (res) {},
            fail: function (res) {}
          });
        }
        else{
          //用户没有授权
         this.setData({
           isShow: true
         });
        }
      }
    })
  },
  handleGetUserInfo(data){
    //判断用户是否点击允许
    if(data.detail.rawData){
      //允许
      wx.getUserInfo({
        success(res) {
          console.log("initial用户信息获取成功", res.userInfo),
            app.globalData.userInfo = res.userInfo
          console.log("initial用户信息获取成功", app.globalData.userInfo)
          wx.request({
            url: 'http://123.207.6.17/getuserinfo',
            data: {
              useropenid: app.data.openid,
              username: res.userInfo['nickName'],
              usergender: res.userInfo['gender'],
              userimg: res.userInfo['avatarUrl'],
              usercountry: res.userInfo['country'],
              userprovince: res.userInfo['province'],
              usercity: res.userInfo['city'],
            },
            method: 'GET',
            header: {
              "Content-Type": "applciation/json"
            },
            success(res) {
              console.log('登陆信息传输成功')
            },
            fail() { }
          })
        },
        fail() {
          console.log('获取用户信息失败')
        }
      })
      wx.switchTab({
        url: '../index/index',
        success: function (res) {
        },
        fail: function (res) {}
      })
    }
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
  
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
  
  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {
  
  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {
  
  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {
  
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {
  
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {
  
  }
})