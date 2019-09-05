<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<title>用户注册</title>
<link rel="stylesheet" href="./statics/css/base.css" />
<link rel="stylesheet" href="./statics/css/global.css" />
<link rel="stylesheet" href="./statics/css/login-register.css" />
<script type="text/javascript" src="./statics/js/jquery.js"></script>
<script type="text/javascript" src="./statics/js/jquery-1.8.0.min.js"></script>

</head>
<body>
	<div class="header wrap1000">
		<a href=""><img src="./statics/images/logo.png" alt="" /></a>
	</div>

	<div class="main">
		<div class="login-form fr">
			<div class="form-hd">
				<h3>用户注册</h3>
			</div>
			<div class="form-bd">
				<form action="insertClient" method="post">
					<dl>
						<dt>用户名</dt>
						<dd>
							<input type="text" name="CPhone" id="CPhone" class="text"
								maxlength="11" /> <font style="color: red;" id="reds"></font>
								<font style="color: blue;" id="blues"></font>
						</dd>
					</dl>
					<div class="item items">
						<dt>验证码</dt>
						<dd>
							<input maxlength="6" class="text" name="mobilecodes"
								id="mobile_code" style="width: 60px;" type="text"><a
								href="javascript:void(0)" class="ncm-btn ml5" tabindex="2">
								<span id="sending" style="display: none">正在</span> <span
								class="send_success_tips" style="display: none;"> <strong
									id="show_times" class="red mr5"></strong>秒后再次获取
							</span> <input type="button" id="hidetimecs" style="width: 100px; height: 25px; cursor: pointer; border-radius: 10px;"
								value="免费获取验证码" onclick="settime(this)" />
							</a>
						</dd>
						<div class="err_box">
							<div class="err_msg2" style="display: none;">请输入发送给您手机上的验证码</div>
						</div>
					</div>
					<dl>
						<dt>密码</dt>
						<dd>
							<input type="password" name="passWord" id="passWords" class="text" />
						
						</dd>
						<dd>
						   <font style="color: blue;" id="bls"></font>
						</dd>
					</dl>
					<dl>
						<dt>确认密码</dt>
						<dd>
							<input type="password" name="repwd" id="repwd" class="text" />
						</dd>
						<dd>
						   <font style="color: blue;" id="bls"></font>
						</dd>
					</dl>

					<dl>
						<dt>验证码</dt>
						<dd>
							<input type="text" name="code" class="text" size="10"
								style="width: 58px;" /> <img src="checkCode" alt="" width="100"
								height="32" class="passcode"
								style="height: 43px; cursor: pointer; float: right; margin-right: 80px;"
								onclick="this.src=this.src+'?'" />
						</dd>
					</dl>
					<dl>
						<dt>&nbsp;</dt>
						<dd>
							<input type="submit" value="立即注册" class="" />
						</dd>
					</dl>
				</form>

			</div>
			<div class="form-ft"></div>
		</div>

		<div class="login-form-left fl">
			<dl class="func clearfix">
				<dt>注册之后您可以</dt>
				<dd class="ico05">
					<i></i>购买商品支付订单
				</dd>
				<dd class="ico01">
					<i></i>查看各类销售商品
				</dd>
				<dd class="ico03">
					<i></i>空间好友推送分享
				</dd>
				<dd class="ico02">
					<i></i>收藏商品关注商品
				</dd>
				<dd class="ico06">
					<i></i>商品资讯服务评价
				</dd>
				<dd class="ico04">
					<i></i>安全交易诚信无忧
				</dd>
			</dl>

			<div class="if">
				<h2>如果您是本站用户</h2>
				<p>
					我已经注册过账号，立即 <a href="login" class="register">登录</a>
				</p>
			</div>
		</div>
	</div>

	<div class="footer clear wrap1000">
		<p>
			<a href="/OnlineShop">首页</a> | <a href="">招聘英才</a> | <a href="">广告合作</a>
			| <a href="http://programmer.ischoolbar.com">关于商品</a> | <a href="">联系我们</a>
		</p>
		<p>Copyright 2015-2019 Mr.huang Inc.,All rights reserved.</p>
	</div>
	<script type="text/javascript">
		var f1 = false;
		var f2 = false;
		var f3 = false;
		function check() {
			if (f1 && f2 && f3) {
				return true;
			} else {
				return false;
			}

		}
		
		var countdown = 60;
		function settime(obj) {
			if (f1 == true) {
				if (countdown == 0) {
					obj.removeAttribute("disabled");
					countdown = 60;
					return;
				} else {
					obj.setAttribute("disabled", true);
					obj.value = "重新发送(" + countdown + ")";
					countdown--;

				}
				setTimeout(function() {
					settime(obj)
				}, 1000)
			}
		}
		$(document).ready(function() {
			//验证密码格式
			$("#passWords").blur(function(){
				var passWord=$("#passWords").val();
				var pass=/^[A-Za-z0-9]{8,16}$/;
				var pa=pass.test(password);
				if(pa==true){
					
					$("#bls").html("");
					$("#bls").html("密码格式正确");
				}else{
					
					$("#bls").html("");
					$("#bls").html("密码格式不正确");
				}
					
			});
			$("#repwd").blur(function(){
				var password=$("#passWords").val();
				var passwords=$("#repwd").val();
				if(password==passwords){
					$("#bls").html("");
					$("#bls").html("密码格式正确");
				}else{
					$("#bls").html("");
					$("#bls").html("密码格式不正确");
				}
			
			});
			//短信接口验证
			$("#hidetimecs").click(function() {

				$.ajax({

					url : "autophone",
					data : {
						"CPhone" : $("#CPhone").val()
					},
					dataType : "json",
					type : "GET",
					success : function(data) {

					}
				});
			});
		});
			//验证手机格式
			$(function() {
				$("#CPhone").blur(function() {

					var phone = $("#CPhone").val();
					var reg = /^1[3-9]\d{9}$/;
					if (reg.test(phone) && phone != "") {
						//用户名是否存在
						$.ajax({
							url : "selectbyphone",
							data : {
								"CPhone" : phone
							},
							dataType : "json",
							type : "post",

							success : function(data) {
								if (data == null) {
									
									$("#blues").html("");
									$("#blues").html("用户名可以使用");
									f1 = true;
								} else {
									$("#blues").html("");
									$("#blues").html("当前用户名已经被注册");

								}
							}
						});

					} else {
						alert();
					}
				});
			});

		
	</script>

</body>
</html>