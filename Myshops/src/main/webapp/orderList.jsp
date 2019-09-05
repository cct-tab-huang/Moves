<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>用户管理</title>
<link type="text/css" rel="stylesheet" href="./statics/style.css" />
<link type="text/css" rel="stylesheet" href="./statics/public.css" />
</head>
<body>
	<!--头部-->
	<header class="publicHeader">
		<h1>JaneShop网上商城</h1>
		<div class="publicHeaderR">
			<p>
				<span>下午好！</span><span style="color: #fff21b">${user.userName}</span>
				, 欢迎你！
			</p>
			<a href="/JaneShop/CommodityServlet?who=exit">退出</a>
		</div>
	</header>

	<!--主体内容-->
	<section class="publicMian ">
		<div class="left">
			<h2 class="leftH2">
				<span class="span1"></span>功能列表 <span></span>
			</h2>
			<nav>
				<ul class="list fa-address-book-o">

					<li><a href="/Myshops/UserQueryAll">用户管理</a></li>
					<li><a href="/Myshops/shopsQueryAll">商品管理</a></li>
					<li><a href="/Myshops/ClientQueryAll">客户管理</a></li>
					<li><a href="/Myshops/TypeQueryAll">分类管理</a></li>
					<li><a href="/Myshops/brandQueryAll">品牌管理</a></li>
					<li><a href="/Myshops/orderQueryAll">订单管理</a></li>
				</ul>
			</nav>
		</div>

		<div class="right"
			style="overflow: scroll; width: 90%; height: 600px;">
			<div class="location">
				<strong>你现在所在的位置是:</strong> <span>订单管理页面</span>
			</div>
			<div class="search">
		<form action="/Myshops/orderNumLike" method="get">
		<input type="hidden" name="who" value="" />
		<span>订单号：</span> <input name="orderNum" class="input-text"
				type="text"> 
				
			<input value="查 询" type="submit" id="searchbutton">
			
		</form>
	</div>

			<!--用户-->
			<table class="providerTable" cellpadding="0" cellspacing="0">
				<tr>
					<td>订单编号</td>
					<td>运单号</td>
					<td>订单总价</td>
					<td>订单编号</td>
					<td>订单状态</td>
					<td>订单数量</td>
					<td>订单客户</td>
					<td>订单时间</td>
					<td>修改订单客户</td>
					<td>修改订单时间</td>
					<td>寄件认</td>
					<td>寄件时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${orderList }" var="uls">

					<tr>
						<td>${uls.oid }</td>
						<td>${uls.trackingNumber }</td>
						<td>${uls.zMoney }</td>
						<td>${uls.orderNum }</td>
						<td>
						<c:if test="${uls.orderStatus==0}">
						  未支付
						  </c:if>
						<c:if test="${uls.orderStatus==1}">
						  已支付，等待发货。。。
						  </c:if>
						<c:if test="${uls.orderStatus==2}">
						  已发货，等待接收。。。
						  </c:if>
						<c:if test="${uls.orderStatus==3}">
						  已接收。。。
						  </c:if>
						<c:if test="${uls.orderStatus==4}">
						  已取消。。。
						  </c:if></td>
						<td>${uls.number }</td>
						<td>${uls.createUser }</td>
						<td>${uls.createTime }</td>
						<td>${uls.updateUser }</td>
						<td>${uls.updateTime }</td>
						<td>${uls.trackingUser }</td>
						<td>${uls.trackingTime }</td>
						<td><span><a class="viewUser"
								href="/Myshops/orderTracking?oid=${uls.oid }"><img
									src="${pageContext.request.contextPath }/statics/images/y.png"
									alt="发货" title="发货" /> </a> </span> <span> </span></td>
					</tr>

				</c:forEach>

			</table>
			<div class="location">
				<div style="margin-left: 42%;">
					<c:if test="${abc==2 }">
						<h1>
							第<font id="qqw">${page.pageNum }</font><a onclick="return a()"
								href="/Myshops/orderQueryAll?&page=${page.prePage}">页|上一页 </a> <a
								onclick="return b()"
								href="/Myshops/orderQueryAll?&page=${page.nextPage }">下一页</a>|共<font
								id="wwq">${page.pages}</font>页
						</h1>
					</c:if>
				</div>
				<font style="color: blue">${userAdddress }</font>
			</div>

		</div>
	</section>
</body>
<script type="text/javascript">
	function a() {
		//alert();
		if (document.getElementById("qqw").innerHTML == 1) {
			return false;
		}
	}
	function b() {
		//alert();
		if (document.getElementById("qqw").innerHTML == document
				.getElementById("wwq").innerHTML) {
			return false;
		}
	}

	function del() {
		if (confirm('确认要删除？')) {
			//alert("删除成功！！！");
			return true;
		}
		return false;
	}
</script>
</html>