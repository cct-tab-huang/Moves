<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>商品查看</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/statics/style.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/statics/public.css" />
</head>
<body>
<!--头部-->
    <header class="publicHeader">
        <h1>单行查看</h1>
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
            <strong>你现在所在的位置是:</strong>
            <span><a href="/Myshops/shopsQueryAll" >商品管理页面 </a>>>> 商品信息查看页面</span>
        </div>
        <div class="providerView">
            <p><strong>品牌编号：</strong><span>${brand.bid}</span></p>
            <p><strong>品牌：</strong><span>${brand.brandName}</span></p>
            <p><strong>类型：</strong><span>${brand.type.typeName }</span></p>
            
            
			<div class="providerAddBtn">
            	<a href="javascript:" onclick="self.location=document.referrer;">返回</a>
            </div>
        </div>
    </div>
</section>
