---
title: wlogs
date: 2017-07-24 19:41:27
tags: 个人日常整理
---

# WLOGS

# 7-11

### windows 下 php环境搭建，开发工具部署 心得

### 工具选择
* phpStudy2016(主要是小巧功能强大，版本可选择)，但是在win下跑，机子还要必须对应的VC运行库 --》php7(vc14) -->最基本要vc9， ！！！！注意的是PHP环境都是32位的，所以运行库必须安装X86
* composer （一个PHP的管理依赖工具）
* sublime编译器（略）


### phpStudy注意点
* 直接装，装完后切换版本会自动检测你有没相应的运行库，没有的话phpStudy也会很人性化的帮你打开网站 按照该提示装好运行库就可以切换高版本了（建议全用php7，因为php一些扩展依赖都要求高于5.6，这个版本的phpStudy正好卡在这个版本上，所以建议直接上7）
* 为装composer做准备-》将php的openssl扩展打开-》直接在php.ini文件搜索extends扩展打开即可，记得重启服务器、
* 将你选择的php版本文件路径配置到环境变量下面，在git 全局下 执行 php -v 查看到版本信息说明安装成功。

### composer 安装
* composer的安装方法有很多种，什么全局，局部，下载可执行文件（推荐）。。
* 安装完后再cmd敲composer如果有显示版本信息就说明安装成功，安装成功建议重启一遍电脑，因为不知道为什么git bush在安装完全第一时间是不识别composer，等你重启系统后自然就可以在git bush 执行composer命令了


# 7-12

### 关于接口一直找不到很具体的概念去定义它，今天无意看到一篇博文，博主是这样定义的:接口类interface就是一个类的领导者，指明方向，子类（使用这一接口的类）必须完成它指定的方法


    interface show{
        public function buy($gid);  
        public function sell($gid);  
        public function view($gid);
        }
    
    

 
    class BaseShop implements Shop  
    {  
        public function buy($gid)  
        {  
            echo('你购买了ID为 :'.$gid.'的商品');  
        }  
        public function sell($gid)  
        {  
            echo('你卖了ID为 :'.$gid.'的商品');  
        }  
        public function view($gid)  
        {  
            echo('你查看了ID为 :'.$gid.'的商品');  
        }  
    }


### baseshop必须把接口的方法给做完,一个都不能少。这样有助于开发的规范

### 一个方法只做一件事，尽量不要超过20行代码

# 7-13

### 重温psr-0
   *  全部使用命名空间（namespace）
   *  所有php文件必须自动载入，不能有include/require（sql_autoload_register[允许一个php中执行多个__autoload]）
   *  单一入口文件
   *  除了入口文件，其他.php文件都遵循一个类的原则


# 7.15
###linux 
   * 命令 hosts alias 服务器别名，


# 7.17
###linux
   * 查看系统中有几种shell,cat /etc/shells (指的是存放位置)
   * 切换zsh chsh -s /bin/zsh


# 7.18

### linux
     持续查看日志状态 tail -f
     ctrl + r 字母 自动匹配history的命令
     定时任务 crontab
          不同权限的定时任务有区别的，最好做定时任务的时候切到root，
          crontab -l  查看定时任务
          crontab -e 编辑定时任务
          /etc/init.d/cron/crontab {start|status|restart|stop} 服务管理相关
         * * * * *  对应分 时 天 月 年

### php
     二维数组排序问题
     如果要想用二位数组的一个元素排序
```php
           <?php

    $data = array();
    $data[] = array('volume' => 67, 'edition' => 2);
    $data[] = array('volume' => 86, 'edition' => 1);
    $data[] = array('volume' => 85, 'edition' => 6);
    $data[] = array('volume' => 98, 'edition' => 2);
    $data[] = array('volume' => 86, 'edition' => 6);
    $data[] = array('volume' => 67, 'edition' => 7);
    // 取得列的列表
    foreach ($data as $key => $row)
    {
        $volume[$key]  = $row['volume'];
        $edition[$key] = $row['edition'];
    }
    array_multisort($volume, SORT_DESC, $edition, SORT_ASC, $data);
    print_r($data);
?>
```



     重新排序函数
          array_values($array) 针对value
          asort() ->value->down to upload
          aesort() 相反
          ksort() ->key
          krsort()
          shuffle()随机
          sort()

# 7.20
### php
    * in_array(substr($list['position_code'], 0, 2), ['xs', 'dz', 'gh', 'zl', 'jl', 'qy']) //判断该元素是否在数组中
    * php 默认是用UTC， 需要用到时间的地方date_default_timezone_set('Asia/Shanghai');或者配置到php.ini
    * date("Y-m-d H:i:s") ok       date("Y-m-d H:m:sa") 有问题 ！！！

### mysql
     导出数据库： mysqldump -u xxx -p databsename > xxx.sql
     导入数据库： mysql -u xxx -p databasename < xxx.sql

