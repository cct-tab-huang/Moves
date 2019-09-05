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
     
<div class="right" >
	<div class="location">
		<strong>你现在所在的位置是:</strong> <span>品牌管理页面</span>
	</div>
	<div class="search">
		<form action="/Myshops/quertBrandLike">
		<input type="hidden" name="who" value="mohuSelectAll" />
		<span>品牌名称：</span> <input name="BrandName" class="input-text"
				type="text"> 
				
			<input value="查 询" type="submit" id="searchbutton">
			 <a href="/Myshops/brandAdd">添加品牌</a>
		</form>
	</div>
	<!--用户-->
	<div style="overflow: scroll; width:80%; height: 600px;">
	  <table class="providerTable" cellpadding="0" cellspacing="0">
		<tr>
								<td>品牌编号</td>
								<td>品牌名称</td>
								<td>操作</td>
							</tr>
							<c:forEach items="${blist }" var="uls">
								<tr>
									<td>${uls.bid }</td>
									<td>${uls.brandName }</td>
									<td><span><a class="viewUser"
											href="/Myshops/brandQueryOne?bid=${uls.bid }"><img
												src="${pageContext.request.contextPath }/statics/images/read.png"
												alt="查看" title="查看" /> </a> </span> <span><a class="modifyUser"
											href="/Myshops/updatebrand?bid=${uls.bid }"><img
												src="${pageContext.request.contextPath }/statics/images/xiugai.png"
												alt="修改" title="修改" /> </a> </span> <span><a class="deleteUser"
											href="/Myshops/deleteBrand?bid=${uls.bid }" onclick="return del()"><img
												src="${pageContext.request.contextPath }/statics/images/schu.png"
												alt="删除" title="删除" /> </a> </span></td>
												
								</tr>
							</c:forEach>
       </table>
	</div>
						<div class="location">
							
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