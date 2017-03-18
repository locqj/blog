---
title: jQuery学习（三）
date: 2017-03-18 20:14:23
tags: [技术,jQuery]
---
## jQuery语法
先取得html的元素，并对其进行操作
### 就绪事件
```JavaScript
    //
    $(document).ready(function(){

        })
    //简洁写法
    $(function(){
 
   // 开始写 jQuery 代码...
 
});
```
---

## jQuery选择器
### 元素选择器
```JavaScript
   $("p")  //在页面中获取所有p元素
```

### #id选择器
```JavaScript
   $("#id")  //在页面中获取id,id是唯一的
```

### 类选择器
```JavaScript
   $(".test")  //在页面中获取class为test的，所有元素，对所有class=test的元素操作
```

### 元素选择器
```JavaScript
   $("p")  //在页面中获取所有p元素
```

### 更多
* 选取所有元素 $("*")
* 选取当前页html元素 $("this")
* 选取class=test 的 p 元素 $("p.test")
* 选取第一个 p 元素 $("p:first")
* 选取第一个 ul 元素的第一个 li 元素 $("ul li:first")
* 选取每个 ul 元素的第一个 li 元素 $("ul li:first-child")
* 选取带有 href 属性的元素 $("[href]")
* 选取所有 target 属性值等于_blank 的 a 元素   $("a[target='_blank']")，不等于!=
* 选取所有 type="button" 的 input 元素 和 button 元素  

---

## jQuery事件
页面对不同访问者的响应叫做事件
事件处理程序指的是当 HTML 中发生某些事件时所调用的方法
### 常见的jQuery事件
* $(document).ready() 方法允许我们在文档完全加载完后执行函数
* click() 鼠标点击事件
* dbclick() 鼠标双击事件
* mouseenter() 鼠标指针划过该元素时触发
* mouseleave() 鼠标离开元素触发
* mousedown() 鼠标移动到元素上方，并按键按下时触发
* mouseup() 鼠标移动到元素上方，并按键按下时离开触发
* hover() 模拟光标悬停事件
* focus() 当元素获得焦点时，发生 focus 事件。
* blur() 元素失去焦点触发
[More](http://www.runoob.com/jquery/jquery-ref-events.html)


