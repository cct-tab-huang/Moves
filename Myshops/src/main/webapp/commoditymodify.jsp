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
    <script	src="./statics/ueditor/ueditor.config.js"></script>
	
	<script src="./statics/ueditor/ueditor.all.js"></script>
	
	<script	src="./statics/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<body>
<!--头部-->
    <header class="publicHeader">
        <h1>修改页面</h1>
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
		<strong>你现在所在的位置是:</strong> <span>用户管理页面 >> 用户修改页面</span>
	</div>
	<div class="providerAdd" >
		<form id="userForm" name="userForm" action="/Myshops/CommodityModel" method="post"  content="multipart/form-data"  enctype="multipart/form-data">
			<input type="hidden" name="who" value="comupdate"/>
			<div>
				<label for="userName">商品编号：</label> <input type="text" name="sid"
					value="${commodity.sid }" readonly="readonly">
			</div>
			<div>
				<label for="userName">品牌：</label> <input type="text"
					value="${commodity.brand.brandName}" name="" >
					<input type="hidden" value="${commodity.brand.bid}" name="BrandId">
			</div>
			<div>
				<label for="userName">类型：</label> <input type="text"
					value="${commodity.brand.type.typeName}" name="">
			</div>
			
			<div>
				<label for="userName">图&nbsp; &nbsp;片:</label><input type="file" name="imge" value="${commodity.simg }" multiple="multiple" />
				
			</div>
			<div>
				<label for="userName">商品名称：</label> <input type="text"
					name="SName" id="name" value="${commodity.SName }"> 
					<font color="red" id="namef"></font>
			</div>
			<div>
				<label for="userName">商品剩余数量：</label> <input type="text"
					name="SSum" id="name" value="${commodity.SSum }"> 
					<font color="red" id="namef"></font>
			</div>
			<div>
				<label for="userName">单价：</label> <input type="text"
					name="SMoney" id="name" value="${commodity.SMoney }"> 
					<font color="red" id="namef"></font>
			</div>
			<div>
				<label for="userName">销售量：</label> <input type="text"
					name="salSum" id="name" value="${commodity.salSum}"> 
					<font color="red" id="namef"></font>
			</div>
			<div  >
				<label for="userName">是否推荐商品：</label> 
				 <select  name="recommend">
					 <option value="0">----是否推荐-----</option>
					 <option value="0">不推荐</option>
					 <option value="1">推荐</option>  
				</select>
			</div>
			<div>
				<label for="userName">商品简介：</label><script id="editor" type="text/plain" name="SIntro" style="width: 80%;height: 80px; text-align: center;">${commodity.SIntro }</script>
					<font color="red" id="namef"></font>
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
var ue = UE.getEditor('editor',{   

	   enterTag : 'br'

	});
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
