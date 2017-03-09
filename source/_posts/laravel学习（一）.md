---
title: laravel学习（一）
date: 2017-02-23 15:54:47
tags: [技术,laravel]
---
   推荐laravel学习版本5.2，这个版本相对稳定，资源也相对的多一些。

## Composer（包管理器）
  Composer 是 PHP 的一个依赖管理工具。它允许你申明项目所依赖的代码库，它会在你的项目中为你安装他们。
  [Composer官网](http://www.phpcomposer.com/)
  安装什么的就不多说了，不过安装来说的话还是推荐全局安装吧，自我感觉这样会比较方便，省得每次都要装一遍。
   说白了就是来下一些php扩展包的，或者也可以下载一些php框架
   有几个比较常用的指令：
    
* composer list 显示所有命令

* composer show 显示所有包信息

* composer install 在 composer.json 配置中添加依赖库之后运行此命令安装

* composer create-project laravel/laravel Laravel –prefer-dist “5.1.*” 创建项目

* composer search packagename 搜索包

* composer update 更新所有包

* composer update monolog/monolog 更新指定包

* composer remove monolog/monolog 移除指定的包

* composer require monolog/monolog 添加指定包

* composer require monolog/monolog:1.19 添加指定包和版本

* composer require monolog/monolog=1.19

* composer require monolog/monolog 1.19

* composer dump-autoload 如果更新了composer.json需要更新autoload

## 目录结构
#### 根目录
新安装的 Laravel 应用包含许多文件夹：

* app目录包含了应用的核心代码；     

* bootstrap目录包含了少许文件用于框架的启动和自动载入配置，还有一个cache文件夹用于包含框架生成的启动文件以提高性能；     

* config目录包含了应用所有的配置文件；

* database目录包含了数据迁移及填充文件，如果你喜欢的话还可以将其作为 SQLite 数据库存放目录；

* public目录包含了前端控制器和资源文件（图片、JavaScript、CSS等）；

* resources目录包含了视图文件及原生资源文件（LESS、SASS、CoffeeScript），以及本地化文件；

* storage目录包含了编译过的Blade模板、基于文件的session、文件缓存，以及其它由框架生成的文件，该文件夹被细分为成app、framework和logs子目录，app目录用于存放应用要使用的文件，framework目录用于存放框架生成的文件和缓存，logs目录包含应用的日志文件；

* tests目录包含自动化测试，其中已经提供了一个开箱即用的PHPUnit示例；

* vendor目录包含Composer依赖；


#### App目录
应用的核心代码位于app目录下，默认情况下，该目录位于命名空间 App 下，  并且被 Composer 通过 PSR-4自动载入标准 自动加载。你可以通过Artisan命令app:name来修改该命名空间。

* app目录下包含多个子目录，如Console、Http、Providers等。Console和Http目录提供了进入应用核心的API，HTTP协议和CLI是和应用进行交互的两种机制，但实际上并不包含应用逻辑。换句话说，它们只是两个向应用发布命令的方式。Console目录包含了所有的Artisan命令，Http目录包含了控制器、中间件和请求等。

* Jobs目录是放置队列任务的地方，应用中的任务可以被队列化，也可以在当前请求生命周期内同步执行。

* Events目录是放置事件类的地方，事件可以用于通知应用其它部分给定的动作已经发生，并提供灵活的解耦的处理。

* Listeners目录包含事件的处理器类，处理器接收一个事件并提供对该事件发生后的响应逻辑，比如，UserRegistered事件可以被SendWelcomeEmail监听器处理。

* Exceptions目录包含应用的异常处理器，同时还是处理应用抛出的任何异常的好地方。

>注意：app目录中的很多类都可以通过Artisan命令生成，要查看所有有效的命令，可以在终端中运行php artisan list make命令。

## Routing
  根据不同版本路由注册的地方不一样，5.3中是在根目录下面的routes中，5.2是在app/Http/routes.php。
   * 基础路由
```php
   Route::get('/', function () {
    return 'Hello World';
});

Route::post('foo/bar', function () {
    return 'Hello World';
});

Route::put('foo/bar', function () {
    //
});

Route::delete('foo/bar', function () {
    //
}); 

Route::match(['get', 'post'], '/', function () {
    return 'Hello World';
});

Route::any('foo', function () {
    return 'Hello World';
});
```
* 带参路由 
```php
  Route::get('user/{id}', function($id)
{
return 'User '.$id;
});
```
* 可选参数路由
```php
 Route::get('user/{name?}', function($name = null)
{
return $name;
});
```
* 带默认值的可选的路由参数
```php
  Route::get('user/{name?}', function($name = 'John')
{
return $name;
});
```
* 带正则表达式约束的路由
```php
 Route::get('user/{name}', function($name)
{
//
})
->where('name', '[A-Za-z]+');
Route::get('user/{id}', function($id)
{
//
})
->where('id', '[0-9]+');
```
* 路由命名
```php
  [as => 'xxx']
  Route::get('user/profile', array('as' => 'profile', function()
{
//
}));
```
* 路由群组
```php
 Route::group(array('before' => 'auth'), function()
{
Route::get('/', function()
{
// Has Auth Filter
});
Route::get('user/profile', function()
{
// Has Auth Filter
});
});
```

## Controller
控制器目录在app/Http/Controllers,当你学会用artisan就可以快速创建控制器（输入命令行 php artisan:make controller 控制器名称），这里也体现了laravel的优雅之处吧。
有学习过或者了解过MVC架构的，这里的控制器也不需要多解释了。也就是把模板，视图，和控制器分离，这样处理起来更清晰，明了。
 这边强烈建议你用artisan来新建Controller，这样一来方便简洁，二来不会丢失一些必要的引用。






  

