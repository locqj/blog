---
title: hexo搭建博客并在Github访问
date: 2017-01-30 00:43:31
tags: [技术,hexo]
---
hello！hexo！耗时半天，终于搭建并实现成功同步管理blog了，现在整理好文档，以便自我备份！

### 前期准备工作
  1. node.js [node官网](http://nodejs.cn/)
  2. git [git官网](https://git-scm.com/downloads)
  3. 编辑工具，看你个人能力吧，我通常还是用sublime比较便捷，记得下MarkDown的插件哦！
  4. github账号

### 安装node和git
  1. 安装node的话，直接安装msi文件，按着步骤走就好了，然后再cmd或者git bush中输入node -v 查看版本信息，有就说明安装成功。
  2. 安装git的话其实也和nod一样，查看版本信息，是git -version、
  3. 还有一个cnpm，一个淘宝源的cnpm，其实我觉得npm速度也没有网上说的不堪，就用npm也可以的。

### 安装hexo
  安装hexo在[官网](https://hexo.io/zh-cn/)上其实有几种安装方式，但是我还是选择用全局安装。
   1. 全局安装在git bush 下输入 npm install -g hexo-cli 安装完后还是查看版本信息验证是否成功 hexo -v。
   2. 创建hexo项目，在指定文件夹内（git bush 进入该文件夹）输入hexo init，待运行end后再输入 npm install。
   3. 安装完成后在终端输入 hexo s 就可以启动本地服务器，来查看你的hexo blog 了。

### 更换主题
   这个其实你可以在官网上面有一个分栏是主题的找到自己喜欢的主题，或者在google中搜索hexo 主题也可以找到该主题，然后你就可以在demo主题中找到该主题工程文件的github，下载下来，然后重点就是cp几个文件，一个是theme文件，一个是source文件，一个是根目录下面的配置文件，记得配置文件中需要改一改url地址,为你自己设定的地址。

### 创建github仓库和ssh
   这个网上搜索随便一抓一大把，就不做解释了,但是创建一个可以访问生成静态网页的仓库名需要这样设置，你的用户名.github.io，这样的话你以后blog的url：https://xxx.github.io
 

### 将本地博客同步到github上面
   在实现这个，我是重新建立一个仓库专门管理hexo代码,其实也就是静态的html罢了。然后在xxx.github.io的仓库是放置生成的静态网站。在实现这个功能，我们还需要装一个插件，在终端分别输入 npm install hexo -server --save 和 npm install hexo -deployer-git --save
   然后编辑根目录下面的配置文件如下配置即可
   ```
   deploy: 
       type: git 
       repo: git@github.com:你的github用户名/你的github用户名.github.io.git branch: master
 
   ```
   

   1. 重新部署 hexo c
   2. 生成静态文件 hexo g
   3. 本地服务器 hexo s
   4. 部署到github hexo d
   
 这样就可以把推文推到网上面啦！！！！

### 日常管理
1. 发文章。  
  hexo new 文章名 然后在source 页面下的_posts会生成相应文章MD文件
   ```
   ---
    title:  
    date:  
    tags: 
   ---
   ```
然后按照该格式填写一些基本信息，还有别的信息可以参考官网的文档上面说的还是挺详细的[hexo文档](https://hexo.io) ！！！这里需要注意的地方，这里的： 后面需要空格隔开 不然就会报错。

2. 发布完blog同步到仓库。（这个是保存代码的仓库，不是实际运行的仓库） 配置.gitignore文件。进入博客目录文件夹下，找到此文件，用sublime text 打开，在最后增加两行内容/.deploy_git和/public
    初始化仓库。在博客根目录下，在git bash下依次执行git init和git remote add origin <server> <server>为远程仓库地址。
同步到远程仓库。gitbash下依次执行以下命令
 ```
    git add . #添加目录下所有文件
    git commit -m "更新说明" #提交并添加更新说明
    git push -u origin master #推送更新到远程仓库
 ```
3. 平时比较常用的命令
```
   git push #同步更新
   git add . #添加修改的文件到缓存区
   git commit -m “sssss” # 添加注释 提交到本地仓库
   git push -u origin master #推送到远程仓库备份

   hexo new xxx #新建文章
   hexo c #清除旧的public文件夹
   hexo g #生成静态文件
   hexo d #发布到github

```