---
title: jQuery学习（四）
date: 2017-03-19 10:32:36
tags: [技术,jQuery]
---

# jQuery HTMl
---

### jQuery捕获
#### 获取内容
* 获取所选元素文本内容 text()
* 获取所选元素的内容包括html html()
* 获取返回表单字段的值 val()

**以上都可以带参数（显示value），或者回调函数，回调函数有两个参数：被选元素列表中当前元素的下标，以及原始（旧的）值。然后以函数新值返回您希望使用的字符串。
```javascript
       $("#test2").html(function(i,origText){
        return "旧 html: " + origText + " 新 html: Hello <b>world!</b> (index: " + i + ")"; 
    });
```
#### 获取属性值
* attr()  有两个参数，第一个参数可以
```javascript
     $("#test").attr({
        "href" : "http://www.baidu.com",
        "title" : "xxx"
    });
```

* 回调函数有两个参数：被选元素列表中当前元素的下标，以及原始（旧的）值。然后以函数新值返回您希望使用的字符串。

---
### jQuery添加元素
* append() - 在被选元素的结尾插入内容
* prepend() - 在被选元素的开头插入内容
* after() - 在被选元素之后插入内容
* before() - 在被选元素之前插入内容

---
### jQuery删除
* remove() - 删除被选元素（及其子元素）
* empty() - 从被选元素中删除子元素（不包括其本身）

---
### jQuery CSS
* addClass() - 向被选元素添加一个或多个类
* removeClass() - 从被选元素删除一个或多个类
* toggleClass() - 对被选元素进行添加/删除类的切换操作
* css() - 设置或返回样式属性

```javascript
   $("p").css("font-size":"20px"); //设置一个
   $("p").css({"font-size":"20px","backgroud-color":"#999"}) //设置多个 记得加{}
```

---
### jQuery 尺寸
* width() 返回元素宽度（不包含内边距，边距，外边距）
* height() 返回元素高度（不包含内边距，边距，外边距）
* innerWidth() 返回元素的宽度（包括内边距）
* innerHeight() 返回元素的高度（包括内边距）
* outerWidth() 返回元素的宽度（包括内边距和边框）。
* outerHeight() 返回元素的高度（包括内边距和边框）。