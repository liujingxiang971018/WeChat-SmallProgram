// components/MyTitle/MyTitle.js
Component({
  /**
   * 组件的属性列表
   */
  properties: {

  },

  /**
   * 组件的初始数据
   */
  data: {
    inputvalue : '',
    searchtitle:'请输入图书名称',
    array: ['标题', '作者', 'is\nbn'],
    index: 0,
  },
  //input的value值
 
  /**
   * 组件的方法列表
   */
  methods: {
    Searchconfirm:function(e){
      var that = this
      if (e.detail.value != '') {
        this.setData({
          inputvalue: ''
        })
        wx.navigateTo({
          url: '../leaderboard/leaderboard?search=' + e.detail.value + "&keyvalue=" + that.data.index,
        })
      }
    },
    submitForm:function(e){
      var form = e.detail.value
      var that = this
      if(form.searchinput != '')
      {
        this.setData({
          inputvalue:''
        })
        wx.navigateTo({
          url: '../leaderboard/leaderboard?search=' + form.searchinput + "&keyvalue=" + that.data.index,
        })
      }
    },
    bindPickerChange:function(e){
      var that = this
      var value = e.detail.value
      if(value == 0){
        that.setData({
          searchtitle:'请输入图书名称',
          index:0
        })
      }
      else if(value == 1){
        that.setData({
          searchtitle:'请输入作者',
          index:1
        })
      }
      else{
        that.setData({
          searchtitle: '请输入isbn号',
          index:2
        })
      }
    }
  }
})
