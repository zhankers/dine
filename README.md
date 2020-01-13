> 今天来给大家讲解一个完整的微信小程序点餐项目。java后台+微信小程序实现点餐系统。

# 后台技术选型：
- JDK8
- MySQL（需要5.6以上）
- Spring-boot
- Spring-data-jpa
- Lombok
- Freemarker
- Bootstrap
- Websocket

# 小程序端技术选型
- 微信小程序

# 老规矩先看效果图
### 管理后台
![菜品管理](https://imgconvert.csdnimg.cn/aHR0cHM6Ly91cGxvYWQtaW1hZ2VzLmppYW5zaHUuaW8vdXBsb2FkX2ltYWdlcy82MjczNzEzLTkyODAxNzI3OGY0NjVjYmQucG5n)
![订单管理](https://imgconvert.csdnimg.cn/aHR0cHM6Ly91cGxvYWQtaW1hZ2VzLmppYW5zaHUuaW8vdXBsb2FkX2ltYWdlcy82MjczNzEzLTRlZGVkZTMzZmFhN2VhNzIucG5n)
小程序下单完成后会有消息推送，如下
![消息推送](https://imgconvert.csdnimg.cn/aHR0cHM6Ly91cGxvYWQtaW1hZ2VzLmppYW5zaHUuaW8vdXBsb2FkX2ltYWdlcy82MjczNzEzLTIzOTFhODMwOTE3NDA5OTEucG5n)
可以直接操作订单
![操作订单](https://imgconvert.csdnimg.cn/aHR0cHM6Ly91cGxvYWQtaW1hZ2VzLmppYW5zaHUuaW8vdXBsb2FkX2ltYWdlcy82MjczNzEzLTViMjViZDFlNTY5MTEzZTMucG5n)

# 小程序端
![小程序端功能](https://imgconvert.csdnimg.cn/aHR0cHM6Ly91cGxvYWQtaW1hZ2VzLmppYW5zaHUuaW8vdXBsb2FkX2ltYWdlcy82MjczNzEzLThkNmMyYjgxNzAxZDMyY2QucG5n)
如上图，目前实现了如下功能。

## 小程序首页
1，扫码点餐
2，菜品浏览
3，餐厅电话
4，在线客服
![](https://imgconvert.csdnimg.cn/aHR0cHM6Ly91cGxvYWQtaW1hZ2VzLmppYW5zaHUuaW8vdXBsb2FkX2ltYWdlcy82MjczNzEzLTQxMGQ5M2Q1Y2E5ZDBkYjUucG5n)
## 菜品分类显示
![](https://imgconvert.csdnimg.cn/aHR0cHM6Ly91cGxvYWQtaW1hZ2VzLmppYW5zaHUuaW8vdXBsb2FkX2ltYWdlcy82MjczNzEzLThjMDM1Y2Q4MTI0M2E5YmEucG5n)

## 购物车编辑页
![](https://imgconvert.csdnimg.cn/aHR0cHM6Ly91cGxvYWQtaW1hZ2VzLmppYW5zaHUuaW8vdXBsb2FkX2ltYWdlcy82MjczNzEzLWJlNGNhZTBlMTFlYzJhMTcucG5n)

## 订单确认页（可以选择就餐人数）
![](https://imgconvert.csdnimg.cn/aHR0cHM6Ly91cGxvYWQtaW1hZ2VzLmppYW5zaHUuaW8vdXBsb2FkX2ltYWdlcy82MjczNzEzLTM0MDAxN2MxMjZmMmRiZjAucG5n)
## 支付系统（模拟支付，可接入微信支付）
![](https://imgconvert.csdnimg.cn/aHR0cHM6Ly91cGxvYWQtaW1hZ2VzLmppYW5zaHUuaW8vdXBsb2FkX2ltYWdlcy82MjczNzEzLTA1NThjMDk2MDcyZDgzYjgucG5n)

## 订单列表页（多种订单状态）
![](https://imgconvert.csdnimg.cn/aHR0cHM6Ly91cGxvYWQtaW1hZ2VzLmppYW5zaHUuaW8vdXBsb2FkX2ltYWdlcy82MjczNzEzLWI5YjE2YjE0M2FkNWM2MGYucG5n)

## 评论系统（评价列表）
![](https://imgconvert.csdnimg.cn/aHR0cHM6Ly91cGxvYWQtaW1hZ2VzLmppYW5zaHUuaW8vdXBsb2FkX2ltYWdlcy82MjczNzEzLTFlYWIxNWQxMjBhNDI1MzcucG5n)


# 下面说下使用流程
## 一，两种获取源码的方式
1，直接找老师索要源码，老师微信：2501902696

2，关注老师公号，然后到老师微信公号回复“点餐小程序”获取源码
![](https://imgconvert.csdnimg.cn/aHR0cHM6Ly91cGxvYWQtaW1hZ2VzLmppYW5zaHUuaW8vdXBsb2FkX2ltYWdlcy82MjczNzEzLTViNzA1Zjk1MGEzNWM1MDEucG5n)


# 二，安装jdk8，mysql
jdk的安装，可以参考老师下面这篇文章
[https://www.jianshu.com/p/504291d87cc5](https://www.jianshu.com/p/504291d87cc5)

mysql的安装就不在细讲了，百度下，网上一大堆安装mysql的文章。
有一点需要特殊注意的：mysql必须是5.6以上版本（我用的是5.7版本，最好和老师保持一致）
![](https://imgconvert.csdnimg.cn/aHR0cHM6Ly91cGxvYWQtaW1hZ2VzLmppYW5zaHUuaW8vdXBsb2FkX2ltYWdlcy82MjczNzEzLTc5NzMxOWNjMzgyY2Q1MjMucG5n)

# 三，导入java代码
- 1，我的java开发工具是IntelliJ IDEA，最好和我保持一致
- 2，如果你不知道如何导入java源码到idea，可以看下下面视频教程。
[https://edu.csdn.net/course/play/23443/265597](https://edu.csdn.net/course/play/23443/265597)


# 四，创建数据库和表格表
导入源码成功后，执行下图的sql语句，即可创建数据库和数据表格
![](https://imgconvert.csdnimg.cn/aHR0cHM6Ly91cGxvYWQtaW1hZ2VzLmppYW5zaHUuaW8vdXBsb2FkX2ltYWdlcy82MjczNzEzLTQ0YzQwZTUzZDRkMTkxZjEucG5n)

我是用IntelliJ IDEA自带的建表工具进行快速建表和管理表的
![](https://imgconvert.csdnimg.cn/aHR0cHM6Ly91cGxvYWQtaW1hZ2VzLmppYW5zaHUuaW8vdXBsb2FkX2ltYWdlcy82MjczNzEzLWYyNGE0OTE2NGQ5MDcwNWMucG5n)
如果你不知道怎么使用，想用idea自带的管理工具，可以看下面这个视频：
[https://edu.csdn.net/course/play/23443/268165](https://edu.csdn.net/course/play/23443/268165)

# 五，修改配置
只需要把mysql数据库的账号和密码改成你的就行了。
![image.png](https://imgconvert.csdnimg.cn/aHR0cHM6Ly91cGxvYWQtaW1hZ2VzLmppYW5zaHUuaW8vdXBsb2FkX2ltYWdlcy82MjczNzEzLThiOWI4M2ZiYWY0ZmRlMjcucG5n)
# 六，在seller_info表里创建一个管理员用于登录管理后台
![创建管理员](https://imgconvert.csdnimg.cn/aHR0cHM6Ly91cGxvYWQtaW1hZ2VzLmppYW5zaHUuaW8vdXBsb2FkX2ltYWdlcy82MjczNzEzLTA5ZTBiOWM0YjMyOWQwMmMucG5n)

---
# 小程序代码的导入与运行
##  一，导入源码到小程序开发工具
![image.png](https://imgconvert.csdnimg.cn/aHR0cHM6Ly91cGxvYWQtaW1hZ2VzLmppYW5zaHUuaW8vdXBsb2FkX2ltYWdlcy82MjczNzEzLTc4YTJlNTU2YjFhNjU3MjYucG5n)
你如果没有小程序开发基础，只需要看下这个视频学习下如何导入小程序源码到开发者工具即可
[https://edu.csdn.net/course/play/9531/234418](https://edu.csdn.net/course/play/9531/234418)

# 二，导入成功后直接就可以用了
> 如果你想用扫码点餐，就把下面注释打开，使用真机调试。

真机调试才可以扫码点餐
![](https://imgconvert.csdnimg.cn/aHR0cHM6Ly91cGxvYWQtaW1hZ2VzLmppYW5zaHUuaW8vdXBsb2FkX2ltYWdlcy82MjczNzEzLTVlNGI5MWNhYTY4ZTAxNDgucG5n)
扫码点餐的实现代码，需要解开注释。
![](https://imgconvert.csdnimg.cn/aHR0cHM6Ly91cGxvYWQtaW1hZ2VzLmppYW5zaHUuaW8vdXBsb2FkX2ltYWdlcy82MjczNzEzLTI2MzdlNmJkOTA0ZWVjMGIucG5n)

# 三，如果要扫码点餐的话，就扫码下面二维码。识别桌号
![](https://imgconvert.csdnimg.cn/aHR0cHM6Ly91cGxvYWQtaW1hZ2VzLmppYW5zaHUuaW8vdXBsb2FkX2ltYWdlcy82MjczNzEzLWMzMGU4OTk3ZTg1MzQxYmYucG5n)

到这里我们java后台+点餐小程序实现就可以了。
如果导入代码中有任何问题可以加我微信：2501902696（备注编程）

### 我后面会录制一套完整的视频来教大家如何快速的开发点餐系统。敬请期待。。。。









