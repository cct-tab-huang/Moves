<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8">
    <title>添加商品</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/statics/style.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/statics/public.css" />

</head>
<body>
<!--头部-->
    <header class="publicHeader">
        <h1>添加商品</h1>
        <div class="publicHeaderR">
            <p><span>下午好！</span><span style="color: #fff21b">${user.userName}</span> , 欢迎你！</p>
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
		<strong>你现在所在的位置是:</strong> <span><a href="/Myshops/TypeQueryAll">类型管理页面 </a>>>> 类型添加页面</span>
	</div>
	<div class="providerAdd">
		<form id="userForm" name="userForm"
			action="/Myshops/typeAdd"
			enctype="multipart/form-data" method="post">
			<input type="hidden" name="who" value="cominsert" />
			<div>
				类型：<input type="text" name="TypeName" placeholder="请输入添加的类型">
			</div>
			<div class="providerAddBtn">
                 <input type="submit" onclick="return true" name="save" id="save" value="保存" />
                  <a href="javascript:" onclick="self.location=document.referrer;">返回</a>
             </div>
		</form>
	</div>
</div>
</section>
</body>
</html>
