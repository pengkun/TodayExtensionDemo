# TodayExtensionDemo

---
title: 在Today Extension中引用cocopods导入的第三方库
date: 2017-07-12 11:32:24
tags: 自强不息
---
直接开始正文。

首先创建一个project
![](/images/2017/today_extension_image1.png)
![](/images/2017/today_extension_image2.png)
在宿主App中创建插件难免会遇到需要公用类的情况，而使用的公用类中也许会用到由cocopods导入的第三方库，今天来创建一个demo记录一下

看大神的博客中讲到插件和宿主APP共享代码需要建立私有 framework，将公用的类在Target Membership选中framework项目,然后分别在宿主App和Today Extension的Build Phases->Link Binary With Libraries中加入framework。如图：
![](/images/2017/today_extension_image4.png)

我建了一个TEKit和ContentView类，初始化两个label，使用SnapKit添加约束。OK，运行一下项目，报错。

 	1. 首先是公用的类undeclared。
 	2. 其次是公用类中引用的SnapKit找不到
 
 先从1开始解决(SnapKit相关代码先注释)，尝试1：
 
 	1. 首先在虚拟机环境编译framework
 	2. 在Build Phases配置中导入私有framework
 运行还是报同样的错。
 尝试2：
 	
 	1. 因为类默认状态是internal(在当前module中能被访问)
 知道原因了就知道怎么修改了，将class的访问权限修改成public，运行。通过! [类的权限public,internal,private,fileprivate,open](https://pengkun.github.io)

#### 在真机运行是要注意，会提示Reason: image not found，这是因为项目没有绑定你的framework导致的，需要在Build Phases添加一个Copy files phase
![](/images/2017/today_extension_image5.png)

ok,再来看下第二个问题
在framework和extension中引用cocopods时，在project中选中右侧Info->Configurations里面点开箭头你会发现宿主App右侧选中的是Pods-xx.debug, XXX-extension右侧是none，选中和project名字一样的配置就可以了
![](/images/2017/today_extension_image3.png)

其实还有一种更简单的方法是 将共享的类 在 Target Membership中都选中你需要引用的项目
![](/images/2017/today_extension_image4.png)
 不过这是一个非常不推荐的方法，因为编译时它会编译多次

