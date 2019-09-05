<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="author" content="order by dede58.com"/>
		<title>小卖铺中的更多东西</title>
		<link rel="stylesheet" type="text/css" href="./statics/css/style.css">
	</head>
	<body>
	<!-- start header -->
		<header>
	<div class="top center">
		<div class="left fl">
			<ul>

			</ul>
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
		</div>
	</div>

	<!-- start danpin -->
		<div class="danpin center">
			
			<div class="biaoti center">黄泉小卖铺</div>
			
			<div class="main center" style="overflow: scroll; width: 45%; height: 600px;">
			<c:forEach items="${tList }" var="tls" >
				<div id="ttextlist" class="mingxing fl mb20" style="border:1px solid #fff;width:240px;cursor:pointer; margin-left:15px; float: left;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'">
				
					<div class="sub_mingxing"><a href="/Myshops/details?sid=${tls.sid }" target="_blank"><img src="./statics/imagevs/${tls.simg }" alt=""></a></div>
					<div class="pinpai"><a href="/Myshops/details?sid=${tls.sid }" target="_blank">${tls.SName }</a></div>
					<div class="youhui">5.16早10点开售</div>
					<div class="jiage">${tls.SMoney}元</div>
					
				</div>
			</c:forEach>
				<div class="clear"></div>
			</div>
			
		</div>
	

     
	

</header>
	</body>
</html>