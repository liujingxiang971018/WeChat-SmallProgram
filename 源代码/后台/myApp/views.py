from django.shortcuts import render

# Create your views here.
from django.shortcuts import render
from django.http import HttpResponse
from .models import Users,Books,Score,Reviews
from django.http import JsonResponse
import operator
#返回阅读数量最高的三本图书
def booksranking(request):
    #每页显示三条数据
    page = int(request.GET.get('page'))
    BookList = Books.bookObj.values()
    sorted_list = sorted(BookList,key = operator.itemgetter('breadtimes'),reverse=True)[(page-1)*3:3*page]
    list = []
    for book in sorted_list:
        list.append(book)
    return JsonResponse({'array':list},json_dumps_params={'ensure_ascii':False})
#返回最新出版的图书
def bookspubnew(request):
    #每页显示3条数据
    page = int(request.GET.get('page'))
    BookList = Books.bookObj.values()
    sorted_list = sorted(BookList,key = operator.itemgetter('bpubtime'),reverse=True)[(page-1)*3:3*page]
    list = []
    for book in sorted_list:
        list.append(book)
    return JsonResponse({'array':list},json_dumps_params={'ensure_ascii':False})
#返回系统最近添加的图书
def booksaddnew(request):
    #每页显示三条数据
    page = int(request.GET.get('page'))
    BookList = Books.bookObj.values()
    sorted_list = sorted(BookList,key = operator.itemgetter('bsystime'),reverse=True)[(page-1)*3:3*page]
    list = []
    for book in sorted_list:
        list.append(book)
    return JsonResponse({'array':list},json_dumps_params={'ensure_ascii':False})
#返回系统最近添加图书的图片url
def booksaddnewimg(request):
    num = int(request.GET.get('num'))
    BookList = Books.bookObj.values()
    sorted_list = sorted(BookList,key = operator.itemgetter('bsystime'),reverse=True)[0:num]
    imglist = []
    for book in sorted_list:
        imglist.append({'id':book['id'],'bimageurl':book['bimageurl']})
    return JsonResponse({'imgarray':imglist},json_dumps_params={'ensure_ascii':False})
#返回详情界面的数据
def getdetail(request):
    mypk = int(request.GET.get('id'))#图书主键mypk
    openid = (request.GET.get('openid'))#用户openid
    # print(openid)
    books = Books.bookObj.filter(pk = mypk).values()
    Booklist = []
    for book in books:
        Booklist.append(book)
    tag = Score.scoreObj.filter(sbookid = mypk,suserid = openid).values()
    # print(tag)
    if(tag):
        Booklist[0]['islike'] = 'true'
    else:
        Booklist[0]['islike'] = 'false'
    # 返回两条评论信息
    Commlist = []
    com = Reviews.reviewObj.filter(rbookid = mypk).values()[0:1]
    for com1 in com:
        Commlist.append(com1)
    return JsonResponse({'array':Booklist,'comlist':Commlist},json_dumps_params={'ensure_ascii':False})
def getuserinfo(request):
    useropenid = request.GET.get('useropenid')
    username = request.GET.get('username')
    usergender = request.GET.get('usergender')
    userimg = request.GET.get('userimg')
    usercountry = str(request.GET.get('usercountry'))
    userprovince = str(request.GET.get('userprovince'))
    usercity = str(request.GET.get('usercity'))
    userlocation = usercountry + userprovince + usercity
    user = Users.userObj.filter(pk = useropenid).values()
    if(user):
        newuser = Users.userObj.get(uopenid = useropenid)
        newuser.uopenid = useropenid
        newuser.uname = username
        newuser.ugender = usergender
        newuser.uphoto = userimg
        newuser.ulocation = userlocation
        newuser.save()
        print('存在当前用户,执行更新操作')
    else:
        print('建立新用户')
        newuser = Users.userObj.createuser(useropenid,username,usergender,userimg,userlocation)
        newuser.save()
    return JsonResponse({'data':'login success'},json_dumps_params={'ensure_ascii':False})
