/**
 * 基于layui的tree重写
 * author: hsianglee
 * �?近修改时�?: 2019/01/07
 */

layui.define(["jquery","laytpl"], function (exports) {
    var $ = layui.jquery;
    var laytpl = layui.laytpl;
    var hint = layui.hint();

    var MOD_NAME="eleTree";
    
    //外部接口
    var eleTree={
        //事件监听
        on: function(events, callback){
            return layui.onevent.call(this, MOD_NAME, events, callback);
        },
        render: function(options) {
            var inst = new Class(options);
            return thisTree.call(inst);
        }
    }

    var thisTree=function() {
        var _self=this;
        var options = _self.config;

        // 暴漏外面的方�?
        return {
            // 接收两个参数�?1. 节点 key 2. 节点数据的数�?
            updateKeyChildren: function(key,data) {
                if(options.data.length===0) return;
                return _self.updateKeyChildren.call(_self,key,data);
            },
            updateKeySelf: function(key,data) {
                if(options.data.length===0) return;
                return _self.updateKeySelf.call(_self,key,data);
            },
            remove: function(key) {
                if(options.data.length===0) return;
                return _self.remove.call(_self,key);
            },
            append: function(key,data) {
                if(options.data.length===0) return;
                return _self.append.call(_self,key,data);
            },
            insertBefore: function(key,data) {
                if(options.data.length===0) return;
                return _self.insertBefore.call(_self,key,data);
            },
            insertAfter: function(key,data) {
                if(options.data.length===0) return;
                return _self.insertAfter.call(_self,key,data);
            },
            // 接收两个 boolean 类型的参数，1. 是否只是叶子节点，默认�?�为 false 2. 是否包含半�?�节点，默认值为 false
            getChecked: function(leafOnly, includeHalfChecked) {
                if(options.data.length===0) return;
                return _self.getChecked.call(_self,leafOnly, includeHalfChecked);
            },
            // 接收勾�?�节点数据的数组
            setChecked: function(data) {
                if(options.data.length===0) return;
                return _self.setChecked.call(_self,data);
            },
            // 取消选中
            unCheckNodes: function() {
                if(options.data.length===0) return;
                return _self.unCheckNodes.call(_self);
            },
            expandAll: function() {
                options.elem.children(".eleTree-node").children(".eleTree-node-group").empty();
                _self.expandAll.call(_self,options.data,[],1,true);
                _self.unCheckNodes();
                _self.defaultChecked();
            },
            unExpandAll: function() {
                return _self.unExpandAll.call(_self);
            },
            reload: function(options) {
                return _self.reload.call(_self,options);
            },
            search: function(value) {
                return _self.search.call(_self,value);
            }
        }
    }

    // 模板渲染
    var TPL_ELEM=function(options,floor,parentStatus) {
        return [
            '{{# for(var i=0;i<d.length;i++){ }}',
                '<div class="eleTree-node" data-'+options.request.key+'="{{d[i]["'+options.request.key+'"]}}" eletree-floor="'+floor+'" style="display: none;">',
                    '<div class="eleTree-node-content" style="padding-left: '+(options.indent*floor)+'px;">',
                        '<span class="eleTree-node-content-icon">',
                            '<i class="layui-icon layui-icon-triangle-r ',
                            function() {
                                if(options.lazy){
                                    var str=[
                                        '{{# if(!d[i]["'+options.request.isLeaf+'"]){ }}',
                                            'lazy-icon" ></i>',
                                        '{{# }else{ }}',
                                            'leaf-icon" style="color: transparent;" ></i>',
                                        '{{# } }}'
                                    ].join("");
                                    return str;
                                }
                                return ['{{# if(!d[i]["'+options.request.children+'"] || d[i]["'+options.request.children+'"].length===0){ }}',
                                        'leaf-icon" style="color: transparent;"',
                                    '{{# } }}',
                                    '"></i>'
                                ].join("");
                            }(),
                        '</span>',
                        function() {
                            if(options.showCheckbox){
                                var status="";
                                if(parentStatus==="1"){
                                    status='"1" checked';
                                }else if(parentStatus==="2"){
                                    status='"2"';
                                }else{
                                    status='"0"';
                                }
                                return [
                                    '{{# if(d[i]["'+options.request.checked+'"]) { }}',
                                        '<input type="checkbox" name="eleTree-node" eleTree-status="1" checked class="eleTree-hideen ',
                                    '{{# }else{ }}',
                                        '<input type="checkbox" name="eleTree-node" eleTree-status='+status+' class="eleTree-hideen ',
                                    '{{# } }}',

                                    '{{# if(d[i]["'+options.request.disabled+'"]) { }}',
                                        'eleTree-disabled',
                                    '{{# } }}',
                                    '" />'
                                ].join("");
                            }
                            return ''
                        }(),
                        '<span class="eleTree-node-content-label">{{d[i]["'+options.request.name+'"]}}</span>',
                    '</div>',
                    '<div class="eleTree-node-group">',
                    '</div>',
                '</div>',
            '{{# } }}'
        ].join("");
    }

    var TPL_NoText=function() {
        return '<h3 class="eleTree-noText" style="text-align: center;height: 30px;line-height: 30px;color: #888;">{{d.emptText}}</h3>';
    }

    var Class=function(options) {
        options.response=$.extend({}, this.config.response, options.response);
        options.request=$.extend({}, this.config.request, options.request);
        this.config = $.extend({}, this.config, options);
        this.prevClickEle=null;
        this.addKeyIndex=20181201;
        this.nameIndex=1;
        this.render();
    };

    Class.prototype={
        constructor: Class,
        config: {
            elem: "",
            data: [],
            emptText: "暂无数据",        // 内容为空的时候展示的文本
            renderAfterExpand: true,    // 是否在第�?次展�?某个树节点后才渲染其子节�?
            highlightCurrent: false,    // 是否高亮当前选中节点，默认�?�是 false�?
            defaultExpandAll: false,    // 是否默认展开�?有节�?
            expandOnClickNode: true,    // 是否在点击节点的时�?�展�?或�?�收缩节点， 默认值为 true，如果为 false，则只有点箭头图标的时�?�才会展�?或�?�收缩节点�??
            checkOnClickNode: false,    // 是否在点击节点的时�?��?�中节点，默认�?�为 false，即只有在点击复选框时才会�?�中节点�?
            defaultExpandedKeys: [],    // 默认展开的节点的 key 的数�?
            autoExpandParent: true,     // 展开子节点的时�?�是否自动展�?父节�?
            showCheckbox: false,        // 节点是否可被选择
            checkStrictly: false,       // 在显示复选框的情况下，是否严格的遵循父子不互相关联的做法，默认为 false
            defaultCheckedKeys: [],     // 默认勾�?�的节点�? key 的数�?
            accordion: false,           // 是否每次只打�?�?个同级树节点展开（手风琴效果�?
            indent: 16,                 // 相邻级节点间的水平缩进，单位为像�?
            lazy: false,                // 是否懒加载子节点，需�? load 方法结合使用
            load: function() {},        // 加载子树数据的方法，仅当 lazy 属�?�为true 时生�?
            draggable: false,           // 是否�?启拖拽节点功�?
            contextmenuList: [],        // 启用右键菜单，支持的操作有："copy","add","edit","remove"
            searchNodeMethod: null,     // 对树节点进行筛�?�时执行的方法，返回 true 表示这个节点可以显示，返�? false 则表示这个节点会被隐�?

            method: "get",
            url: "",
            contentType: "",
            headers: {},
            done: null,
            
            response: {
                statusName: "code",
                statusCode: 0,
                dataName: "data"
            },
            request: {
                name: "label",
                key: "id",
                children: "children",
                disabled: "disabled",
                checked: "checked",
                isLeaf: "isLeaf"
            }
        },
        render: function() {
            if(this.config.indent>30){
                this.config.indent=30;
            }else if(this.config.indent<10){
                this.config.indent=10;
            }
            var options=this.config;
            options.where=options.where || {};
            if(!options.elem) return hint.error("缺少elem参数");
            options.elem=typeof options.elem === "string" ? $(options.elem) : options.elem;
            this.filter=options.elem.attr("lay-filter");
            // load加载�?
            options.elem.append('<div class="eleTree-loadData"><i class="layui-icon layui-icon-loading layui-icon layui-anim layui-anim-rotate layui-anim-loop"></i></div>')
            
            // 判断加载方式
            if(options.data.length===0){
                this.ajaxGetData();
            }else{
                this.renderData();
            }
        },
        renderData: function() {
            var options=this.config;
            // 渲染第一�?
            laytpl(TPL_ELEM(options,0)).render(options.data, function(string){
                options.elem.html(string).children().show();
            }); 
            // 懒加�? > 展开�?�? > 初始展开�? > 初始渲染�?有子节点 > 初始选中�? > 每次点击只渲染当前层（默认）
            // 判断�?有dom是否全部加载
            if(!options.lazy){
                if(!options.renderAfterExpand || options.defaultExpandAll || options.defaultExpandedKeys.length>0 || options.defaultCheckedKeys.length>0){
                    this.expandAll(options.data,[],1);
                }
            }

            this.eleTreeEvent();
            this.checkboxRender();
            this.checkboxEvent();
            this.defaultChecked();
            this.nodeEvent();
            this.rightClickMenu();
            if(!options.checkStrictly){
                this.checkboxInit();
            }
        },
        ajaxGetData: function() {
            var options=this.config;
            var _self=this;
            if(!options.url) {
                laytpl(TPL_NoText()).render(options, function(string){
                    options.elem.html(string);
                }); 
                return;
            }
            var data = $.extend({}, options.where);
            if(options.contentType && options.contentType.indexOf("application/json") == 0){ //提交 json 格式
              data = JSON.stringify(data);
            }

            $.ajax({
                type: options.method || 'get'
                ,url: options.url
                ,contentType: options.contentType
                ,data: data
                ,dataType: 'json'
                ,headers: options.headers || {}
                ,success: function(res){
                    if(res[options.response.statusName] != options.response.statusCode || !res[options.response.dataName]){
                        hint.error("请检查数据格式是否符合规�?");
                        typeof options.done === 'function' && options.done(res);
                        return;
                    }
                    options.data=res[options.response.dataName];
                    _self.renderData();
                    typeof options.done === 'function' && options.done(res);
                }
            });
        },
        reload: function(options) {
            var _self=this;
            if(this.config.data && this.config.data.constructor === Array) this.config.data=[];
            this.config = $.extend({}, this.config, options);
            $(this.config.elem).off();  // 取消事件绑定，防止多次绑定事�?
            // reload记录选中的数�?
            // this.getChecked().forEach(function(val) {
            //     if($.inArray(val.key,this.config.defaultCheckedKeys)===-1){
            //         this.config.defaultCheckedKeys.push(val.key);
            //     }
            // },this);
            return eleTree.render(this.config)
        },
        // 下拉
        eleTreeEvent: function() {
            var _self=this;
            var options=this.config;
            // 下拉
            var expandOnClickNode=options.expandOnClickNode?".eleTree-node-content":".eleTree-node-content>.eleTree-node-content-icon";
            options.elem.on("click",expandOnClickNode,function(e) {
                e.stopPropagation();
                var eleTreeNodeContent=$(this).parent(".eleTree-node").length===0?$(this).parent(".eleTree-node-content"):$(this);
                var eleNode=eleTreeNodeContent.parent(".eleTree-node");
                var sibNode=eleTreeNodeContent.siblings(".eleTree-node-group");
                var el=eleTreeNodeContent.children(".eleTree-node-content-icon").children(".layui-icon");

                // 添加active背景
                if(_self.prevClickEle) _self.prevClickEle.removeClass("eleTree-node-content-active");
                if(options.highlightCurrent) eleTreeNodeContent.addClass("eleTree-node-content-active");
                _self.prevClickEle=eleTreeNodeContent;

                

                if(el.hasClass("icon-rotate")){
                    // 合并
                    sibNode.children(".eleTree-node:not(.eleTree-search-hide)").hide("fast");
                    el.removeClass("icon-rotate");
                    return;
                }

                if(sibNode.children(".eleTree-node").length===0){
                    var floor=Number(eleNode.attr("eletree-floor"))+1;

                    var data=_self.reInitData(eleNode);
                    var d=data.currentData;
                    // 是否懒加�?
                    if(options.lazy && el.hasClass("lazy-icon")){
                        el.removeClass("layui-icon-triangle-r").addClass("layui-icon-loading layui-anim layui-anim-rotate layui-anim-loop");
                        options.load(d,function(getData) {
                            d[options.request.children]=getData;
                            var eletreeStatus=eleTreeNodeContent.children("input.eleTree-hideen").attr("eletree-status");
                            if(d[options.request.children] && d[options.request.children].length>0){
                                laytpl(TPL_ELEM(options,floor,eletreeStatus)).render(d[options.request.children], function(string){
                                    sibNode.append(string).children().show("fast");
                                });
                            }else{
                                el.css("color","transparent").addClass("leaf-icon");
                            }
                            el.removeClass("lazy-icon layui-icon-loading layui-anim layui-anim-rotate layui-anim-loop").addClass("layui-icon-triangle-r icon-rotate");
                            _self.checkboxRender();

                            // 懒加载子元素选择祖父（待写）
                        })
                    }else{
                        var eletreeStatus=eleTreeNodeContent.children("input.eleTree-hideen").attr("eletree-status");
                        d[options.request.children] && d[options.request.children].length>0 && laytpl(TPL_ELEM(options,floor,eletreeStatus)).render(d[options.request.children], function(string){
                            sibNode.append(string);
                        });

                        // 选择祖父
                        var eleNode1=sibNode.children(".eleTree-node").eq(0);
                        if(eleNode1.length===0){
                            _self.checkboxRender();
                            return;
                        }
                        var siblingNode1=eleNode1.siblings(".eleTree-node");
                        var item1=eleNode1.children(".eleTree-node-content").children(".eleTree-hideen").get(0);
                        _self.selectParents(item1,eleNode1,siblingNode1);
                        _self.checkboxRender();
                    }
                }
                // 显示隐藏没有搜索类的
                sibNode.children(".eleTree-node:not(.eleTree-search-hide)").show("fast");
                el.addClass("icon-rotate");
                // 手风琴效�?
                if(options.accordion){
                    var node=eleTreeNodeContent.parent(".eleTree-node").siblings(".eleTree-node");
                    node.children(".eleTree-node-group").children(".eleTree-node:not(.eleTree-search-hide)").hide("fast");
                    node.children(".eleTree-node-content").children(".eleTree-node-content-icon").children(".layui-icon").removeClass("icon-rotate");
                }
            })
        },
        // checkbox选中
        checkboxEvent: function() {
            var options=this.config;
            var _self=this;
            var checkOnClickNode=options.checkOnClickNode?".eleTree-node-content":".eleTree-checkbox";
            // input添加属�?�eleTree-status：即input的三种状态，"0":未�?�中�?"1":选中�?"2":子孙部分选中
            options.elem.on("click",checkOnClickNode,function(e,type) {
                e.stopPropagation();
                var eleTreeNodeContent=$(this).parent(".eleTree-node").length===0?$(this).parent(".eleTree-node-content"):$(this);
                var checkbox=eleTreeNodeContent.children(".eleTree-checkbox");
                if(checkbox.hasClass("eleTree-checkbox-disabled")) return;
                // 获取点击�?在数�?
                var node=eleTreeNodeContent.parent(".eleTree-node");
                // var d=_self.reInitData(node).currentData;
                // 实际的input
                var inp=checkbox.siblings(".eleTree-hideen").get(0);
                var childNode=eleTreeNodeContent.siblings(".eleTree-node-group").find("input[name='eleTree-node']");

                // 添加active背景
                if(_self.prevClickEle) _self.prevClickEle.removeClass("eleTree-node-content-active");
                if(options.highlightCurrent) eleTreeNodeContent.addClass("eleTree-node-content-active");
                _self.prevClickEle=eleTreeNodeContent;
                
                if(!inp){
                    return;
                }

                if(inp.checked){
                    // 反�?�自�?
                    $(inp).prop("checked",false).attr("eleTree-status","0");
                    // 点击祖父层�?�中子孙�?
                    if(!options.checkStrictly){
                        childNode.prop("checked",false);
                        childNode.attr("eleTree-status","0");
                    }
                    
                }else{
                    // 反�?�自�?
                    $(inp).prop("checked",true).attr("eleTree-status","1");
                    // 点击祖父层�?�中子孙�?
                    if(!options.checkStrictly){
                        childNode.prop("checked",true).attr("eleTree-status","1");
                    }
                }

                var eleNode=eleTreeNodeContent.parent(".eleTree-node");
                // 点击子孙层�?�中祖父�?(递归)
                if(!options.checkStrictly){
                    var siblingNode=eleNode.siblings(".eleTree-node");
                    // 点击子孙层�?�中祖父�?(递归)
                    _self.selectParents(inp,eleNode,siblingNode);
                }
                
                _self.checkboxRender();

                if(type==="default") return;
                layui.event.call(inp, MOD_NAME, 'nodeChecked('+ _self.filter +')', {
                    node: eleNode,
                    data: _self.reInitData(eleNode),
                    isChecked: inp.checked
                });
            })
        },
        // 对后台数据有 checked:true 的默认�?�中项渲染父子层
        checkboxInit: function() {
            var options=this.config;
            var _self=this;
            options.elem.find("input[eleTree-status='1']").each(function(index,item) {
                var checkboxEl=$(item).siblings(".eleTree-checkbox");
                var childNode=checkboxEl.parent(".eleTree-node-content").siblings(".eleTree-node-group").find("input[name='eleTree-node']");
                // 选择当前
                checkboxEl.addClass("eleTree-checkbox-checked");
                checkboxEl.children("i").addClass("layui-icon-ok").removeClass("eleTree-checkbox-line");
                // 选择子孙
                childNode.prop("checked","checked").attr("eleTree-status","1");
                childNode.siblings(".eleTree-checkbox").addClass("eleTree-checkbox-checked");
                childNode.siblings(".eleTree-checkbox").children("i").addClass("layui-icon-ok").removeClass("eleTree-checkbox-line");
                
                // 选择祖父
                var eleNode=checkboxEl.parent(".eleTree-node-content").parent(".eleTree-node");
                var siblingNode=eleNode.siblings(".eleTree-node");
                _self.selectParents(item,eleNode,siblingNode);
            })
            _self.checkboxRender();
        },
        // 通过子元素�?�中祖父元素
        selectParents: function(inp,eleNode,siblingNode) {
            // inp: 实际input(dom元素)
            // eleNode: input父层类（.eleTree-node�?
            // siblingNode: 父层同级兄弟
            while (Number(eleNode.attr("eletree-floor"))!==0) {
                // 同级input状�?�存入数�?
                var arr=[];
                arr.push($(inp).attr("eleTree-status"));
                siblingNode.each(function(index,item) {
                    var siblingIsChecked=$(item).children(".eleTree-node-content").children("input[name='eleTree-node']").attr("eleTree-status");
                    arr.push(siblingIsChecked);
                })
                // 父元素的实际input
                var parentInput=eleNode.parent(".eleTree-node-group").siblings(".eleTree-node-content").children("input[name='eleTree-node']");
                // 父元素的checkbox替代
                var parentCheckbox=parentInput.siblings(".eleTree-checkbox");
                // 子都选中则�?�中�?
                if(arr.every(function(val) {
                    return val==="1";
                })){
                    parentInput.prop("checked",true).attr("eleTree-status","1");
                }
                // 子有�?个未选中则checkbox第三种状�?
                if(arr.some(function(val) {
                    return val==="0" || val==="2";
                })){
                    parentInput.attr("eleTree-status","2");
                }
                // 子全部未选中则取消父选中(并且取消第三种状�?)
                if(arr.every(function(val) {
                    return val==="0";
                })){
                    parentInput.prop("checked",false);
                    parentInput.attr("eleTree-status","0");
                }

                var parentNode=eleNode.parents("[eletree-floor='"+(Number(eleNode.attr("eletree-floor"))-1)+"']");
                var parentCheckbox=parentNode.children(".eleTree-node-content").children("input[name='eleTree-node']").get(0);
                var parentSiblingNode=parentNode.siblings(".eleTree-node");
                eleNode=parentNode;
                inp=parentCheckbox;
                siblingNode=parentSiblingNode;
            }
        },
        // 初始展开�?�?
        expandAll: function(data,arr,floor,isMethodsExpandAll) {
            var options=this.config;
            var _self=this;
            data.forEach(function(val,index) {
                arr.push(index);
                if(val[options.request.children] && val[options.request.children].length>0){
                    var el=options.elem.children(".eleTree-node").eq(arr[0]).children(".eleTree-node-group");
                    for(var i=1;i<arr.length;i++){
                        el=el.children(".eleTree-node").eq(arr[i]).children(".eleTree-node-group");
                    }
                    laytpl(TPL_ELEM(options,floor)).render(val[options.request.children], function(string){
                        el.append(string);
                        // 判断是否展开�?�?
                        if(options.defaultExpandAll || isMethodsExpandAll){
                            el.siblings(".eleTree-node-content").children(".eleTree-node-content-icon").children(".layui-icon").addClass("icon-rotate");
                            el.children().show();
                        }else if(options.defaultExpandedKeys.length>0) {
                            // 展开指定id�?
                            var id=el.parent(".eleTree-node").attr("data-"+options.request.key);
                            id=isNaN(id) ? id : Number(id);
                            if($.inArray(id,options.defaultExpandedKeys)!==-1){
                                el.siblings(".eleTree-node-content").children(".eleTree-node-content-icon").children(".layui-icon").addClass("icon-rotate");
                                el.children().show();
                                // 展开子项是否继续展开祖父�?
                                if(options.autoExpandParent){
                                    var eleP=el.parent(".eleTree-node[data-"+options.request.key+"]").parents(".eleTree-node");
                                    eleP.each(function(i,item) {
                                        if($(item).attr("data-"+options.request.key)){
                                            $(item).children(".eleTree-node-group").siblings(".eleTree-node-content").children(".eleTree-node-content-icon").children(".layui-icon").addClass("icon-rotate");
                                            $(item).children(".eleTree-node-group").children().show();
                                        }
                                    })
                                }
                            }
                        }
                    });
                    floor++;
                    _self.expandAll(val[options.request.children],arr,floor,isMethodsExpandAll);
                    floor--;
                }
                // 重置数组索引
                arr.pop();
            })

            
        },
        // 初始默认选中
        defaultChecked: function() {
            var options=this.config;
            if(options.defaultCheckedKeys.length===0){
                return false;
            }
            // 判断是否父子无关
            if(options.checkStrictly){
                options.defaultCheckedKeys.forEach(function(val,index) {
                    var nodeContent=options.elem.find("[data-"+options.request.key+"='"+val+"']").children(".eleTree-node-content");
                    // 如果当前没�?�中则�?�中
                    if(nodeContent.children(".eleTree-hideen").prop("checked")===false){
                        nodeContent.children(".eleTree-checkbox").trigger("click",["default"]);
                    }
                })
                return false;
            }
            // 父元素优�?
            var arr=$.extend([],options.defaultCheckedKeys);
            options.defaultCheckedKeys.forEach(function(val,index) {
                options.elem.find("[data-"+options.request.key+"='"+val+"']").find("[data-"+options.request.key+"]").each(function(i,item) {
                    var id=$(item).attr("data-"+options.request.key);
                    id=isNaN(id) ? id : Number(id);
                    var isInArrayIndex=$.inArray(id,arr);
                    if(isInArrayIndex!==-1){
                        arr.splice(isInArrayIndex,1);
                    }
                })
            })
            arr.forEach(function(val,index) {
                var nodeContent=options.elem.find("[data-"+options.request.key+"='"+val+"']").children(".eleTree-node-content");
                // 如果当前没�?�中则�?�中
                if(nodeContent.children(".eleTree-hideen").prop("checked")===false){
                    nodeContent.children(".eleTree-checkbox").trigger("click",["default"]);
                }
            })
        },
        // 自定义checkbox解析
        checkboxRender: function() {
            var options=this.config;
            options.elem.find(".eleTree-checkbox").remove();
            options.elem.find("input.eleTree-hideen[type=checkbox]").each(function(index,item){
                if($(item).hasClass("eleTree-disabled")){
                    $(item).after('<div class="eleTree-checkbox eleTree-checkbox-disabled"><i class="layui-icon"></i></div>');
                }else{
                    $(item).after('<div class="eleTree-checkbox"><i class="layui-icon"></i></div>');
                }

                var checkbox=$(item).siblings(".eleTree-checkbox");
                if($(item).attr("eletree-status")==="1"){
                    checkbox.addClass("eleTree-checkbox-checked");
                    checkbox.children("i").addClass("layui-icon-ok").removeClass("eleTree-checkbox-line");
                }else if($(item).attr("eletree-status")==="0"){
                    checkbox.removeClass("eleTree-checkbox-checked");
                    checkbox.children("i").removeClass("layui-icon-ok eleTree-checkbox-line");
                }else if($(item).attr("eletree-status")==="2"){
                    checkbox.addClass("eleTree-checkbox-checked");
                    checkbox.children("i").removeClass("layui-icon-ok").addClass("eleTree-checkbox-line");
                }
                
            })
        },
        // 通过dom节点找对应数�?
        reInitData: function(node) {
            var options=this.config;
            var i=node.index();
            var floor=Number(node.attr("eletree-floor"));
            var arr=[];     // 节点对应的index
            while (floor>=0) {
                arr.push(i);
                floor=floor-1;
                node=node.parents("[eletree-floor='"+floor+"']");
                i=node.index();
            }
            arr=arr.reverse();
            var oData=this.config.data;
            // 当前节点的父节点数据
            var parentData=oData[arr[0]];
            // 当前节点的data数据
            var d = oData[arr[0]];
            for(var i = 1; i<arr.length; i++){
                d = d[options.request.children]?d[options.request.children][arr[i]]:d;
            }
            for(var i = 1; i<arr.length-1; i++){
                parentData = parentData[options.request.children]?parentData[options.request.children][arr[i]]:parentData;
            }

            return {
                currentData: d,
                parentData: {
                    data: parentData,
                    childIndex: arr[arr.length-1]
                },
                index: arr
            }
        },
        // 通过key查找数据
        keySearchToOpera: function(key,callback) {
            var options=this.config;
            var _self=this;
            // 查找数据
            var fn=function(data) {
                var obj={
                    i: 0,
                    len: data.length
                }
                for(;obj.i<obj.len;obj.i++){
                    if(data[obj.i][options.request.key]!==key){
                        if(data[obj.i][options.request.children] && data[obj.i][options.request.children].length>0){
                            fn(data[obj.i][options.request.children]);
                        }
                    }else{
                        callback(data,obj);
                    }
                }
            }
            fn(options.data);
        },
        updateKeyChildren: function(key,data) {
            var options=this.config;
            var node=options.elem.find("[data-"+options.request.key+"='"+key+"']");
            var floor=Number(node.attr("eletree-floor"))+1;
            var _self=this;
            
            this.keySearchToOpera(key,function(d,obj) {
                // 数据更新
                d[obj.i][options.request.children]=data;
                // dom更新
                node.length!==0 && laytpl(TPL_ELEM(options,floor)).render(data, function(string){
                    $(node).children(".eleTree-node-group").empty().append(string);
                    options.defaultExpandAll && $(node).children(".eleTree-node-group").children().show();
                }); 
                _self.unCheckNodes();
                _self.defaultChecked();
            });
        },
        updateKeySelf: function(key,data) {
            var options=this.config;
            var node=options.elem.find("[data-"+options.request.key+"='"+key+"']").children(".eleTree-node-content");
            var floor=Number(node.attr("eletree-floor"))+1;
            data[options.request.name] && node.children(".eleTree-node-content-label").text(data[options.request.name]);
            data[options.request.disabled] && node.children(".eleTree-hideen").addClass("eleTree-disabled")
                .siblings(".eleTree-checkbox").addClass("eleTree-checkbox-disabled");
            // 数据更新
            var getData=this.keySearchToOpera(key,function(d,obj) {
                data[options.request.key]=d[obj.i][options.request.key];
                data[options.request.children]=d[obj.i][options.request.children];
                d[obj.i]=$.extend({},d[obj.i],data);
                console.log(options.data);
            });
        },
        remove: function(key) {
            var options=this.config;
            var node=options.elem.find("[data-"+options.request.key+"='"+key+"']");
            var pElem=node.parent(".eleTree-node-group");
            // 数据删除
            this.keySearchToOpera(key,function(data,obj) {
                data.splice(obj.i,1);
                obj.i--;
                obj.len--;

                node.length!==0 && options.elem.find("[data-"+options.request.key+"='"+key+"']").remove();
                if(pElem.children(".eleTree-node").length===0){
                    pElem.siblings(".eleTree-node-content").children(".eleTree-node-content-icon").children(".layui-icon").css("color", "transparent");
                }
            });
            this.unCheckNodes();
            this.defaultChecked();
        },
        append: function(key,data) {
            var options=this.config;
            var node=options.elem.find("[data-"+options.request.key+"='"+key+"']");
            var floor=Number(node.attr("eletree-floor"))+1;
            // 数据更新
            this.keySearchToOpera(key,function(d,obj) {
                if(d[obj.i][options.request.children]){
                    d[obj.i][options.request.children].push(data);
                }else{
                    d[obj.i][options.request.children]=[data];
                }
                var arr=d[obj.i][options.request.children];
                // 添加之后长度�?1，则原来没有三角，添加三�?
                if(arr.length===1){
                    node.children(".eleTree-node-content").find(".eleTree-node-content-icon .layui-icon").removeAttr("style").addClass("icon-rotate");
                }
                var len=arr.length;
                var eletreeStatus=node.children(".eleTree-node-content").children("input.eleTree-hideen").attr("eletree-status");
                eletreeStatus=eletreeStatus==="2" ? "0" : eletreeStatus;
                node.length!==0 && laytpl(TPL_ELEM(options,floor,eletreeStatus)).render([arr[len-1]], function(string){
                    node.children(".eleTree-node-group").append(string).children().show();
                }); 
            });
            this.checkboxRender();
        },
        insertBefore: function(key,data) {
            var options=this.config;
            var node=options.elem.find("[data-"+options.request.key+"='"+key+"']");
            var floor=Number(node.attr("eletree-floor"));
            // 数据更新
            this.keySearchToOpera(key,function(d,obj) {
                d.splice(obj.i,0,data);
                obj.i++;
                obj.len++;
                var eletreeStatus=node.parent(".eleTree-node-group").length===0 ? "0" : node.parent(".eleTree-node-group").parent(".eleTree-node")
                .children(".eleTree-node-content").children("input.eleTree-hideen").attr("eletree-status");
                eletreeStatus=eletreeStatus==="2" ? "0" : eletreeStatus;
                node.length!==0 && laytpl(TPL_ELEM(options,floor,eletreeStatus)).render([data], function(string){
                    node.before(string).prev(".eleTree-node").show();
                }); 
            });
            this.checkboxRender();
        },
        insertAfter: function(key,data) {
            var options=this.config;
            var node=options.elem.find("[data-"+options.request.key+"='"+key+"']");
            var floor=Number(node.attr("eletree-floor"));
            // 数据更新
            this.keySearchToOpera(key,function(d,obj) {
                d.splice(obj.i+1,0,data);
                obj.i++;
                obj.len++;
                var eletreeStatus=node.parent(".eleTree-node-group").length===0 ? "0" : node.parent(".eleTree-node-group").parent(".eleTree-node")
                .children(".eleTree-node-content").children("input.eleTree-hideen").attr("eletree-status");
                eletreeStatus=eletreeStatus==="2" ? "0" : eletreeStatus;
                node.length!==0 && laytpl(TPL_ELEM(options,floor,eletreeStatus)).render([data], function(string){
                    $(node).after(string).next(".eleTree-node").show();
                }); 
            });
            this.checkboxRender();
            // if(!options.lazy){
            //     if(!options.renderAfterExpand || options.defaultExpandAll || options.defaultExpandedKeys.length>0){
            //         this.expandAll(options.data,[],1);
            //     }
            // }
        },
        getChecked: function(leafOnly, includeHalfChecked) {
            var options=this.config
                ,el
                ,arr=[];
            leafOnly=leafOnly || false;
            includeHalfChecked=includeHalfChecked || false;
            if(leafOnly){
                el=options.elem.find(".layui-icon.leaf-icon").parent(".eleTree-node-content-icon")
                    .siblings("input.eleTree-hideen[eletree-status='1']");
            }else if(includeHalfChecked){
                el=options.elem.find("input.eleTree-hideen[eletree-status='1'],input.eleTree-hideen[eletree-status='2']");
            }else{
                el=options.elem.find("input.eleTree-hideen[eletree-status='1']");
            }
            el.each(function(index,item) {
                var obj={};
                var id=$(item).parent(".eleTree-node-content").parent(".eleTree-node").attr("data-"+options.request.key);
                id=isNaN(id) ? id : Number(id);
                obj[options.request.key]=id;
                obj.elem=item;
                obj.othis=$(item).siblings(".eleTree-checkbox").get(0)
                arr.push(obj);
            })
            return arr;
        },
        setChecked: function(arr) {
            var options=this.config;
            this.unCheckNodes();
            arr.forEach(function(val) {
                if($.inArray(val,options.defaultCheckedKeys)===-1){
                    options.defaultCheckedKeys.push(val);
                }
            })
            this.defaultChecked();
        },
        unCheckNodes: function() {
            var options=this.config;
            options.elem.find("input.eleTree-hideen[eletree-status='1'],input.eleTree-hideen[eletree-status='2']").each(function(index,item) {
                $(item).attr("eletree-status","0").prop("checked",false);
            });
            this.checkboxRender();
        },
        unExpandAll: function() {
            var options=this.config;
            options.elem.find(".layui-icon.icon-rotate").removeClass("icon-rotate")
                .parent(".eleTree-node-content-icon").parent(".eleTree-node-content")
                .siblings(".eleTree-node-group").children(".eleTree-node").hide();
        },
        // 节点事件
        nodeEvent: function() {
            var _self=this;
            var options=this.config;
            // 节点被点击的回调事件
            options.elem.on("click",".eleTree-node-content",function(e) {
                var eleNode=$(this).parent(".eleTree-node");
                $("#tree-menu").hide().remove();
                layui.event.call(eleNode, MOD_NAME, 'nodeClick('+ _self.filter +')', {
                    node: eleNode,
                    data: _self.reInitData(eleNode),
                    event: e
                });
            })
            // 节点右键的回调事�?
            options.elem.on("contextmenu",".eleTree-node-content",function(e) {
                var eleNode=$(this).parent(".eleTree-node");
                layui.event.call(eleNode, MOD_NAME, 'nodeContextmenu('+ _self.filter +')', {
                    node: eleNode,
                    data: _self.reInitData(eleNode),
                    event: e
                });
            })
            // 节点被拖拽的回调事件
            options.draggable && options.elem.on("mousedown",".eleTree-node-content",function(e) {
                var time=0;
                var eleNode=$(this).parent(".eleTree-node");
                var eleFloor=Number(eleNode.attr("eletree-floor"));
                var groupNode=eleNode.parent(".eleTree-node-group");

                e.stopPropagation();
                options.elem.css("user-select","none");
                var cloneNode=eleNode.clone(true);
                var temNode=eleNode.clone(true);

                var x=e.clientX-options.elem.offset().left;
                var y=e.clientY-options.elem.offset().top;
                options.elem.append(cloneNode);
                cloneNode.css({
                    "display": "none",
                    "opacity": 0.7,
                    "position": "absolute",
                    "background-color": "#f5f5f5",
                    "width": "100%"
                })

                var currentData=_self.reInitData(eleNode);

                var isStop=false;

                $(document).on("mousemove",function(e) {
                    // t为了区别click事件
                    time++;
                    if(time>2){
                        var xx=e.clientX-options.elem.offset().left+10;
                        var yy=e.clientY-options.elem.offset().top+$(document).scrollTop()-5;   // 加上浏览器滚动高�?

                        cloneNode.css({
                            display: "block",
                            left: xx+"px",
                            top: yy+"px"
                        })
                    }
                }).on("mouseup",function(e) {
                    $(document).off("mousemove").off("mouseup");
                    var target=$(e.target).parents(".eleTree-node").eq(0);
                    cloneNode.remove();
                    options.elem.css("user-select","auto");

                    
                    // 当前点击的是否时�?外层
                    var isCurrentOuterMost=eleNode.parent().get(0).isEqualNode(options.elem.get(0))
                    // 目标是否时最外层
                    var isTargetOuterMost=$(e.target).get(0).isEqualNode(options.elem.get(0))
                    if(isTargetOuterMost){
                        target=options.elem;
                    }
                    // 判断是否超出边界
                    if(target.parents(options.elem).length===0 && !isTargetOuterMost){
                        return;
                    }
                    // 判断初始与结束是否是同一个节�?
                    if(target.get(0).isEqualNode(eleNode.get(0))){
                        return;
                    }
                    // 判断是否是父节点放到子节�?
                    var tFloor=target.attr("eletree-floor");
                    var isInChild=false;
                    eleNode.find("[eletree-floor='"+tFloor+"']").each(function() {
                        if(this.isEqualNode(target.get(0))){
                            isInChild=true;
                        }
                    })
                    if(isInChild){
                        return;
                    }

                    var targetData=_self.reInitData(target);
                    layui.event.call(target, MOD_NAME, 'nodeDrag('+ _self.filter +')', {
                        current: {
                            node: eleNode,
                            data: currentData
                        },
                        target: {
                            node: target,
                            data: targetData
                        },
                        stop: function() {
                            isStop=true;
                        }
                    });
                    // 拖拽是否取消
                    if(isStop){
                        return false;
                    }

                    // 数据更改
                    var currList=currentData.parentData.data[options.request.children]
                    var currIndex=currentData.parentData.childIndex
                    var currData=currentData.currentData;
                    var tarData=targetData.currentData;
                    // 当前是否是最外层
                    isCurrentOuterMost ? options.data.splice(currIndex,1) : currList.splice(currIndex,1)
                    // 目标是否是最外层
                    isTargetOuterMost ? options.data.push(currData) : (function() {
                        !tarData[options.request.children] ? tarData[options.request.children]=[] : "";
                        tarData[options.request.children].push(currData);
                    })()

                    // dom互换
                    eleNode.remove();
                    // �?外层判断
                    if(isTargetOuterMost){
                        target.append(temNode);
                        var floor=0;
                    }else{
                        target.children(".eleTree-node-group").append(temNode);
                        var floor=Number(target.attr("eletree-floor"))+1;
                    }
                    // 加floor和padding
                    temNode.attr("eletree-floor",String(floor));
                    temNode.children(".eleTree-node-content").css("padding-left",floor*options.indent+"px");
                    // 通过floor差�?�计算子元素的floor
                    var countFloor=eleFloor-floor;
                    temNode.find(".eleTree-node").each(function(index,item) {
                        var f=Number($(item).attr("eletree-floor"))-countFloor;
                        $(item).attr("eletree-floor",String(f));
                        $(item).children(".eleTree-node-content").css("padding-left",f*options.indent+"px");
                    })
                    // 原dom去三�?
                    var leaf=groupNode.children(".eleTree-node").length===0;
                        leaf && groupNode.siblings(".eleTree-node-content")
                        .children(".eleTree-node-content-icon").children(".layui-icon")
                        .removeClass("icon-rotate").css("color","transparent");
                    // 当前的增加三�?
                    var cLeaf=target.children(".eleTree-node-group").children(".eleTree-node").length===0;
                        !cLeaf && target.children(".eleTree-node-content")
                        .children(".eleTree-node-content-icon").children(".layui-icon")
                        .addClass("icon-rotate").removeAttr("style");

                    _self.unCheckNodes();
                    _self.defaultChecked();

                })
            })
        },
        rightClickMenu: function() {
            var _self=this;
            var options=this.config;
            if(options.contextmenuList.length<=0){
                return;
            }
            $(document).on("click",function() {
                $("#tree-menu").hide().remove();
            });
            var menuStr=['<ul id="tree-menu">'
                ,$.inArray("copy",options.contextmenuList)!==-1?'<li class="copy"><a href="javascript:;">复制</a></li>':''
                ,$.inArray("add",options.contextmenuList)!==-1?'<li class="add"><a href="javascript:;">新增</a></li>'+
                    '<li class="insertBefore"><a href="javascript:;">插入节点�?</a></li>'+
                    '<li class="insertAfter"><a href="javascript:;">插入节点�?</a></li>'+
                    '<li class="append"><a href="javascript:;">插入子节�?</a></li>' : ""
                ,$.inArray("edit",options.contextmenuList)!==-1?'<li class="edit"><a href="javascript:;">修改</a></li>':''
                ,$.inArray("remove",options.contextmenuList)!==-1?'<li class="remove"><a href="javascript:;">删除</a></li>':''
            ,'</ul>'].join("");
            this.treeMenu=$(menuStr);
            options.elem.off("contextmenu").on("contextmenu",".eleTree-node-content",function(e) {
                var that=this;
                e.stopPropagation();
                e.preventDefault();
                // 添加active背景
                if(_self.prevClickEle) _self.prevClickEle.removeClass("eleTree-node-content-active");
                $(this).addClass("eleTree-node-content-active");
                var eleNode=$(this).parent(".eleTree-node");
                var nodeData=_self.reInitData(eleNode);

                // 菜单位置
                $(document.body).after(_self.treeMenu);
                $("#tree-menu li.insertBefore,#tree-menu li.insertAfter,#tree-menu li.append").hide();
                $("#tree-menu li.copy,#tree-menu li.add,#tree-menu li.edit,#tree-menu li.remove").show();
                $("#tree-menu").css({
                    left: e.pageX,
                    top: e.pageY
                }).show();
                // 复制
                $("#tree-menu li.copy").off().on("click",function() {
                    var el = $(that).children(".eleTree-node-content-label").get(0);
                    var selection = window.getSelection();
                    var range = document.createRange();
                    range.selectNodeContents(el);
                    selection.removeAllRanges();
                    selection.addRange(range);
                    document.execCommand('Copy', 'false', null);
                    selection.removeAllRanges();
                });
                // 新增
                $("#tree-menu li.add").off().on("click",function(e) {
                    e.stopPropagation();
                    $(this).hide().siblings("li.copy,li.edit,li.remove").hide();
                    $(this).siblings(".append,li.insertAfter,li.insertBefore").show();
                })
                // 添加的默认数�?
                var obj={};
                obj[options.request.key]=_self.addKeyIndex;
                obj[options.request.name]="未命�?"+_self.nameIndex;
                
                var arr=["Append","InsertBefore","InsertAfter"];
                arr.forEach(function(val) {
                    var s=val[0].toLocaleLowerCase()+val.slice(1,val.length);
                    $("#tree-menu li."+s).off().on("click",function(e) {
                        var node=$(that).parent(".eleTree-node");
                        var key=node.attr("data-"+options.request.key);
                        key=isNaN(key) ? key : Number(key);
                        var isStop=false;
                        var s=val[0].toLocaleLowerCase()+val.slice(1,val.length);
                        layui.event.call(node, MOD_NAME, 'node'+val+'('+ _self.filter +')', {
                            node: node,
                            data: nodeData.currentData,
                            // 重新设置数据
                            setData: function(o) {
                                _self[s](key,$.extend({},obj,o));
                                isStop=true;
                            },
                            // 停止添加
                            stop: function() {
                                isStop=true;
                            }
                        });
                        if(isStop) return;
                        _self[s](key,obj)
                        _self.nameIndex++;
                        _self.addKeyIndex++;
                    })
                })
                
                // 编辑
                $("#tree-menu li.edit").off().on("click",function(e) {
                    e.stopPropagation();
                    $("#tree-menu").hide().remove();
                    var node=$(that).parent(".eleTree-node");
                    var key=node.attr("data-"+options.request.key);
                    key=isNaN(key) ? key : Number(key);
                    var label=$(that).children(".eleTree-node-content-label").hide();
                    var text=label.text();
                    var inp="<input type='text' value='"+text+"' class='eleTree-node-content-input' />";
                    label.after(inp);
                    label.siblings(".eleTree-node-content-input").focus().select().off().on("blur",function() {
                        var val=$(this).val();
                        var isStop=false;
                        var inpThis=this;
                        layui.event.call(node, MOD_NAME, 'nodeEdit('+ _self.filter +')', {
                            node: node,
                            value: val,
                            data: nodeData.currentData,
                            // 停止添加
                            stop: function() {
                                isStop=true;
                                $(inpThis).siblings(".eleTree-node-content-label").show();
                                $(inpThis).remove();
                            }
                        });
                        if(isStop) return;
                        // 修改数据
                        _self.reInitData(eleNode).currentData[options.request.name]=val;
                        // 修改dom
                        $(this).siblings(".eleTree-node-content-label").text(val).show();
                        $(this).remove();
                    }).on("mousedown",function(e) {
                        // 防止input拖拽
                        e.stopPropagation();
                    })
                })
                // 删除
                $("#tree-menu li.remove").off().on("click",function(e) {
                    var node=$(that).parent(".eleTree-node");
                    var key=node.attr("data-"+options.request.key);
                    key=isNaN(key) ? key : Number(key);
                    var isStop=false;
                    layui.event.call(node, MOD_NAME, 'nodeRemove('+ _self.filter +')', {
                        node: node,
                        data: nodeData.currentData,
                        // 停止添加
                        stop: function() {
                            isStop=true;
                        }
                    });
                    if(isStop) return;
                    _self.remove(key);
                })

                _self.prevClickEle=$(this);
            })
        },
        search: function(value) {
            var options=this.config;
            if(!options.searchNodeMethod || typeof options.searchNodeMethod !== "function"){
                return;
            }
            var data=options.data;
            // 数据递归
            var traverse=function(data) {
                data.forEach(function(val,index) {
                    // �?有查找到的节点增加属�?
                    val.visible=options.searchNodeMethod(value,val);
                    if(val[options.request.children] && val[options.request.children].length>0){
                        traverse(val[options.request.children]);
                    }
                    //如果当前节点属�?�为隐藏，判断其子节点是否有显示的，如果有，则当前节点改为显�?
                    if(!val.visible){
                        let childSomeShow = false;
                        if(val[options.request.children] && val[options.request.children].length>0){
                            childSomeShow=val[options.request.children].some(function(v,i) {
                                return v.visible;
                            })
                        }
                        val.visible = childSomeShow;
                    }
                    // 通过节点的属性，显示隐藏各个节点，并添加删除搜索�?
                    var el=options.elem.find("[data-"+options.request.key+"='"+val[options.request.key]+"']");
                    if(val.visible){
                        el.removeClass("eleTree-search-hide");
                        // 判断父节点是否展�?，如果父节点没有展开，则子节点也不要显示
                        var parentEl=el.parent(".eleTree-node-group").parent(".eleTree-node");
                        var isParentOpen=parentEl.children(".eleTree-node-content").children(".eleTree-node-content-icon").children(".layui-icon.layui-icon-triangle-r").hasClass("icon-rotate")
                        if((parentEl.length>0 && isParentOpen) || parentEl.length===0){
                            el.show();
                        }
                    }else{
                        el.hide().addClass("eleTree-search-hide");
                    }
                    // 删除子层属�??
                    if(val[options.request.children] && val[options.request.children].length>0){
                        val[options.request.children].forEach(function(v,i) {
                            delete v.visible;
                        })
                    }
                })
            }
            traverse(data);
            // 删除�?外层属�??
            var arr=[];
            data.forEach(function(val) {
                arr.push(val.visible);
                delete val.visible;
            })
            // 如果第一层的�?有的都隐藏，则显示文�?
            if(arr.every(function(v) {
                return v===false;
            })){
                laytpl(TPL_NoText()).render(options, function(string){
                    options.elem.append(string);
                }); 
            }else{
                options.elem.children(".eleTree-noText").remove();
            }
        }
    }
    
    exports(MOD_NAME,eleTree);
})