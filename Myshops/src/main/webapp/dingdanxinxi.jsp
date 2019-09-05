<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="author" content="order by dede58.com"/>
		<title>小米商城-个人中心</title>
		<link rel="stylesheet" type="text/css" href="./statics/css/style.css">
	</head>
	<body>
	<!-- start header -->
		<header>
			<div class="top center">
				<div class="left fl">
					<ul>
						<li><a href="http://www.mi.com/" target="_blank">黄泉小卖铺</a></li>
						
						<div class="clear"></div>
					</ul>
				</div>
				<div class="right fr">
					<div class="gouwuche fr"><a href="/Myshops/logoshopcar">我的购物车</a></div>
					<div class="fr">
						<ul>
							<li><a href="/Myshops/cliLogin" target="_blank">登录</a></li>
							<li>|</li>
							<li><a href="/Myshops/register" target="_blank" >注册</a></li>
							
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
				
			</div>
			<div class="search fr">
				<form action="" method="post">
					<div class="text fl">
						<input type="text" class="shuru"  placeholder="小米6&nbsp;小米MIX现货">
					</div>
					<div class="submit fl">
						<input type="submit" class="sousuo" value="搜索"/>
					</div>
					<div class="clear"></div>
				</form>
				<div class="clear"></div>
			</div>
		</div>
<!-- end banner_x -->
<!-- self_info -->
	<div class="grzxbj">
		<div class="selfinfo center">
		<div class="lfnav fl">
			<div class="ddzx" style="cursor: pointer;">订单中心</div>
			<div class="subddzx">
				<ul>
					<li><a href="/Myshops/logoshopkehu">所有订单管理</a></li>
					<li><a href="/Myshops/logoshopstatus?status=0">未支付</a></li>
					<li><a href="/Myshops/logoshopstatus?status=1">已支付</a></li>
					<li><a href="/Myshops/logoshopstatus?status=2">已发货</a></li>
					<li><a href="/Myshops/logoshopstatus?status=3">已完成</a></li>
					<li><a href="/Myshops/logoshopstatus?status=4">已取消</a></li>
				</ul>
			</div>
			
		</div>
		<div class="rtcont fr" style="overflow: scroll; width: 980px; height: 500px;">
			<div class="ddzxbt">交易订单</div>
			<c:forEach items="${orderList }" var="olis">
			<div class="ddxq">
				<div class="ddspt fl"><img src="./statics/imagevs/${olis.shop.simg }" width="100px" height="100px" alt=""></div>
				<div class="ddbh fl">订单号:${olis.orderNum }</div>
				<div class="ztxx fr">
					<ul>
						<li>
						  <c:if test="${olis.orderStatus==0}">
						  未支付
						  </c:if>
						  <c:if test="${olis.orderStatus==1}">
						  已支付，等待发货。。。
						  </c:if>
						  <c:if test="${olis.orderStatus==2}">
						  已发货，等待接收。。。
						  </c:if>
						  <c:if test="${olis.orderStatus==3}">
						  已接收。。。
						  </c:if>
						  <c:if test="${olis.orderStatus==4}">
						  已取消。。。
						  </c:if>
						</li>
						<li>￥${olis.zMoney }</li>
						<li>${olis.createTime }</li>
						<div class="clear"></div>
					</ul>
				</div>
				
				<div class="clear"></div>
			</div>
			</c:forEach>
		</div>
		<div class="clear"></div>
		</div>
	</div>
<!-- self_info -->
		
		<footer class="mt20 center">			
			<div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
			<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div> 
			<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
		</footer>
	</body>
</html>