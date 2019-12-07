/**
 * Created by towery on 2018/8/3.
 */
/**
 * 表格插件
 */

;(function($, window, document, undefined) {
    var pluginName = 'table';
    var config;
    var dataTable;
    var searchParams = {};

    var table = function(options,callback,datacall,initcall){
        var options = arguments[0];
        var selector = '#' + options.renderAt;
        var url = options.url;
        var columnDefs = [{
            "targets" :"_all",
            "defaultContent" : ""
        }];
        var columnOptions = options.columnDefs;
        if (typeof(columnOptions) != 'undefined') {
        	columnDefs.push({
            	"targets":columnOptions.targets,
            	"visible":columnOptions.visible
            });
        }
        var bPaginate = typeof(options.bPaginate) == 'undefined' ? true : options.bPaginate; // 分页参数 默认�?启分�?
        var columns = options.columns;
        var base_path = document.getElementsByTagName('script')[0].dataset.src;
        dataTable = $(selector).DataTable({
            "language": {
                //"url": base_path + "plugins/datatables/zh_CN.txt"
                "processing": "<img src='" + base_path + "images/plugins/_loading.gif'/ style='width:65px;height:50px;'>",
                "lengthMenu": "显示 _MENU_ 项结�?",
                "sZeroRecords": "没有匹配结果",
                "info": "&nbsp;&nbsp;&nbsp;显示�? _START_ �? _END_ 条结果，�? _TOTAL_ �?",
                "infoEmpty": "&nbsp;&nbsp;显示�? 0 �? 0 条结果，�? 0 �?",
                "infoFiltered": "(�? _MAX_ 项结果过�?)",
                "infoPostFix": "",
                "search": "搜索:",
                "url": "",
                "paginate": {
                    "first":    "首页",
                    "previous": "上页",
                    "next":     "下页",
                    "last":     "末页"
                }
            },
            "processing": true,
            "serverSide": bPaginate,
            "initComplete": function(settings, json) {
                $(".dataTables_paginate").on("click", "a", function() {
                    if($('#goodsdata_processing')[0].style.display=="block"){
                        $(".dataTables_paginate li").addClass("disabled");
                    }
                });
                if (initcall) {
                	initcall(json);
                }
            },
            "info": bPaginate, //是否显示底部信息info�?
            "ordering": false,
            "searching": false,
            "lengthChange": false,
            "bPaginate":bPaginate,//去掉分页�?
            "iDisplayLength":10,
            "columnDefs" : columnDefs,
            ajax: {
                //指定数据�?
                type:"post",
                url: url,
                data:function (d) {
                    searchParams.dbOffset = d.start;
                    searchParams.pageSize = d.length;
                    $.extend(d,searchParams); //给d扩展参数
                    
                    for(var key in d){
                        if(key.indexOf("columns") == 0 || key.indexOf("order") == 0 || key.indexOf("search") == 0 || key.indexOf("start") == 0 || key.indexOf("length") == 0){ //以columns�?头的参数删除
                            delete d[key];
                        }
                    }
                    return d;
                },dataSrc:function(json){
                	if (datacall) {
                		datacall(json.extra);
                    }
                	return json.data;
                }
            },
            columns: columns
        });
        if (callback) {
            callback(dataTable);
        }
    }

    var methods = {
        //初始化的函数，传入参数对�?
        init: function(options,callback,datacall,initcall){
            return this.each(function() {
                var $this = $(this);
                var settings = $this.data(pluginName);
                if(typeof(settings) == 'undefined'){
                    var defaults = {
                        renderAt: $this.attr('id'),
                    };

                    settings = $.extend({}, defaults, options);
                    $this.data(pluginName,settings);
                }else{
                    settings = $.extend({}, settings, options);
                    $this.data(pluginName, settings);
                }

                config=settings;
                table(config,callback,datacall,initcall);

            });
        },
        destroy: function(options) {
            // 在每个元素中执行代码
            return $(this).each(function() {
                var $this = $(this);

                // 执行代码

                // 删除元素对应的数�?
                $this.removeData(pluginName);
            });
        },

        // 表格搜索
        search: function(key) {
        	return this.each(function(){
        		$.extend(searchParams,key);
            	dataTable.ajax.reload();
        	});
        },
        
        getContent: function(){
            return this.each(function(){
                var content=$(this).text();
               // console.log(content);
                //获取全局变量的初始化的�??
            //    console.log(config.sex)
            });
        }

    };

    $.fn.table = function(){
        var method = arguments[0]; // 通过table插件传�?�的参数(table第一个参�?)
        if(methods[method]) {
            method = methods[method];
            //将含有length属�?�的数组获取从第下标�?1的之后的数组元素，并返回数组
            arguments = Array.prototype.slice.call(arguments,1);
           // console.log(arguments);
        }else if( typeof(method) == 'object' || !method ){
            method = methods.init;
        }else{
            $.error( '方法 ' +  method + ' 不存在此方法' );
            return this;
        }

        return method.apply(this,arguments);

    };
})(jQuery, window, document);
