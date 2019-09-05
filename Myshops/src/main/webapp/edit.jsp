<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="order by dede58.com" />
<title>苹果38plus</title>
<link rel="stylesheet" type="text/css" href="./statics/css/style.css">
<link rel="stylesheet" type="text/css" href="./statics/css/dspg.css">
<script type="text/javascript" src="./statics/js/jquery-1.8.0.min.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.9.1/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.2.js"></script>
<script src="http://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>

</head>
<body>
	<!-- start header -->
	<header>
		<div class="top center">
			<div class="left fl"></div>
			<div class="right fr">
				<div class="gouwuche fr">
					<a href="">购物车</a>
				</div>
				<div class="fr">
					<ul>
						<li><a href="./login.html" target="_blank">登录</a></li>
						<li>|</li>
						<li><a href="./register.html" target="_blank">注册</a></li>
						<li>|</li>
						<li><a href="">消息通知</a></li>
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
			<ul>
				<li><a href="">小米手机</a></li>
				<li><a href="">红米</a></li>
				<li><a href="">平板·笔记本</a></li>
				<li><a href="">电视</a></li>
				<li><a href="">盒子·影音</a></li>
				<li><a href="">路由器</a></li>
				<li><a href="">智能硬件</a></li>
				<li><a href="">服务</a></li>
				<li><a href="">社区</a></li>
			</ul>
		</div>
		<div class="search fr">
			<form action="" method="post">
				<div class="text fl">
					<input type="text" class="shuru" placeholder="小米6&nbsp;小米MIX现货">
				</div>
				<div class="submit fl">
					<input type="submit" class="sousuo" value="搜索" />
				</div>
				<div class="clear"></div>
			</form>
			<div class="clear"></div>
		</div>
	</div>
	<!-- end banner_x -->


	<!-- xiangqing -->

	<div class="xiangqing">
		<div class="neirong w">
			<div class="xiaomi6 fl">${detailsShop.SName }</div>
			<nav class="fr">
				<li><a href="">概述</a></li>
				<li>|</li>
				<li><a href="">变焦双摄</a></li>
				<li>|</li>
				<li><a href="">设计</a></li>
				<li>|</li>
				<li><a href="">参数</a></li>
				<li>|</li>
				<li><a href="">F码通道</a></li>
				<li>|</li>
				<li><a href="">用户评价</a></li>
				<div class="clear"></div>
			</nav>
			<div class="clear"></div>
		</div>
	</div>

	<div class="cpt">
		<div class="one">
			<div class="cpt-left">
				<div class="float-cpt"></div>
				<img
					src="${pageContext.request.contextPath }/statics/imagevs/${detailsShop.simg}"
					width="450" height="450" id="cptimg" />
			</div>

			<div class="cpt-right">
				<img
					src="${pageContext.request.contextPath }/statics/imagevs/${detailsShop.simg}"
					width="907" height="906" class="rightimg" />
			</div>
			<div class="cptt">
				<ul>
					<li><img
						src="${pageContext.request.contextPath }/statics/imagevs/${detailsShop.simg}"
						class="imgsrc" /></li>

				</ul>
			</div>
		</div>

		<div class="cpt-one">
			<form action="/Myshops/editAddcart"
				method="get">
				<input type="hidden" value="${detailsShop.sid}" name="cid">
				<h3>${detailsShop.SName }</h3>
				<!-- <p>九代H系处理器，GTX1660TiMax-Q,外星人控制中心，——键热血散热提升50%，72%NTSC高色域，高速固态硬盘，rgb键盘</p> -->
				<input type="hidden" value="${detailsShop.sid}" id="cid">
				<div class="price">
					<h5>价格：</h5>
					<p>
						￥<span>${detailsShop.SMoney}</span>
					</p>
				</div>

				<div class="price-one">
					<h5>库存：</h5>
					<p>${detailsShop.SSum - detailsShop.salSum}</p>
				</div>

				<div class="pri">
					<div class="price-two">
						<h5>数量:</h5>
						<input type="text" value="1" class="amount" name="number" />
					</div>
					<div class="two1">
						<input type="button" value="+" class="plus" /> <input
							type="button" value="-" class="minus" />
					</div>
					<div style="border: 0px; float: right; font-size: 30px;">
						总价： <input type="text" name="zMoney" class="shopices"
							readonly="readonly"
							style="border: 0px; width: 100px; font-size: 30px;"
							value="${detailsShop.SMoney}" name="">元
					</div>
					<font style="color: blue;" id="blu"></font>
				</div>

				<div style="margin-left: 100px; margin-top: 100px;">
					<input type="submit" value="立即购买" class="submit" />
				</div>
				<div class="two2" style="float: left; margin-left: 20px;">
					<input type="button" value="加入购物车" id="buttons" onclick="check()"
						class="submit" />
				</div>
				<div id="dialog"></div>

			</form>
		</div>

	</div>
	<!-- /cpt end-->

	<!-- xingx 部分-->
	<div class="xiangx">
		<h4>详细描述</h4>
	</div>
	<!-- /xiangx end-->

	<!-- pic 部分-->
	<div class="pic">${product.intro}</div>
	<!-- /pic end-->

	<script type="text/javascript">
		function check() {
			$.ajax({
				type : "GET",
				url : "/Myshops/addOrderCar",
				data : {
					"cid" : $("#cid").val(),
					"zMoney" : $(".shopices").val(),
					"number" : $(".amount").val()
				},
				dataType : "json",
				success : function(data) {
					$("#dialog").dialog();
					$("#dialog").dialog("close");
					if (data > 0) {
						$("#dialog").dialog("open");
						$("#dialog").text("5秒后自动关闭");
						$("body").animate({
							"top" : "0px"
						}, 5000, function() {
							$("#dialog").dialog("close");
						});

					}
				}

			});
		}

		var cptda = document.getElementsByClassName("cpt")[0]; //获取最大框
		var cptbox = document.getElementsByClassName("cpt-left")[0]; //获取左边框
		var floatbox = document.getElementsByClassName("float-cpt")[0]; //获取浮动class
		var rightbox = document.getElementsByClassName("cpt-right")[0]; //获取右边class
		var rightimg = document.getElementsByClassName("rightimg")[0]; //获取右边img的class

		// 绑定左边框class鼠标事件
		cptbox.onmouseover = function() {
			floatbox.style.display = "block";
			rightbox.style.display = "block";
		}

		cptbox.onmouseout = function() {
			floatbox.style.display = "none";
			rightbox.style.display = "none";
		}

		//绑定鼠标事件
		cptbox.onmousemove = function(e) {
			var floatx = e.pageX; //获取鼠标x值坐标
			var floaty = e.pageY; //获取鼠标y值坐标
			console.log("floatx:" + floatx);
			console.log("floaty:" + floaty);

			//变量  保存浮动盒子距离=鼠标值-大盒子到顶部距离-浮动盒子距离一半
			var flowtx = floatx - cptda.offsetLeft - floatbox.offsetWidth / 2;
			var flowty = floaty - cptda.offsetTop - floatbox.offsetHeight / 2;
			if (flowtx <= 0) {
				flowtx = 0;
			} else if (flowtx >= cptbox.offsetWidth - floatbox.offsetWidth) {
				flowtx = cptbox.offsetWidth - floatbox.offsetWidth;
			}

			if (flowty <= 0) {
				flowty = 0;
			} else if (flowty >= cptbox.offsetHeight - floatbox.offsetHeight) {
				flowty = cptbox.offsetHeight - floatbox.offsetHeight;
			}
			floatbox.style.left = flowtx + "px";
			floatbox.style.top = flowty + "px";

			var ratex = rightbox.offsetWidth / floatbox.offsetWidth;
			var ratey = rightbox.offsetHeight / floatbox.offsetHeight;

			rightimg.style.left = -flowtx * ratex + "px";
			rightimg.style.top = -flowty * ratey + "px";
		}

		var imgsrc = document.getElementsByClassName("imgsrc");
		//console.log(imgsrc)
		for (var i = 0; i < imgsrc.length; i++) {
			imgsrc[i].onmouseover = function() { //点击事件  当前点击的缩列图的src
				//console.log(12)
				var cptimg = document.getElementById("cptimg"); //获取缩列图的class
				cptimg.src = this.src; //点击缩列图，指代当前被点击图

				var cptsub = this.src.lastIndexOf(""); //lastIndexOf(要查看位置的字符); 从后往前，返回首次遇到该字符位置 区分大小写
				//console.log(cptsub)

				var cptlast = this.src.substr(0, cptsub); // substr(开始位置，结束位置)

				var rightimg = document.getElementsByClassName("rightimg")[0]; //获取右边img的class

				rightimg.src = cptlast; // 
			}
		}

		var butt = document.getElementsByClassName("plus")[0];
		var butt1 = document.getElementsByClassName("minus")[0];
		var tex = document.getElementsByClassName("amount")[0];
		var price = $(".price p span").html();
		$(".price p span").html(parseFloat(price).toFixed(2));
		var total = 0;
		butt.onclick = function() {
			//console.log(butt);
			var t = tex.value;
			console.log(t);
			if (t == '') {
				t = 0;
			}
			tex.value = parseInt(t) + 1;
			$(function() {
				console.log(price);
				var num = $(".amount").val();
				//console.log(num);
				total = parseFloat(total);
				total = parseFloat(num * price).toFixed(2);
				console.log(total);
				$(".shopices").val(total);
			})
		}
		butt1.onclick = function() {
			//console.log(butt);
			var t = tex.value;
			tex.value = parseInt(t) - 1;
			if (t <= 1) {
				tex.value = 1;
			}
			$(function() {
				console.log(price);
				var num = $(".amount").val();
				//console.log(num);
				total = parseFloat(total);
				total = parseFloat(num * price).toFixed(2);
				console.log(total);
				$(".shopices").val(total);
			})
		}
		$(function() {
			$(".amount").keyup(function() {
				var num = $(".amount").val();
				//console.log(num);
				price = parseFloat(price);
				if (num == '' || num == 0) {
					num = 0;
					$(".submit").attr("disabled", "disabled");
				}
				total = parseFloat(num * price).toFixed(2);
				console.log(total);
				$(".shopices").val(total);
			})
		})
	</script>
</body>
</html>