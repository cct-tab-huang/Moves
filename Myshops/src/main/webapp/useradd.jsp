<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>添加用户</title>
    <link type="text/css" rel="stylesheet" href="./statics/style.css" />
    <link type="text/css" rel="stylesheet" href="./statics/public.css" />
    <script type="text/javascript" src="./statics/js/jquery-1.7.2.min.js"></script>s
</head>
<body>
<!--头部-->
    <header class="publicHeader">
        <h1>添加页面</h1>
        <div class="publicHeaderR">
            <p><span>下午好！</span><span style="color: #fff21b">${mag }</span> , 欢迎你！</p>
            <a href="/JaneShop/CommodityServlet?who=exit">退出</a>
        </div>
    </header>

 <!--主体内容-->
 <section class="publicMian ">
     <div class="left">
         <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
         <nav>
             <ul class="list">
            <li ><a href="/Myshops/UserQueryAll">用户管理</a></li>
              <li ><a href="/Myshops/shopsQueryAll">商品管理</a></li>
              <li ><a href="/Myshops/ClientQueryAll">客户管理</a></li>
              <li ><a href="/Myshops/TypeQueryAll">分类管理</a></li>
              <li ><a href="/Myshops/brandQueryAll">品牌管理</a></li>
             </ul>
         </nav>
     </div>
     
<div class="right">
	<div class="location">
		<strong>你现在所在的位置是:</strong> <span>用户管理页面 >> 用户添加页面</span>
	</div>
	<div class="providerAdd">
		<form id="userForm" name=""
			action="/Myshops/userAddFrom"
			enctype="multipart/form-data"
			method="post">
			<input type="hidden" name="who" value="insert" />
			<div>
				<input type="text" id="ph" name="userName" class="username" placeholder="用户名" autocomplete="off"/>
				<span style="color: red" id="pspan"></span><span style="color: red" id="ps1pan"></span>
			</div>
			<div>
				<input type="text" id="ph" name="phone" class="username" placeholder="请输入手机号码" autocomplete="off"/>
				<span style="color: red" id="pspan"></span><span style="color: red" id="ps1pan"></span>
			</div>
			<div>
				<input type="password" id="pw" name="passWord" class="password" placeholder="输入密码" oncontextmenu="return false" onpaste="return false" />
				<span style="color: red" id="pwspan"></span>
			</div>
			<div>
				<input type="password" id="pw1" name="confirm_password" class="confirm_password" placeholder="再次输入密码" oncontextmenu="return false" onpaste="return false" />
				<span style="color: red" id="pw1span"></span>
			</div>
			<div>
			   <span><h1>${userAdddress }</h1></span>
			</div>
			<div class="providerAddBtn">
                 <input type="submit"  name="save" id="save" value="保存" />
                  <a href="javascript:" onclick="self.location=document.referrer;">返回</a>
             </div>
		</form>
	</div>
</div>
</section>
</body>
<script type="text/javascript">
var b=false;
var c=false;
var d=false;

function del(){
	if(b&&c&&d){
		return true;
	}
	return false;
}

		
		$("#pw").blur(function(){
			if($("#pw").val().length<3||$("#pw").val().length>9){
				$("#pwspan").html("请输入3-9位的密码！");
			}else{
				c=true;
				$("#pwspan").html("");
			}
		})
		
		$("#pw1").blur(function(){
			var pwd = $("#pw").val();
		    var pwd1 = $("#pw1").val();

		    if(pwd == pwd1){
		    	d=true;
		    	$("#pw1span").html(""); 
		    }
			else {
		        $("#pw1span").html("两次密码不相同");  
		     }
		})
		
		$("#ph").blur(function(){
			//alert();
			$.ajax({
	             type: "GET",
	             url: "/JaneShop/UserServlet?who=userByPhone",
	             data: {phone:$("#ph").val()},
	             dataType: "json",
	             success: function(data){
	            	 
	                        if(data==null){
	                        	$("#ps1pan").html("");
	                        	var phoneReg = /(^1[3|4|5|7|8]\d{9}$)|(^09\d{8}$)/;
	                			//电话
	                			var phone = $.trim($('#ph').val());
	                			if (!phoneReg.test(phone)) {
	                				//alert('请输入有效的手机号码！');
	                				$("#pspan").html("请输入有效的手机号码！");
	                				//return false;
	                			}else{
	                				b=true;
	                				$("#pspan").html("");
	                			}
	                       }else{
	                    	   $("#pspan").html("");
	                    	   $("#ps1pan").html("该手机也被注册！");
	                       } 
	                      }
	         });
		})
	</script>
</html>
