---
title: jQuery学习（一）
date: 2017-03-15 21:45:27
tags: [技术,jQuery]
---

# jQuery效果
---
  
  [jQuery api](http://api.jquery.com/)

---
## 淡入淡出
  * fadeIn(time)
  * fadeOut(time)
  * fadeToggle(time) 继承上面两种在一个
  * fadeTo(time,透明度)  透明度1全透明，范围在0~1
  
```html
    <button id="fadeIn">淡入</button>
    <button id="fadeOut">淡出</button>
    <button id="fadeToggle">淡入/淡出</button>
    <button id="fadeTo">渐渐透明</button>
    <div id="div1" style="width: 50px; height: 50px; background-color: #999; display: none;">1</div>
    <div id="div2" style="width: 50px; height: 50px; background-color: #111;display: none;">2</div>
    <div id="div3" style="width: 50px; height: 50px; background-color: #666; display: none;">3</div>
```

```javascript
  $(document).ready(function(){
    $('#fadeIn').on("click",function(){
         $("#div1").fadeIn(1000);
         $("#div2").fadeIn(1000);
         $("#div3").fadeIn(1000);
        });
    $('#fadeOut').on("click",function(){
         $("#div1").fadeOut(1000);
         $("#div2").fadeOut(1000);
         $("#div3").fadeOut(1000);
        });
    $('#fadeToggle').on("click",function(){
         $("#div1").fadeToggle(1000);
         $("#div2").fadeToggle(1000);
         $("#div3").fadeToggle(1000);
        });
    $('#fadeTo').on("click",function(){
         $("#div1").fadeTo(1000,0.1);
         $("#div2").fadeTo(1000,0.3);
         $("#div3").fadeTo(1000,0.6);
        });
    })
```

--- 

## 隐藏显示 
  * hide(time) 
  * show(time)
  * toggle(time) 合成上两种方法
  
```html
  <p>hello world</p>
  <button id="click">hide</button>
  <button id="click2">show</button>
  <button id="click3">toggle</button>
```


```javascript
  $(document).ready(function(){
      $('#click').click(function(){
        $("P").hide(1000);
        });
      $('#click2').click(function(){
        $("P").show(1000);
        });
      $('#click3').click(function(){
        $("P").toggle(1000);
        });
    })
```

---

## 滑动 
 * slideDown(time)
 * slideUp(time)
 * slideToggle(time)
```html
<div id="flipshow">显示</div>
<div id="flipshow2">隐藏</div>
<div id="flipshow3">显示/隐藏</div>
<div id="content">neirong</div>
```

```javascript
   $(document).ready(function(){
      $('#filpshow').click(function(){
        $('content').slideDown(1000);
        });
      $('#filpshow2').click(function(){
        $('content').slideUp(1000);
        });
        $('#filpshow3').click(function(){
        $('content').slideToggle(1000);
        });
    })
```

---
## 动画
  jQuery animate() 方法用于创建自定义动画。
  $(selector).animate({params},speed,callback);
```javascript
 //多个参数遍历
  $("button").click(function(){
  $("div").animate({
    left:'250px',
    opacity:'0.5',
    height:'150px',
    width:'150px'
  });
});
 //使用相对值
  $("button").click(function(){
  $("div").animate({
    left:'250px',
    height:'+=150px',
    width:'+=150px'
  });
});
 //使用预设值，默认情况下，所有的 HTML 元素有一个静态的位置，且是不可移动的。 如果需要改变为，我们需要将元素的 position 属性设置为 relative, fixed, 或 absolute!
 $(document).ready(function(){
  $("button").click(function(){
    $("div").animate({
      height:'toggle'
    });
  });
});
 //使用队列，按照队列执行
 $("button").click(function(){
  var div=$("div");
  div.animate({height:'300px',opacity:'0.4'},"slow");
  div.animate({width:'300px',opacity:'0.8'},"slow");
  div.animate({height:'100px',opacity:'0.4'},"slow");
  div.animate({width:'100px',opacity:'0.8'},"slow");
});
```


---
## 回调
动画执行完后可执行的操作

```html
  <button id='btn'>隐藏</button>
  <p>Hello World!!!!</p>
```

```javascript
   $(document).ready(function(){
        $('#btn').click(function(){

             $("p").hide(1000,function(){
                //可添加回调函数，当动画结束后实现
                //动画可以重叠使用，顺序是按你调用的先后
            
                })
            })

    })
```
