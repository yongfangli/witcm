//遥控和键盘事件
$(document).ready(function() {
	$(document).on('keydown', function(e) {
		var code = event.keyCode;//遥控和键盘事件
		//alert(code);
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
		 }
	 });
});

function key_left(){
	
}

function key_right(){
	
}

function key_up(){
	
}

function key_down(){
	
}

function key_center(){
	
}
