package com.houpu.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.houpu.model.Client;
import com.houpu.model.Role;
import com.houpu.model.User;
import com.houpu.service.UserService;
import com.houpu.utils.DateUtil;
import com.houpu.utils.MD5Util;
import com.houpu.utils.RandomValidateCodeUtil;
import com.houpu.utils.SendMsgUtil;
import com.mysql.fabric.xmlrpc.base.Value;

@Controller
@RequestMapping
public class UserController {

	
	// 注入service层、model层
	@Resource
	private UserService us;
	
	/**
	 * 员工进行模糊查询
	 */
	@RequestMapping(value ="/selNameLike")
	public String selNameLike(@RequestParam("name") String name,Model model,
			HttpSession session,
			@RequestParam(defaultValue = "1",required = true) Integer page
			) {
		PageHelper.startPage(page, 10);
	
		//调用查询的方法
		List<User> list=us.selNameLike(name);
		PageInfo<User> pageInfo=new PageInfo<User>(list);
		model.addAttribute("list", list);
		model.addAttribute("page", pageInfo);
		model.addAttribute("abc", 2);
		return "userList";
		
	}
	
	/**
	 * 根据id删除员工
	 */
	@RequestMapping(value = "/deleteUser")
	public String deleteUser(@RequestParam("uid") long uid,
			@RequestParam(defaultValue = "1",required = true) Integer page,
			Model model,HttpSession session
			) {
		PageHelper.startPage(page, 10);
		Date date=new Date();//获取当前时间
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd/HH:mm:ss");//格式化时间
		//获取当前登录的用户
		String userNames=(String) session.getAttribute("userNames");
		//调用删除方法
		Integer i=us.deleteUser(sdf.format(date), userNames, uid);
		if (i>0) {
			long roleId=(long) session.getAttribute("roleId");
			List<User> list=us.UserQueryAll(roleId);
			PageInfo<User> pageInfo=new PageInfo<User>(list);
			model.addAttribute("list", list);
			model.addAttribute("page", pageInfo);
			model.addAttribute("abc", 2);
			return "userList";
		}else {
			model.addAttribute("userAdddress", "修改失败,不知道哪里报错！！！！");
			return "userList";
		}
		
	}
	/**
	 * 修改信息
	 */
	@RequestMapping(value = "/UserServletSave")
	public String UserServletSave(
			User users,Model model,
			@RequestParam(defaultValue = "1",required = true) Integer page,
			HttpSession session) {
		
		String passWord;
		if(users.getPassWord().equals("")) {
			passWord=(String) session.getAttribute("password");
			
		}else {
			passWord = MD5Util.MD5(users.getPassWord());
		}
		Date date=new Date();//获取当前时间
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd/HH:mm:ss");//格式化时间
		//获取当前登录的用户
		String userNames=(String) session.getAttribute("userNames");
		users.setPassWord(passWord);
		users.setUpdateUser(userNames);
		users.setUpdateTime(sdf.format(date));
		//调用更新方法
		Integer i=us.updateOne(users);
		System.out.println(users);
		if(i>0) {
			PageHelper.startPage(page, 10);
			long roleId=(long) session.getAttribute("roleId");
			List<User> list=us.UserQueryAll(roleId);
			PageInfo<User> pageInfo=new PageInfo<User>(list);
			model.addAttribute("list", list);
			model.addAttribute("page", pageInfo);
			model.addAttribute("abc", 2);
			return "userList";
		}else {
			model.addAttribute("userAdddress", "修改失败,不知道哪里报错！！！！");
			return "usermodify";
		}
		
		
	}
	
