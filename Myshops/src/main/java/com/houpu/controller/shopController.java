package com.houpu.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.jws.WebParam.Mode;
import javax.lang.model.util.Elements;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.jdbc.Null;
import org.apache.xmlbeans.impl.inst2xsd.util.Element;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.houpu.model.Brand;
import com.houpu.model.Client;
import com.houpu.model.Shop;
import com.houpu.model.Type;
import com.houpu.model.User;
import com.houpu.model.orderShop;
import com.houpu.service.cliService;
import com.houpu.service.orderService;
import com.houpu.service.shopService;
import com.houpu.service.typeServicer;
import com.houpu.utils.ImagePath;


@Controller
@RequestMapping()
public class shopController {

	//注入service
	@Resource
	private shopService ss;
	@Resource
	private orderService os;
	@Resource
	private cliService cs;
	@Resource
	private typeServicer ts;
	
	/**
	 * * 订单模糊查询
	 * 
	 * 
	 */
	 @RequestMapping(value = "/orderNumLike")
	public 	String orderNumLike(
			@RequestParam("orderNum") String orderNum,
			Model model,@RequestParam(defaultValue = "1",required = true) Integer page){
		    PageHelper.startPage(page, 20);
		    //调用模糊查询
		   List<orderShop> orderList=os.orderNumLike(orderNum);
		   PageInfo<orderShop> pageInfo=new PageInfo<orderShop>(orderList);
			model.addAttribute("orderList", orderList);
			model.addAttribute("page", pageInfo);
			model.addAttribute("abc", 2);
		return "orderList";
		 
	 }
	/**
	 ** 订单发货
	 */
	@RequestMapping(value = "/orderTracking")
	public String orderTracking(
			HttpSession session,
			Model model,
			orderShop orderShop,
			@RequestParam("oid") long oid,
			@RequestParam(defaultValue = "1",required = true) Integer page
			) {
		PageHelper.startPage(page, 20);
		Date date=new Date();//获取当前时间
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd/HH:mm:ss");//格式化时间
		//获取当前登录的用户
		String userNames=(String) session.getAttribute("names");
		SimpleDateFormat sdfs=new SimpleDateFormat("yyyyMMddHHmmss");//格式化时间
		Random random=new Random();//产生随机数
		int i=random.nextInt(1000000000);
		String newNames=sdfs.format(date)+i;//用字符串拼接
		orderShop.setOid(oid);
		orderShop.setTrackingUser(userNames);
		orderShop.setTrackingTime(sdf.format(date));
		orderShop.setTrackingNumber(newNames);
		//调用更新语句
		Integer t=os.orderTracking(orderShop);
		if (t>0) {
			//调用查询数据库信息
			List<orderShop> orderList=os.orderQueryAll();
			PageInfo<orderShop> pageInfo=new PageInfo<orderShop>(orderList);
			model.addAttribute("orderList", orderList);
			model.addAttribute("page", pageInfo);
			model.addAttribute("abc", 2);
		}
		return "orderList";
	}
	
