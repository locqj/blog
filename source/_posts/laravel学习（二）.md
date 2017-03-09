---
title: laravel学习（二）
date: 2017-03-09 19:19:00
tags: [技术,laravel]
---
# 服务器上传的问题
     从本地上传到服务器，访问入口地址，显示空白页

* 考虑是否没有给文件权限，具体有两个目录需要给写的权限
      1. storage目录，bootstrap/cache目录 都要777  eg：chmod -R 777 xxx
      2. php 版本是否足够