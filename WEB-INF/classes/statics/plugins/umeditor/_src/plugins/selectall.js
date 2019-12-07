///import core
///commands 全�??
///commandsName  SelectAll
///commandsTitle  全�??
/**
 * 选中�?�?
 * @function
 * @name UM.execCommand
 * @param   {String}   cmdName    selectall选中编辑器里的所有内�?
 * @author zhanyi
*/
UM.plugins['selectall'] = function(){
    var me = this;
    me.commands['selectall'] = {
        execCommand : function(){
            //去掉了原生的selectAll,因为会出现报错和当内容为空时，不能出现闭合状态的光标
            var me = this,body = me.body,
                range = me.selection.getRange();
            range.selectNodeContents(body);
            if(domUtils.isEmptyBlock(body)){
                //opera不能自动合并到元素的里边，要手动处理�?�?
                if(browser.opera && body.firstChild && body.firstChild.nodeType == 1){
                    range.setStartAtFirst(body.firstChild);
                }
                range.collapse(true);
            }
            range.select(true);
        },
        notNeedUndo : 1
    };


    //快捷�?
    me.addshortcutkey({
         "selectAll" : "ctrl+65"
    });
};