	/**
	 * 管理员进行订单查询管理
	 */
	@RequestMapping(value = "/orderQueryAll")
	public String orderQueryAll(Model model,@RequestParam(defaultValue = "1",required = true) Integer page){
		PageHelper.startPage(page, 20);
		//调用查询数据库信息
		List<orderShop> orderList=os.orderQueryAll();
		PageInfo<orderShop> pageInfo=new PageInfo<orderShop>(orderList);
		model.addAttribute("orderList", orderList);
		model.addAttribute("page", pageInfo);
		model.addAttribute("abc", 2);
		return "orderList";
	}
	/**
	 * 修改商品更新商品数据
	 */
	@RequestMapping(value="/CommodityModel",headers = "content-type=multipart/*", method = RequestMethod.POST)
	public String CommodityModel(Shop shops,
			@RequestParam("sid") long sid,
			@RequestParam("imge") MultipartFile file,
			@RequestParam("SName") String SName,
			@RequestParam("SSum")  int SSum,
			@RequestParam("recommend")  int recommend,
			@RequestParam("SMoney") String SMoney,
			@RequestParam("salSum") int salSum,
			@RequestParam("SIntro") String SIntro,
			HttpSession session,Model model,
			@RequestParam(defaultValue = "1",required = true) Integer page
			){
		
		String newNames=null;
		Date date=new Date();//获取当前时间
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd/HH:mm:ss");//格式化时间
		//获取当前登录的用户
		String userNames=(String) session.getAttribute("userNames");
		long userId=(long) session.getAttribute("userId");
		//根据phone查询用户id
	    if(!file.isEmpty()) {
			String fileNeme=file.getOriginalFilename();//拿到页面传过来的图片名称
			String hz=fileNeme.substring(fileNeme.lastIndexOf("."));//截取点后面的字段
			SimpleDateFormat sdfs=new SimpleDateFormat("yyyyMMddHHmmss");//格式化时间
			Random random=new Random();//产生随机数
			int i=random.nextInt(1000000000);
			newNames=sdfs.format(date)+i+hz;//用字符串拼接
			String updateTime=sdf.format(date);
			//存入数据
			shops.setSimg(newNames);
			shops.setUId(userId);
			shops.setUpdateTime(updateTime);
			shops.setUpdateUser(userNames);
			shops.setSalSum(salSum);
			shops.setSid(sid);
			shops.setSIntro(SIntro);
			shops.setSName(SName);
			shops.setSSum(SSum);
			shops.setRecommend(recommend);
			//调用更新语句
			System.err.println(shops);
			Integer q=ss.commodityModel(shops);
			
			if(q>0) {
				PageHelper.startPage(page, 10);
				//FileUtils.copyInputStreamToFile(file.getInputStream(), new File("C:\\Users\\26540\\eclipse-workspace\\Myshops\\src\\main\\webapp\\statics\\imagevs\\"+newNames));
				try {
					FileUtils.copyInputStreamToFile(file.getInputStream(),new File("F:\\shopx\\Myshops\\src\\main\\webapp\\statics\\imagevs\\"+newNames));
					List<Shop> list=ss.showQueryAll();
					//调用查询的方法
					PageInfo<Shop> pageInfo=new PageInfo<Shop>(list);
					model.addAttribute("slist", list);
					model.addAttribute("page", pageInfo);
					model.addAttribute("abc", 1);
					return "commodityList";
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return "commoditymodify";
				}
				
				
			}
			return "commoditymodify";
	    }
	    return "commoditymodify";
		
	}
	/**
	 * 推荐更多商品
	 */
	@RequestMapping(value="/tuijianShop")
	public String tuijianShop(Model model){
		List<Shop> tList=ss.queryRecommend();
		model.addAttribute("tList", tList);
		model.addAttribute("abc",2);
		return "liebiao";
	}
	/**
	 * 更多热销商品
	 */
	@RequestMapping(value="/rexiaoShop")
	public String rexiaoShop(Model model){
		
		List<Shop> tList=ss.queryBySSum();
		model.addAttribute("tList", tList);
		model.addAttribute("abc",2);
		return "liebiao";
	}
	
	/**
	 * 更多新的商品
	 */
	@RequestMapping(value="/newMore")
	public String newMore(Model model){
		List<Shop> tList=ss.queryByCreateTime();
		model.addAttribute("tList", tList);
		model.addAttribute("abc", 1);
		return "liebiao";
		
	}
	
	
	/**
	 * 跳转添加类型的页面
	 */
	@RequestMapping(value = "/typeAdds")
	public String typeAdds()
	{
		return "typeAdd";
		
	}
	
	/**
	 * 添加商品类型
	 */
	@RequestMapping(value = "/typeAdd")
	public String typeAdd(Type type,HttpSession session,Model model,
			@RequestParam(defaultValue = "1",required = true) Integer page){
		PageHelper.startPage(page, 5);
		Date date=new Date();//获取当前时间
		//创建时间
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd/ HH:mm:ss");//格式化时间
		
		//获取当前登录的用户
		String createUser=(String) session.getAttribute("userNames");
		type.setCreateTime(sdf.format(date));
		type.setCreateUser(createUser);
		Integer i=ts.typeAdd(type);
		if (i>0) {
			List<Type> list=ts.TypeQueryAll();
			//System.out.println(list);
			PageInfo<Type> pageInfo=new PageInfo<Type>(list);
			model.addAttribute("lists", list);
			model.addAttribute("page", pageInfo);
			model.addAttribute("abc", 2);
			return "typeList";
		}else {
			return "typeAdd";
		}
		
		
	}
	