# 接收表单
def subform(request):
    comment = request.GET.get('comment')
    bookid = request.GET.get('bookid')
    userid = request.GET.get('openid')
    username = request.GET.get('username')
    userPhoto = request.GET.get('userPhoto')
    print(userid,bookid,comment,username,userPhoto)
    judge_review = Reviews.reviewObj.filter(rbookid = bookid,ruserid = userid).values()
    if(judge_review):
         return JsonResponse({'reply':'too many'},json_dumps_params={'ensure_ascii':False})
    else:
        user = Users.userObj.get(uopenid=userid)
        book = Books.bookObj.get(id = bookid)
        new_review = Reviews.reviewObj.createreviews(user,book,username,comment,userPhoto)
        new_review.save()
        return JsonResponse({'reply':'subform success'},json_dumps_params={'ensure_ascii':False})
# 更新喜爱标签
def upliketag(request):
    openid = request.GET.get('openid')
    tag = request.GET.get('islike')
    bookid = request.GET.get('bookid')
    print(tag)
    if(tag == 'true'):
        userid = Users.userObj.get(uopenid=openid)
        thisbookid = Books.bookObj.get(pk=bookid)
        like = Score.scoreObj.createscore(userid,thisbookid,'True')
        like.save()
    else:
        Score.scoreObj.filter(suserid=openid,sbookid=bookid).delete()
    return JsonResponse({'data':'upliketag success'},json_dumps_params={'ensure_ascii':False})
#获取评论,每次返回5条数据
def getcomment(request):
    bookid = request.GET.get('bookid')
    page = int(request.GET.get('page'))
    comments = Reviews.reviewObj.filter(rbookid = bookid).values()[(page-1)*5:page*5]
    comment = []
    for com in comments:
        comment.append(com)
    return JsonResponse({'comlist':comment},json_dumps_params={'ensure_ascii':False})
#获取搜索内容
def searchcontent(request):
    content = request.GET.get('content')
    page = int(request.GET.get('page'))
    keyvalue = int(request.GET.get('keyvalue'))
    print('-------------',content)
    if(keyvalue == 0):
        books = Books.bookObj.filter(btitle__contains=content).values()[(page-1)*5:page*5]
    elif(keyvalue == 1):
        books = Books.bookObj.filter(bauthor__contains=content).values()[(page-1)*5:page*5]
    else:
        books = Books.bookObj.filter(bisbn__contains=content).values()[(page-1)*5:page*5]
    booklist = []
    for book in books:
        booklist.append(book)
    return JsonResponse({'array':booklist},json_dumps_params={'ensure_ascii':False})

import numpy as np
import pandas as pd
import math
from operator import itemgetter
def dataprocess():
    reviwList = Score.scoreObj.values() #读出数据库内容
    # reviwList = Reviews.reviewObj.values()
    reviws = [] #用户喜爱列表
    for reviw in reviwList:
        reviws.append(reviw)
    rows2 = []
    user_like=dict()#用户喜爱字典
    for index,row_tmp in enumerate(reviws):
        if((row_tmp['stag']) == True ): #如果标签是喜欢
            #将该记录加入用户喜爱列表
            rows2.append(reviws[index])
            #若用户喜爱字典中还没有该用户的记录
            if row_tmp['suserid_id'] not in user_like:
                #为该用户建立无序不重复元素集
                user_like[row_tmp['suserid_id']] = set()
                #在该集合中加入喜爱图书的id
                user_like[row_tmp['suserid_id']].add(row_tmp['sbookid_id'])
            #若字典中已经存在该用户的喜爱集合，则直接为其加入图书id
            user_like[row_tmp['suserid_id']].add(row_tmp['sbookid_id'])
    #返回用户喜爱列表和喜爱字典
    return reviws,user_like
