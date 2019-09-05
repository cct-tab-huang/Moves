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
    <script type="text/javascript" src="./statics/js/jquery-1.8.0.min.js"></script>
    <script	src="./statics/ueditor/ueditor.config.js"></script>
	
	<script src="./statics/ueditor/ueditor.all.js"></script>
	
	<script	src="./statics/ueditor/lang/zh-cn/zh-cn.js"></script>
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
		<strong>你现在所在的位置是:</strong> <span><a href="/Myshops/shopsQueryAll">商品管理页面 </a>>>> 商品添加页面</span>
	</div>
	<div class="providerAdd" style="text-align: center;">
		<form id="userForm" name="userForm"
			action="/Myshops/addShopAction"
			enctype="multipart/form-data" method="post">
			<input type="hidden" name="who" value="cominsert" />
			<div>
				品&nbsp; &nbsp;牌：<select name="brandid" id="shopBrandName" onchange="brandChange(${bls.bid })">
				     <option value="0">---------------请选择品牌-----------------------</option>
                     <c:forEach items="${blist }" var="bls">
                        <option value="${bls.bid }">${bls.brandName }</option>
                     </c:forEach>				
				</select>
			</div>
			<div >
				类&nbsp; &nbsp;型：<select name="type" id="shopTypeName">
						<option value="">---------------请选择商品类型------------------------</option>
					</select>
			</div>
			<div>
				图&nbsp; &nbsp;片:<input type="file" name="imge" multiple="multiple" />
				<span style="color: red" id="pspan"></span><span style="color: red" id="ps1pan"></span>
			</div>
			<div>
				商品名称:<input type="text" id="qqw" name="SName" class="username" placeholder="请输入标题" autocomplete="off"/>
				<span style="color: red" id="pspan"></span><span style="color: red" id="ps1pan"></span>
			</div>
			<div>
				剩余数量：<input type="text" id="ph" name="SSum" class="username" placeholder="请输入商品剩余数量" autocomplete="off"/>
				<span style="color: red" id="pspan"></span><span style="color: red" id="ps1pan"></span>
			</div>
			<div>
				单&nbsp; &nbsp;价：<input type="text" id="ph" name="SMoney" class="username" placeholder="单价" autocomplete="off"/>
				<span style="color: red" id="pspan"></span><span style="color: red" id="ps1pan"></span>
			</div>
			<div >
				销售量：<input type="text" id="ph" name="salSum" class="username" placeholder="单价" autocomplete="off"/>
				<span style="color: red" id="pspan"></span><span style="color: red" id="ps1pan"></span>
			</div>
			<div  >
				是否推荐商品：
				 <select  name="recommend">
					 <option value="0">----是否推荐-----</option>
					 <option value="0">不推荐</option>
					 <option value="1">推荐</option>  
				</select>
			</div>
		   <div>
				商品简介：<script id="editor" type="text/plain" name="SIntro" style="width: 80%;height: 80px;"></script>
			</div> 
			
			<div class="providerAddBtn"  >
                 <input type="submit" onclick="return true" name="save" id="save" value="保存" />
                  <a href="javascript:" onclick="self.location=document.referrer;">返回</a>
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
	

var imgurl = "";
function getPhoto(node) {
    var imgURL = "";
    try{
        var file = null;
        if(node.files && node.files[0] ){
            file = node.files[0];
        }else if(node.files && node.files.item(0)) {
            file = node.files.item(0);
        }
        //Firefox 因安全性问题已无法直接通过input[file].value 获取完整的文件路径
        try{
            imgURL =  file.getAsDataURL();
        }catch(e){
            imgRUL = window.URL.createObjectURL(file);
        }
    }catch(e){
        if (node.files && node.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                imgURL = e.target.result;
            };
            reader.readAsDataURL(node.files[0]);
        }
    }
    creatImg(imgRUL);
   // alert(imgURL);
    return imgURL;
}

function creatImg(imgRUL){
    var textHtml = "<img src='"+imgRUL+"'width='414px' height='600px'/>";
    $(".ge_pic_icon_Infor").html(textHtml);
    alert(imgRUL);
}

	</script>
</html>
