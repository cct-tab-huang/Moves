<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="order by dede58.com" />
<title>黄泉购物车</title>
<link rel="stylesheet" type="text/css" href="./statics/css/style.css">
<script type="text/javascript" src="./statics/js/jquery-1.8.0.min.js"></script>
</head>
<body>
	<!-- start header -->
	<!--end header -->

	<!-- start banner_x -->
	<div class="banner_x center">
		<a href="./index.html" target="_blank"><div class="logo fl"></div></a>

		<div class="wdgwc fl ml40">我的购物车</div>
		<div class="wxts fl ml20">温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</div>
		<div class="dlzc fr">
			<ul>
				<li><a href="/Myshops/cliLogin" target="_blank">登录</a></li>
				<li>|</li>
				<li><a href="/Myshops/register" target="_blank">注册</a></li>
			</ul>

		</div>
		<div class="clear"></div>
	</div>
	<div class="xiantiao"></div>
	
	<div class="gwcxqbj">
	<form action="/Myshops/pay" method="get">
		<div class="gwcxd center" style="overflow: scroll; width: 980px; height: 500px;">
			<div class="top2 center">
				<div class="sub_top fl">
					<input type="checkbox" value="quanxuan" id="checks"
						onclick="quanx()" class="quanxuan" />全选 
				</div>
				<div class="sub_top fl">商品名称</div>
				<div class="sub_top fl">单价</div>
				<div class="sub_top fl">数量</div>
				<div class="sub_top fl">小计(元)</div>
				<div class="sub_top fr">操作</div>
				<div class="clear"></div>
			</div>
			<c:forEach items="${orderList}" var="olis" varStatus="status">
			<input type="hidden" value="${status.index + 1}" name="oid" id="oid" >
			
				<div class="content2 center">
					<div class="sub_content fl ">
						<input name="xh" type="checkbox" value="danxuan" id="checkd${olis.oid}"
							onclick="checkcli('${olis.oid}')" class="quanxuan" />
					</div>
					<div class="sub_content fl"></div>
					<div class="sub_content fl ft20" style="width: 350px;">${olis.shop.SName}</div>
					<div class="sub_content fl ">
						<span id="dj${olis.oid}">${olis.shop.SMoney}</span>
					</div>
					<div class=""
						style="width: 120px; padding-top: 45px; margin-left: 80px; float: left;">
						<input type="button" id="jianhao${olis.oid}"
							onclick="jian('${olis.oid}')" value="-"
							style="display: block; float: left; width: 17px; height: 23px;" />
						<input class="shuliang"    onkeyup="checkid('${olis.oid}') "
							type="text" id="shuliang1${olis.oid}" value="${olis.number}"
							style="width: 60px; height: 23px; float: left;"> <input
							type="button" id="jiahao${olis.oid}" onclick="jia('${olis.oid}')"
							value="+"
							style="display: block; width: 100px; float: left; width: 17px; height: 23px;" />

					</div>
					<div class="sub_content fl"
						style="margin-left: 50px; width: 100px;">
						<span id="zj${olis.oid }" class="ozj">${olis.zMoney}</span>
					</div>
					<div class="sub_content fl"
						style="margin-left: 100px; width: 100px;">
						<a href="/Myshops/deleteById?oid=${olis.oid}">×</a>
					</div>
					<div class="clear">${deleteShopCar}</div>
					
				</div>
			</c:forEach>
		</div>
		<div class="jiesuandan mt20 center">
			<div class="tishi fl ml20">
				<ul>
					<li><a href="./liebiao.html">继续购物</a></li>
					<li>|</li>
					<li>共<span id="jkx"></span>件商品，已选择<span id="jks">0</span>件
					</li>
					<div class="clear"></div>
				</ul>
			</div>
			<div class="jiesuan fr">
				<div class="jiesuanjiage fl">
					合计（不含运费）：<span id="zjy">0</span>元
					<input type="hidden" id="hiddMoney" value="0" name="money">
				</div>
				<div class="jsanniu fr">
					<input class="jsan" type="submit" name="jiesuan" value="去结算" />
				</div>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
		</div>
</form>
	</div>




	<!-- footer -->
	<footer class="center">

		<div class="mt20">黄泉路小卖铺购物车</div>

	</footer>

</body>
<script type="text/javascript">




