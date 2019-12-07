/**
 * Created by towery on 2018/8/3.
 */
(function($){
    $.fn.table=function(options){
        var defaults = {};
        var opts = $.extend({}, defaults, options);
        console.log(opts);
       var table = $(selector).DataTable({
            "language": {
                "url": "../plugins/datatables/zh_CN.txt"
            },
            "processing": true,
            "serverSide": true,
            "initComplete": function(settings, json) {
                $(".dataTables_paginate").on("click", "a", function() {
                    if($('#goodsdata_processing')[0].style.display=="block"){
                        $(".dataTables_paginate li").addClass("disabled");
                    }
                });
            },
            "ordering": false,
            "searching": false,
            "lengthChange": false,
            "iDisplayLength":10,
            ajax: {
                //指定数据�?
                type:"post",
                url: url,
                data:function (d) {
                    var param = {};
                    param.draw = d.draw;
                    param.dbOffset = d.start;
                    param.pageSize = d.length;
                    return param;
                }
            },
            columns: [ //定义�?
                {"data": function (obj) {
                    return '<input type="checkbox" name="goods_id" class="fly-checkbox" value=' + obj.id + '>';
                }},
                {data: "id"},
                {data: function (obj) {
                    return '<a href="${ctx}/goods-'+obj.id+'.html" target="_blank">'+obj.gname+'</a>';
                }},
                {data: "gname"},
                {data: function (obj) {
                    return '�?'+obj.price;
                }},
                {data: function (obj) {
                    if(obj.status==1){
                        return "售卖�?";
                    }else if(obj.status==0){
                        return "已下�?";
                    }else{
                        return "预览商品";
                    }
                }},
                {data: "brand"},
                {data: function (obj) {
                    return "<a class='layui-btn layui-btn-small _aa' name='change_btn' onclick='newTab(\""+obj.name+"\",\"${ctx}/shop/admin/goods/edit.do?goodsId="+obj.goods_id+"\")' >操作</a>";		//获取�?:data["brand_id"]
                }}
            ]
        });
       return table;
       return this;
    }
})(jQuery);