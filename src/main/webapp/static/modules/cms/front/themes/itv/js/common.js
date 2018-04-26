//遥控和键盘事件
$(document).ready(function() {
	
	$(document).on('keydown', function(e) {
		var code = event.keyCode;//遥控和键盘事件
		if(code==8){
			var back_obj = $("#itv_back");
			if(back_obj!=null && back_obj!="" && back_obj.length>0){
				window.location.href = back_obj.attr("href");
			}
		}else{
			var jbox_but_focus = $(".jbox-button-focus");
			if(jbox_but_focus!=null && jbox_but_focus!="" && jbox_but_focus.length>0){
				$(".jbox-button").each(function(){
					if($(this).attr("value")=="ok"){
						$(this).attr("id","but_ok");
					}else if($(this).attr("value")=="cancel"){
						$(this).attr("id","but_cancel");
					}
				});
				if(code==37){
					var jbox_value = jbox_but_focus.attr("value");
					if(jbox_value=="cancel"){
						$("#but_cancel").removeClass("jbox-button-focus");
						$("#but_ok").addClass("jbox-button-focus");
					}
				}else if(code==39){
					var jbox_value = jbox_but_focus.attr("value");
					if(jbox_value=="ok"){
						$("#but_cancel").addClass("jbox-button-focus");
						$("#but_ok").removeClass("jbox-button-focus");
					}
				}else if(code==13){
					$(".jbox-button-focus").trigger('click');
				}
			}
		}
		
		//showTip(code);
		/**
		var menu_three = $(".menu_three_active");//二级菜单选中
		var menu_two = $(".menu_two_active");//二级菜单选中
	   	var active_id = "";//选择中菜单ID
	   	if(menu_three!=null && menu_three!="" && menu_three.length>0){
	   		active_id = menu_three.attr("id");
	   	}else if(menu_two!=null && menu_two!="" && menu_two.length>0){
	   		active_id = menu_two.attr("id");
	   	}else{
	   		active_id = $(".menu_one_active").attr("id");//一级菜单选中
	   	}
	    var index = active_id.split("_")[2];
		 if(code==37 || code=="KEY_LEFT"){//左
			 if(active_id.indexOf("menu_one")>-1){//一级菜单
				 if(index>0){
					--index;
					$("#menu_one_"+index).trigger('click');
				 }
			 }else if(active_id.indexOf("menu_two")>-1){//二级菜单
				 if(index>0){
					 --index;
					 $(".menu_two").removeClass("menu_two_active");
					 $("#menu_two_"+index).addClass("menu_two_active");
				 }
			 }else if(active_id.indexOf("menu_three")>-1){//三级菜单
				 
			 }
		 }else if(code==38 || code=="KEY_UP"){//上
			 if(active_id.indexOf("menu_one")>-1){//一级菜单
				 $(".menu_two").removeClass("menu_two_active");
				 $("#menu_two_0").addClass("menu_two_active");
			 }else if(active_id.indexOf("menu_two")>-1){//二级菜单
				
			 }else if(active_id.indexOf("menu_three")>-1){//三级菜单
				 if(index>0){
					 --index;
					 $("#menu_three_"+index).trigger('click');
				 }
			 }
		 }else if(code==39 || code=="KEY_RIGHT"){//右
			 if(active_id.indexOf("menu_one")>-1){//一级菜单
				 var nodes = $("#menu_one > div");
				 if(index<nodes.length-1){
					++index;
					$("#menu_one_"+index).trigger('click');
				 }
			 }else if(active_id.indexOf("menu_two")>-1){//二级菜单
				 var nodes = $(".menu_two");
				 if(index<nodes.length-1){
					++index;
					$(".menu_two").removeClass("menu_two_active");
					$("#menu_two_"+index).addClass("menu_two_active");
				 }
			 }else if(active_id.indexOf("menu_three")>-1){//三级菜单
				 
			 }
		 }else if(code==40 || code=="KEY_DOWN"){//下
			 if(active_id.indexOf("menu_one")>-1){//一级菜单
			 }else if(active_id.indexOf("menu_two")>-1){//二级菜单
				 $(".menu_two").removeClass("menu_two_active");
			 }else if(active_id.indexOf("menu_three")>-1){//三级菜单
				 var nodes = $(".menu_three");
				 if(index<nodes.length-1){
					++index;
					$("#menu_three_"+index).trigger('click');
				 } 
			 }
		 }else if(code==13 || code=="KEY_ENTER"){
			if(active_id.indexOf("menu_one")>-1){//一级菜单
			 }else if(active_id.indexOf("menu_two")>-1){//二级菜单
				 $("#menu_two_"+index).trigger('click');
			 }
		 }**/
	 });
	 
});

//确认对话框
function confirmx(mess, href, closed){
	top.$.jBox.confirm(mess,'系统提示',function(v,h,f){
		if(v=='ok'){
			if (typeof href == 'function') {
				href();
			}else{
				resetTip(); //loading();
				location = href;
			}
		}
	},{buttonsFocus:0, closed:function(){
		if (typeof closed == 'function') {
			closed();
		}
	}});
	top.$('.jbox-body .jbox-icon').css('top','55px');
	return false;
}

//恢复提示框显示
function resetTip(){
	top.$.jBox.tip.mess = null;
}