#train为用户喜爱列表
def Usersimilarity(train):
    #建立物品和用户的倒排表
    item_users = dict()
    for row in train:
        #若该图书不在倒排表中
        if row['sbookid_id'] not in item_users:
            #为该图书建立无序不重复元素集
            item_users[row['sbookid_id']] = set()
            #将用户id添加到该集合中
            item_users[row['sbookid_id']].add(row['suserid_id'])
        #若字典中已经存在该图书的集合，则将用户id加入
        item_users[row['sbookid_id']].add(row['suserid_id'])

    # print(item_users)
    #计算矩阵，若两个用户喜欢相同的物品，对应位置加一
    C = dict()
    N = dict()
    #改进后的余弦相似度算法，惩罚对于热门商品的喜爱
    for i, users in item_users.items():
        for u in users:
            N.setdefault(u,0)
            #喜欢物品u的用户数+1
            N[u] = N[u]+ 1
            # print(N)
            for v in users:
                if u == v:
                    continue
                #若物品u在字典C中，且u不同于v
                if u in C:
                    #若C[u][v]没有值，将C[u][v]设置为0
                    C[u].setdefault(v,0)
                    #计算C[u][v]的值
                    C[u][v] += 1/ math.log(1+len(users))
                #若u不在字典C中，且u不同于v
                else:
                    #设置C[u][v]为0
                    C.update({u:{v:0}})
                    C[u][v] += 1/ math.log(1+len(users))
    # print(C)
    #计算最终的相似矩阵
    W = dict()
    #C是二维的，首先得到行
    for u, related_users in C.items():
        #再得到列的每个元素
        for v,cuv in related_users.items():
            if u in W:
                W[u].setdefault(v,0)
                W[u][v] = cuv / math.sqrt(N[u]*N[v])
            else:
                W.update({u:{v:0}})
                W[u][v] = cuv / math.sqrt(N[u]*N[v])
    return W

#兴趣最接近的K个用户
#user表示用户id,train表示用户喜爱列表，W为相似度矩阵
def Recommend(user,user_like,W):
    #排序字典
    rank = dict()
    #用户喜爱的物品
    interacted_items = user_like[user]
    # print(interacted_items)
    if user in W:
        # print (W[user].items())
        # print(sorted(W[user].items(),key=itemgetter(1),reverse=True)[0:3])
        #按照user所在行的相似度由大到小进行排序，取前4个用户
        for u,sim in sorted(W[user].items(),key=itemgetter(1),reverse=True)[0:3]:
            print(u,sim)
            #相似度为前4的用户喜爱的物品
            for item in user_like[u]:
                #若用户已经喜爱了，跳过
                if item in interacted_items:
                    continue
                #若用户还没有喜爱，则加入推荐列表中，且计算出喜爱程度
                if item not in rank:
                    rank.setdefault(item,0)
                    rank[item] += sim * 1
                rank[item] += sim * 1

    return rank

#推荐内容
def getrecommender(request):
    userid = request.GET.get('userid')
    page = int(request.GET.get('page'))
    reviws,user_like = dataprocess()
    W = Usersimilarity(reviws)
    books = []
    rank = Recommend(userid,user_like,W)
    print(len(rank))
    #若是新用户或者推荐列表已经遍历完
    if((page-1)*10>=len(rank)):
        BookList = Books.bookObj.values()
        sorted_list = sorted(BookList,key = operator.itemgetter('breadtimes'),reverse=True)[(page-1)*10:10*page]
        for book in sorted_list:
            books.append(book)
        books1 = books
    else:
        sorted_rank = sorted(rank.items(),key=lambda x:x[1])[(page-1)*5:5*page]
        for index,item in enumerate(sorted_rank):
            book = Books.bookObj.filter(pk = item[0]).values()
            books.append(list(book))#将QuerySet转为list
        books1 = []
        for book1 in books:
            books1.append(book1[0])
    print('--------------------------------------',books1)
    return JsonResponse({'array':books1},json_dumps_params={'ensure_ascii':False})
#喜爱内容
def getlikelist(request):
    userid = request.GET.get('userid')
    page = int(request.GET.get('page'))
    ScoreList = Score.scoreObj.filter(suserid = userid).values()[(page-1)*10:10*page]
    Scores = []
    for sco in ScoreList:
        Scores.append(sco)
    books = []
    for sco in Scores:
        books.append(list(Books.bookObj.filter(pk = sco['sbookid_id']).values()))
    books1 = []
    for book1 in books:
        books1.append(book1[0])
    return JsonResponse({'array':books1},json_dumps_params={'ensure_ascii':False})


