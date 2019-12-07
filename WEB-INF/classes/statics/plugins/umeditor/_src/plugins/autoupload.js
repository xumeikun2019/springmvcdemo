/**
 * @description
 * 1.拖放文件到编辑区域，自动上传并插入到选区
 * 2.插入粘贴板的图片，自动上传并插入到�?�区
 * @author Jinqn
 * @date 2013-10-14
 */
UM.plugins['autoupload'] = function () {

    var me = this;

    me.setOpt('pasteImageEnabled', true);
    me.setOpt('dropFileEnabled', true);
    var sendAndInsertImage = function (file, editor) {
        //模拟数据
        var fd = new FormData();
        fd.append(editor.options.imageFieldName || 'upfile', file, file.name || ('blob.' + file.type.substr('image/'.length)));
        fd.append('type', 'ajax');
        var xhr = new XMLHttpRequest();
        xhr.open("post", me.options.imageUrl, true);
        xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
        xhr.addEventListener('load', function (e) {
            try {
                var json = eval('('+e.target.response+')'),
                    link = json.url,
                    picLink = me.options.imagePath + link;
                editor.execCommand('insertimage', {
                    src: picLink,
                    _src: picLink
                });
            } catch (er) {
            }
        });
        xhr.send(fd);
    };

    function getPasteImage(e) {
        return e.clipboardData && e.clipboardData.items && e.clipboardData.items.length == 1 && /^image\//.test(e.clipboardData.items[0].type) ? e.clipboardData.items : null;
    }

    function getDropImage(e) {
        return  e.dataTransfer && e.dataTransfer.files ? e.dataTransfer.files : null;
    }

    me.addListener('ready', function () {
        if (window.FormData && window.FileReader) {
            var autoUploadHandler = function (e) {
                var hasImg = false,
                    items;
                //获取粘贴板文件列表或者拖放文件列�?
                items = e.type == 'paste' ? getPasteImage(e.originalEvent) : getDropImage(e.originalEvent);
                if (items) {
                    var len = items.length,
                        file;
                    while (len--) {
                        file = items[len];
                        if (file.getAsFile) file = file.getAsFile();
                        if (file && file.size > 0 && /image\/\w+/i.test(file.type)) {
                            sendAndInsertImage(file, me);
                            hasImg = true;
                        }
                    }
                    if (hasImg) return false;
                }

            };
            me.getOpt('pasteImageEnabled') && me.$body.on('paste', autoUploadHandler);
            me.getOpt('dropFileEnabled') && me.$body.on('drop', autoUploadHandler);

            //取消拖放图片时出现的文字光标位置提示
            me.$body.on('dragover', function (e) {
                if (e.originalEvent.dataTransfer.types[0] == 'Files') {
                    return false;
                }
            });
        }
    });

};