### ngnix
     我的ubuntu：
     nginx.conf 在 /ETC/ngnix/nginx.conf
     默认主机配置文件 /etc/nginx/sites-available/default
     配置虚拟域名的在 /etc/hosts


### php
     
```php
#demo

server {
    listen 80;
    server_name www.demo.com;
    root /home/zxl/wwwroot/demo/;
    index index.php index.html index.htm;



    if (!-e $request_filename) {
        rewrite  ^/(.*)$  /index.php/$1  last;
        break;
    }

    location ~ \.php
    {
        #响应请求处理入口，使用php-fpm进行管理
        fastcgi_pass unix:/var/run/php5-fpm.sock;

        fastcgi_index index.php;
        fastcgi_split_path_info ^(.+\.php)(.*)$;
        fastcgi_param PATH_INFO $fastcgi_path_info;
        fastcgi_param PATH_TRANSLATED $document_root$fastcgi_path_info;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ .*\.(gif|jgp|jpeg|png|bmp|swf)$
    {
        expires 30d;
    }

    location ~ .*\.(js|css)?$
    {
        expires 1h;
    }

    #log_format access '$remote_addr - $remote_user [$time_local] "$request" ' '$status $body_bytes_sent "$http_referer"' '"$http_user_agent" $http_x_forwarded_for';
    #access_log /var/log/nginx/access.log access;
}


```


### mongodb
    mongodb 默认端口6343

    locate mongo 输出当前陌路


# 7-21


### composer
   * composer install update 必须要非root用户
   * composer global require "laravel/lumen-installer" 配置全局必须该配置下面，我的是/home/locqj/.composer
   * composer config -g repo.packagist composer https://packagist.phpcomposer.com   记得配置国内的镜像！！！！好坑


### on-my-zsh 
   * del just run ```uninstall_oh_my_zsh```


### gnome 
   * 添加图标的文件目录为 ```/vsr/share/applications/xxx.desktop `, 修改配置文件的两处ICON


### html
   * input 如果是button 不想破坏其样式 可以用 readonly="readonly" disabled会吧样式给注释掉


### linux
   * echo export EDITOR=/usr/bin/vim >> ~/.bashrc(or zshrc)  在终端输入，修改默认打开编译器
   * 安装东西 不要用root,apt有的东西，就要先在apt下载再update


### patterns
   * 策略模式： 将一组特定的行为和算法封装成类， 以适应某些特定的上下文关系。eg：根据电商系统，针对用户的需求不同，展示的类目不同，传统就是ifelse 硬编码！。这个就是为了解决硬编码问题。


# 7-22

### linux
   * chown –R root:root rootfs 将rootfs文件夹及其子录的权限和组均改为root
   * chown –R liufan:liufan-desktop rootfs 将目录rootfs文件夹及子目录的所有者和组更改为用  户liufan和组liufan-desktop
   * pwd -p 真实路径
   * 文件查看
      ```
      Linux 文件内容查看
      Linux系统中使用以下命令来查看文件的内容：
      cat  由第一行开始显示文件内容
      tac  从最后一行开始显示，可以看出 tac 是 cat 的倒著写！
      nl   显示的时候，顺道输出行号！
      more 一页一页的显示文件内容
      less 与 more 类似，但是比 more 更好的是，他可以往前翻页！
      head 只看头几行
      ```
    * 解压缩汇总
      * tar： 
        tar -cf all.tar *.jpg 将所有的.jpg 打包名为all.tar的包。-c产生新的包，-f指定包的文件名。
    tar -rf all.tar *.gif 这条命令是将所有.gif的文件增加到all.tar的包里面去。-r是表示增加文件的 
意思。
    tar -xf all.tar 解压
      * gzip： 基本上tar就可以用来压缩和解压了
      * zip： unzip 解压  zip -r yasuo.zip abc.txt dir1 将abc.txt 和dir1一起打包
      
    
        


### jquery
   * $.trim($("#title").val()); 去除空格

### mysql
   * mysql> CREATE DATABASE abccs;  新建数据库

### shell
   * 删库小脚本

### php

   * _construct 构造方法，当一个对象创建时调用此方法，使用此方法的好处是：可以使构造方法有一个独一无二的名称,无论它所在的类的名称是什么.这样你在改变类的名称时,就不需要改变构造方法的名称
   * __destruct 析构方法，PHP将在对象被销毁前（即从内存中清除前）调用这个方法



# 7-23


