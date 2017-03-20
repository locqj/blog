---
title: jQuery学习（六）
date: 2017-03-20 10:17:04
tags: [技术,jQuery,踩过的坑]
---
jQuery Ajax 上传文件

前几天有一个项目需要用到该方法实现，网上也是五花八门的方法，有的说什么AjaxFileUpload，ajaxupload,FormData...,尝试过几种方法后，发觉还是FormData比较简单，同时也不需要引入额外的.js文件。
以下就是实现的代码。

```html
     <form id="form1" enctype="multipart/form-data" style="display: inline-block">
                            <div class="andArea">
                                <div class="filePicker">
                                    <i class="iconfont icon-jiahao"></i>
                                </div>
                                <input id="fileImage" type="file" class="upfile" name="image">
                            </div>
                            <div id="fileName">
                                <label class="fileName">暂时没有选择文件</label>
                            </div>
                            <div class="clear"></div>
                            <a href="#uploadFile">
                                <input type="button" name="uploadFile" id="uploadFile" value="上&nbsp;&nbsp;&nbsp;&nbsp;传">
                            </a>
                        </form>
```

```JavaScript
      $.ajax({
            url: "{:url('UpDownFile/upload')}",
            type: 'POST',
            cache: false,
            data: new FormData($('#form1')[0]),
            processData: false,
            contentType: false
        }).done(function(res) {

            $.ajax({
                type: 'post',  
                url: "{:url('UpDownFile/sure_els_relook')}",
                data: {
                    getFunction: 1,

                },
                success: function(data, status) {
                    var data = eval("(" + data + ")");
                    var str = '';

                    $.each(data, function(i, val) {

                        str = str + '<tr>';
                        $.each(val, function(k, v) {
                            str = str + '<td> ' + v + ' </td>';
                        });
                        str = str + '</tr>';
                    });
                    $('#infolist').html(str);

                },
                error: function(data, statsu) {
                    alert("发送请求失败！");
                }
            });
        }).fail(function(res) {

        });

    });
```

**注意**：

* html：这边form表单中切记action不需要填写，还有button的type改成button，切记
不要`type="submit"`,因为这边的提交工作转到ajax去了，所以就不需要submit。`<form>`中添加enctype="multipart/form-data"。
* jQuery：在设置ajax需要注意的是，processData要设置为false，因为data值是FormData对象，所以不需要对data处理。cache属性设置为false，因为上传文件不需要缓存。contentType设置为false，因为在`<form>`标签中已经声明enctype属性，所以这边就不需要设置true。
* 还有一点，上传服务器后，是获取`<input>`标签的name值。
