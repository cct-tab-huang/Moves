<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/login.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/layui/css/layui.css" />
</head>
<body>
	<div id="append"></div>
	<div class="full_sc">
		<div class="head_cent head_cwo ClearFix">
			<div class="h_logo">
				<a href=""> <img src="${pageContext.request.contextPath }/statics/images/logo.jpg" />
				</a>
			</div>
			<div class="h_right">
				<img src="${pageContext.request.contextPath }/statics/images/top_center.jpg" />
			</div>
		</div>
	</div>
	<div class="w980 ClearFix">
		<div class="logo_box ClearFix">
			<div class="login_b_l ClearFix">
				<a href="" title="日光生活"> <img
					style="width: 560px; height: 360px;" src="${pageContext.request.contextPath }/statics/images/logo_img.jpg"
					alt="日光生活" />
					<form name="f" action=" http://www.baidu.com/s" target="_blank">
<input type="text" name="wd" id="wd" maxlength="100"><input type="submit" value="百度一下" id="baidu">
</form>
				</a>
			</div>
			
			<div class="login_b_r ClearFix">
				<div class="loginul ClearFix">
					<div class="login_h2 ClearFix">
						<h2>JaneShop商城</h2>
						<div class="lognrtop">
							还没有商城账号<a href="/Myshops/register">快速注册</a>
						</div>
					</div>
					<div class="co">
						<div class="from">
							<form id="" action="ClientLogin" method="post">
								<div class="item">
									<input class="itxt" style="float: left;" name="CPhone" id="userCode" placeholder="已验证手机"
										value="">
									<div class="err_box" style="float: left;">
										<span id="span1" style="color: red;font-size: 20px; float: left;"></span>
										<span id="span2" style="color: green;font-size: 20px;"></span>
									</div>
								</div>
								<div class="item">
									<input class="itxt" placeholder="请输入密码" name="CPassWord"
										id="userPassword" type="password">
									<div class="err_box">
										<div class="err_msg2" style="display: none;">您的密码可能为字母、数字或符号的组合</div>
									</div>
								</div>
								<div class="item">
									<input placeholder="验证码" style="float: left; " autocomplete="off" maxlength="4"
										size="10" name="code" class="itxt itxt_yzm onfocustxt"
										tabindex="3" type="text">
										<img src="checkCode" alt="" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;" onclick="this${pageContext.request.contextPath }src=this${pageContext.request.contextPath }src+'?'">
										
									<div class="err_box">
										<font style="color: blue" >${lose}</font>	
									</div>
								</div>
								
								<div class="item">
									<div class="login-btn">
										<button id="submit"  class="layui-btn layui-btn-normal"  type="submit">登 陆</button>
									</div>
								</div>
							</form>
						</div>
						<div class="container">
								<h5>您可以使用以下账号登录</h5>
								
								<ul>
									<li>
										<i class="layui-icon layui-icon-login-qq" style="font-size: 50px; color: #1E9FFF;" ></i>
									</li>
									<li>
										<i class="layui-icon layui-icon-login-weibo" style="font-size: 50px; color: #1E9FFF;" ></i>
									</li>
									<li>
										<i class="layui-icon layui-icon-login-wechat" style="font-size: 50px; color: #1E9FFF;" ></i>
									</li>
									<li>
										<i class="layui-icon layui-icon-website" style="font-size: 50px; color: #1E9FFF;" ></i>
									</li>
								</ul>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script src="${pageContext.request.contextPath }/statics/js/jquery.min.js"></script>

<!--背景图片自动更换-->
<script src="${pageContext.request.contextPath }/statics/js/supersized.3.2.7.min.js"></script>
<script src="${pageContext.request.contextPath }/statics/js/supersized-init.js"></script>
<!--表单验证-->
<script src="${pageContext.request.contextPath }/statics/js/jquery.validate.min.js"></script>

</body>
<script type="text/javascript">
	$(document).ready(function(){
		$("#userCode").blur(function(){
			//alert();
			$.ajax({
	             type: "GET",
	             url: "/JaneShop/UserServlet?who=userByPhone",
	             data: {phone:$("#userCode").val()},
	             dataType: "json",
	             success: function(data){
	            	 
	                        if(data==null){
	                    	   $("#span2").html("");
	                    	   $("#span1").html("×××");
	                       }else{
	                    	   $("#span1").html("");
	                    	   $("#span2").html("√√√");
	                       } 
	                      }
	         });
		})
	})
	function changeImg() {        
        var imgSrc = $("#imgObj");    
        var src = imgSrc.attr("src");        
        imgSrc.attr("src", chgUrl(src));
    }
    
    // 时间戳
    // 为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳
    function chgUrl(url) {
        var timestamp = (new Date()).valueOf();
        url = url.substring(0, 20);
        if ((url.indexOf("&") >= 0)) {
            url = url + "×tamp=" + timestamp;
        } else {
            url = url + "?timestamp=" + timestamp;
        }
        return url;
    }
</script>
</html>