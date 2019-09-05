<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>商品管理</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/statics/style.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/statics/public.css" />
    <script type="text/javascript" src="./statics/js/jquery-1.8.0.min.js"></script>
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
             <ul class="list">
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
		<strong>你现在所在的位置是:</strong> <span>商品管理页面</span>
	</div>
	<div class="search">
		<form action="/Myshops/commdityShopLike">
		<input type="hidden" name="who" value="mohuSelectAll" />
		<span>商品名称：</span> <input name="SName" class="input-text"
				type="text"> 
				品牌：<select name="brandid" id="shopBrandName" onchange="brandChange(${bls.bid })">
				     <option value="0">--请选择品牌--</option>
                     <c:forEach items="${blist }" var="bls">
                        <option value="${bls.bid }">${bls.brandName }</option>
                     </c:forEach>				
				</select>
				类型：<select name="typeName" id="shopTypeName">
						<option value="">--请选择商品类型--</option>
					</select>
			<input value="查 询" type="submit" id="searchbutton">
		
			 <a href="commodityadd">添加商品</a>
		</form>
	</div>
	<!--用户-->
	<table class="providerTable" cellpadding="0" cellspacing="0">
		<tr>
						<td>商品编号</td>
						<td>品牌</td>
						<td>男女装其他类型</td>
						<td>图片</td>
						<td>商品名称</td>
						<td>商品剩余数量</td>
						<td>操作人</td>
						<td>单价</td>
						<td>操作</td>
					</tr>
					<c:forEach items="${slist}" var="ls">
						<tr>
							<td>${ls.sid}</td>
							<td>${ls.brand.brandName}</td>
							<td>${ls.brand.type.typeName}</td>
							<td><img src="./statics/imagevs/${ls.simg}" style="width: 50px; height: 50px"/></td>
							<td>${ls.SName }</td>
							<td>${ls.SSum}</td>
							<td>${ls.user.name}</td>
							<td>${ls.SMoney }</td>
							

					<td><span><a class="viewUser"
									href="/Myshops/CommoditySelById?sid=${ls.sid }"><img
										src="./statics/images/read.png" alt="查看" title="查看" /> </a> </span> <span><a
									class="modifyUser"
									href="/Myshops/CommodityUpdById?sid=${ls.sid }"><img
										src="./statics/images/xiugai.png" alt="修改" title="修改" /> </a> </span> <span><a
									class="deleteUser" href="/Myshops/CommodityDelById?sid=${ls.sid }"
									onclick="return del()"><img src="./statics/images/schu.png"
										alt="删除" title="删除" /> </a> </span></td>
						</tr>
					</c:forEach>

				</table>
				<div class="location">
				<div style="margin-left: 42%;">

					<c:if test="${abc==1}">
						<h1>
							第<font id="qqw">${page.pageNum }</font><a onclick="return a()"
								href="/Myshops/shopsQueryAll?&page=${page.prePage }">页|上一页</a> <a
								onclick="return b()"
								href="/Myshops/shopsQueryAll?&page=${page.nextPage}">下一页</a>|共<font
								id="wwq">${page.pages }</font>页
						</h1>
					</c:if>
	             </div>
	        </div>
			</div>


			
		
    </section>
</body>
<script type="text/javascript">

function  brandChange(id){
	
	var shopBrandNameid=$("#shopBrandName").val();
	
	//异步提交根据id查询数据
	$.ajax({
		url:"/Myshops/shopBandid",
		type:"get",
		dataType:"json",
		data:{
		    "shopBrandNameid":shopBrandNameid
		},
	success:function(data){
		$("#shopTypeName").empty();
		console.log(data);
		for (var i = 0; i < data.length; i++) {
			$("#shopTypeName").append("<option value='"+data[i].type.typeName+"'>"+data[i].type.typeName+"</option>");
			
		}
		 
	}
	});
}

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