	/**
	 * 查询单行商品的数据,并且跳转修改页面
	 */
	@RequestMapping(value ="/CommodityUpdById")
	public String CommodityUpdById(@RequestParam("sid") long sid,Model model) {
		//调用service层的查询单行数据的方法
		Shop commodity=ss.CommoditySelById(sid);
		model.addAttribute("commodity", commodity);
		return "commoditymodify";
	}
	
	/**
	 * 查询所有商品类型
	 */
	@RequestMapping(value ="/TypeQueryAll")
	public String TypeQueryAll(
			Model model,
			@RequestParam(defaultValue = "1",required = true) Integer page){
		PageHelper.startPage(page, 5);
		//调用查询的方法
		List<Type> list=ts.TypeQueryAll();
		System.out.println(list);
		PageInfo<Type> pageInfo=new PageInfo<Type>(list);
		model.addAttribute("lists", list);
		model.addAttribute("page", pageInfo);
		model.addAttribute("abc", 2);
		return "typeList";
		
	}
	/**
	 * 根据商品id取消商品
	 */
	@RequestMapping(value = "/deleteById")
	public  String deleteById(@RequestParam("oid") long oid,Model model,HttpSession session) {
		Integer i=os.deleteById(oid);
		if(i>0) {
			long uid=(long) session.getAttribute("userId");
			//查询购物车
			List<orderShop> orderList=os.queryOrderCard(uid);
			//根据商品id查询商品
			Shop shops=ss.queryBySid(orderList.get(0).getCid());
			
			model.addAttribute("shops", shops);
			session.setAttribute("orderList", orderList);
			return "shopCard";
		}else {
			model.addAttribute("deleteShopCar", "删除失败。。。");
			return "shopCard";
		}
		
	}
	/**
	 * 订单状态查询
	 */
	@RequestMapping(value ="/logoshopstatus")
	public String logoshopstatus(@RequestParam("status") int status,Model model,HttpSession session) {
		long uid=(long) session.getAttribute("userId");
		//查询购物车
		List<orderShop> orderList=os.logoshopstatus(uid, status);
		Shop shops=ss.queryBySid(orderList.get(0).getCid());
		
		model.addAttribute("shops", shops);
		session.setAttribute("orderList", orderList);
		return "dingdanxinxi";
		
	}
	/**
	 * 订单详情
	 */
	@RequestMapping(value ="/logoshopkehu")
	public String logoshopkehu(Model model,HttpSession session){
		long uid=(long) session.getAttribute("userId");
		//查询购物车
		List<orderShop> orderList=os.queryOrderCards(uid);
		
		//根据商品id查询商品
		Shop shops=ss.queryBySid(orderList.get(0).getCid());
		model.addAttribute("shops", shops);
		session.setAttribute("orderList", orderList);
		return "dingdanxinxi";
		
	}
	/**
	 * 进入购物车
	 */
	@RequestMapping(value="/logoshopcar")
	public String logoshopcar(Model model,HttpSession session){
		long uid=(long) session.getAttribute("userId");
		//查询购物车
		List<orderShop> orderList=os.queryOrderCard(uid);
		//根据商品id查询商品
		Shop shops=ss.queryBySid(orderList.get(0).getCid());
		
		model.addAttribute("shops", shops);
		session.setAttribute("orderList", orderList);
		return "shopCard";
		
	}
	/**
	 * 加入购物车不购买
	 */
	@RequestMapping(value ="/addOrderCar")
	@ResponseBody
	public Integer addOrderCar(
			@RequestParam("cid") long cid,
			@RequestParam("zMoney") double zMoney,
			@RequestParam("number") Integer number,
			orderShop orderShop,
			HttpSession session,
			Model model){
		//获取当前时间
		//创建随机数
		Date date=new Date();//获取当前时间
		SimpleDateFormat sdfs=new SimpleDateFormat("yyyyMMddHHmmss");//格式化时间
		Random random=new Random();//产生随机数
		int i=random.nextInt(1000000000);
		String orderNum=i+sdfs.format(date);
		//创建时间
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd/ HH:mm:ss");//格式化时间
		//获取当前登录的人
		Client client=(Client) session.getAttribute("clients");
		String createUser=client.getCName();
		long uid=client.getCid();
		orderShop.setCid(cid);
		orderShop.setzMoney(zMoney);
		orderShop.setNumber(number);
		orderShop.setCreateUser(createUser);
		orderShop.setUid(uid);
		orderShop.setCreateTime(sdf.format(date));
		orderShop.setOrderNum(sdfs.format(date));
		//调用加入购物车
		Integer s=os.editAddcart(orderShop);
		if (s>0) {
			return s;
		}
		return null;
		
	}
	/**
	 * 
	 1. 异步提交查询主页数据
	 * 
	 */
	@RequestMapping(value = "/queryAjaxSname")
	@ResponseBody
	public List<Shop> queryAjaxSname(@RequestParam("sName") String sName,@RequestParam("bid") String bid,HttpSession session) {
		//调用查询的方法
		List<Shop> queryListSname=ss.queryAjaxSname(bid);
		System.err.println(queryListSname);
		session.setAttribute("queryListSname", queryListSname);
		return queryListSname;
		
	}
	/**
	 * 立即购买并且跳转购物车
	 */
	
