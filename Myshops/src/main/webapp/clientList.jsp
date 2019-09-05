<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>用户管理</title>
    <link type="text/css" rel="stylesheet" href="./statics/style.css" />
    <link type="text/css" rel="stylesheet" href="./statics/public.css" />
</head>
<body>
<!--头部-->
    <header class="publicHeader">
        <h1>JaneShop网上商城</h1>
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
             <ul class="list fa-address-book-o">
               
              <li ><a href="/Myshops/UserQueryAll">用户管理</a></li>
              <li ><a href="/Myshops/shopsQueryAll">商品管理</a></li>
              <li ><a href="/Myshops/ClientQueryAll">客户管理</a></li>
              <li ><a href="/Myshops/TypeQueryAll">分类管理</a></li>
              <li ><a href="/Myshops/brandQueryAll">品牌管理</a></li>
              <li ><a href="/Myshops/orderQueryAll">订单管理</a></li>
             </ul>
         </nav>
     </div>
     
<div class="right">
	<div class="location">
		<strong>你现在所在的位置是:</strong> <span>用户管理页面</span>
	</div>
	
	<!--用户-->
	<table class="providerTable" cellpadding="0" cellspacing="0">
		<tr>
								<td>客户编号</td>
								<td>客户姓名</td>
								<td>客户电话</td>
								<td>客户性别</td>
								<td>客户联系地址</td>
								<td>客户邮箱</td>
							</tr>
							<c:forEach items="${lists }" var="uls">

								<tr>
									<td>${uls.cid }</td>
									<td>${uls.CName }</td>
									<td>${uls.CPhone }</td>
									<td>${uls.CSex }</td>
									<td>${uls.CAddress }</td>
									<td>${uls.CEmail }</td>
									
												
								</tr>
							</c:forEach>

						</table>
						<div class="location">
							<div style="margin-left: 42%;">
								<c:if test="${abc==2 }">
									<h1>
										第<font id="qqw">${page.pageNum }</font><a onclick="return a()"
											href="/Myshops/ClientQueryAll?&page=${page.prePage}">页|上一页 </a>
										<a onclick="return b()"
											href="/Myshops/ClientQueryAll?&page=${page.nextPage }">下一页</a>|共<font
											id="wwq">${page.pages}</font>页
									</h1>
								</c:if>
	</div>
	<font style="color: blue" >${userAdddress }</font>
	</div>
	
		</div>
    </section>
</body>
<script type="text/javascript">
function a(){
	//alert();
	if(document.getElementById("qqw").innerHTML==1){
		return false;
	}
}
function b(){
	//alert();
	if(document.getElementById("qqw").innerHTML==document.getElementById("wwq").innerHTML){
		return false;
	}
}

function del(){   
    if(confirm('确认要删除？'))   
      {   
    	//alert("删除成功！！！");
        return true;   
      }   
        return false;   
       }  
</script>
</html>