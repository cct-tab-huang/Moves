<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>欢迎来到黄泉小卖铺首页</title>
<link rel="stylesheet" type="text/css" href="./statics/css/style.css">
<script src="./statics/js/jquery-1.7.2.min.js" type="text/javascript"></script>

</head>

<body>
	<!-- start header -->
	<header>
	<div class="top center">
		<div class="left fl">
			
		</div>
		<div class="right fr">
			<div class="gouwuche fr">
				<a href="/Myshops/logoshopcar">购物车</a>
			</div>
			<div class="gouwuche fr">
				<a href="/Myshops/logoshopkehu">购物订单</a>
			</div>
			<div class="fr">
				<ul>
					<li><a href="/Myshops/cliLogin" target="_blank">登录</a></li>
					<li>|</li>
					<li><a href="/Myshops/register" target="_blank">注册</a></li>
					
				</ul>
			</div>
			<div class="clear"></div>
		</div>
		<div class="clear"></div>
	</div>
	</header>
	<!--end header -->

	<!-- start banner_x -->
	<div class="banner_x center">
		<a href="./index.html" target="_blank"><div class="logo fl"></div></a>
		<a href=""><div class="ad_top fl"></div></a>
		<div class="nav fl">

			<form action="http://www.baidu.com/baidu" target="_blank">
				<table bgcolor="#FFFFFF">
					<tr>
						<td><input name=tn type=hidden value=baidu> <a
							href="http://www.baidu.com/"> <img
								src="http://img.baidu.com/img/logo-80px.gif" alt="Baidu"
								align="bottom" border="0">
						</a> <input type=text name=word size=30> <input type="submit"
							value="百度搜索"></td>
					</tr>
				</table>
			</form>

		</div>
		<div class="search fr">
			
		</div>
	</div>
	<!-- end banner_x -->

	<!-- start banner_y -->
	<div class="banner_y center">
		<div class="nav" style="float: left;">
			<ul>

				<c:forEach items="${queryBrandList }" var="snlis" end="9">
					<li style="cursor: pointer;" onmousemove="changes(${snlis.bid})"><a ><span  id="sNamex${snlis.bid}">${snlis.brandName}</span></a>
						<div class="pop">
							<div class="left fl">
								<div id="sdf" >
									<div class="xuangou_left fl">
										<a href="" id="sdf${snlis.bid}">
											<div class="img fl">
												
											</div> 
											<span class="fl" ></span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr">
										<a href="./xiangqing.html" target="_blank">选购</a>
									</div>
									<div class="clear"></div>
								</div>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		

	</div>

	<div class="sub_banner center">
		<div class="sidebar fl">
			<div class="fl">
				<a href=""><img src="./statics/images/hjh_01.gif"></a>
			</div>
			<div class="fl">
				<a href=""><img src="./statics/images/hjh_02.gif"></a>
			</div>
			<div class="fl">
				<a href=""><img src="./statics/images/hjh_03.gif"></a>
			</div>
			<div class="fl">
				<a href=""><img src="./statics/images/hjh_04.gif"></a>
			</div>
			<div class="fl">
				<a href=""><img src="./statics/images/hjh_05.gif"></a>
			</div>
			<div class="fl">
				<a href=""><img src="./statics/images/hjh_06.gif"></a>
			</div>
			<div class="clear"></div>
		</div>
		<div class="datu fl">
			<a href=""><img src="./statics/images/hongmi4x.png" alt=""></a>
		</div>
		<div class="datu fl">
			<a href=""><img src="./statics/images/xiaomi5.jpg" alt=""></a>
		</div>
		<div class="datu fr">
			<a href=""><img src="./statics/images/pinghengche.jpg" alt=""></a>
		</div>
		<div class="clear"></div>


	</div>
	<!-- end banner -->
	<div class="tlinks">
		Collect from <a href="http://www.cssmoban.com/">企业网站模板</a>
	</div>

	<!-- start danpin -->
	<div class="danpin center">

		<div class="biaoti center" >最新上架商品>>><a href="/Myshops/newMore">更多</a></div>
		
		<div class="main center">
		<c:forEach items="${queryCreateTimeList }" var="qctl" end="4">
			<div class="mingxing fl" >
				<div class="sub_mingxing">
					<a href="/Myshops/details?sid=${qctl.sid }"><img src="./statics/imagevs/${qctl.simg }" alt=""></a>
				</div>
				<div class="pinpai">
					<a href="/Myshops/details?sid=${qctl.sid }">${qctl.SName }</a>
				</div>
				<div class="youhui">${qctl.SSum }</div>
				<div class="jiage">${qctl.SMoney }元</div>
			</div>
		 </c:forEach>
		</div>
		
	</div>
	
	<div class="peijian w">
		<div class="biaoti center">最近热销商品>>><a href="/Myshops/rexiaoShop">更多</a></div>
		<div class="main center">
			<div class="content">
			<c:forEach items="${queryBySSum }" var="qctl" end="4">
				  
				<div class="remen fl">
				  
					<div class="xinpin">
						<span>热销</span>
					</div>
					<div class="tu">
						 <a href="/Myshops/details?sid=${qctl.sid }"><img src="./statics/imagevs/${qctl.simg }" width="150px;" height="150ox;"  alt=""></a> 
					</div>
					<div class="miaoshu">
						<a href="/Myshops/details?sid=${qctl.sid }">${qctl.SName }</a>
					</div>
					<div class="jiage">${qctl.SMoney }元</div>
					<div class="pingjia">372人评价</div>
					<div class="piao">
						<a href=""> <span>发货速度很快！很配小米6！</span> <span>来至于mi狼牙的评价</span>
						</a>
					</div>
				
				</div>
				</c:forEach>
			</div>
			<div class="content">
			<div class="biaoti center">商品推荐>>><a href="/Myshops/tuijianShop">更多</a></div>
				<c:forEach items="${queryRecommend }" var="qctl" end="3">
				<div class="remen fl">
					<div class="xinpin">
						<span style="background: #fff"></span>
					</div>
					<div class="tu">
						<a href="/Myshops/details?sid=${qctl.sid }"><img src="./statics/imagevs/${qctl.simg }" width="150px;" height="150ox;"></a>
					</div>
					<div class="miaoshu">
						<a href="/Myshops/details?sid=${qctl.sid }">${qctl.SName }</a>
					</div>
					<div class="jiage">${qctl.SMoney }</div>
					<div class="pingjia">372人评价</div>
					<div class="piao">
						<a href=""> <span>发货速度很快！很配小米6！</span> <span>来至于mi狼牙的评价</span>
						</a>
					</div>
				</div>
				</c:forEach>
				
				<div class="remenlast fr">
					<div class="hongmi">
						<a href=""><img src="./statics/images/hongmin4.png" alt=""></a>
					</div>
					<div class="liulangengduo">
						<a href=""><img src="./statics/images/liulangengduo.png" alt=""></a>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<div style="text-align: center; margin-top: 20px;">
	
   </div>
</body>
<script type="text/javascript">
   function changes(id){
	  
	   var sName=$("#sNamex"+id).html();
	   $.ajax({
			url:"/Myshops/queryAjaxSname",
			type:"get",
			dataType:"json",
			data:{
			    "sName":sName,"bid":id,
			},
		success:function(data){
			$("#sdf"+id).empty();
			//console.log(data);
			for(var i=0;i<data.length;i++){
				console.log(data[i].simg);
				$("<div class='img fl'></div><span class='fl' >"+data[i].sName+"</span><div class='clear'></div>").appendTo("#sdf"+id);
				
			}
			
		}
		})
   }
</script>
</html>