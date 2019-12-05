from django.contrib import admin
from .models import Users,Books,Score,Reviews
# Register your models here.

@admin.register(Users)
class UsersAdmin(admin.ModelAdmin):
    def PK(self):
        return self.pk
    def gender(self):
        if self.ugender:
            return "男"
        else:
            return "女"
    gender.short_description = '性别'
    list_display = [PK,'user_image_data','uname',gender,'ulocation','uentrytime']
    list_filter = ['ugender']
    list_per_page = 5   #每页展示的数据量
    search_fields = ['uname']   #搜索字段
    actions_on_top = True



@admin.register(Books)
class BooksAdmin(admin.ModelAdmin):
    def PK(self):
        return self.pk
    PK.short_description = '编号'
    def textlen(self):
        if len(str(self.bcontent))>100:
            return '{}.......'.format(str(self.bcontent)[0:100])
        else:
            return str(self.bcontent)
    textlen.short_description = '内容概要'
    #展示的字段序列
    list_display = [PK,'image_data','btitle','bauthor','bpages',textlen,'bisbn','bpubtime',
                    'breadtimes','bavescore','bsystime']
    readonly_fields = ["image_data"] #只读字段
    list_per_page = 5   #每页展示的数据量
    search_fields = ['btitle']  #搜索字段
    #执行动作位置问题
    actions_on_top = True

@admin.register(Score)
class ScoreAdmin(admin.ModelAdmin):
    def tag(self):
        if self.stag:
            return '喜欢'
        else:
            return '不喜欢'
    tag.short_description = '是否喜欢'
    list_display = ['suserid','sbookid',tag]
    list_filter = ['suserid']
    list_per_page = 5
    search_fields = ['suserid','sbookid']
    actions_on_top = True

@admin.register(Reviews)
class ReviewsAdmin(admin.ModelAdmin):
    # def book_name(self):
    #     book = Books.bookObj.filter(id=int(self.rbookid)).values()
    #     return book['btitle']
    # book_name.short_description = '图书标题'
    list_display = ['ruser_image_data','rusername','ruserid','rbookid','rreview','rpublishtime']
    list_filter = ['ruserid']
    list_per_page = 5
    search_fields = ['ruserid','rbookid']
    actions_on_top = True