<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<title>用户登录</title>
<link rel="stylesheet" href="./statics/css/base.css" />
<link rel="stylesheet" href="./statics/css/global.css" />
<link rel="stylesheet" href="./statics/css/login-register.css" />
<script type="text/javascript" src="./statics/js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="./statics/layui/css/layui.css" />
</head>
<body>
	<div class="header wrap1000">
		<a href=""><img src="./statics/images/logo.png" alt="" /></a>
	</div>

	<div class="main">
		<div class="login-form fr">
			<div class="form-hd">
				<h3>管理员登录</h3>
			</div>
			<div class="form-bd">
				<form action="UserLogin" method="post">
					<dl>
						<dt>用户名</dt>
						<dd>
							<input type="text" name="userName" class="text" />
						</dd>
					</dl>
					<dl>
						<dt>密&nbsp;&nbsp;&nbsp;&nbsp;码</dt>
						<dd>
							<input type="password" name="passWord" class="text" />
						</dd>
					</dl>
					<dl>
						<dt>验证码</dt>
						<dd>
							<input type="text" name="code" class="text" size="10" style="width: 58px;">
							<img src="checkCode" alt="" width="100" height="32" class="passcode" style="height:43px;cursor:pointer; float: right; margin-right: 80px;" onclick="this.src=this.src+'?'">
						</dd>
					</dl>

					</dl>
					<dl>
						<dt>&nbsp;</dt>
						<dd>
							<input type="submit" id="login-submit" value="登  录"
								class="submit" />
						</dd>
					</dl>
				</form>
				<dl>
					<dt>&nbsp;</dt>
					<dd>
						还不是本站会员？立即 <a href="register" class="layui-btn layui-btn-normal" class="register">注册</a>
					</dd>
				</dl>
			</div>
			<div class="form-ft"></div>
		</div>

		<div class="login-form-left fl">
			<img src="./statics/images/left.jpg" alt="" />
		</div>
	</div>

	<div class="footer clear wrap1000">
		<p>
			<a href="/OnlineShop">首页</a> | <a href="">招聘英才</a> | <a href="">广告合作</a>
			| <a href="http://programmer.ischoolbar.com">关于猿来入此</a> | <a href="">联系我们</a>
		</p>
		<p>Copyright 2015-2019 Inc.,All rights reserved.</p>
	</div>
</body>
<script>
	function changeCode() {
		$("#login-code").attr(
				'src',
				'../system/get_cpacha?vl=4&w=100&h=30&type=userLoginCpacha&t='
						+ new Date().getTime());
	}
	$("#login-submit").click(function() {
		var name = $("input[name='user']").val();
		var password = $("input[name='pwd']").val();
		var code = $("input[name='code']").val();
		if (name == '') {
			alert('用户名不能为空');
			return;
		}
		if (password == '') {
			alert('密码不能为空');
			return;
		}
		if (code == '') {
			alert('验证码不能为空');
			return;
		}
		$.ajax({
			url : 'login',
			type : 'POST',
			data : {
				name : name,
				password : password,
				code : code
			},
			dataType : 'json',
			success : function(data) {
				if (data.type == 'success') {
					alert('登录成功!');
					window.location.href = 'index';
				} else {
					alert(data.msg);
				}
			}
		});
	});
</script>
</html>
