<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>用户查看</title>
    <link type="text/css" rel="stylesheet" href="./statics/style.css" />
    <link type="text/css" rel="stylesheet" href="./statics/public.css" />
</head>
<body>
<!--头部-->
    <header class="publicHeader">
        <h1>单行查看</h1>
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
	                <li id="lastjiang"><a href="UserServletAll">用户管理</a></li>
					<li id="jasthuang"><a href="commoditySelAll" >商品管理</a></li>
					<li ><a href="/Myshops/ClientQueryAll">客户管理</a></li>
		            <li ><a href="/Myshops/TypeQueryAll">分类管理</a></li>
		            <li ><a href="/Myshops/brandQueryAll">品牌管理</a></li>
             </ul>
         </nav>
     </div>
     
 <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户管理页面 >> 用户信息查看页面</span>
        </div>
        <div class="providerView">
            <p><strong>员工编号：</strong><span>${users.uid}</span></p>
            <p><strong>员工姓名：</strong><span>${users.userName}</span></p>
            <p><strong>员工电话：</strong><span>${users.phone}</span></p>
            <p><strong>员工地址：</strong><span>${users.address }</span></p>
            <p><strong>所属类别：</strong>
            	<c:if test="${users.status==0 }">
            		<span>超级管理员</span>
            	</c:if>
            	<c:if test="${users.status==1 }">
            		<span>普通用户</span>
            	</c:if>
            
            </p>   
			<div class="providerAddBtn">
            	<a href="javascript:" onclick="self.location=document.referrer;">返回</a>
            </div>
        </div>
    </div>
</section>
