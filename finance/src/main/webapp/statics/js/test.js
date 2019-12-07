/**
 * Created by towery on 2018/7/20.
 */
layui.define(["element","jquery"],function(exports){

    var obj = {
        test:function () {
            alert('5515');
        }
    }

    //输出模块
    exports('test', obj);
})