---
title: laravel学习（三）
date: 2017-03-28 16:51:14
tags: [技术,laravel]
---
## laravel学习（三）--Migrations


>Migrations are like version control for your database, allowing a team to easily modify and share the application's database schema. Migrations are typically paired with Laravel's schema builder to easily build your application's database schema. --[laravel官网]

---

* 好处：就是对数据库进行一个类似github的版本控制，
Migrations,如此一来在团队开发的时候，就不会引发不必要的冲突。
*  **create_users_table.php**， **password_resets_table.php**，分别是用户表和用户密码重置表。每个文件中都包含了 up() 和 down() 两个方法，一个用来创建、更改数据表，一个用来回滚操作，即撤 up() 中的操作。

---

### 创建迁移文件
使用artisan 的 make:migrate
用--create，--table 来指定创建文件，如果想在指定路径添加迁移文件，
--path 选项
创建test表 `php artisan make:migrate 文件名 --create=test`

---

### 迁移结构

一个migration 类有两个方法 up 和 down 。up方法向数据库添加新的表，字段或者索引，而 down 方法是up方法的对立面。

---

### 执行迁移
 
执行迁移用到的命令是`php artisan migrate`。
强行执行迁移的命令是`php artisan migrate --force`

### 回滚迁移

  
* `php artisan migrate:rollback`  对上一次执行的批量回滚，其中可能不止一个迁移文件。 --step=数字
是回滚【数字】个迁移。 
* `php artisan migrate:reset` 回滚所有迁移文件。
* `php artisan migrate:refresh`  回滚并执行迁移

---