var val=$("input[value='danxuan']").length;
$("#jkx").html(val);
	function checkcli(id) {
		var zjy = $("#zjy").html();
		//alert($("#checkd"+id));
		console.log($("#checkd" + id).prop('checked'))
		if ($("#checkd" + id).prop('checked')) {
			var val=$("input[value='danxuan']").length;
			var vals=$("input[value='danxuan']:checked").length;
			$("#jks").html(vals);
			$("#jkx").html(val);
			
			///alert(val);
				if(val==vals){
					$("#checks").attr("checked","checked");
				}
			var zjx = $("#zj" + id).html();
			var f = parseInt(zjx) + parseInt(zjy);
			$("#zjy").html(f);
			$("#hiddMoney").val(f);
		} else {
			var vals=$("input[value='danxuan']:checked").length;
			$("#jks").html(vals);
			
			$("#checks").attr("checked",null);
			var zjx = $("#zj" + id).html();
			var f = parseInt(zjy) - parseInt(zjx);
			$("#zjy").html(f);
			$("#hiddMoney").val(f);

		}
	}

	function checkid(id) {
		var a = $("#shuliang1" + id).val();
		var dj = $("#dj" + id).html();
		var b = $("#jianhao" + id).text();
		var codex=/\d/;
		var coo=codex.test(a);
		if(coo){
			console.log("dj:" + dj)
			if (a <= 1) {
				$("#shuliang1" + id).val(1);

				$("#zj" + id).html(dj);
			} else {
				var c = $("#shuliang1" + id).val();
				$("#zj" + id).html(dj * c);
			}
		}else{
			$("#shuliang1" + id).val(1);

			$("#zj" + id).html(dj);
		}
		
	}

	function jian(id) {
		var a = $("#shuliang1" + id).val();
		var dj = $("#dj" + id).html();
		var b = $("#jianhao" + id).text();
        alert(dj);
		if (a <= 1) {
			$("#shuliang1" + id).val(1);
			$("#zj" + id).html(dj);
		} else {
			var zjy = $("#zjy").html();
			  var zjx = $("#zj"+id).html();
			 if ($("#checkd" + id).prop('checked')) {
				  $("#jks").html(val);
				var f =  parseInt(zjy) -parseInt(dj);
				$("#zjy").html(f);
				$("#checkd"+id).val(parseInt(a)*parseInt(dj));
				//alert(f);
				$("#hiddMoney").val(f);
			  }
			$("#shuliang1" + id).val(--a);
			
			var c = $("#shuliang1" + id).val();
			$("#zj" + id).html(dj * c);
		}

	}

	function jia(id) {
		var a = $("#shuliang1" + id).val();
		var dj = $("#dj"+ id).html();
		var b = $("#jiahao" + id).text();
		//alert(dj);
		if (a < 1) {
			$("#shuliang1" + id).val(1);
			$("#zj" + id).html(dj);

		} else {
			var zjy = $("#zjy").html();
			  var zjx = $("#zj"+id).html();
			 if ($("#checkd" + id).prop('checked')) {
				  $("#jks").html(val);
				var f =  parseInt(zjy) + parseInt(dj);
				alert(parseInt(dj));
				$("#zjy").html(f);
				$("#checkd"+id).val(parseInt(a)*parseInt(dj));
				$("#hiddMoney").val(f);
				//alert(f);
			  }
			$("#shuliang1" + id).val(++a);
			var c = $("#shuliang1" + id).val();
			$("#zj" + id).html(dj * c);
			//alert(a);
		}

	}

	function quanx() {
		var val=$("input[value='danxuan']").length;
		///alert(val);
		for (var i = 0; i < val; i++) {
		var id=$("#oid").eq(i).val();
		
		var id=$("#oid").val();
	    
		  //$("#checkx").attr("checked", null);
		  var s=0;
		  
		 //alert(id);
		  $("input[class='quanxuan']").each(function(){
				   if($(this).get(0).checked){
					   
					  $("input[class='quanxuan']").attr("checked", "checked");
					  var zjx = $("#zj"+id).html();
						  $("#jks").html(val);
						var f = parseInt(zjx)* val;
						$("#zjy").html(f);
						$("#hiddMoney").val(f);
						//alert($("#hiddMoney").val(f));
						//alert(f);
					  console.log($("#zj"+id));
				   return true;
				    }else{
				    	$("input[class='quanxuan']").attr("checked",null);
				    	$("#jks").html(0);
							var f =0;
							$("#zjy").html(f);
							
							return false;
				    }
				   });
		}

	}

</script>
</html>