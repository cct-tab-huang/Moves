$(function(){
	//放大镜点击切换图片效果
	      //绑定点击小图片事件
	      var img1=document.getElementById("img1");
	      var img2=document.getElementsByClassName("img2");
	      var img3=document.getElementById("imag");
	 	for(var i=0;i<img2.length;i++){
	 	  img2[i].onclick=function(e){
	 		var imgs=e.target;//改变目标节点，元素
	 		img1.src=imgs.src;
	 		img3.src=imgs.src;
	 	}
	 }
           //点击添加边框style样式
                $(".magn_left .ul li").eq(0).addClass("style").siblings().removeClass("style");
	 			$(".magn_left .ul li").click(function(){
                        $(this).addClass("style").siblings().removeClass("style");
	              })
	 			$(".magn_left .ul li").mouseover(function(){
                        $(this).addClass("style").siblings().removeClass("style");
	              })
	 
	 	
	//放大镜事件效果js
         //绑定鼠标移入移出事件 ，显示隐藏
	      $(".thumbnail").hover(function(){
	      	   $(".float_box").show();
	      	   $(".thumbnail_1").show();
	      },function(){
	      	   $(".float_box").hide();
	      	   $(".thumbnail_1").hide();
	      })
	      //鼠标移入thumbnail框获取鼠标位置
	        $(".thumbnail").mousemove(function(e){
	        
        	var x=e.pageX;  //x轴
        	var y=e.pageY;  //y轴
        	console.log(x,y)
        	//获取thumbnail盒子的左上角位置坐标
        	 var box_x = x-$(".thumbnail").offset().left-$(".float_box").width()/2;
        	 var box_y = y-$(".thumbnail").offset().top-$(".float_box").height()/2;
        	 
        	 //判断鼠标移动左右限制范围
        	 if (box_x<=0) {//左
        	 	box_x=0;
        	 }
        	 if (box_x>=$(".thumbnail").width()-$(".float_box").width()) {//右
        	 	box_x=$(".thumbnail").width()-$(".float_box").width();
        	 }
        	 //判断鼠标移动左右限制范围
        	 if (box_y<=0) {//左
        	 	box_y=0;
        	 }
        	 if (box_y>=$(".thumbnail").height()-$(".float_box").height()) {//右
        	 	box_y=$(".thumbnail").height()-$(".float_box").height();
        	 }
        	 //浮动盒子移动
        	 $(".float_box").css({
        	 	"left":box_x,
        	 	"top":box_y
        	 })       	 
        	
        	  //放大图片反向移动
		        $(".thumbnail_1 img").eq(0).css({
        	 	"left":-box_x*$(".img").width()/$(".thumbnail").width(),
        	 	"top":-box_y*$(".img").width()/$(".thumbnail").width()
        	     })
        })
	          	var val = $(".o1").html();
	       //数量加减
	       $(".o2").click(function(){
	       	    val = parseInt(val)+1;
	       	  $(".o1").html(val)
	       })
	       $(".o3").click(function(){
	       	val = parseInt(val);
	       	if(val <= 1){
	       		val=1;
	       	}else{
	       		 val = parseInt(val)-1;
	       	     $(".o1").html(val)
	       	}
	       	
	       })
	        
         
})