	@RequestMapping(value = "/editAddcart")
	public String editAddcart(
			orderShop orderShop,
			HttpSession session,
			Model model) {
		Client client=(Client) session.getAttribute("clients");
		Client clients =cs.selectbyphone(client.getCPhone());
		if(clients!=null) {
			
			if(clients.getCName()!=null&&clients.getCAddress()!=null&&!clients.getCName().equals("")&&!clients.getCAddress().equals("")) {
				//获取用户id
				long uid=(long) session.getAttribute("userId");
				//创建随机数
				Date date=new Date();//获取当前时间
				SimpleDateFormat sdfs=new SimpleDateFormat("yyyyMMddHHmmss");//格式化时间
				Random random=new Random();//产生随机数
				int i=random.nextInt(1000000000);
				String orderNum=i+sdfs.format(date);
				//创建时间
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd/ HH:mm:ss");//格式化时间
				//获取创建人
				String userNames=(String) session.getAttribute("userName");
				//存入数据
				orderShop.setUid(uid);
				orderShop.setCreateUser(userNames);
				orderShop.setOrderNum(orderNum);
				orderShop.setCreateTime(sdf.format(date));
				//调用注册
				System.out.println(orderShop);
				Integer s=os.editAddcart(orderShop);
				if(s>0) {
					//查询购物车
					List<orderShop> orderList=os.queryOrderCard(uid);
					//根据商品id查询商品
					Shop shops=ss.queryBySid(orderList.get(0).getCid());
					
					model.addAttribute("shops", shops);
					session.setAttribute("orderList", orderList);
					return "shopCard";
				}else {
					return "edit";
				}
			}else {
				model.addAttribute("cids", clients.getCid());
				return "selfinfo";
			}
		}else {
			return "clilogin";
		}
		
	}
	/**
	 * 查询商品详情
	 */
	@RequestMapping(value = "/details")
	public String details(@RequestParam("sid") long sid,Model model) {
		//调用查询的方法
		Shop detailsShop=ss.details(sid);
		//保存数据
		String s=detailsShop.getSIntro();
		
		model.addAttribute("detailsShop", detailsShop);
		return "edit";
		
	}
	/**
	 * 根据商品编号查看商品详细信息
	 */
	