	/**
	 * 修改员工信息,跳转修改页面
	 */
	@RequestMapping(value = "/updateUser")
	public String  updateUser(@RequestParam("uid") long uid,Model model,
			HttpSession session) {
		//查询单行数据
		User user=us.queryUserOne(uid);
		model.addAttribute("user", user);
		session.setAttribute("password", user.getPassWord());
		return "usermodify";
		
	}
	/**
	 * 修改员工信息,跳转修改页面
	 */
	@RequestMapping(value = "/UserQueryOne")
	public String  UserQueryOne(@RequestParam("uid") long uid,Model model,
			HttpSession session) {
		//查询单行数据
		User user=us.queryUserOne(uid);
		model.addAttribute("users", user);
		session.setAttribute("password", user.getPassWord());
		return "userview";
		
	}
	/**
	 * 添加员工
	 */
	@RequestMapping(value = "/userAddFrom")
	public String userAddFrom(
			@RequestParam("userName") String userName,
			@RequestParam("passWord") String passWord,
			@RequestParam("phone") String phone,
			
			Model model,HttpSession session,
			@RequestParam(defaultValue = "1",required = true) Integer page
			) {
		PageHelper.startPage(page, 10);
		Date date=new Date();//获取当前时间
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd/HH:mm:ss");//格式化时间
		sdf.format(date);
		//获取当前登录的用户
		String userNames=(String) session.getAttribute("userNames");
		String psw = MD5Util.MD5(passWord);
        //调用添加语句
		Integer i=us.addUserFrom(userName,phone,psw, userNames, sdf.format(date));
		if (i>0) {
			long roleId=(long) session.getAttribute("roleId");
			List<User> list=us.UserQueryAll(roleId);
			PageInfo<User> pageInfo=new PageInfo<User>(list);
			model.addAttribute("list", list);
			model.addAttribute("page", pageInfo);
			model.addAttribute("abc", 2);
			return "userList";
		}else {
			model.addAttribute("userAdddress", "添加失败,不知道哪里错误！！！！");
			return "useradd";
		}
		
		
	}
	/**
	 * 进入登录页面
	 */
	@RequestMapping(value = "/login")
	public String login() {
		
		return "login";
	}
	/**
	 * 用户列表管理页面
	 */

	@RequestMapping(value="/UserQueryAll")
	public String UserQueryAll(Model model,
			HttpSession session,
			@RequestParam(defaultValue = "1",required = true) Integer page
			) {
		PageHelper.startPage(page, 10);
	
		long roleId=(long) session.getAttribute("roleId");
		//调用查询的方法
		List<User> list=us.UserQueryAll(roleId);
		PageInfo<User> pageInfo=new PageInfo<User>(list);
		model.addAttribute("list", list);
		model.addAttribute("page", pageInfo);
		model.addAttribute("abc", 2);
		return "userList";
		
	}
	
		
		
		
		
	/**
	 * 进入员工与管理员登录页面
	 */
	@RequestMapping(value ="/Userlogins")
	public String Userlogin(){
		return "login";
		
	}
	
	/**
	 1. 员工登录页面
	 */
	@RequestMapping(value="/UserLogin")
	public String UserLogin(
			@RequestParam("userName") String userName,
			@RequestParam("passWord") String passWord,
			Model model,
			HttpSession session,
			@RequestParam("code") String code) {
		// 密码加密
		// 获得图形验证码
		String txyzm = (String) session.getAttribute("randomcode_key");
		if(txyzm.equals(code)) {
			String psw = MD5Util.MD5(passWord);
			User user=us.UserLogin(userName, psw);
			if(user!=null) {
				session.setAttribute("roleId", user.getRoleId());
				session.setAttribute("user", user);
				session.setAttribute("userNames", user.getUserName());
				session.setAttribute("names", user.getName());
				session.setAttribute("userId", user.getUid());
				session.setAttribute("abc",2);
				return "userList";	
			}else {
				model.addAttribute("lose", "用户名或者密码错误");
				return "login";
			}
			
		}else {
			model.addAttribute("lose", "验证码错误");
			return "login";
		}
	
		
	}
	/**
	 * 跳转到注册页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "insert")
	public String insert() {
		return "register";

	}

	/**
	 * 短信接口
	 * 
	 * @param phone
	 * @param request
	 */
	@RequestMapping(value = "/autophone")
	@ResponseBody
	public void autophone(@RequestParam(value = "CPhone") String CPhone, HttpServletRequest request) {
        System.out.println(CPhone);
		HttpSession session = request.getSession(); // 设置session
		HashMap<String, String> map = SendMsgUtil.getMessageStatus(CPhone, request); // 调用发送短信接口
		String sjyzm = map.get("num");
		System.out.println(sjyzm);
		session.setAttribute("sjyzm", sjyzm);
		String result = map.get("result");// 获取到result值
		if (result.trim().equals("1")) {// 如果为1，表示成功发送
			String code = map.get("code");// 获取发送的验证码内容
			session.setAttribute("code", code);// 将短信验证码放到session中保存
			session.setMaxInactiveInterval(60 * 5);// 保存时间 暂时设定为5分钟
			System.out.println(code);
			String yzm = map.get("num");
			session.setAttribute("yzm", yzm);
		}
		
	}

	/**
	 * 获取生成验证码显示到 UI 界面
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "/checkCode")
	public void checkCode(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 设置相应类型,告诉浏览器输出的内容为图片
		response.setContentType("image/jpeg");
		// 设置响应头信息，告诉浏览器不要缓存此内容
		response.setHeader("pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expire", 0);
		RandomValidateCodeUtil randomValidateCode = new RandomValidateCodeUtil();
		try {
			randomValidateCode.getRandcode(request, response);// 输出图片方法
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
