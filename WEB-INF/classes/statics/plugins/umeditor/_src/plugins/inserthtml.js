///import core
/**
 * @description 插入内容
 * @name baidu.editor.execCommand
 * @param   {String}   cmdName     inserthtml插入内容的命�?
 * @param   {String}   html                要插入的内容
 * @author zhanyi
 */
UM.commands['inserthtml'] = {
    execCommand: function (command,html,notNeedFilter){
        var me = this,
            range,
            div;
        if(!html){
            return;
        }
        if(me.fireEvent('beforeinserthtml',html) === true){
            return;
        }
        range = me.selection.getRange();
        div = range.document.createElement( 'div' );
        div.style.display = 'inline';

        if (!notNeedFilter) {
            var root = UM.htmlparser(html);
            //如果给了过滤规则就先进行过滤
            if(me.options.filterRules){
                UM.filterNode(root,me.options.filterRules);
            }
            //执行默认的处�?
            me.filterInputRule(root);
            html = root.toHtml()
        }
        div.innerHTML = utils.trim( html );

        if ( !range.collapsed ) {
            var tmpNode = range.startContainer;
            if(domUtils.isFillChar(tmpNode)){
                range.setStartBefore(tmpNode)
            }
            tmpNode = range.endContainer;
            if(domUtils.isFillChar(tmpNode)){
                range.setEndAfter(tmpNode)
            }
            range.txtToElmBoundary();
            //结束边界可能放到了br的前边，要把br包含进来
            // x[xxx]<br/>
            if(range.endContainer && range.endContainer.nodeType == 1){
                tmpNode = range.endContainer.childNodes[range.endOffset];
                if(tmpNode && domUtils.isBr(tmpNode)){
                    range.setEndAfter(tmpNode);
                }
            }
            if(range.startOffset == 0){
                tmpNode = range.startContainer;
                if(domUtils.isBoundaryNode(tmpNode,'firstChild') ){
                    tmpNode = range.endContainer;
                    if(range.endOffset == (tmpNode.nodeType == 3 ? tmpNode.nodeValue.length : tmpNode.childNodes.length) && domUtils.isBoundaryNode(tmpNode,'lastChild')){
                        me.body.innerHTML = '<p>'+(browser.ie ? '' : '<br/>')+'</p>';
                        range.setStart(me.body.firstChild,0).collapse(true)

                    }
                }
            }
            !range.collapsed && range.deleteContents();
            if(range.startContainer.nodeType == 1){
                var child = range.startContainer.childNodes[range.startOffset],pre;
                if(child && domUtils.isBlockElm(child) && (pre = child.previousSibling) && domUtils.isBlockElm(pre)){
                    range.setEnd(pre,pre.childNodes.length).collapse();
                    while(child.firstChild){
                        pre.appendChild(child.firstChild);
                    }
                    domUtils.remove(child);
                }
            }

        }


        var child,parent,pre,tmp,hadBreak = 0, nextNode;
        //如果当前位置选中了fillchar要干掉，要不会产生空�?
        if(range.inFillChar()){
            child = range.startContainer;
            if(domUtils.isFillChar(child)){
                range.setStartBefore(child).collapse(true);
                domUtils.remove(child);
            }else if(domUtils.isFillChar(child,true)){
                child.nodeValue = child.nodeValue.replace(fillCharReg,'');
                range.startOffset--;
                range.collapsed && range.collapse(true)
            }
        }
        while ( child = div.firstChild ) {
            if(hadBreak){
                var p = me.document.createElement('p');
                while(child && (child.nodeType == 3 || !dtd.$block[child.tagName])){
                    nextNode = child.nextSibling;
                    p.appendChild(child);
                    child = nextNode;
                }
                if(p.firstChild){

                    child = p
                }
            }
            range.insertNode( child );
            nextNode = child.nextSibling;
            if ( !hadBreak && child.nodeType == domUtils.NODE_ELEMENT && domUtils.isBlockElm( child ) ){

                parent = domUtils.findParent( child,function ( node ){ return domUtils.isBlockElm( node ); } );
                if ( parent && parent.tagName.toLowerCase() != 'body' && !(dtd[parent.tagName][child.nodeName] && child.parentNode === parent)){
                    if(!dtd[parent.tagName][child.nodeName]){
                        pre = parent;
                    }else{
                        tmp = child.parentNode;
                        while (tmp !== parent){
                            pre = tmp;
                            tmp = tmp.parentNode;

                        }
                    }


                    domUtils.breakParent( child, pre || tmp );
                    //去掉break后前�?个多余的节点  <p>|<[p> ==> <p></p><div></div><p>|</p>
                    var pre = child.previousSibling;
                    domUtils.trimWhiteTextNode(pre);
                    if(!pre.childNodes.length){
                        domUtils.remove(pre);
                    }
                    //trace:2012,在非ie的情况，切开后剩下的节点有可能不能点入光标添加br占位

                    if(!browser.ie &&
                        (next = child.nextSibling) &&
                        domUtils.isBlockElm(next) &&
                        next.lastChild &&
                        !domUtils.isBr(next.lastChild)){
                        next.appendChild(me.document.createElement('br'));
                    }
                    hadBreak = 1;
                }
            }
            var next = child.nextSibling;
            if(!div.firstChild && next && domUtils.isBlockElm(next)){

                range.setStart(next,0).collapse(true);
                break;
            }
            range.setEndAfter( child ).collapse();

        }

        child = range.startContainer;

        if(nextNode && domUtils.isBr(nextNode)){
            domUtils.remove(nextNode)
        }
        //用chrome可能有空白展位符
        if(domUtils.isBlockElm(child) && domUtils.isEmptyNode(child)){
            if(nextNode = child.nextSibling){
                domUtils.remove(child);
                if(nextNode.nodeType == 1 && dtd.$block[nextNode.tagName]){

                    range.setStart(nextNode,0).collapse(true).shrinkBoundary()
                }
            }else{

                try{
                    child.innerHTML = browser.ie ? domUtils.fillChar : '<br/>';
                }catch(e){
                    range.setStartBefore(child);
                    domUtils.remove(child)
                }

            }

        }
        //加上true因为在删除表情等时会删两次，第一次是删的fillData
        try{
            if(browser.ie9below && range.startContainer.nodeType == 1 && !range.startContainer.childNodes[range.startOffset]){
                var start = range.startContainer,pre = start.childNodes[range.startOffset-1];
                if(pre && pre.nodeType == 1 && dtd.$empty[pre.tagName]){
                    var txt = this.document.createTextNode(domUtils.fillChar);
                    range.insertNode(txt).setStart(txt,0).collapse(true);
                }
            }
            setTimeout(function(){
                range.select(true);
            })

        }catch(e){}


        setTimeout(function(){
            range = me.selection.getRange();
            range.scrollIntoView();
            me.fireEvent('afterinserthtml');
        },200);
    }
};
