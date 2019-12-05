from django.db import models
from django.utils.html import format_html
#自定义用户管理器类
class UsersManager(models.Manager):
    def createuser(self,openid,name,gender,photo,location):
        user = self.model()
        user.uname = name
        user.uopenid = openid
        user.ugender = gender
        user.uphoto = photo
        user.ulocation = location
        return user

#定义用户管理模型
class Users(models.Model):
    userObj = UsersManager()
    uopenid = models.CharField('用户openid',max_length=30,primary_key=True,default='defaultopenid')
    uname = models.CharField('用户名',max_length=20,blank=True,null=True)
    ugender = models.BooleanField(default=False)
    uphoto = models.CharField('用户头像',max_length=300,blank=True,null=True)
    ulocation = models.CharField('所在地区',max_length=50,blank=True,null=True)
    uentrytime = models.DateTimeField('最近登陆时间',auto_now = True)
    def user_image_data(self):
        return format_html('<img src="{}" width="50px"/>',self.uphoto,)
    user_image_data.short_description = '用户头像'
    class Meta:
        db_table = 'users'
        ordering = ['-uentrytime']
    def __str__(self):
        return self.uname

#�Զ���ͼ��ģ�͹�����
class BooksManager(models.Manager):
    def createbook(self,title,author,pages,pubtime,readtimes,isbn,avescore,content,imageurl):
        book =self.model()
        book.bbtitle = title
        book.bauthor = author
        book.bpages = pages
        book.bpubtime = pubtime
        book.breadtimes = readtimes
        book.bisbn = isbn
        book.bavescore = avescore
        book.bimageurl = imageurl
        book.bcontent = content
        return book

#����ͼ��ģ��
class Books(models.Model):
    bookObj = BooksManager()
    btitle = models.CharField('标题',max_length=50,blank=True,null=True)
    bauthor = models.CharField('作者',max_length=20,blank=True,null=True)
    bpages = models.IntegerField('页数',blank=True,null=True)
    bpubtime = models.DateField('出版日期',blank=True,null=True)
    breadtimes = models.IntegerField('阅读次数',blank=True,null=True)
    bisbn = models.CharField('isbn号',max_length=13,blank=True,null=True)
    bavescore = models.DecimalField('平均分',max_digits=3,decimal_places=2,blank=True,null=True)
    bcontent = models.TextField('内容概要',blank=True,null=True)
    bimageurl = models.CharField(max_length=100,blank=True,null=True)
    bsystime = models.DateField('系统添加时间',auto_now_add =True)
    def image_data(self):
        return format_html('<img src="{}" width="50px"/>',self.bimageurl,)
    image_data.short_description = '图片'
    class Meta:
        db_table = 'books'
        ordering = ['-id']
    def __str__(self):
        return self.btitle

#�Զ�������ģ�͹�����
class ScoreManager(models.Manager):
    def createscore(self,userid,bookid,tag):
        thisscore = self.model()
        thisscore.suserid = userid
        thisscore.sbookid = bookid
        thisscore.stag = tag
        return thisscore

#���ֹ���ģ��
class Score(models.Model):
    scoreObj = ScoreManager()
    suserid = models.ForeignKey("Users",verbose_name='用户id',on_delete=models.CASCADE)
    sbookid = models.ForeignKey("Books",verbose_name='图书id',on_delete=models.CASCADE)
    stag = models.BooleanField(default=True)
    class Meta:
        db_table = "score"
        ordering = ['-id']
        unique_together = ('suserid','sbookid')
    # def __str__(self):
    #     return self.suserid

#�Զ������۹���ģ����
class ReviewsManager(models.Manager):
    def createreviews(self,userid,bookid,username,review,userphoto):
        thisreview = self.model()
        thisreview.ruserid = userid
        thisreview.rbookid = bookid
        thisreview.rusername = username
        thisreview.rreview = review
        thisreview.ruserphoto = userphoto
        return thisreview

#���۹���ģ��
class Reviews(models.Model):
    reviewObj = ReviewsManager()
    ruserid = models.ForeignKey("Users",verbose_name='用户id',on_delete=models.CASCADE)
    rbookid = models.ForeignKey("Books",verbose_name='图书id',on_delete=models.CASCADE)
    rreview = models.TextField('评论',blank=True,null=True)
    rusername = models.CharField('用户名',max_length=20,blank=True,null=True)
    ruserphoto = models.CharField('用户头像',max_length=300,blank=True,null=True)
    rpublishtime = models.DateField('发表时间',auto_now_add = True,blank=True,null=True)
    #通过url在前端显示图片
    def ruser_image_data(self):
        return format_html('<img src="{}" width="50px"/>',self.ruserphoto,)
    ruser_image_data.short_description = '用户头像'
    class Meta:
        db_table = "review" #数据表名
        ordering = ["-rpublishtime"]    #按照发表时间排序
        unique_together = ('ruserid','rbookid') #唯一约束性字段
    # def __str__(self):
    #     return self.ruserid

