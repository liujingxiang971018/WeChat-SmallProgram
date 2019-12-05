const app = getApp()
Page({
  /**
   * 页面的初始数据
   */
  data: {
    scrollHeight:'500',
    userInfo : {},
    bookid:0,
    page:1,
    mylist:[ ],
    initialvalue:'',
  },
//提交表单操作
  submitForm(e){
    var form = e.detail.value;
    var that = this;
    if(form.comment == ''){
      wx.showToast({
        title: '请输入内容',
        icon:'loading',
        duration:2000
      })
      return 
    }
    else{
      //提交评论
      console.log("comment获取用户信息", app.globalData.userInfo['nickName'])
      wx.request({
        url: 'http://123.207.6.17/subform/',
        method: "GET",
        data:{
          comment : form.comment,
          bookid : that.data.bookid,
          openid: app.data.openid,
          username: app.globalData.userInfo['nickName'],
          userPhoto: app.globalData.userInfo['avatarUrl']
        },
        success: res=>{
          that.setData({
            initialvalue:''
          })
          console.log(res)
          if(res.data['reply'] == 'subform success')
          {
            wx.showToast({
              title: '发表成功',
            })
          that.loadcontent(taht.data.bookid, 1)
          }
          else{
            wx.showToast({
              title: '您已评论过了',
              icon:'loading',
            })
          }
        }
      })
    }
  },
  // 加载页面内容
  loadcontent:function(bookid,mypage){
    var that = this
    wx.request({
      url: 'http://123.207.6.17/getcomment',
      data:{bookid:bookid,page:mypage},
      success:function(res){
        console.log('评论数据：',res.data)
        var dataArr = that.data.mylist
        var newData = dataArr.concat(res.data.comlist)
        that.setData({
          mylist: newData,
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
    var that = this;
    console.log('com页面监听', app.globalData.userInfo['nickName']),
    //设置scroll的高度
    wx.getSystemInfo({
      success: function (res) {
        that.setData({
          scrollHeight: (res.windowHeight)-50,
        });
      }
    });
    that.setData({
      bookid : options.id ,
    })
    that.loadcontent(options.id,that.data.page)
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
    // this.loadcontent(this.data.bookid,1)
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
    that.loadcontent(that.data.bookid,that.data.mypage)
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {
    
  }
})