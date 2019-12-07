/**
 * Created by lishida on 2017/1/11.
 */
var base_path = document.getElementsByTagName('script')[0].dataset.src;
layui.config({
    base : base_path + 'js/'
}).use(['bodyTab'], function() {
    newTab= function  (title,icon,href){
        window.parent.tab.newTab({
            title: title,
            icon: icon,
            href: href
        });

    };

    tabChange = function (title) {
        window.parent.tab.tabChange({
            title:title
        });
    };

    tabDelete = function (title) {
        window.parent.tab.tabDelete({
            title:title
        });
    };
})

    function jsCopy(id){
        const range = document.createRange();
        range.selectNode(document.getElementById(id));

        const selection = window.getSelection();
        if(selection.rangeCount > 0) selection.removeAllRanges();
        selection.addRange(range);

        document.execCommand('copy');
    }


