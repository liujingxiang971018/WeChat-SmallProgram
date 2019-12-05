const app =getApp()
Page({
  /**
   * 页面的初始数据
   */
  data: {
    info:[],
    islike:'',
    comid :0,
    list: [
    ],
  },
// 加载更多评论
gocomm:function(){
  var that = this
  console.log('页面id',that.data.comid)
  wx.navigateTo({
    url: '../comment/comment?id=' + that.data.comid,
    success: function (res) {console.log('评论页面跳转成功')},
    fail: function () {},
    complete: function () {}
  })
},
//点击喜欢按钮
  oncollectionTap:function(){
    var that = this
    // console.log('点击喜欢按钮')
    if(that.data.islike == true){
      that.setData({
        islike : false
      })
    }
    else{
      that.setData({
        islike: true
      })
    }
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this
    that.data.comid = options.id
    wx.request({
      url: 'http://123.207.6.17/getdetail',
      data: { id: options.id, openid: app.data.openid},
      method:'GET',
      success:function(res){
        var tag = false
        if (res.data.array[0]['islike']=='true')
        {
          tag = true
        }
        that.setData({
          info:res.data.array[0],
          islike: tag,
          list:res.data.comlist
        })
      }
    })
  },
// 判断是否需要更新
judgement(){
  var that = this
  // console.log('传输过来的islike值', that.data.info['islike'])
  // console.log('本页面islike的值', that.data.islike)
  var tag = false
  if (that.data.info['islike'] == 'true') {tag = true}
  if(that.data.islike != tag){
    wx.request({
      url: 'http://123.207.6.17/upliketag',
      data:{islike:that.data.islike,openid:app.data.openid,bookid:that.data.comid},
      success:function(res){
        console.log('like标签设置成功')
      }
    }) 
  }
  else{
    console.log('标签值相等，不调用uplike')
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
    var that = this
    wx.request({
      url: 'http://123.207.6.17/getdetail',
      data: { id: that.data.comid, openid: app.data.openid },
      method: 'GET',
      success: function (res) {
        var tag = false
        if (res.data.array[0]['islike'] == 'true') {
          tag = true
        }
        that.setData({
          info: res.data.array[0],
          islike: tag,
          list: res.data.comlist
        })
      }
    })
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
    var that = this
    that.judgement()
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