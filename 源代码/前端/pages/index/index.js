//index.js
//获取应用实例
Page({
  /**
   * 页面的初始数据
   */
  data: {
    imgUrls: [],
    array: [],
    mypage:0,
  },
  //滑块点击事件处理函数
  swipclick:function(event){
    var mid = event.currentTarget.dataset.myid;
    // console.log(mid)
    wx.navigateTo({
      url: '../detail/detail?id=' + mid,
      success: function (res) { },
      fail: function () { },
      complete: function () {}
    })
  },
//搜索功能页面跳转
  Searchconfirm: function (e) {
    console.log(e.detail.value)
    wx.navigateTo({
      url: '../leaderboard/leaderboard?search=' + e.detail.value,
    })
  },
// 获取首页数据
loadData:function(page){
  var that = this
  wx.showLoading({
    title: '加载中',
  })
  wx.request({
    url: 'http://123.207.6.17/booksranking',
    data:{page:page},
    header:{
      'content-type':'application/json'
    },
    success:function(res){
      // console.log((res.data.array).length)
      if(!(res.data.array).length)
      {
        wx.showToast({
          title: '没有更多了',
          image:'../../image/fail.png',
          duration:1500,
          mask:true,
          success:function(res){ },
          fail:function(res){},
          complete:function(res){},
        })
        return false
      }
      that.setData({mypage:page+1})
      // console.log(page)
      var dataArr = that.data.array
      // console.log(dataArr)
      var newData = dataArr.concat(res.data.array)
      // console.log(newData)
      that.setData({
        array:newData
      })
    },
    complete:function(){
      //隐藏加载中提示
      setTimeout(function(){
        wx.hideLoading()
      },1000)
    }
  })
},

loadimg:function(num){
  var that = this
  wx.request({
    url: 'http://123.207.6.17/booksaddnewimg',
    data:{num:num},
    success:function(res){
      var list = []
      for (var i=0;i<res.data.imgarray.length;i++)
      {
        list[i] = res.data.imgarray[i]
      }
      that.setData({
        imgUrls: list
      })
    }
  })
},
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that =this
    that.loadData(1)
    that.loadimg(5)
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
    that.loadData(that.data.mypage)
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {
    
  }
})