#shell
   删除数据库

   ```shell
  #!/bin/bash
# 删除mysql中所有表
# 示例：
# Usage: ./script user password dbnane
# Usage: ./script user password dbnane server-ip
# Usage: ./script user password dbnane mysql.nixcraft.in
# ---------------------------------------------------
 
MUSER="$1"
MPASS="$2"
MDB="$3"
 
MHOST="localhost"



[ "$4" != "" ] && MHOST="$4"
 
# 设置命令路径
MYSQL=$(which mysql)
AWK=$(which awk)
GREP=$(which grep)
 
# help $# 是参数，参数小于三个就报错
if [ ! $# -ge 3 ]
  then
    echo "Usage: $0 {用户名} {密码} {数据库名} [端口,默认localhost]"
    echo "删库小脚本"
  exit 1
fi
 
# 连接mysql数据库
$MYSQL -u $MUSER -p$MPASS -h $MHOST -e "use $MDB"  &>/dev/null
if [ $? -ne 0 ]
  then
    echo "Error - 用户名或密码无效，无法连接mysql数据库"
    exit 2
fi
 
TABLES=$($MYSQL -u $MUSER -p$MPASS -h $MHOST $MDB -e 'show tables' | $AWK '{ print $1}' | $GREP -v '^Tables' )
 
# make sure tables exits
if [ "$TABLES" == "" ]
  then
    echo "Error - 在数据库中 $MDB 未发现相关表"
  exit 3
fi
 
# let us do it
for t in $TABLES

do
  if [ $t == "user" ]
    then
      delete_sql="delete from $t where username <> 'cw' AND username <> 'jl' AND username <> 'gh'"
      $MYSQL -u $MUSER -p$MPASS -h $MHOST $MDB -e  "${delete_sql}"
    continue
  elif [ $t == "employee_position" ]
    then
      delete_sql="delete from $t where position_code <> 'cw01' AND position_code <> 'jl01' AND position_code <> 'gh01'"
      $MYSQL -u $MUSER -p$MPASS -h $MHOST $MDB -e  "${delete_sql}"
    continue
  elif [ $t == "store_store" ]
    then
      delete_sql="delete from $t where code <> 'hj001'"
      $MYSQL -u $MUSER -p$MPASS -h $MHOST $MDB -e  "${delete_sql}"
    continue
  elif [ $t == "staff_position" ]
    then
      delete_sql="delete from $t where store_code <> 'hj001'"
      $MYSQL -u $MUSER -p$MPASS -h $MHOST $MDB -e  "${delete_sql}"
    continue
  elif [ $t == "staff_employee" ]
    then
      delete_sql="delete from $t where name <> 'bruce_zj' AND name <> 'bruce_cw' AND name <> 'bruce_gh'"
      $MYSQL -u $MUSER -p$MPASS -h $MHOST $MDB -e  "${delete_sql}"
    continue
  elif [ $t == "store_city" ] || [ $t == "store_company" ] || [ $t == "staff_bonus_rule" ]
    then
    continue
  else
    then
    echo "Truncate $t table from $MDB database..."
    $MYSQL -u $MUSER -p$MPASS -h $MHOST $MDB -e "TRUNCATE TABLE  $t"
  fi
  
done

   ```

  
#7-24

### python
   * ```# -*- coding: UTF-8 -*-```   必须加在py文件第一行，不然中文注释报错，因为py是默认ascll编码的，这行则指定文件为utf-8，文件就可以用中文
   * 在 python 中，for … else 表示这样的意思，for 中的语句和普通的没有区别，**else中的语句会在循环正常执行完**（即 for 不是通过 break 跳出而中断的）的情况下执行，while … else 也是一样。

### hexo
   * 记得linux下面文件权限问题，将new的文章权限改成当前用户权限，不然就老是报```hexo  Cannot set property 'lastIndex' of undefined```

### linux
   * 不同权限用户的公钥也不一样，root的id_rsa.pub 的公钥和locqj的id_rsa.pub的公钥是不一样的


# 7-25

### linux
   * 重新读取.zshrc，source .zshrc
   * source 改变配置文件的时候需要用到 source xxx
   * tree -l 当前路径下的文件 -d 是目录 -a所有 -c加上色彩 -L level 显示一级目录和文件
   * vim
      * 5dd 删除当前行和之后四行， 3x是删除当前字符和之后两个字符 d$删除到行尾，d0删除到行头 dW删除当前字符到下一个单词
      * yy 复制 具体和上面一样 ，p是粘贴
      * u撤销， J是合并当前行和下一行， /xxx 搜索 
      * :n 下一个文件 :N 上一个文件 :buffers 正在编译的文件列表 :e xxx 文件名就载入多一个文件：
   * scp
      * 本地上传服务器 ```scp /home/liujia/file.1txt  liujia@172.16.252.32:/user/liujia```
      * 服务器下载 ```scpliujia@172.16.252.32:/user/liujia/file1.txt /home/liujia```
      * 参数： -r整个目录， -v 提示文件信息， -p保留源文件的建立时间
   * python
      * tup1 = (50,); 一个元组的时候需要加，
      * Python的from语句让你从模块中导入一个指定的部分到当前命名空间中。语法如下：```from modname import name1[, name2[, ... nameN]]``` 也可以是* 
      * __init__.py引入包，然后里面的函数名必须要有和from xxx import xxx 名字必须一样 这个引的是.py文件里面的函数，是包的入口文件
      * raw_input('xxx') 或 input 输入-》类似scanf
