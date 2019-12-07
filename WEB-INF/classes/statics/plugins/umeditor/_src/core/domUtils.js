/**
 * @file
 * @name UM.dom.domUtils
 * @short DomUtils
 * @import editor.js, core/utils.js,core/browser.js,core/dom/dtd.js
 * @desc UEditor封装的底层dom操作�?
 */

function getDomNode(node, start, ltr, startFromChild, fn, guard) {
    var tmpNode = startFromChild && node[start],
        parent;
    !tmpNode && (tmpNode = node[ltr]);
    while (!tmpNode && (parent = (parent || node).parentNode)) {
        if (parent.tagName == 'BODY' || guard && !guard(parent)) {
            return null;
        }
        tmpNode = parent[ltr];
    }
    if (tmpNode && fn && !fn(tmpNode)) {
        return  getDomNode(tmpNode, start, ltr, false, fn);
    }
    return tmpNode;
}
var attrFix = ie && browser.version < 9 ? {
        tabindex: "tabIndex",
        readonly: "readOnly",
        "for": "htmlFor",
        "class": "className",
        maxlength: "maxLength",
        cellspacing: "cellSpacing",
        cellpadding: "cellPadding",
        rowspan: "rowSpan",
        colspan: "colSpan",
        usemap: "useMap",
        frameborder: "frameBorder"
    } : {
        tabindex: "tabIndex",
        readonly: "readOnly"
    },
    styleBlock = utils.listToMap([
        '-webkit-box', '-moz-box', 'block' ,
        'list-item' , 'table' , 'table-row-group' ,
        'table-header-group', 'table-footer-group' ,
        'table-row' , 'table-column-group' , 'table-column' ,
        'table-cell' , 'table-caption'
    ]);
