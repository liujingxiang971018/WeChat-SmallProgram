App({
globalData:{
  userInfo:null,
},
data:{
  openid:'',
  appid: 'wxde7e651c66270fe9',
  secret:'0af449788787893a31084b16d4f8b868',
},
  /**
   * 当小程序初始化完成时，会触发 onLaunch（全局只触发一次）
   */
  onLaunch: function () {
    var that = this
    wx.login({
      //获取code
      success: function(res){
        var code = res.code
        //发起网络请求获取openid
        wx.request({
          url: 'https://api.weixin.qq.com/sns/jscode2session?appid='+that.data.appid+'&secret='+that.data.secret+'&js_code=' + code + '&grant_type=authorization_code',
          data:{},
          header:{
            'content-type': 'application/json'
          },
          success:function(res){
            that.data.openid = res.data.openid
            console.log('登陆获取到openid', that.data.openid )
          }
        })
      },
      fail:function(res){console.log('登陆获取code失败')}
    })
  },

  /**
   * 当小程序启动，或从后台进入前台显示，会触发 onShow
   */
  onShow: function (options) {
    
  },

  /**
   * 当小程序从前台进入后台，会触发 onHide
   */
  onHide: function () {
    
  },

  /**
   * 当小程序发生脚本错误，或者 api 调用失败时，会触发 onError 并带上错误信息
   */
  onError: function (msg) {
    
  }
})
