/**
 * @file
 * @name UM.filterNode
 * @short filterNode
 * @desc 根据给定的规则过滤节�?
 * @import editor.js,core/utils.js
 * @anthor zhanyi
 */
var filterNode = UM.filterNode = function () {
    function filterNode(node,rules){
        switch (node.type) {
            case 'text':
                break;
            case 'element':
                var val;
                if(val = rules[node.tagName]){
                    if(val === '-'){
                        node.parentNode.removeChild(node)
                    }else if(utils.isFunction(val)){
                        var parentNode = node.parentNode,
                            index = node.getIndex();
                        val(node);
                        if(node.parentNode){
                            if(node.children){
                                for(var i = 0,ci;ci=node.children[i];){
                                    filterNode(ci,rules);
                                    if(ci.parentNode){
                                        i++;
                                    }
                                }
                            }
                        }else{
                            for(var i = index,ci;ci=parentNode.children[i];){
                                filterNode(ci,rules);
                                if(ci.parentNode){
                                    i++;
                                }
                            }
                        }


                    }else{
                        var attrs = val['$'];
                        if(attrs && node.attrs){
                            var tmpAttrs = {},tmpVal;
                            for(var a in attrs){
                                tmpVal = node.getAttr(a);
                                //todo 只先对style单独处理
                                if(a == 'style' && utils.isArray(attrs[a])){
                                    var tmpCssStyle = [];
                                    utils.each(attrs[a],function(v){
                                        var tmp;
                                        if(tmp = node.getStyle(v)){
                                            tmpCssStyle.push(v + ':' + tmp);
                                        }
                                    });
                                    tmpVal = tmpCssStyle.join(';')
                                }
                                if(tmpVal){
                                    tmpAttrs[a] = tmpVal;
                                }

                            }
                            node.attrs = tmpAttrs;
                        }
                        if(node.children){
                            for(var i = 0,ci;ci=node.children[i];){
                                filterNode(ci,rules);
                                if(ci.parentNode){
                                    i++;
                                }
                            }
                        }
                    }
                }else{
                    //如果不在名单里扣出子节点并删除该节点,cdata除外
                    if(dtd.$cdata[node.tagName]){
                        node.parentNode.removeChild(node)
                    }else{
                        var parentNode = node.parentNode,
                            index = node.getIndex();
                        node.parentNode.removeChild(node,true);
                        for(var i = index,ci;ci=parentNode.children[i];){
                            filterNode(ci,rules);
                            if(ci.parentNode){
                                i++;
                            }
                        }
                    }
                }
                break;
            case 'comment':
                node.parentNode.removeChild(node)
        }

    }
    return function(root,rules){
        if(utils.isEmptyObject(rules)){
            return root;
        }
        var val;
        if(val = rules['-']){
            utils.each(val.split(' '),function(k){
                rules[k] = '-'
            })
        }
        for(var i= 0,ci;ci=root.children[i];){
            filterNode(ci,rules);
            if(ci.parentNode){
                i++;
            }
        }
        return root;
    }
}();