	@RequestMapping(value = "/CommoditySelById")
	public String CommoditySelById(@RequestParam("sid") long sid,Model model) {
		//调用service层的查询单行数据的方法
		Shop commodity=ss.CommoditySelById(sid);
		model.addAttribute("commodity", commodity);
		return "commodityview";
		
	}
	/**
	 * 根据id删除商品
	 */
	@RequestMapping(value = "/CommodityDelById")
	public String CommodityDelById(@RequestParam("sid") long sid,Model model,
			@RequestParam(defaultValue = "1",required = true) Integer page) {
		//调用shop 中service中的删除方法
		Integer i=ss.CommodityDelById(sid);
		if (i>0) {
			PageHelper.startPage(page, 10);
			List<Shop> list=ss.showQueryAll();
			PageInfo<Shop> pageInfo=new PageInfo<Shop>(list);
			model.addAttribute("slist", list);
			model.addAttribute("page", pageInfo);
			model.addAttribute("abc", 1);
			return "commodityList";	
		}
		
		return "commodityList";	
		
	}
	/**
	 * 添加商品
	 */
	@RequestMapping(value = "/addShopAction")
	public String addShopAction(
            @RequestParam("brandid") String brandId,
			@RequestParam("imge") MultipartFile file,
			Shop shops,
			HttpServletRequest request,
			HttpSession session,
			@RequestParam(defaultValue = "1",required = true) Integer page,
			Model model){
		String newNames=null;
		Date date=new Date();//获取当前时间
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd/HH:mm:ss");//格式化时间
		//获取当前登录的用户
		String userNames=(String) session.getAttribute("userNames");
		long userId=(long) session.getAttribute("userId");
		//根据phone查询用户id
	   
	    if(!file.isEmpty()) {
			String fileNeme=file.getOriginalFilename();//拿到页面传过来的图片名称
			String hz=fileNeme.substring(fileNeme.lastIndexOf("."));//截取点后面的字段
			SimpleDateFormat sdfs=new SimpleDateFormat("yyyyMMddHHmmss");//格式化时间
			Random random=new Random();//产生随机数
			int i=random.nextInt(1000000000);
			newNames=sdfs.format(date)+i+hz;//用字符串拼接
			shops.setBrandId(Long.valueOf(brandId));
			shops.setSimg(newNames);
			shops.setUId(userId);
			shops.setCreateTime(sdf.format(date));
			shops.setCreateUser(userNames);
			System.err.println(shops);
			Integer s=ss.addShopOne(shops);//调用添加数据导数据库的方法
			if(s>0) {
				try {//把图片存在服务器保存的位置
					//调用查询所有商品信息并且分页
					PageHelper.startPage(page, 10);
					//FileUtils.copyInputStreamToFile(file.getInputStream(), new File("C:\\Users\\26540\\eclipse-workspace\\Myshops\\src\\main\\webapp\\statics\\imagevs\\"+newNames));
					FileUtils.copyInputStreamToFile(file.getInputStream(), 
							new File("E:\\shopx\\Myshops\\src\\main\\webapp\\statics\\imagevs\\"+newNames));
					
					List<Shop> list=ss.showQueryAll();
					//调用查询的方法
					PageInfo<Shop> pageInfo=new PageInfo<Shop>(list);
					model.addAttribute("slist", list);
					model.addAttribute("page", pageInfo);
					model.addAttribute("abc", 1);
					return "commodityList";
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					
				}
			}
			
		}
		return "commodityadd";
	}
	/**
	 * 根据brandId查询type数据
	 */
	@RequestMapping(value = "/shopBandid")
	@ResponseBody
	public List<Brand> shopBandid(@RequestParam("shopBrandNameid") long bid,Model model) {
		List<Brand> tlist=ss.shopBandid(bid);
		model.addAttribute("tlist", tlist);
		return tlist;
		
	}
	/**
	 * 对商品进行模糊查询
	 */
	@RequestMapping(value="/commdityShopLike")
	public String commdityShopLike(
			@RequestParam("SName") String SName,
			@RequestParam("brandid") long brandid,
			@RequestParam("typeName") String typeName,
			Model model,
			@RequestParam(defaultValue = "1",required = true) Integer page
			){
		//调用模糊查询
		PageHelper.startPage(page, 10);
		List<Shop> slist=ss.commdityShopLike(SName, brandid, typeName);
		PageInfo<Shop> pageInfo=new PageInfo<Shop>(slist);
		model.addAttribute("slist", slist);
		model.addAttribute("page", pageInfo);
		//查询所有品牌
		List<Brand> lists=ss.brandAll();
		model.addAttribute("blist", lists);
		model.addAttribute("abc", 1);
		return "commodityList";
		
	}
	/**
	 * 跳转添加商品页面
	 * @param page
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/commodityadd")
	public String commodityadd(Model model) {
		//查询所有品牌
		List<Brand> list=ss.brandAll();
		model.addAttribute("blist", list);
		return "commodityadd";
	}
	/*
	 1.查询所有商品
	 */
	@RequestMapping( value="/shopsQueryAll") 
	public String showQueryAll(
			@RequestParam(defaultValue = "1",required = true) Integer page,
			Model model
			){
		PageHelper.startPage(page, 10);
	
		List<Shop> list=ss.showQueryAll();
		//调用查询的方法
		
		PageInfo<Shop> pageInfo=new PageInfo<Shop>(list);
		//查询所有品牌
		List<Brand> lists=ss.brandAll();
		model.addAttribute("blist", lists);
		model.addAttribute("slist", list);
		model.addAttribute("page", pageInfo);
		model.addAttribute("abc", 1);
		model.addAttribute("dianji", 6);
		return "commodityList";
	}
}
