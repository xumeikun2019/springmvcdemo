var repData = '';
$.msg={
    // 错误弹出层
    tip: function(data) {
        if (data != '') {
            var res = data.result;
            if (res == 'ok') {
                layer.msg('操作成功', {
                    icon: 1,
                    time: 2000, //2s后自动关闭
                });
            } else if (res == 'fail') {
                layer.msg('操作失败', {
                    icon: 5,
                    time: 2000, //2s后自动关闭
                });
            } else {
            	layer.msg(data.message, {
                    icon: 5,
                    time: 2000, //2s后自动关闭
                });
            }
        }

    },

    //成功弹出层
    success : function(message,url) {
        layer.msg('保存成功', {
            icon: 1,
            time: 2000, //2s后自动关闭
        });
    },
},
    $.submit={
       post:function (data,url,callback) {
           var params = JSON.stringify(data.field);
           $.ajax({
               contentType: "application/json;charset=utf-8",
               dataType:'json',
               type: "post",
               url: url,
               beforeSend:function () {
                  
                  if (repData == params) {
                	  layer.msg('请勿重复提交数据！', {
                          icon: 5,
                          time: 2000, //2s后自动关闭
                      });
                	  return false;
                  }
                  repData = params;
                  $(data.form).find('button.save-btn').addClass('layui-btn-disabled').attr('disabled','disabled');
               },
               data: params,
               success: function (resp) {
                   $.msg.tip(resp);
                   if (callback) {
                       callback(resp);
                   }
               },
               error: function () {
                   layer.msg('操作失败', {
                       icon: 5,
                       time: 2000, //2s后自动关闭
                   });
               },
               complete: function () {
                  $(data.form).find('button.save-btn').removeClass('layui-btn-disabled').removeAttr('disabled');
               }

           });
       }
    }, 
    
    $.component={
		dropdown:function (form,element,params,url,choose,callback) {
    	           $.ajax({
    	               contentType: "application/json;charset=utf-8",
    	               dataType:'json',
    	               type: "post",
    	               url: url,
    	               data: params,
    	               success: function (resp) {
    	            	   var res = resp.result;
    	            	   var html = '';
    	            	   if (choose) {
    	            		   html += '<option value="">--请选择--</option>';
    	            	   }
    	            	   if (res == 'ok') {
    	            		   var data = resp.data;
    	            		   var val = $('#' + element).attr('value');
    	            		   $.each(data,function(i,d){
    	            			   var id = d.id;
    	    	            	   var value = d.cname;
    	    	            	   if (id == val) {
    	    	            		   html += '<option value="' + id + '" selected>' + value + '</option>';
    	    	            	   } else {
    	    	            		   html += '<option value="' + id + '">' + value + '</option>';
    	    	            	   }
    	            		   });
    	            		   $('#' + element).children().remove();
    	            		   $('#' + element).append(html);
    	            		   form.render('select');
    	            	   }
    	            	  
    	                   if (callback) {
    	                       callback(resp);
    	                   }
    	               },
    	               error: function () {
    	                   layer.msg('操作失败', {
    	                       icon: 5,
    	                       time: 2000, //2s后自动关闭
    	                   });
    	               }
    	           });
    	       },
    	       multiDropdown:function (form,selectPlus,element,params,url,choose,callback) {
    	           $.ajax({
    	               contentType: "application/json;charset=utf-8",
    	               dataType:'json',
    	               type: "post",
    	               url: url,
    	               data: params,
    	               success: function (resp) {
    	            	   var res = resp.result;
    	            	   if (res == 'ok') {
    	            		   var data = resp.data;
    	            		   var dataArr = new Array();
    	            		   var val = $('#' + element).attr('value');
    	            		   if (typeof(val) != 'undefined') {
    	            			   if (val.indexOf(',') > -1) {
        	            			   dataArr = val.split(',');
        	            		   } else {
        	            			   dataArr.push(val);
        	            		   }
    	            		   }
    	            		   
    	            		   select = selectPlus.render({
    	            		        el: '#' + element,
    	            		        data: resp.data,
    	            		        valueName: "cname",
    	            		        label: ["cname"],
    	            		        values: dataArr,
    	            		        valueSeparator: ","
    	            		      });
    	            	   }
    	            	  
    	                   if (callback) {
    	                       callback(select);
    	                   }
    	               },
    	               error: function () {
    	                   layer.msg('操作失败', {
    	                       icon: 5,
    	                       time: 2000, //2s后自动关闭
    	                   });
    	               }
    	           });
    	       }
    	    }
    
