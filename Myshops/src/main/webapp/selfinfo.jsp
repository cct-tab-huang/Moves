<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="order by dede58.com" />
<title>小米商城-个人中心</title>
<link rel="stylesheet" type="text/css" href="./statics/css/style.css">
<script type="text/javascript" src="./statics/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="./statics/js/sanjiliandong.js"></script>
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
					<a href="./dingdanzhongxin.html">我的订单</a>
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
		<div class="nav fl"></div>
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
	<!-- self_info -->
	<div class="grzxbj">
		<div class="selfinfo center">
			<div class="lfnav fl">
				<div class="ddzx">订单中心</div>
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
				<div class="ddzx">个人中心</div>
				<div class="subddzx">
					<ul>
						<li><a href="./self_info.html"
							style="color: #ff6700; font-weight: bold;">我的个人中心</a></li>
						
					</ul>
				</div>
			</div>
			<div class="rtcont fr">
				<div class="grzlbt ml40">我的资料</div>
				<input type="hidden" value="${cids}" id="cid" />
				<div class="subgrzl ml40">
					<span>昵称</span><span>啦啦维吉尔</span>
				</div>
				<div class="subgrzl ml40">
					<span>手机号</span><span>15669097417</span><span><a href="">编辑</a></span>
				</div>
				<div class="subgrzl ml40">
					<span>姓名</span><span><input type="text" id="sName"></span>
				</div>
				<div class="subgrzl ml40" >
					<span style="margin-top: 3px;">地址</span><span> 
						<select id="s_province"name="sprovince"></select> 
						<select id="s_city" name="scity"></select>
						<select id="s_county" name="scounty"></select>
						<script class="resources library" src="area.js" type="text/javascript"></script>
						<script type="text/javascript">_init_area();</script>
					</span>
				</div>

				<div class="subgrzl ml40">
					<span style="margin-top: 3px;">详细地址</span><input type="text" id="address" style="margin-left: 
					120px; width: 500px;" /><span>
				</div>
				<div class="subgrzl ml40">
					<input  type="submit" id="tijiao" style="margin-left: 400px; width: 80px; height: 30px;"
					value="提交">
				</div>
				
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<!-- self_info -->

	<footer class="mt20 center">
		<div class="mt20">欢迎来到阿里爸爸</div>

	</footer>
</body>
<script type="text/javascript">
var Gid  = document.getElementById ;

var showArea = function(){

    Gid('show').innerHTML = "<h3>省" + Gid('s_province').value + " - 市" +     

    Gid('s_city').value + " - 县/区" + 

    Gid('s_county').value + "</h3>"

                            }


	   $(function(){
		   $("#tijiao").click(function(){
			  
			   $.ajax({
		             type: "GET",
		             url: "/Myshops/addSelf",
		             data: {"sName":$("#sName").val(),
		            	 "address":$("#address").val(),
		            	 "cid":$("#cid").val(),
		            	 "s_province":$("#s_province").val(),
		            	 "s_city":$("#s_city").val(),
		            	 "s_county":$("#s_county").val()},
		             dataType: "json",
		             success: function(data){
				            	 if (data>0) {
				            		 history.go(-1);  
								}
		                      }
		         });
		   })
		   
	   })
	</script>
</html>