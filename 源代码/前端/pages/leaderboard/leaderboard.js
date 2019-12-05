Page({

  /**
   * 页面的初始数据
   */
  data: {
    searchcontent:'',
    searchkeyvalue:'',
    array: [ ],
    page:1,
  },
//加载页面数据
loadcontent:function(search,mypage,mykeyvalue){
  var that = this
  wx.request({
    url: 'http://123.207.6.17/searchcontent',
    data:{content:search,page:mypage,keyvalue:mykeyvalue},
    success:function(res){
      console.log(res.data)
      var dataArr = that.data.array
      var newData = dataArr.concat(res.data.array)
      that.setData({
        array: newData,
        page:mypage+1
      })
    },
    fail:function(res){},
    complete:function(res){},
  })
},
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this
    console.log('keyvalue', options.keyvalue)
    that.setData({
      searchcontent:options.search,
      searchkeyvalue:options.keyvalue
    })
    that.loadcontent(that.data.searchcontent,that.data.page,that.data.searchkeyvalue)
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
    that.loadcontent(that.data.searchcontent,that.data.page,that.data.searchkeyvalue)
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {
    
  }
})