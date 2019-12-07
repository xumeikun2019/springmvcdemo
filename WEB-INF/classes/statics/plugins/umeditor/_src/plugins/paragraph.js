///import core
///commands 格式
///commandsName  Paragraph
///commandsTitle  段落格式
/**
 * 段落样式
 * @function
 * @name UM.execCommand
 * @param   {String}   cmdName     paragraph插入段落执行命令
 * @param   {String}   style               标签值为�?'p', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6'
 * @param   {String}   attrs               标签的属�?
 * @author zhanyi
 */
UM.plugins['paragraph'] = function() {
    var me = this;
    me.setOpt('paragraph',{'p':'', 'h1':'', 'h2':'', 'h3':'', 'h4':'', 'h5':'', 'h6':''});
    me.commands['paragraph'] = {
        execCommand : function( cmdName, style ) {
            return this.document.execCommand('formatBlock',false,'<' + style + '>');
        },
        queryCommandValue : function() {
            try{
                var  val = this.document.queryCommandValue('formatBlock')
            }catch(e){
            }
            return val ;
        }
    };
};
