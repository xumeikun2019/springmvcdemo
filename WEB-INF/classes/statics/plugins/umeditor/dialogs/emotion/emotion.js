(function(){

    var editor = null;

    UM.registerWidget('emotion',{

        tpl: "<link type=\"text/css\" rel=\"stylesheet\" href=\"<%=emotion_url%>emotion.css\">" +
            "<div class=\"edui-emotion-tab-Jpanel edui-emotion-wrapper\">" +
            "<ul class=\"edui-emotion-Jtabnav edui-tab-nav\">" +
            "<li class=\"edui-tab-item\"><a data-context=\".edui-emotion-Jtab0\" hideFocus=\"true\" class=\"edui-tab-text\"><%=lang_input_choice%></a></li>" +
            "<li class=\"edui-tab-item\"><a data-context=\".edui-emotion-Jtab1\" class=\"edui-tab-text\"><%=lang_input_Tuzki%></a></li>" +
            "<li class=\"edui-tab-item\"><a data-context=\".edui-emotion-Jtab2\" hideFocus=\"true\" class=\"edui-tab-text\"><%=lang_input_lvdouwa%></a></li>" +
            "<li class=\"edui-tab-item\"><a data-context=\".edui-emotion-Jtab3\" hideFocus=\"true\" class=\"edui-tab-text\"><%=lang_input_BOBO%></a></li>" +
            "<li class=\"edui-tab-item\"><a data-context=\".edui-emotion-Jtab4\" hideFocus=\"true\" class=\"edui-tab-text\"><%=lang_input_babyCat%></a></li>" +
            "<li class=\"edui-tab-item\"><a data-context=\".edui-emotion-Jtab5\" hideFocus=\"true\" class=\"edui-tab-text\"><%=lang_input_bubble%></a></li>" +
            "<li class=\"edui-tab-item\"><a data-context=\".edui-emotion-Jtab6\" hideFocus=\"true\" class=\"edui-tab-text\"><%=lang_input_youa%></a></li>" +
            "<li class=\"edui-emotion-tabs\"></li>" +
            "</ul>" +
            "<div class=\"edui-tab-content edui-emotion-JtabBodys\">" +
            "<div class=\"edui-emotion-Jtab0 edui-tab-pane\"></div>" +
            "<div class=\"edui-emotion-Jtab1 edui-tab-pane\"></div>" +
            "<div class=\"edui-emotion-Jtab2 edui-tab-pane\"></div>" +
            "<div class=\"edui-emotion-Jtab3 edui-tab-pane\"></div>" +
            "<div class=\"edui-emotion-Jtab4 edui-tab-pane\"></div>" +
            "<div class=\"edui-emotion-Jtab5 edui-tab-pane\"></div>" +
            "<div class=\"edui-emotion-Jtab6 edui-tab-pane\"></div>" +
            "</div>" +
            "<div class=\"edui-emotion-JtabIconReview edui-emotion-preview-box\">" +
            "<img src=\"<%=cover_img%>\" class=\'edui-emotion-JfaceReview edui-emotion-preview-img\'/>" +
            "</div>",

        sourceData: {
            emotion: {
                tabNum:7, //切换面板数量
                SmilmgName:{ 'edui-emotion-Jtab0':['j_00', 84], 'edui-emotion-Jtab1':['t_00', 40], 'edui-emotion-Jtab2':['w_00', 52], 'edui-emotion-Jtab3':['B_00', 63], 'edui-emotion-Jtab4':['C_00', 20], 'edui-emotion-Jtab5':['i_f', 50], 'edui-emotion-Jtab6':['y_00', 40] }, //图片前缀�?
                imageFolders:{ 'edui-emotion-Jtab0':'jx2/', 'edui-emotion-Jtab1':'tsj/', 'edui-emotion-Jtab2':'ldw/', 'edui-emotion-Jtab3':'bobo/', 'edui-emotion-Jtab4':'babycat/', 'edui-emotion-Jtab5':'face/', 'edui-emotion-Jtab6':'youa/'}, //图片对应文件夹路�?
                imageCss:{'edui-emotion-Jtab0':'jd', 'edui-emotion-Jtab1':'tsj', 'edui-emotion-Jtab2':'ldw', 'edui-emotion-Jtab3':'bb', 'edui-emotion-Jtab4':'cat', 'edui-emotion-Jtab5':'pp', 'edui-emotion-Jtab6':'youa'}, //图片css类名
                imageCssOffset:{'edui-emotion-Jtab0':35, 'edui-emotion-Jtab1':35, 'edui-emotion-Jtab2':35, 'edui-emotion-Jtab3':35, 'edui-emotion-Jtab4':35, 'edui-emotion-Jtab5':25, 'edui-emotion-Jtab6':35}, //图片偏移
                SmileyInfor:{
                    'edui-emotion-Jtab0':['Kiss', 'Love', 'Yeah', '啊！', '背扭', '�?', '抖胸', '88', '�?', '瞌睡', '鲁拉', '拍砖', '揉脸', '生日快乐', '大笑', '瀑布汗~', '惊讶', '臭美', '傻笑', '抛媚�?', '发�??', '打酱�?', '俯卧�?', '气愤', '?', '�?', '�?', '胜利', 'HI', 'KISS', '不说', '不要', '扯花', '大心', '�?', '大惊', '飞吻', '鬼脸', '害羞', '口水', '狂哭', '�?', '发财�?', '吃西�?', '套牢', '害羞', '庆祝', '我来�?', '敲打', '晕了', '胜利', '臭美', '被打�?', '贪吃', '迎接', '�?', '微笑', '亲吻', '调皮', '惊恐', '耍酷', '发火', '害羞', '汗水', '大哭', '', '加油', '�?', '你NB', '晕�??', '�?�?', '偷笑', '大哭', '滴汗', '叹气', '超赞', '??', '飞吻', '天使', '撒花', '生气', '被砸', '吓傻', '随意�?'],
                    'edui-emotion-Jtab1':['Kiss', 'Love', 'Yeah', '啊！', '背扭', '�?', '抖胸', '88', '�?', '瞌睡', '鲁拉', '拍砖', '揉脸', '生日快乐', '摊手', '睡觉', '瘫坐', '无聊', '星星�?', '旋转', '也不�?', '郁闷', '正Music', '抓墙', '撞墙至死', '歪头', '戳眼', '飘过', '互相拍砖', '砍死�?', '扔桌�?', '少林�?', '�?么？', '转头', '我爱牛奶', '我踢', '摇晃', '晕厥', '在笼子里', '震荡'],
                    'edui-emotion-Jtab2':['大笑', '瀑布汗~', '惊讶', '臭美', '傻笑', '抛媚�?', '发�??', '我错�?', 'money', '气愤', '挑�??', '�?', '�?', '胜利', '委屈', '受伤', '说啥呢？', '闭嘴', '�?', '逗你玩儿', '飞吻', '眩晕', '魔法', '我来�?', '睡了', '我打', '闭嘴', '�?', '打晕�?', '刷牙', '爆揍', '炸弹', '倒立', '刮胡�?', '邪恶的笑', '不要不要', '爱恋�?', '放大仔细�?', '偷窥', '超高�?', '�?', '松口�?', '我跑', '享受', '修养', '�?', '�?', '啊~', '热烈欢迎', '打酱�?', '俯卧�?', '?'],
                    'edui-emotion-Jtab3':['HI', 'KISS', '不说', '不要', '扯花', '大心', '�?', '大惊', '飞吻', '鬼脸', '害羞', '口水', '狂哭', '�?', '泪眼', '流泪', '生气', '吐舌', '喜欢', '旋转', '再见', '抓狂', '�?', '鄙视', '�?', '吐血', '�?', '打人', '蹦跳', '变脸', '扯肉', '吃To', '吃花', '吹泡泡糖', '大变�?', '飞天�?', '回眸', '可�??', '猛抽', '泡泡', '苹果', '�?', '', '骚舞', '烧香', '�?', '套娃�?', '捅捅', '舞�??', '西红�?', '爱慕', '�?', '摇摆', '杂�??', '招财', '被殴', '被球�?', '大惊', '理想', '欧打', '呕吐', '�?', '吐痰'],
                    'edui-emotion-Jtab4':['发财�?', '吃西�?', '套牢', '害羞', '庆祝', '我来�?', '敲打', '晕了', '胜利', '臭美', '被打�?', '贪吃', '迎接', '�?', '�?', '幸运', '爱心', '�?', '送花', '选择'],
                    'edui-emotion-Jtab5':['微笑', '亲吻', '调皮', '惊讶', '耍酷', '发火', '害羞', '汗水', '大哭', '得意', '鄙视', '�?', '夸奖', '晕�??', '疑问', '媒婆', '狂吐', '青蛙', '发愁', '亲吻', '', '爱心', '心碎', '玫瑰', '礼物', '�?', '奸笑', '可爱', '得意', '呲牙', '暴汗', '楚楚可�??', '�?', '�?', '生气', '惊讶', '口水', '彩虹', '夜空', '太阳', '钱钱', '灯泡', '咖啡', '蛋糕', '音乐', '�?', '胜利', '�?', '鄙视', 'OK'],
                    'edui-emotion-Jtab6':['男兜', '女兜', '�?�?', '乖乖', '偷笑', '大笑', '抽泣', '大哭', '无奈', '滴汗', '叹气', '狂晕', '委屈', '超赞', '??', '疑问', '飞吻', '天使', '撒花', '生气', '被砸', '口水', '泪奔', '吓傻', '吐舌�?', '点头', '随意�?', '旋转', '困困', '鄙视', '狂顶', '篮球', '再见', '欢迎光临', '恭喜发财', '稍等', '我在�?', '恕不议价', '库房有货', '货在路上']
                }
            }
        },
        initContent:function( _editor, $widget ){

            var me = this,
                emotion = me.sourceData.emotion,
                lang = _editor.getLang( 'emotion' )['static'],
                emotionUrl = UMEDITOR_CONFIG.UMEDITOR_HOME_URL + 'dialogs/emotion/',
                options = $.extend( {}, lang, {
                    emotion_url: emotionUrl
                }),
                $root = me.root();

            if( me.inited ) {
                me.preventDefault();
                this.switchToFirst();
                return;
            }

            me.inited = true;

            editor = _editor;
            this.widget = $widget;

            emotion.SmileyPath = _editor.options.emotionLocalization === true ? emotionUrl + 'images/' : "http://img.baidu.com/hi/";
            emotion.SmileyBox = me.createTabList( emotion.tabNum );
            emotion.tabExist = me.createArr( emotion.tabNum );

            options['cover_img'] = emotion.SmileyPath + (editor.options.emotionLocalization ? '0.gif' : 'default/0.gif');

            $root.html( $.parseTmpl( me.tpl, options ) );

            me.tabs = $.eduitab({selector:".edui-emotion-tab-Jpanel"});

            //缓存预览对象
            me.previewBox = $root.find(".edui-emotion-JtabIconReview");
            me.previewImg = $root.find(".edui-emotion-JfaceReview");

            me.initImgName();

        },
        initEvent:function(){

            var me = this;

            //防止点击过后关闭popup
            me.root().on('click', function(e){
                return false;
            });

            //移动预览
            me.root().delegate( 'td', 'mouseover mouseout', function( evt ){

                var $td = $( this),
                    url = $td.attr('data-surl') || null;

                if( url ) {
                    me[evt.type]( this, url , $td.attr('data-posflag') );
                }

                return false;

            } );

            //点击选中
            me.root().delegate( 'td', 'click', function( evt ){

                var $td = $( this),
                    realUrl = $td.attr('data-realurl') || null;

                if( realUrl ) {
                    me.insertSmiley( realUrl.replace( /'/g, "\\'" ), evt );
                }

                return false;

            } );

            //更新模板
            me.tabs.edui().on("beforeshow", function( evt ){

                var contentId = $(evt.target).attr('data-context').replace( /^.*\.(?=[^\s]*$)/, '' );

                evt.stopPropagation();

                me.updateTab( contentId );

            });

            this.switchToFirst();

        },
        initImgName: function() {

            var emotion = this.sourceData.emotion;

            for ( var pro in emotion.SmilmgName ) {
                var tempName = emotion.SmilmgName[pro],
                    tempBox = emotion.SmileyBox[pro],
                    tempStr = "";

                if ( tempBox.length ) return;

                for ( var i = 1; i <= tempName[1]; i++ ) {
                    tempStr = tempName[0];
                    if ( i < 10 ) tempStr = tempStr + '0';
                    tempStr = tempStr + i + '.gif';
                    tempBox.push( tempStr );
                }
            }

        },
        /**
         * 切换到第�?个tab
         */
        switchToFirst: function(){
            this.root().find(".edui-emotion-Jtabnav .edui-tab-text:first").trigger('click');
        },
        updateTab: function( contentBoxId ) {

            var me = this,
                emotion = me.sourceData.emotion;

            me.autoHeight( contentBoxId );

            if ( !emotion.tabExist[ contentBoxId ] ) {

                emotion.tabExist[ contentBoxId ] = true;
                me.createTab( contentBoxId );

            }

        },
        autoHeight: function( ) {
            this.widget.height(this.root() + 2);
        },
        createTabList: function( tabNum ) {
            var obj = {};
            for ( var i = 0; i < tabNum; i++ ) {
                obj["edui-emotion-Jtab" + i] = [];
            }
            return obj;
        },
        mouseover: function( td, srcPath, posFlag ) {

            posFlag -= 0;

            $(td).css( 'backgroundColor', '#ACCD3C' );

            this.previewImg.css( "backgroundImage", "url(" + srcPath + ")" );
            posFlag && this.previewBox.addClass('edui-emotion-preview-left');
            this.previewBox.show();

        },
        mouseout: function( td ) {
            $(td).css( 'backgroundColor', 'transparent' );
            this.previewBox.removeClass('edui-emotion-preview-left').hide();
        },
        insertSmiley: function( url, evt ) {
            var obj = {
                src: url
            };
            obj._src = obj.src;
            editor.execCommand( 'insertimage', obj );
            if ( !evt.ctrlKey ) {
                //关闭预览
                this.previewBox.removeClass('edui-emotion-preview-left').hide();
                this.widget.edui().hide();
            }
        },
        createTab: function( contentBoxId ) {

            var faceVersion = "?v=1.1", //版本�?
                me = this,
                $contentBox = this.root().find("."+contentBoxId),
                emotion = me.sourceData.emotion,
                imagePath = emotion.SmileyPath + emotion.imageFolders[ contentBoxId ], //获取显示表情和预览表情的路径
                positionLine = 11 / 2, //中间�?
                iWidth = iHeight = 35, //图片长宽
                iColWidth = 3, //表格剩余空间的显示比�?
                tableCss = emotion.imageCss[ contentBoxId ],
                cssOffset = emotion.imageCssOffset[ contentBoxId ],
                textHTML = ['<table border="1" class="edui-emotion-smileytable">'],
                i = 0, imgNum = emotion.SmileyBox[ contentBoxId ].length, imgColNum = 11, faceImage,
                sUrl, realUrl, posflag, offset, infor;

            for ( ; i < imgNum; ) {
                textHTML.push( '<tr>' );
                for ( var j = 0; j < imgColNum; j++, i++ ) {
                    faceImage = emotion.SmileyBox[ contentBoxId ][i];
                    if ( faceImage ) {
                        sUrl = imagePath + faceImage + faceVersion;
                        realUrl = imagePath + faceImage;
                        posflag = j < positionLine ? 0 : 1;
                        offset = cssOffset * i * (-1) - 1;
                        infor = emotion.SmileyInfor[ contentBoxId ][i];

                        textHTML.push( '<td  class="edui-emotion-' + tableCss + '" data-surl="'+ sUrl +'" data-realurl="'+ realUrl +'" data-posflag="'+ posflag +'" align="center">' );
                        textHTML.push( '<span>' );
                        textHTML.push( '<img  style="background-position:left ' + offset + 'px;" title="' + infor + '" src="' + emotion.SmileyPath + (editor.options.emotionLocalization ? '0.gif" width="' : 'default/0.gif" width="') + iWidth + '" height="' + iHeight + '"></img>' );
                        textHTML.push( '</span>' );
                    } else {
                        textHTML.push( '<td bgcolor="#FFFFFF">' );
                    }
                    textHTML.push( '</td>' );
                }
                textHTML.push( '</tr>' );
            }
            textHTML.push( '</table>' );
            textHTML = textHTML.join( "" );
            $contentBox.html( textHTML );
        },
        createArr: function( tabNum ) {
            var arr = [];
            for ( var i = 0; i < tabNum; i++ ) {
                arr[i] = 0;
            }
            return arr;
        },
        width:603,
        height:400
    });

})();

