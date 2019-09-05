<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>用户修改</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/statics/style.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/statics/public.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jquery-1.8.3.min.js"></script>
</head>
<body>
<!--头部-->
    <header class="publicHeader">
        <h1>修改页面</h1>
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
		<strong>你现在所在的位置是:</strong> <span><a href="/Myshops/UserQueryAll">用户管理页面 </a>>> 用户修改页面</span>
	</div>
	<div class="providerAdd">
		<form id="userForm" name="userForm" action="UserServletSave" enctype="multipart/form-data" method="post">
			<input type="hidden" name="who" value="update"/>
			<div>
				<label for="userName">员工编号：</label> <input type="text" name="uid"
					value="${user.uid }" readonly="readonly">
			</div>
			<div>
				<label for="userName">用户名：</label> <input type="text"
					value="${user.userName}" name="userName" readonly="readonly">
			</div>
			<div>
				<label for="userName">用户电话：</label> <input type="text"
					value="${user.phone }" name="phone" readonly="readonly">
			</div>
			<div>
				<label for="userName">用户姓名：</label> <input type="text"
					value="${user.name}" name="name" readonly="readonly">
			</div>
			<div>
				<label for="userName">性别：</label> <input type="text"
					value="${user.sex }" name="sex">
			</div>
			<div>
				<label for="userName">年龄：</label> <input type="text"
					value="${user.age}" name="age">
			</div>
			<div>
			  <c:if test="${user.card != '' }">
			    <label for="userName">身份证号码：</label> <input type="text"
					value="${user.card}" name="card">
			  </c:if>
			  <c:if test="${user.card eq '' }">
				<label for="userName">身份证号码：</label> <input type="text"
					value="${user.card}" name="card" readonly="readonly">
				</c:if>
			</div>
			<div>
				<label for="userName">密码：</label> <input type="password"
					value="" name="passWord">
			</div>
			
			<div>
				<label for="userName">邮箱：</label> <input type="text"
					value="${user.email }" name="email">
			</div>
			<div>
				<label for="userName">收货地址：</label><input type="text"
					name="address" id="name" value="${user.address }"> 
					<font color="red" id="namef"></font>
			</div>
			<div>
				<label for="userName">提示保持信息：</label>
				<font style="color: blue">${userAdddress}</font>
			</div>
			<div class="providerAddBtn">
				<input type="submit" onclick="return del()" name="save" id="save" value="保存" /> <a href="javascript:" onclick="self.location=document.referrer;">返回</a>
			</div>
		</form>
	</div>
</div>
</section>
</body>
<script type="text/javascript">
	/* var a=true;
	function del(){
		if(a){
			alert("修改成功！！！");
			return true;
		}
		return false;
	} */
	$(document).ready(function(){
		$("#name").blur(function(){
			if($("#name").val()==''){
				$("#namef").html("请输入地址!!!");
				a=false;
			}else{
				$("#namef").html("");
				a=true;
			}
		})
	})
</script>
</html>
