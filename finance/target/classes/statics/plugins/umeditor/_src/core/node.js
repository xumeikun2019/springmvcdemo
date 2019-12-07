///import editor.js
///import core/utils.js
///import core/dom/dom.js
///import core/dom/dtd.js
///import core/htmlparser.js
//模拟的节点类
//by zhanyi
(function () {
    var uNode = UM.uNode = function (obj) {
        this.type = obj.type;
        this.data = obj.data;
        this.tagName = obj.tagName;
        this.parentNode = obj.parentNode;
        this.attrs = obj.attrs || {};
        this.children = obj.children;
    };
    var notTransAttrs = {
        'href':1,
        'src':1,
        '_src':1,
        '_href':1,
        'cdata_data':1
    };

    var notTransTagName = {
        style:1,
        script:1
    };

    var indentChar = '    ',
        breakChar = '\n';

    function insertLine(arr, current, begin) {
        arr.push(breakChar);
        return current + (begin ? 1 : -1);
    }

    function insertIndent(arr, current) {
        //插入缩进
        for (var i = 0; i < current; i++) {
            arr.push(indentChar);
        }
    }

    //创建uNode的静态方�?
    //支持标签和html
    uNode.createElement = function (html) {
        if (/[<>]/.test(html)) {
            return UM.htmlparser(html).children[0]
        } else {
            return new uNode({
                type:'element',
                children:[],
                tagName:html
            })
        }
    };
    uNode.createText = function (data,noTrans) {
        return new UM.uNode({
            type:'text',
            'data':noTrans ? data : utils.unhtml(data || '')
        })
    };
    function nodeToHtml(node, arr, formatter, current) {
        switch (node.type) {
            case 'root':
                for (var i = 0, ci; ci = node.children[i++];) {
                    //插入新行
                    if (formatter && ci.type == 'element' && !dtd.$inlineWithA[ci.tagName] && i > 1) {
                        insertLine(arr, current, true);
                        insertIndent(arr, current)
                    }
                    nodeToHtml(ci, arr, formatter, current)
                }
                break;
            case 'text':
                isText(node, arr);
                break;
            case 'element':
                isElement(node, arr, formatter, current);
                break;
            case 'comment':
                isComment(node, arr, formatter);
        }
        return arr;
    }

    function isText(node, arr) {
        if(node.parentNode.tagName == 'pre'){
            //源码模式下输入html标签，不能做转换处理，直接输�?
            arr.push(node.data)
        }else{
            arr.push(notTransTagName[node.parentNode.tagName] ? utils.html(node.data) : node.data.replace(/[ ]{2}/g,' &nbsp;'))
        }

    }

    function isElement(node, arr, formatter, current) {
        var attrhtml = '';
        if (node.attrs) {
            attrhtml = [];
            var attrs = node.attrs;
            for (var a in attrs) {
                //这里就针�?
                //<p>'<img src='http://nsclick.baidu.com/u.gif?&asdf=\"sdf&asdfasdfs;asdf'></p>
                //这里边的\"做转换，要不用innerHTML直接被截断了，属性src
                //有可能做的不�?
                attrhtml.push(a + (attrs[a] !== undefined ? '="' + (notTransAttrs[a] ? utils.html(attrs[a]).replace(/["]/g, function (a) {
                    return '&quot;'
                }) : utils.unhtml(attrs[a])) + '"' : ''))
            }
            attrhtml = attrhtml.join(' ');
        }
        arr.push('<' + node.tagName +
            (attrhtml ? ' ' + attrhtml  : '') +
            (dtd.$empty[node.tagName] ? '\/' : '' ) + '>'
        );
        //插入新行
        if (formatter  &&  !dtd.$inlineWithA[node.tagName] && node.tagName != 'pre') {
            if(node.children && node.children.length){
                current = insertLine(arr, current, true);
                insertIndent(arr, current)
            }

        }
        if (node.children && node.children.length) {
            for (var i = 0, ci; ci = node.children[i++];) {
                if (formatter && ci.type == 'element' &&  !dtd.$inlineWithA[ci.tagName] && i > 1) {
                    insertLine(arr, current);
                    insertIndent(arr, current)
                }
                nodeToHtml(ci, arr, formatter, current)
            }
        }
        if (!dtd.$empty[node.tagName]) {
            if (formatter && !dtd.$inlineWithA[node.tagName]  && node.tagName != 'pre') {

                if(node.children && node.children.length){
                    current = insertLine(arr, current);
                    insertIndent(arr, current)
                }
            }
            arr.push('<\/' + node.tagName + '>');
        }

    }

    function isComment(node, arr) {
        arr.push('<!--' + node.data + '-->');
    }

    function getNodeById(root, id) {
        var node;
        if (root.type == 'element' && root.getAttr('id') == id) {
            return root;
        }
        if (root.children && root.children.length) {
            for (var i = 0, ci; ci = root.children[i++];) {
                if (node = getNodeById(ci, id)) {
                    return node;
                }
            }
        }
    }

    function getNodesByTagName(node, tagName, arr) {
        if (node.type == 'element' && node.tagName == tagName) {
            arr.push(node);
        }
        if (node.children && node.children.length) {
            for (var i = 0, ci; ci = node.children[i++];) {
                getNodesByTagName(ci, tagName, arr)
            }
        }
    }
    function nodeTraversal(root,fn){
        if(root.children && root.children.length){
            for(var i= 0,ci;ci=root.children[i];){
                nodeTraversal(ci,fn);
                //ci被替换的情况，这里就不再�? fn�?
                if(ci.parentNode ){
                    if(ci.children && ci.children.length){
                        fn(ci)
                    }
                    if(ci.parentNode) i++
                }
            }
        }else{
            fn(root)
        }

    }
    uNode.prototype = {

        /**
         * 当前节点对象，转换成html文本
         * @method toHtml
         * @return { String } 返回转换后的html字符�?
         * @example
         * ```javascript
         * node.toHtml();
         * ```
         */

        /**
         * 当前节点对象，转换成html文本
         * @method toHtml
         * @param { Boolean } formatter 是否格式化返回�??
         * @return { String } 返回转换后的html字符�?
         * @example
         * ```javascript
         * node.toHtml( true );
         * ```
         */
        toHtml:function (formatter) {
            var arr = [];
            nodeToHtml(this, arr, formatter, 0);
            return arr.join('')
        },

        /**
         * 获取节点的html内容
         * @method innerHTML
         * @warning 假如节点的type不是'element'，或节点的标签名称不在dtd列表里，直接返回当前节点
         * @return { String } 返回节点的html内容
         * @example
         * ```javascript
         * var htmlstr = node.innerHTML();
         * ```
         */

        /**
         * 设置节点的html内容
         * @method innerHTML
         * @warning 假如节点的type不是'element'，或节点的标签名称不在dtd列表里，直接返回当前节点
         * @param { String } htmlstr 传入要设置的html内容
         * @return { UM.uNode } 返回节点本身
         * @example
         * ```javascript
         * node.innerHTML('<span>text</span>');
         * ```
         */
        innerHTML:function (htmlstr) {
            if (this.type != 'element' || dtd.$empty[this.tagName]) {
                return this;
            }
            if (utils.isString(htmlstr)) {
                if(this.children){
                    for (var i = 0, ci; ci = this.children[i++];) {
                        ci.parentNode = null;
                    }
                }
                this.children = [];
                var tmpRoot = UM.htmlparser(htmlstr);
                for (var i = 0, ci; ci = tmpRoot.children[i++];) {
                    this.children.push(ci);
                    ci.parentNode = this;
                }
                return this;
            } else {
                var tmpRoot = new UM.uNode({
                    type:'root',
                    children:this.children
                });
                return tmpRoot.toHtml();
            }
        },

        /**
         * 获取节点的纯文本内容
         * @method innerText
         * @warning 假如节点的type不是'element'，或节点的标签名称不在dtd列表里，直接返回当前节点
         * @return { String } 返回节点的存文本内容
         * @example
         * ```javascript
         * var textStr = node.innerText();
         * ```
         */

        /**
         * 设置节点的纯文本内容
         * @method innerText
         * @warning 假如节点的type不是'element'，或节点的标签名称不在dtd列表里，直接返回当前节点
         * @param { String } textStr 传入要设置的文本内容
         * @return { UM.uNode } 返回节点本身
         * @example
         * ```javascript
         * node.innerText('<span>text</span>');
         * ```
         */
        innerText:function (textStr,noTrans) {
            if (this.type != 'element' || dtd.$empty[this.tagName]) {
                return this;
            }
            if (textStr) {
                if(this.children){
                    for (var i = 0, ci; ci = this.children[i++];) {
                        ci.parentNode = null;
                    }
                }
                this.children = [];
                this.appendChild(uNode.createText(textStr,noTrans));
                return this;
            } else {
                return this.toHtml().replace(/<[^>]+>/g, '');
            }
        },

        /**
         * 获取当前对象的data属�??
         * @method getData
         * @return { Object } 若节点的type值是elemenet，返回空字符串，否则返回节点的data属�??
         * @example
         * ```javascript
         * node.getData();
         * ```
         */
        getData:function () {
            if (this.type == 'element')
                return '';
            return this.data
        },

        /**
         * 获取当前节点下的第一个子节点
         * @method firstChild
         * @return { UM.uNode } 返回第一个子节点
         * @example
         * ```javascript
         * node.firstChild(); //返回第一个子节点
         * ```
         */
        firstChild:function () {
//            if (this.type != 'element' || dtd.$empty[this.tagName]) {
//                return this;
//            }
            return this.children ? this.children[0] : null;
        },

        /**
         * 获取当前节点下的�?后一个子节点
         * @method lastChild
         * @return { UM.uNode } 返回�?后一个子节点
         * @example
         * ```javascript
         * node.lastChild(); //返回�?后一个子节点
         * ```
         */
        lastChild:function () {
//            if (this.type != 'element' || dtd.$empty[this.tagName] ) {
//                return this;
//            }
            return this.children ? this.children[this.children.length - 1] : null;
        },

        /**
         * 获取和当前节点有相同父亲节点的前�?个节�?
         * @method previousSibling
         * @return { UM.uNode } 返回前一个节�?
         * @example
         * ```javascript
         * node.children[2].previousSibling(); //返回子节点node.children[1]
         * ```
         */
        previousSibling : function(){
            var parent = this.parentNode;
            for (var i = 0, ci; ci = parent.children[i]; i++) {
                if (ci === this) {
                    return i == 0 ? null : parent.children[i-1];
                }
            }

        },

        /**
         * 获取和当前节点有相同父亲节点的后�?个节�?
         * @method nextSibling
         * @return { UM.uNode } 返回后一个节�?,找不到返回null
         * @example
         * ```javascript
         * node.children[2].nextSibling(); //如果有，返回子节点node.children[3]
         * ```
         */
        nextSibling : function(){
            var parent = this.parentNode;
            for (var i = 0, ci; ci = parent.children[i++];) {
                if (ci === this) {
                    return parent.children[i];
                }
            }
        },

        /**
         * 用新的节点替换当前节�?
         * @method replaceChild
         * @param { UM.uNode } target 要替换成该节点参�?
         * @param { UM.uNode } source 要被替换掉的节点
         * @return { UM.uNode } 返回替换之后的节点对�?
         * @example
         * ```javascript
         * node.replaceChild(newNode, childNode); //用newNode替换childNode,childNode是node的子节点
         * ```
         */
        replaceChild:function (target, source) {
            if (this.children) {
                if(target.parentNode){
                    target.parentNode.removeChild(target);
                }
                for (var i = 0, ci; ci = this.children[i]; i++) {
                    if (ci === source) {
                        this.children.splice(i, 1, target);
                        source.parentNode = null;
                        target.parentNode = this;
                        return target;
                    }
                }
            }
        },

        /**
         * 在节点的子节点列表最后位置插入一个节�?
         * @method appendChild
         * @param { UM.uNode } node 要插入的节点
         * @return { UM.uNode } 返回刚插入的子节�?
         * @example
         * ```javascript
         * node.appendChild( newNode ); //在node内插入子节点newNode
         * ```
         */
        appendChild:function (node) {
            if (this.type == 'root' || (this.type == 'element' && !dtd.$empty[this.tagName])) {
                if (!this.children) {
                    this.children = []
                }
                if(node.parentNode){
                    node.parentNode.removeChild(node);
                }
                for (var i = 0, ci; ci = this.children[i]; i++) {
                    if (ci === node) {
                        this.children.splice(i, 1);
                        break;
                    }
                }
                this.children.push(node);
                node.parentNode = this;
                return node;
            }


        },

        /**
         * 在传入节点的前面插入�?个节�?
         * @method insertBefore
         * @param { UM.uNode } target 要插入的节点
         * @param { UM.uNode } source 在该参数节点前面插入
         * @return { UM.uNode } 返回刚插入的子节�?
         * @example
         * ```javascript
         * node.parentNode.insertBefore(newNode, node); //在node节点后面插入newNode
         * ```
         */
        insertBefore:function (target, source) {
            if (this.children) {
                if(target.parentNode){
                    target.parentNode.removeChild(target);
                }
                for (var i = 0, ci; ci = this.children[i]; i++) {
                    if (ci === source) {
                        this.children.splice(i, 0, target);
                        target.parentNode = this;
                        return target;
                    }
                }

            }
        },

        /**
         * 在传入节点的后面插入�?个节�?
         * @method insertAfter
         * @param { UM.uNode } target 要插入的节点
         * @param { UM.uNode } source 在该参数节点后面插入
         * @return { UM.uNode } 返回刚插入的子节�?
         * @example
         * ```javascript
         * node.parentNode.insertAfter(newNode, node); //在node节点后面插入newNode
         * ```
         */
        insertAfter:function (target, source) {
            if (this.children) {
                if(target.parentNode){
                    target.parentNode.removeChild(target);
                }
                for (var i = 0, ci; ci = this.children[i]; i++) {
                    if (ci === source) {
                        this.children.splice(i + 1, 0, target);
                        target.parentNode = this;
                        return target;
                    }

                }
            }
        },

        /**
         * 从当前节点的子节点列表中，移除节�?
         * @method removeChild
         * @param { UM.uNode } node 要移除的节点引用
         * @param { Boolean } keepChildren 是否保留移除节点的子节点，若传入true，自动把移除节点的子节点插入到移除的位置
         * @return { * } 返回刚移除的子节�?
         * @example
         * ```javascript
         * node.removeChild(childNode,true); //在node的子节点列表中移除child节点，并且吧child的子节点插入到移除的位置
         * ```
         */
        removeChild:function (node,keepChildren) {
            if (this.children) {
                for (var i = 0, ci; ci = this.children[i]; i++) {
                    if (ci === node) {
                        this.children.splice(i, 1);
                        ci.parentNode = null;
                        if(keepChildren && ci.children && ci.children.length){
                            for(var j= 0,cj;cj=ci.children[j];j++){
                                this.children.splice(i+j,0,cj);
                                cj.parentNode = this;

                            }
                        }
                        return ci;
                    }
                }
            }
        },

        /**
         * 获取当前节点�?代表的元素属性，即获取attrs对象下的属�?��??
         * @method getAttr
         * @param { String } attrName 要获取的属�?�名�?
         * @return { * } 返回attrs对象下的属�?��??
         * @example
         * ```javascript
         * node.getAttr('title');
         * ```
         */
        getAttr:function (attrName) {
            return this.attrs && this.attrs[attrName.toLowerCase()]
        },

        /**
         * 设置当前节点�?代表的元素属性，即设置attrs对象下的属�?��??
         * @method setAttr
         * @param { String } attrName 要设置的属�?�名�?
         * @param { * } attrVal 要设置的属�?��?�，类型视设置的属�?��?�定
         * @return { * } 返回attrs对象下的属�?��??
         * @example
         * ```javascript
         * node.setAttr('title','标题');
         * ```
         */
        setAttr:function (attrName, attrVal) {
            if (!attrName) {
                delete this.attrs;
                return;
            }
            if(!this.attrs){
                this.attrs = {};
            }
            if (utils.isObject(attrName)) {
                for (var a in attrName) {
                    if (!attrName[a]) {
                        delete this.attrs[a]
                    } else {
                        this.attrs[a.toLowerCase()] = attrName[a];
                    }
                }
            } else {
                if (!attrVal) {
                    delete this.attrs[attrName]
                } else {
                    this.attrs[attrName.toLowerCase()] = attrVal;
                }

            }
        },
        hasAttr: function( attrName ){
            var attrVal = this.getAttr( attrName );
            return ( attrVal !== null ) && ( attrVal !== undefined );
        },
        /**
         * 获取当前节点在父节点下的位置索引
         * @method getIndex
         * @return { Number } 返回索引数�?�，如果没有父节点，返回-1
         * @example
         * ```javascript
         * node.getIndex();
         * ```
         */
        getIndex:function(){
            var parent = this.parentNode;
            for(var i= 0,ci;ci=parent.children[i];i++){
                if(ci === this){
                    return i;
                }
            }
            return -1;
        },

        /**
         * 在当前节点下，根据id查找节点
         * @method getNodeById
         * @param { String } id 要查找的id
         * @return { UM.uNode } 返回找到的节�?
         * @example
         * ```javascript
         * node.getNodeById('textId');
         * ```
         */
        getNodeById:function (id) {
            var node;
            if (this.children && this.children.length) {
                for (var i = 0, ci; ci = this.children[i++];) {
                    if (node = getNodeById(ci, id)) {
                        return node;
                    }
                }
            }
        },

        /**
         * 在当前节点下，根据元素名称查找节点列�?
         * @method getNodesByTagName
         * @param { String } tagNames 要查找的元素名称
         * @return { Array } 返回找到的节点列�?
         * @example
         * ```javascript
         * node.getNodesByTagName('span');
         * ```
         */
        getNodesByTagName:function (tagNames) {
            tagNames = utils.trim(tagNames).replace(/[ ]{2,}/g, ' ').split(' ');
            var arr = [], me = this;
            utils.each(tagNames, function (tagName) {
                if (me.children && me.children.length) {
                    for (var i = 0, ci; ci = me.children[i++];) {
                        getNodesByTagName(ci, tagName, arr)
                    }
                }
            });
            return arr;
        },

        /**
         * 根据样式名称，获取节点的样式�?
         * @method getStyle
         * @param { String } name 要获取的样式名称
         * @return { String } 返回样式�?
         * @example
         * ```javascript
         * node.getStyle('font-size');
         * ```
         */
        getStyle:function (name) {
            var cssStyle = this.getAttr('style');
            if (!cssStyle) {
                return ''
            }
            var reg = new RegExp('(^|;)\\s*' + name + ':([^;]+)','i');
            var match = cssStyle.match(reg);
            if (match && match[0]) {
                return match[2]
            }
            return '';
        },

        /**
         * 给节点设置样�?
         * @method setStyle
         * @param { String } name 要设置的的样式名�?
         * @param { String } val 要设置的的样�?
         * @example
         * ```javascript
         * node.setStyle('font-size', '12px');
         * ```
         */
        setStyle:function (name, val) {
            function exec(name, val) {
                var reg = new RegExp('(^|;)\\s*' + name + ':([^;]+;?)', 'gi');
                cssStyle = cssStyle.replace(reg, '$1');
                if (val) {
                    cssStyle = name + ':' + utils.unhtml(val) + ';' + cssStyle
                }

            }

            var cssStyle = this.getAttr('style');
            if (!cssStyle) {
                cssStyle = '';
            }
            if (utils.isObject(name)) {
                for (var a in name) {
                    exec(a, name[a])
                }
            } else {
                exec(name, val)
            }
            this.setAttr('style', utils.trim(cssStyle))
        },
        hasClass: function( className ){
            if( this.hasAttr('class') ) {
                var classNames = this.getAttr('class').split(/\s+/),
                    hasClass = false;
                $.each(classNames, function(key, item){
                    if( item === className ) {
                        hasClass = true;
                    }
                });
                return hasClass;
            } else {
                return false;
            }
        },
        addClass: function( className ){

            var classes = null,
                hasClass = false;

            if( this.hasAttr('class') ) {

                classes = this.getAttr('class');
                classes = classes.split(/\s+/);

                classes.forEach( function( item ){

                    if( item===className ) {
                        hasClass = true;
                        return;
                    }

                } );

                !hasClass && classes.push( className );

                this.setAttr('class', classes.join(" "));

            } else {
                this.setAttr('class', className);
            }

        },
        removeClass: function( className ){
            if( this.hasAttr('class') ) {
                var cl = this.getAttr('class');
                cl = cl.replace(new RegExp('\\b' + className + '\\b', 'g'),'');
                this.setAttr('class', utils.trim(cl).replace(/[ ]{2,}/g,' '));
            }
        },
        /**
         * 传入�?个函数，递归遍历当前节点下的�?有节�?
         * @method traversal
         * @param { Function } fn 遍历到节点的时，传入节点作为参数，运行此函数
         * @example
         * ```javascript
         * traversal(node, function(){
         *     console.log(node.type);
         * });
         * ```
         */
        traversal:function(fn){
            if(this.children && this.children.length){
                nodeTraversal(this,fn);
            }
            return this;
        }
    }
})();
