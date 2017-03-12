---
title: Mongodb学习（一）
date: 2017-03-12 21:15:33
tags: [技术,Mongodb]
---
# 环境配置
---
## Mongodb简介
  * 功能特点
  * 适用范围

---
### 功能特点
   1. 高效的传统存储方式：支持二进制数据及大型对象（如照片和视频）。
   2. 复制及自动故障转移：Mongo数据库支持服务器之间的数据复制，支持主-从模式及服务器之间的相互复制。
   3. Auto-Sharding自动分片支持云级扩展性（处于早期alpha阶段）：自动分片功能支持水平的数据库集群，可动态添加额外的机器。
   4. 动态查询：它支持丰富的查询表达式。查询指令使用JSON形式的标记，可轻易查询文档中内嵌的对象及数组。
   5. 全索引支持：包括文档内嵌对象及数组。Mongo的查询优化器会分析查询表达式，并生成一个高效的查询计划。
   6. 支持RUBY，PYTHON，JAVA，C++，PHP等多种语言。 

---
### 适用范围
   1. 及时性要求比较高的。
   2. 作为信息基础设施的持久化缓存层
   3. 适合多服务器组成的数据库
   4. Mongo的BSON数据格式非常适合文档化格式的存储和查询。5. 

---
## 下载安装
[下载地址](http://www.mongodb.org/downloads)
找到对应系统和版本。
### 安装步骤
  1. 在自定义文件夹新建文件xxx
  2. 解压下载文件，将bin目录cp到xxx文件夹
  3. 在文件夹xxx下面新建data，在data下新建文件夹db和log
  4. 执行命令 >mongod -auth --dbpath "x:\xxx\data\db" 将mongodb的数据库文件创建到\data\db下面,既可以启动。
  
## 服务开启与关闭
 命令 [net stop mongodb] 关闭mongodb服务
 命令 [net start mongodb] 开启mongodb服务

## 注意
在windows中使用Mongodb，记得注册window服务。



