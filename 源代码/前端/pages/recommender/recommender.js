const app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    page: 1,
    array: [],
  },
  //加载页面数据
  loadcontent:function(id,mypage){
    var that = this
    wx.showLoading({
      title: '加载中',
    })
    wx.request({
      url: 'http://123.207.6.17/getrecommender',
      data:{userid:id,page:mypage},
      success:function(res){
        if (!(res.data.array).length) {
          wx.showToast({
            title: '没有更多了',
            image: '../../image/fail.png',
            duration: 1500,
            mask: true,
            success: function (res) { },
            fail: function (res) { },
            complete: function (res) { },
          })
          return false
        }
        console.log('recommender data:',res.data)
        var dataArr = that.data.array
        var newData = dataArr.concat(res.data.array)
        that.setData({
          array: newData,
          page:mypage+1
        })
      },
      complete: function () {
        //隐藏加载中提示
        setTimeout(function () {
          wx.hideLoading()
        }, 1000)
      }
    })
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this
    that.loadcontent(app.data.openid,that.data.page)
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
    var that = this
    that.loadcontent(app.data.openid,that.data.page)
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {
    
  }
})