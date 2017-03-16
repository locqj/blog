---
title: jQuery学习（二）
date: 2017-03-16 22:02:26
tags: [技术,jQuery,踩过的坑]
---
# jQuery ajax 遍历表格的坑
   1. 后台解析**json字符串**后传到，
          ```php
             echo json_encode($array); //将数组解析成json字符串
          ```
      ajax的success:function(){} 需要解析成**json对象** 
          ```javascript
            var st =  eval("("+data+")"); //json字符串转对象
          ```
   2. $.each(json对象,function(key,value){xxx})   jQuery遍历

---

# 总结
  * jQuery遍历json的三种方法
      1. 使用each遍历
          ```javascript
                $(function () {
           var tbody = "";
           //------------遍历对象 .each的使用-------------
           //对象语法JSON数据格式(当服务器端回调回来的对象数据格式是json数据格式，必须保证JSON的格式要求，回调的对象必须使用eval函数进行转化（否则将得不到Object）)
           var obj = [{ "name": "项海军", "password": "123456"}];
           $("#result").html("------------遍历对象 .each的使用-------------");
           alert(obj); //是个object元素
           //下面使用each进行遍历
           $.each(obj, function (n, value) {
               alert(n + ' ' + value);
               var trs = "";
               trs += "<tr><td>" + value.name + "</td> <td>" + value.password + "</td></tr>";
               tbody += trs;
           });
           $("#project").append(tbody);
       });
          ```
      2. jQuery解析json对象1
          ```javascript
              var json = [{dd:'test',AA:'test',re1:123},{cccc:'demo',lk:'demo'}];
               for(var i=0,l=json.length;i<l;i++){
                  for(var key in json[i]){
                      alert(key+':'+json[i][key]);
                  }
               }
          ```
      3. jQuery解析json对象2     
          ```javascript
               //如下json对象
             var obj ={”name”:cqj,”password”:”123456″,”department”:“test”,”sex”:“man”,”old”:30}; 
             for(var p in obj){
                  str = str+obj[p]+',';
                  return str;
              }
          ```
  * 最近一直在接触着json，不管是NoSQL，还是说一些api，由此发觉自己对json的理解还是很薄弱，明天专门学习一下json，加深这方面的理解，同时也会把最近的学习的MongoDB，一点点整理push上来。
    