var domUtils = dom.domUtils = {
    //节点常量
    NODE_ELEMENT: 1,
    NODE_DOCUMENT: 9,
    NODE_TEXT: 3,
    NODE_COMMENT: 8,
    NODE_DOCUMENT_FRAGMENT: 11,

    //位置关系
    POSITION_IDENTICAL: 0,
    POSITION_DISCONNECTED: 1,
    POSITION_FOLLOWING: 2,
    POSITION_PRECEDING: 4,
    POSITION_IS_CONTAINED: 8,
    POSITION_CONTAINS: 16,
    //ie6使用其他的会有一段空白出�?
    fillChar: ie && browser.version == '6' ? '\ufeff' : '\u200B',
    //-------------------------Node部分--------------------------------
    keys: {
        /*Backspace*/ 8: 1, /*Delete*/ 46: 1,
        /*Shift*/ 16: 1, /*Ctrl*/ 17: 1, /*Alt*/ 18: 1,
        37: 1, 38: 1, 39: 1, 40: 1,
        13: 1 /*enter*/
    },
    breakParent:function (node, parent) {
        var tmpNode,
            parentClone = node,
            clone = node,
            leftNodes,
            rightNodes;
        do {
            parentClone = parentClone.parentNode;
            if (leftNodes) {
                tmpNode = parentClone.cloneNode(false);
                tmpNode.appendChild(leftNodes);
                leftNodes = tmpNode;
                tmpNode = parentClone.cloneNode(false);
                tmpNode.appendChild(rightNodes);
                rightNodes = tmpNode;
            } else {
                leftNodes = parentClone.cloneNode(false);
                rightNodes = leftNodes.cloneNode(false);
            }
            while (tmpNode = clone.previousSibling) {
                leftNodes.insertBefore(tmpNode, leftNodes.firstChild);
            }
            while (tmpNode = clone.nextSibling) {
                rightNodes.appendChild(tmpNode);
            }
            clone = parentClone;
        } while (parent !== parentClone);
        tmpNode = parent.parentNode;
        tmpNode.insertBefore(leftNodes, parent);
        tmpNode.insertBefore(rightNodes, parent);
        tmpNode.insertBefore(node, rightNodes);
        domUtils.remove(parent);
        return node;
    },
    trimWhiteTextNode:function (node) {
        function remove(dir) {
            var child;
            while ((child = node[dir]) && child.nodeType == 3 && domUtils.isWhitespace(child)) {
                node.removeChild(child);
            }
        }
        remove('firstChild');
        remove('lastChild');
    },
    /**
     * 获取节点A相对于节点B的位置关�?
     * @name getPosition
     * @grammar UM.dom.domUtils.getPosition(nodeA,nodeB)  =>  Number
     * @example
     *  switch (returnValue) {
     *      case 0: //相等，同�?节点
     *      case 1: //无关，节点不相连
     *      case 2: //跟随，即节点A头部位于节点B头部的后�?
     *      case 4: //前置，即节点A头部位于节点B头部的前�?
     *      case 8: //被包含，即节点A被节点B包含
     *      case 10://组合类型，即节点A满足跟随节点B且被节点B包含。实际上，如果被包含，必定跟随，�?以returnValue事实上不会存�?8的情况�??
     *      case 16://包含，即节点A包含节点B
     *      case 20://组合类型，即节点A满足前置节点A且包含节点B。同样，如果包含，必定前置，�?以returnValue事实上也不会存在16的情�?
     *  }
     */
    getPosition: function (nodeA, nodeB) {
        // 如果两个节点是同�?个节�?
        if (nodeA === nodeB) {
            // domUtils.POSITION_IDENTICAL
            return 0;
        }
        var node,
            parentsA = [nodeA],
            parentsB = [nodeB];
        node = nodeA;
        while (node = node.parentNode) {
            // 如果nodeB是nodeA的祖先节�?
            if (node === nodeB) {
                // domUtils.POSITION_IS_CONTAINED + domUtils.POSITION_FOLLOWING
                return 10;
            }
            parentsA.push(node);
        }
        node = nodeB;
        while (node = node.parentNode) {
            // 如果nodeA是nodeB的祖先节�?
            if (node === nodeA) {
                // domUtils.POSITION_CONTAINS + domUtils.POSITION_PRECEDING
                return 20;
            }
            parentsB.push(node);
        }
        parentsA.reverse();
        parentsB.reverse();
        if (parentsA[0] !== parentsB[0]) {
            // domUtils.POSITION_DISCONNECTED
            return 1;
        }
        var i = -1;
        while (i++, parentsA[i] === parentsB[i]) {
        }
        nodeA = parentsA[i];
        nodeB = parentsB[i];
        while (nodeA = nodeA.nextSibling) {
            if (nodeA === nodeB) {
                // domUtils.POSITION_PRECEDING
                return 4
            }
        }
        // domUtils.POSITION_FOLLOWING
        return  2;
    },

    /**
     * 返回节点node在父节点中的索引位置
     * @name getNodeIndex
     * @grammar UM.dom.domUtils.getNodeIndex(node)  => Number  //索引值从0�?�?
     */
    getNodeIndex: function (node, ignoreTextNode) {
        var preNode = node,
            i = 0;
        while (preNode = preNode.previousSibling) {
            if (ignoreTextNode && preNode.nodeType == 3) {
                if (preNode.nodeType != preNode.nextSibling.nodeType) {
                    i++;
                }
                continue;
            }
            i++;
        }
        return i;
    },

    /**
     * �?测节点node是否在节点doc的树上，实质上是�?测是否被doc包含
     * @name inDoc
     * @grammar UM.dom.domUtils.inDoc(node,doc)   =>  true|false
     */
    inDoc: function (node, doc) {
        return domUtils.getPosition(node, doc) == 10;
    },
    /**
     * 查找node节点的祖先节�?
     * @name findParent
     * @grammar UM.dom.domUtils.findParent(node)  => Element  // 直接返回node节点的父节点
     * @grammar UM.dom.domUtils.findParent(node,filterFn)  => Element  //filterFn为过滤函数，node作为参数，返回true时才会将node作为符合要求的节点返�?
     * @grammar UM.dom.domUtils.findParent(node,filterFn,includeSelf)  => Element  //includeSelf指定是否包含自身
     */
    findParent: function (node, filterFn, includeSelf) {
        if (node && !domUtils.isBody(node)) {
            node = includeSelf ? node : node.parentNode;
            while (node) {
                if (!filterFn || filterFn(node) || domUtils.isBody(node)) {
                    return filterFn && !filterFn(node) && domUtils.isBody(node) ? null : node;
                }
                node = node.parentNode;
            }
        }
        return null;
    },
    /**
     * 通过tagName查找node节点的祖先节�?
     * @name findParentByTagName
     * @grammar UM.dom.domUtils.findParentByTagName(node,tagNames)   =>  Element  //tagNames支持数组，区分大小写
     * @grammar UM.dom.domUtils.findParentByTagName(node,tagNames,includeSelf)   =>  Element  //includeSelf指定是否包含自身
     * @grammar UM.dom.domUtils.findParentByTagName(node,tagNames,includeSelf,excludeFn)   =>  Element  //excludeFn指定例外过滤条件，返回true时忽略该节点
     */
    findParentByTagName: function (node, tagNames, includeSelf, excludeFn) {
        tagNames = utils.listToMap(utils.isArray(tagNames) ? tagNames : [tagNames]);
        return domUtils.findParent(node, function (node) {
            return tagNames[node.tagName] && !(excludeFn && excludeFn(node));
        }, includeSelf);
    },
    /**
     * 查找节点node的祖先节点集�?
     * @name findParents
     * @grammar UM.dom.domUtils.findParents(node)  => Array  //返回�?个祖先节点数组集合，不包含自�?
     * @grammar UM.dom.domUtils.findParents(node,includeSelf)  => Array  //返回�?个祖先节点数组集合，includeSelf指定是否包含自身
     * @grammar UM.dom.domUtils.findParents(node,includeSelf,filterFn)  => Array  //返回�?个祖先节点数组集合，filterFn指定过滤条件，返回true的node将被选取
     * @grammar UM.dom.domUtils.findParents(node,includeSelf,filterFn,closerFirst)  => Array  //返回�?个祖先节点数组集合，closerFirst为true的话，node的直接父亲节点是数组的第0�?
     */
    findParents: function (node, includeSelf, filterFn, closerFirst) {
        var parents = includeSelf && ( filterFn && filterFn(node) || !filterFn ) ? [node] : [];
        while (node = domUtils.findParent(node, filterFn)) {
            parents.push(node);
        }
        return closerFirst ? parents : parents.reverse();
    },

    /**
     * 在节点node后面插入新节点newNode
     * @name insertAfter
     * @grammar UM.dom.domUtils.insertAfter(node,newNode)  => newNode
     */
    insertAfter: function (node, newNode) {
        return node.parentNode.insertBefore(newNode, node.nextSibling);
    },

    /**
     * 删除节点node，并根据keepChildren指定是否保留子节�?
     * @name remove
     * @grammar UM.dom.domUtils.remove(node)  =>  node
     * @grammar UM.dom.domUtils.remove(node,keepChildren)  =>  node
     */
    remove: function (node, keepChildren) {

        var parent = node.parentNode,
            child;
        if (parent) {
            if (keepChildren && node.hasChildNodes()) {
                while (child = node.firstChild) {
                    parent.insertBefore(child, node);
                }
            }
            parent.removeChild(node);
        }
        return node;
    },


    /**
     * 取得node节点的下�?个兄弟节点， 如果该节点其后没有兄弟节点， 则�?�归查找其父节点之后的第�?个兄弟节点，
     * 直到找到满足条件的节点或者�?�归到BODY节点之后才会结束�?
     * @method getNextDomNode
     * @param { Node } node �?要获取其后的兄弟节点的节点对�?
     * @return { Node | NULL } 如果找满足条件的节点�? 则返回该节点�? 否则返回NULL
     * @example
     * ```html
     *     <body>
     *      <div id="test">
     *          <span></span>
     *      </div>
     *      <i>xxx</i>
     * </body>
     * <script>
     *
     *     //output: i节点
     *     console.log( UE.dom.domUtils.getNextDomNode( document.getElementById( "test" ) ) );
     *
     * </script>
     * ```
     * @example
     * ```html
     * <body>
     *      <div>
     *          <span></span>
     *          <i id="test">xxx</i>
     *      </div>
     *      <b>xxx</b>
     * </body>
     * <script>
     *
     *     //由于id为test的i节点之后没有兄弟节点�? 则查找其父节点（div）后面的兄弟节点
     *     //output: b节点
     *     console.log( UE.dom.domUtils.getNextDomNode( document.getElementById( "test" ) ) );
     *
     * </script>
     * ```
     */

    /**
     * 取得node节点的下�?个兄弟节点， 如果startFromChild的�?�为ture，则先获取其子节点，
     * 如果有子节点则直接返回第�?个子节点；如果没有子节点或�?�startFromChild的�?�为false�?
     * 则执�?<a href="#UE.dom.domUtils.getNextDomNode(Node)">getNextDomNode(Node node)</a>的查找过程�??
     * @method getNextDomNode
     * @param { Node } node �?要获取其后的兄弟节点的节点对�?
     * @param { Boolean } startFromChild 查找过程是否从其子节点开�?
     * @return { Node | NULL } 如果找满足条件的节点�? 则返回该节点�? 否则返回NULL
     * @see UE.dom.domUtils.getNextDomNode(Node)
     */
    getNextDomNode:function (node, startFromChild, filterFn, guard) {
        return getDomNode(node, 'firstChild', 'nextSibling', startFromChild, filterFn, guard);
    },
    getPreDomNode:function (node, startFromChild, filterFn, guard) {
        return getDomNode(node, 'lastChild', 'previousSibling', startFromChild, filterFn, guard);
    },

    /**
     * �?测节点node是否属于bookmark节点
     * @name isBookmarkNode
     * @grammar UM.dom.domUtils.isBookmarkNode(node)  => true|false
     */
    isBookmarkNode: function (node) {
        return node.nodeType == 1 && node.id && /^_baidu_bookmark_/i.test(node.id);
    },
    /**
     * 获取节点node�?在的window对象
     * @name  getWindow
     * @grammar UM.dom.domUtils.getWindow(node)  => window对象
     */
    getWindow: function (node) {
        var doc = node.ownerDocument || node;
        return doc.defaultView || doc.parentWindow;
    },

    /**
     * 获取离nodeA与nodeB�?近的公共的祖先节�?
     * @method  getCommonAncestor
     * @param { Node } nodeA 第一个节�?
     * @param { Node } nodeB 第二个节�?
     * @remind 如果给定的两个节点是同一个节点， 将直接返回该节点�?
     * @return { Node | NULL } 如果未找到公共节点， 返回NULL�? 否则返回�?近的公共祖先节点�?
     * @example
     * ```javascript
     * var commonAncestor = UE.dom.domUtils.getCommonAncestor( document.body, document.body.firstChild );
     * //output: true
     * console.log( commonAncestor.tagName.toLowerCase() === 'body' );
     * ```
     */
    getCommonAncestor:function (nodeA, nodeB) {
        if (nodeA === nodeB)
            return nodeA;
        var parentsA = [nodeA] , parentsB = [nodeB], parent = nodeA, i = -1;
        while (parent = parent.parentNode) {
            if (parent === nodeB) {
                return parent;
            }
            parentsA.push(parent);
        }
        parent = nodeB;
        while (parent = parent.parentNode) {
            if (parent === nodeA)
                return parent;
            parentsB.push(parent);
        }
        parentsA.reverse();
        parentsB.reverse();
        while (i++, parentsA[i] === parentsB[i]) {
        }
        return i == 0 ? null : parentsA[i - 1];

    },
    /**
     * 清除node节点左右连续为空的兄弟inline节点
     * @method clearEmptySibling
     * @param { Node } node 执行的节点对象， 如果该节点的左右连续的兄弟节点是空的inline节点�?
     * 则这些兄弟节点将被删�?
     * @grammar UE.dom.domUtils.clearEmptySibling(node,ignoreNext)  //ignoreNext指定是否忽略右边空节�?
     * @grammar UE.dom.domUtils.clearEmptySibling(node,ignoreNext,ignorePre)  //ignorePre指定是否忽略左边空节�?
     * @example
     * ```html
     * <body>
     *     <div></div>
     *     <span id="test"></span>
     *     <i></i>
     *     <b></b>
     *     <em>xxx</em>
     *     <span></span>
     * </body>
     * <script>
     *
     *      UE.dom.domUtils.clearEmptySibling( document.getElementById( "test" ) );
     *
     *      //output: <div></div><span id="test"></span><em>xxx</em><span></span>
     *      console.log( document.body.innerHTML );
     *
     * </script>
     * ```
     */

    /**
     * 清除node节点左右连续为空的兄弟inline节点�? 如果ignoreNext的�?�为true�?
     * 则忽略对右边兄弟节点的操作�??
     * @method clearEmptySibling
     * @param { Node } node 执行的节点对象， 如果该节点的左右连续的兄弟节点是空的inline节点�?
     * @param { Boolean } ignoreNext 是否忽略忽略对右边的兄弟节点的操�?
     * 则这些兄弟节点将被删�?
     * @see UE.dom.domUtils.clearEmptySibling(Node)
     */

    /**
     * 清除node节点左右连续为空的兄弟inline节点�? 如果ignoreNext的�?�为true�?
     * 则忽略对右边兄弟节点的操作， 如果ignorePre的�?�为true，则忽略对左边兄弟节点的操作�?
     * @method clearEmptySibling
     * @param { Node } node 执行的节点对象， 如果该节点的左右连续的兄弟节点是空的inline节点�?
     * @param { Boolean } ignoreNext 是否忽略忽略对右边的兄弟节点的操�?
     * @param { Boolean } ignorePre 是否忽略忽略对左边的兄弟节点的操�?
     * 则这些兄弟节点将被删�?
     * @see UE.dom.domUtils.clearEmptySibling(Node)
     */
    clearEmptySibling:function (node, ignoreNext, ignorePre) {
        function clear(next, dir) {
            var tmpNode;
            while (next && !domUtils.isBookmarkNode(next) && (domUtils.isEmptyInlineElement(next)
                //这里不能把空格算进来会吧空格干掉，出现文字间的空格丢掉了
                || !new RegExp('[^\t\n\r' + domUtils.fillChar + ']').test(next.nodeValue) )) {
                tmpNode = next[dir];
                domUtils.remove(next);
                next = tmpNode;
            }
        }
        !ignoreNext && clear(node.nextSibling, 'nextSibling');
        !ignorePre && clear(node.previousSibling, 'previousSibling');
    },

    /**
     * 将一个文本节点node拆分成两个文本节点，offset指定拆分位置
     * @name split
     * @grammar UM.dom.domUtils.split(node,offset)  =>  TextNode  //返回从切分位置开始的后一个文本节�?
     */
    split: function (node, offset) {
        var doc = node.ownerDocument;
        if (browser.ie && offset == node.nodeValue.length) {
            var next = doc.createTextNode('');
            return domUtils.insertAfter(node, next);
        }
        var retval = node.splitText(offset);
        //ie8下splitText不会跟新childNodes,我们手动触发他的更新
        if (browser.ie8) {
            var tmpNode = doc.createTextNode('');
            domUtils.insertAfter(retval, tmpNode);
            domUtils.remove(tmpNode);
        }
        return retval;
    },

    /**
     * �?测节点node是否为空节点（包括空格�?�换行�?�占位符等字符）
     * @name  isWhitespace
     * @grammar  UM.dom.domUtils.isWhitespace(node)  => true|false
     */
    isWhitespace: function (node) {
        return !new RegExp('[^ \t\n\r' + domUtils.fillChar + ']').test(node.nodeValue);
    },
    /**
     * 获取元素element相对于viewport的位置坐�?
     * @name getXY
     * @grammar UM.dom.domUtils.getXY(element)  => Object //返回坐标对象{x:left,y:top}
     */
    getXY: function (element) {
        var x = 0, y = 0;
        while (element.offsetParent) {
            y += element.offsetTop;
            x += element.offsetLeft;
            element = element.offsetParent;
        }
        return { 'x': x, 'y': y};
    },
    /**
     * �?查节点node是否是空inline节点
     * @name  isEmptyInlineElement
     * @grammar   UM.dom.domUtils.isEmptyInlineElement(node)  => 1|0
     * @example
     * <b><i></i></b> => 1
     * <b><i></i><u></u></b> => 1
     * <b></b> => 1
     * <b>xx<i></i></b> => 0
     */
    isEmptyInlineElement: function (node) {
        if (node.nodeType != 1 || !dtd.$removeEmpty[ node.tagName ]) {
            return 0;
        }
        node = node.firstChild;
        while (node) {
            //如果是创建的bookmark就跳�?
            if (domUtils.isBookmarkNode(node)) {
                return 0;
            }
            if (node.nodeType == 1 && !domUtils.isEmptyInlineElement(node) ||
                node.nodeType == 3 && !domUtils.isWhitespace(node)
                ) {
                return 0;
            }
            node = node.nextSibling;
        }
        return 1;

    },


    /**
     * �?查节点node是否为块元素
     * @name isBlockElm
     * @grammar UM.dom.domUtils.isBlockElm(node)  => true|false
     */
    isBlockElm: function (node) {
        return node.nodeType == 1 && (dtd.$block[node.tagName] || styleBlock[domUtils.getComputedStyle(node, 'display')]) && !dtd.$nonChild[node.tagName];
    },


    /**
     * 原生方法getElementsByTagName的封�?
     * @name getElementsByTagName
     * @grammar UM.dom.domUtils.getElementsByTagName(node,tagName)  => Array  //节点集合数组
     */
    getElementsByTagName: function (node, name, filter) {
        if (filter && utils.isString(filter)) {
            var className = filter;
            filter = function (node) {
                var result = false;
                $.each(utils.trim(className).replace(/[ ]{2,}/g, ' ').split(' '), function (i, v) {
                    if ($(node).hasClass(v)) {
                        result = true;
                        return false;
                    }
                })
                return result;
            }
        }
        name = utils.trim(name).replace(/[ ]{2,}/g, ' ').split(' ');
        var arr = [];
        for (var n = 0, ni; ni = name[n++];) {
            var list = node.getElementsByTagName(ni);
            for (var i = 0, ci; ci = list[i++];) {
                if (!filter || filter(ci))
                    arr.push(ci);
            }
        }
        return arr;
    },


    /**
     * 设置节点node及其子节点不会被选中
     * @name unSelectable
     * @grammar UM.dom.domUtils.unSelectable(node)
     */
    unSelectable: ie && browser.ie9below || browser.opera ? function (node) {
        //for ie9
        node.onselectstart = function () {
            return false;
        };
        node.onclick = node.onkeyup = node.onkeydown = function () {
            return false;
        };
        node.unselectable = 'on';
        node.setAttribute("unselectable", "on");
        for (var i = 0, ci; ci = node.all[i++];) {
            switch (ci.tagName.toLowerCase()) {
                case 'iframe' :
                case 'textarea' :
                case 'input' :
                case 'select' :
                    break;
                default :
                    ci.unselectable = 'on';
                    node.setAttribute("unselectable", "on");
            }
        }
    } : function (node) {
        node.style.MozUserSelect =
            node.style.webkitUserSelect =
                    node.style.msUserSelect =
                        node.style.KhtmlUserSelect = 'none';
    },
    /**
     * 删除节点node上的属�?�attrNames，attrNames为属性名称数�?
     * @name  removeAttributes
     * @grammar UM.dom.domUtils.removeAttributes(node,attrNames)
     * @example
     * //Before remove
     * <span style="font-size:14px;" id="test" name="followMe">xxxxx</span>
     * //Remove
     * UM.dom.domUtils.removeAttributes(node,["id","name"]);
     * //After remove
     * <span style="font-size:14px;">xxxxx</span>
     */
    removeAttributes: function (node, attrNames) {
        attrNames = utils.isArray(attrNames) ? attrNames : utils.trim(attrNames).replace(/[ ]{2,}/g, ' ').split(' ');
        for (var i = 0, ci; ci = attrNames[i++];) {
            ci = attrFix[ci] || ci;
            switch (ci) {
                case 'className':
                    node[ci] = '';
                    break;
                case 'style':
                    node.style.cssText = '';
                    if (node.getAttributeNode('style')) {
                        !browser.ie && node.removeAttributeNode(node.getAttributeNode('style'))
                    }
            }
            node.removeAttribute(ci);
        }
    },
    /**
     * 在doc下创建一个标签名为tag，属性为attrs的元�?
     * @name createElement
     * @grammar UM.dom.domUtils.createElement(doc,tag,attrs)  =>  Node  //返回创建的节�?
     */
    createElement: function (doc, tag, attrs) {
        return domUtils.setAttributes(doc.createElement(tag), attrs)
    },
    /**
     * 为节点node添加属�?�attrs，attrs为属性键值对
     * @name setAttributes
     * @grammar UM.dom.domUtils.setAttributes(node,attrs)  => node
     */
    setAttributes: function (node, attrs) {
        for (var attr in attrs) {
            if (attrs.hasOwnProperty(attr)) {
                var value = attrs[attr];
                switch (attr) {
                    case 'class':
                        //ie下要这样赋�?�，setAttribute不起作用
                        node.className = value;
                        break;
                    case 'style' :
                        node.style.cssText = node.style.cssText + ";" + value;
                        break;
                    case 'innerHTML':
                        node[attr] = value;
                        break;
                    case 'value':
                        node.value = value;
                        break;
                    default:
                        node.setAttribute(attrFix[attr] || attr, value);
                }
            }
        }
        return node;
    },

    /**
     * 获取元素element的计算样�?
     * @name getComputedStyle
     * @grammar UM.dom.domUtils.getComputedStyle(element,styleName)  => String //返回对应样式名称的样式�??
     * @example
     * getComputedStyle(document.body,"font-size")  =>  "15px"
     * getComputedStyle(form,"color")  =>  "#ffccdd"
     */
    getComputedStyle: function (element, styleName) {
        return utils.transUnitToPx(utils.fixColor(styleName, $(element).css(styleName)));
    },

    /**
     * 阻止事件默认行为
     * @param {Event} evt    �?要组织的事件对象
     */
    preventDefault: function (evt) {
        evt.preventDefault ? evt.preventDefault() : (evt.returnValue = false);
    },

    /**
     * 删除元素element指定的样�?
     * @method removeStyle
     * @param { Element } element �?要删除样式的元素
     * @param { String } styleName �?要删除的样式�?
     * @example
     * ```html
     * <span id="test" style="color: red; background: blue;"></span>
     *
     * <script>
     *
     *     var testNode = document.getElementById("test");
     *
     *     UE.dom.domUtils.removeStyle( testNode, 'color' );
     *
     *     //output: background: blue;
     *     console.log( testNode.style.cssText );
     *
     * </script>
     * ```
     */
    removeStyle:function (element, name) {
        if(browser.ie ){
            //针对color先单独处理一�?
            if(name == 'color'){
                name = '(^|;)' + name;
            }
            element.style.cssText = element.style.cssText.replace(new RegExp(name + '[^:]*:[^;]+;?','ig'),'')
        }else{
            if (element.style.removeProperty) {
                element.style.removeProperty (name);
            }else {
                element.style.removeAttribute (utils.cssStyleToDomStyle(name));
            }
        }


        if (!element.style.cssText) {
            domUtils.removeAttributes(element, ['style']);
        }
    },

    /**
     * 获取元素element的某个样式�??
     * @name getStyle
     * @grammar UM.dom.domUtils.getStyle(element,name)  => String
     */
    getStyle: function (element, name) {
        var value = element.style[ utils.cssStyleToDomStyle(name) ];
        return utils.fixColor(name, value);
    },
    /**
     * 为元素element设置样式属�?��??
     * @name setStyle
     * @grammar UM.dom.domUtils.setStyle(element,name,value)
     */
    setStyle: function (element, name, value) {
        element.style[utils.cssStyleToDomStyle(name)] = value;
        if (!utils.trim(element.style.cssText)) {
            this.removeAttributes(element, 'style')
        }
    },

    /**
     * 删除_moz_dirty属�??
     * @function
     */
    removeDirtyAttr: function (node) {
        for (var i = 0, ci, nodes = node.getElementsByTagName('*'); ci = nodes[i++];) {
            ci.removeAttribute('_moz_dirty');
        }
        node.removeAttribute('_moz_dirty');
    },
    /**
     * 返回子节点的数量
     * @function
     * @param {Node}    node    父节�?
     * @param  {Function}    fn    过滤子节点的规则，若为空，则得到�?有子节点的数�?
     * @return {Number}    符合条件子节点的数量
     */
    getChildCount: function (node, fn) {
        var count = 0, first = node.firstChild;
        fn = fn || function () {
            return 1;
        };
        while (first) {
            if (fn(first)) {
                count++;
            }
            first = first.nextSibling;
        }
        return count;
    },

    /**
     * 判断是否为空节点
     * @function
     * @param {Node}    node    节点
     * @return {Boolean}    是否为空节点
     */
    isEmptyNode: function (node) {
        return !node.firstChild || domUtils.getChildCount(node, function (node) {
            return  !domUtils.isBr(node) && !domUtils.isBookmarkNode(node) && !domUtils.isWhitespace(node)
        }) == 0
    },

    /**
     * 判断节点是否为br
     * @function
     * @param {Node}    node   节点
     */
    isBr: function (node) {
        return node.nodeType == 1 && node.tagName == 'BR';
    },
    
    isEmptyBlock: function (node, reg) {
        if (node.nodeType != 1)
            return 0;
        reg = reg || new RegExp('[ \t\r\n' + domUtils.fillChar + ']', 'g');
        if (node[browser.ie ? 'innerText' : 'textContent'].replace(reg, '').length > 0) {
            return 0;
        }
        for (var n in dtd.$isNotEmpty) {
            if (node.getElementsByTagName(n).length) {
                return 0;
            }
        }
        return 1;
    },

    //判断是否是编辑器自定义的参数
    isCustomeNode: function (node) {
        return node.nodeType == 1 && node.getAttribute('_ue_custom_node_');
    },
    fillNode: function (doc, node) {
        var tmpNode = browser.ie ? doc.createTextNode(domUtils.fillChar) : doc.createElement('br');
        node.innerHTML = '';
        node.appendChild(tmpNode);
    },
    isBoundaryNode: function (node, dir) {
        var tmp;
        while (!domUtils.isBody(node)) {
            tmp = node;
            node = node.parentNode;
            if (tmp !== node[dir]) {
                return false;
            }
        }
        return true;
    },
    isFillChar: function (node, isInStart) {
        return node.nodeType == 3 && !node.nodeValue.replace(new RegExp((isInStart ? '^' : '' ) + domUtils.fillChar), '').length
    },
    isBody: function(node){
        return $(node).hasClass('edui-body-container');
    }
};
var fillCharReg = new RegExp(domUtils.fillChar, 'g');