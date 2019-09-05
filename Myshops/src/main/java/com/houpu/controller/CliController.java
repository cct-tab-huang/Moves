package com.houpu.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.houpu.model.Brand;
import com.houpu.model.Client;
import com.houpu.model.Shop;
import com.houpu.service.BrandService;
import com.houpu.service.cliService;
import com.houpu.service.shopService;
import com.houpu.utils.MD5Util;

@Controller
@RequestMapping
public class CliController {

	@Resource
	private cliService cs;
	
	//注入shop service层
	@Resource
	private shopService ss;
	@Resource
	private BrandService bs;
	/**
	 * 添加姓名和地址
	 */
	@RequestMapping(value ="/addSelf")
	@ResponseBody
	public Integer addSelf(@RequestParam("sName") String sName,
			@RequestParam("address") String address,
			@RequestParam("cid") long cid,
			@RequestParam("s_province") String s_province,
			@RequestParam("s_city") String s_city,
			@RequestParam("s_county") String s_county){
		String s=s_province+s_city+s_county+address;
		//调用添加条件
		Integer i=cs.addSelf(sName, s, cid);
		
		return i;
		
	}
	/**
	 * 用户列表管理查询所以用户
	 */
	@RequestMapping(value="ClientQueryAll")
	public String ClientQueryAll
	(
			Model model,
			@RequestParam(defaultValue = "1",required = true) Integer page){
		PageHelper.startPage(page, 5);
		//调用查询的方法
		List<Client> list=cs.ClientQueryAll();
		PageInfo<Client> pageInfo=new PageInfo<Client>(list);
		model.addAttribute("lists", list);
		model.addAttribute("page", pageInfo);
		model.addAttribute("abc", 2);
		return "clientList";
		
	}
	
		

	/**
	 * 通过phone 查询
	 * 
	 * @param phone
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/selectbyphone")
	@ResponseBody
	public Client selectbyphone(@RequestParam("CPhone") String CPhone, Model model) {
		Client client = cs.selectbyphone(CPhone);
		model.addAttribute("user", client);
		System.out.println(111);
		return client;

	}
	/**
	 * 跳转注册页面
	 */

		@RequestMapping(value="/register")
		public String register(){
			return "register";
			
		}

	/**
	 * 注册
	 * 
	 * @param phone
	 * @param password
	 * @param code
	 * @param mobile_code
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/insertClient")
	public String insertClient(@RequestParam("CPhone") String CPhone, @RequestParam("passWord") String passWord,
			@RequestParam("code") String code, @RequestParam("mobilecodes") String mobile_code,
			HttpServletRequest request, Model model) {
		System.out.println(1111111);
		HttpSession session = request.getSession();
		// 获得手机验证码
		String sjyzm = (String) session.getAttribute("code");
		// 获得图形验证码
		String txyzm = (String) session.getAttribute("randomcode_key");
		System.out.println(txyzm);
		if (sjyzm.equals(mobile_code)) {
			if (txyzm.equals(code)) {
				// 密码加密
				String psw = MD5Util.MD5(passWord);
				// 调用注册
				int i = cs.zhuce(CPhone, psw);
				if (i > 0) {
					return "clilogin";
				} else {
					model.addAttribute("msg", "注册失败,重新注册");
					return "register";
				}

			} else {
				model.addAttribute("msg", "图形验证码不正确");
				return "register";
			}

		} else {
			model.addAttribute("msg", " 手机验证码不正确");
			return "register";
		}

	}
	//跳转登录页面
	@RequestMapping(value="/cliLogin")
	public String cliLogin(){
		
		return "clilogin";
		
	}
	
	//跳转登录页面
	@RequestMapping(value="/index")
	public String index(){
		
		return "index";
		
	}

	/**
	 * 客户登录
	 */
	@RequestMapping(value = "/ClientLogin")
	public String  ClientLogin(
			@RequestParam("CPhone") String CPhone,
			@RequestParam("CPassWord") String CPassWord,
			Model model,
			HttpSession session,
			@RequestParam("code") String code) {
		// 密码加密
		// 获得图形验证码
		String txyzm = (String) session.getAttribute("randomcode_key");
		if(txyzm.equals(code)) {
			String psw = MD5Util.MD5(CPassWord);
			Client client=cs.ClientLogin(CPhone, psw);
			if(client!=null) {
				//登录成功后保存数据 调用查询的方法
				List<Shop> queryCreateTimeList=ss.queryByCreateTime();
				//查询所有品牌
				List<Brand> queryBrandList=bs.brandAll();
				//热销商品查询
				List<Shop> queryBySSum=ss.queryBySSum();
				//推荐商品
				List<Shop> queryRecommend=ss.queryRecommend();
				//查询商品名称
				List<Shop> querySname=ss.querySname();
				session.setAttribute("querySname", querySname);	
				session.setAttribute("queryBrandList", queryBrandList);		
				session.setAttribute("queryRecommend", queryRecommend);
				session.setAttribute("queryBySSum", queryBySSum);
				session.setAttribute("queryCreateTimeList", queryCreateTimeList);
				session.setAttribute("clients", client);
				session.setAttribute("userId", client.getCid());
				session.setAttribute("userName", client.getCName());
				session.setAttribute("abc",1);
				return "index";	
			}else {
				model.addAttribute("lose", "用户名或者密码错误");
				return "clilogin";
			}
			
		}else {
			model.addAttribute("lose", "验证码错误");
			return "clilogin";
		}
		
		
	}

}
