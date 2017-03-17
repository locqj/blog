---
title: JSON学习
date: 2017-03-17 08:33:52
tags: [技术,JSON]
---
## 什么事json？
   * JSON 指的是 JavaScript 对象表示法（JavaScript Object Notation）
   * JSON 是轻量级的文本数据交换格式
   * JSON 独立于语言 
   * JSON 具有自我描述性，更易理解
   * JSON 使用 Javascript语法来描述数据对象，但是 JSON 仍然独立于语言和平台。JSON 解析器和 JSON 库支持许多不同的编程语言。 目前非常多的动态（PHP，JSP，.NET）编程语言都支持JSON。

---
## 为什么使用 JSON？
   * 对于 AJAX 应用程序来说，JSON 比 XML 更快更易使用：
   * 使用 XML
   * 读取 XML 文档
   * 使用 XML DOM 来循环遍历文档
   * 读取值并存储在变量中
   * 使用 JSON
   * 读取 JSON 字符串
   * 用 eval() 处理 JSON 字符串

---
## JSON语法
#### 格式
   JSON 数据的书写格式是：名称/值对。
  名称/值对包括字段名称（在双引号中），后面写一个冒号，然后是值：。

        ```json
            {"name":"value"}
        ```

---

#### JSON值
   * 数字（整数或浮点数）
   
        ```json
            {"json":30}
        ```

   * 字符串（在双引号中）
   
        ```json
            {"json":"string"}
        ```

   * 逻辑值（true 或 false）

        ```json
            { "flag":true }
        ```

   * 数组（在中括号中）
   
        ```json
            //对象中的数组
            {"json":[{"name":cqj,"url":"www.locqj.github.io"},
                     {"name":cqj,"url":"www.locqj.github.io"},
                     {"name":cqj,"url":"www.locqj.github.io"}]}
        ```
        * JSON 数组在中括号中书写。
        * JSON 中数组值必须是合法的 JSON 数据类型（字符串, 数字, 对象, 数组, 布尔值或 null）。
        * JavaScript 中，数组值可以是以上的 JSON 数据类型，也可以是 JavaScript 的表达式，包括函数，日期，及 undefined。
        **循环数组**
        ```json
           //for-in
           for (i in myObj.sites) {
                 x += myObj.sites[i] + "<br>";
                 }
           //for
           for (i = 0; i < myObj.sites.length; i++) {
                 x += myObj.sites[i] + "<br>";
                 }
        ```
         
    
        ```json
            {"json":"string","json2":"string2"}
        ```
        **访问对象值**

        ```json
            var myObj, x;
            myObj = { "name":"cqj", "alexa":10000, "site":null };
            x = myObj.name;
            x = myObj["name"];//效果和上面一样
        ```
         XD的值为cqj
        **循环对象**
        ```json
            var myObj = { "name":"cqj", "alexa":10000, "site":null };
            for (x in myObj) {
                //循环key
                document.getElementById("demo").innerHTML += x + "<br>";
                //循环value,属性值
                document.getElementById("demo").innerHTML += myObj[x] + "<br>";

            }
        ```
        **嵌套json**
        ```json
            myObj = {
                "name":"cqj",
                "alexa":10000,
                "sites": {
                    "site1":"cqj",
                    "site2":"cqj",
                    "site3":"cqj"
                }
            };
            //访问嵌套对象
            x = myObj.sites.site1;
            // 或者
            x = myObj.sites["site1"];
        ```
        **修改值json**
        跟赋值是一样的
        myObj.sites["site1"] = “修改的值”;
        **删除json对象**
        delete myObj.sites.site1;
   * null

        ```json
            { "cqj":null }
        ```

---

#### JSON.parse()

        ```json
            JSON.parse(text[, reviver]);
        ```

  * text:必需， 一个有效的 JSON 字符串。
  * reviver: 可选，一个转换结果的函数， 将为对象的每个成员调用此函数。

---

##### 异常
##### 解析数据
  JSON 不能存储 Date 对象。
  如果你需要存储 Date 对象，需要将其转换为字符串。之后再将字符串转换为 Date 对象。
        ```json
        var text = '{ "name":"Runoob", "initDate":"2013-12-14", "site":"www.runoob.com"}';
        var obj = JSON.parse(text);
        obj.initDate = new Date(obj.initDate);
        document.getElementById("demo").innerHTML = obj.name + "创建日期: " + obj.initDate;       
        ```

---

####JSON.stringify()

        ```json
            JSON.stringify(value[, replacer[, space]]);
        ```
  * JSON 通常用于与服务端交换数据。
  * 在向服务器发送数据时一般是字符串。
  * 我们可以使用 JSON.stringify() 方法将 JavaScript 对象转换为字符串。

---

#### JSON使用

JSON 最常见的用法之一，是从 web 服务器上读取 JSON 数据（作为文件或作为 HttpRequest），将 JSON 数据转换为 JavaScript 对象，然后在网页中使用该数据。
  * json文本转化为js对象
      
        ```json
              var obj = eval ("(" + txt + ")");
        ```

---

#### jsonp

jsonp(JSON with Padding)json的使用模式，可以让网页从别的域名获取资源（同源策略），所有支持js的浏览器都支持该策略

---

#### 实例

服务端文件（.php）

        ```php
           <?php
              header('Content-type: application/json');
              //获取回调函数名
              $jsoncallback = htmlspecialchars($_REQUEST ['jsoncallback']);
              //json数据
              $json_data = '["customername1","customername2"]';
              //输出jsonp格式的数据
              echo $jsoncallback . "(" . $json_data . ")";
        ?>
        ```
  客户端（相当于调用这个api）
        ```html
                 <!DOCTYPE html>
              <html>
              <head>
                  <meta charset="utf-8">
                  <title>JSONP 实例</title>
                  <script src="http://cdn.static.runoob.com/libs/jquery/1.8.3/jquery.js"></script>    
              </head>
              <body>
              <div id="divCustomers"></div>
              <script>
              $.getJSON("http://www.runoob.com/try/ajax/jsonp.php?jsoncallback=?", function(data) {
                  
                  var html = '<ul>';
                  for(var i = 0; i < data.length; i++)
                  {
                      html += '<li>' + data[i] + '</li>';
                  }
                  html += '</ul>';
                  
                  $('#divCustomers').html(html); 
              });
              </script>
              </body>
              </html>
        ```





