---
title: jQuery学习（五）
date: 2017-03-20 09:11:38
tags: [技术,jQuery]
---
## jQuery遍历
 通过“移动”，用于其元素的位置关系找到别的元素。

---
### 向上遍历DOM
有一下三种：
* parent() 只会向上一级进行遍历，只遍历一级
* parents() 只会向上所有级进行遍历
* parentsUntil() 基于以上两种方法的折中，遍历从该元素到某元素之间的所有元素

```JavaScript
    $("p").parent();
    $("p").parents();
    $("p").parentUntil("div")
```

---
### 向下遍历DOM

* children() 只会向下一级进行遍历，只遍历一级，默认无参数，就找其下一级的所有子元素，也可以索引其某元素（class索引）
* find() 返回被选元素的后代元素，一路向下直到最后一个后代，参数指定（*是指定所有）

```JavaScript
    $("p").chlidren();
    $("p").chlidren(".test");
    $("p").find("*");
    $("p").find(".test");
```

---

### 水平遍历DOM（同胞）
* siblings() 该方法返回被选元素的所有同胞元素。默认返回同级所有，带参数可以规定返回指定
* next() 返回被选元素的下一个同胞元素。该方法只返回一个元素。**无参数**
* nextAll() 返回被选元素的一下所有元素，也可以带参数指定一个
* nextUntil() 跟parentUntil类似
* prev() 
* prevAll()
* prevUntil()
最后三种和前三种没什么区别，就方向是向上的，同胞元素向上

```JavaScript
    $("p").siblings();
    $("p").siblings("div");
    $("p").next();
    $("p").nextAll();
    $("p").nextAll(".p1");
    ...
```

---
### jQuery过滤
* first() 返回被选元素的首个元素。
* last() 返回被选元素的最后一个元素。
* not() 和filter()相反
* filter() 匹配的元素会被返回。
* eq() 返回被选元素中带有指定索引号的元素。从0开始  

```JavaScript
    $("p").first();
    $("p").last();
    $("p").eq(1); 

```
