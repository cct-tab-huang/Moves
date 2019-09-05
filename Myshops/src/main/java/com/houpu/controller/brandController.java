package com.houpu.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.houpu.model.Brand;
import com.houpu.model.Type;
import com.houpu.service.BrandService;
import com.houpu.service.typeServicer;

@Controller
@RequestMapping()
public class brandController {

	//注入service
	@Resource
	private BrandService bService;
	@Resource
	private typeServicer ts;
	
	/**
	 * 针对品牌模糊查询
	 * @param bid
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/quertBrandLike")
	public String quertBrandLike(@RequestParam("BrandName") String BrandName,Model model) {
		List<Brand> blist=bService.quertBrandLike(BrandName);
		model.addAttribute("blist", blist);
		return "brandList";
	}
	
	//根据品牌id查询单个品牌信息
	@RequestMapping(value="/brandQueryOne")
	public String brandQueryOne(@RequestParam("bid") long bid,Model model){
		Brand brand=bService.brandQueryOne(bid);
		model.addAttribute("brand", brand);
		return "brandview";
		
	}
	//查询所有品牌信息
	@RequestMapping(value = "/brandQueryAll")
	public String brandQueryAl(Model model) {
		//调用查询语句
		List<Brand> blist=bService.brandAll();
		model.addAttribute("blist", blist);
		return "brandList";
	}
	/**
	 * 进入添加品牌的页面
	 */
	@RequestMapping(value="/brandAdd")
	public String brandAdd(Model model){
		//查询类型
		List<Type> tlist=ts.TypeQueryAll();
		model.addAttribute("tlist", tlist);
		return "branddityadd";
		
	}
	/**
	 * 添加新的品牌
	 */
	@RequestMapping(value="/addbrandAction")
	public String  addbrandAction(@RequestParam("BrandName") String BrandName,
			@RequestParam("type") long type,
			Model model,HttpSession session){
		//System.out.println(type);
		Date date=new Date();//获取当前时间
		//创建时间
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd/ HH:mm:ss");//格式化时间
		String createTime=sdf.format(date);
		
		//获取当前登录的用户
		String createUser=(String) session.getAttribute("userNames");
		Integer i=bService.addbrandAction(BrandName,createUser,createTime,type);
		if (i>0) {
			List<Brand> blist=bService.brandAll();
			model.addAttribute("blist", blist);
			return "brandList";
		}
		return "brandList";
		
	}
	/**
	 * 根据品牌编号删除商品 
	 * 
	 * 
	 */
	@RequestMapping(value ="/deleteBrand")
	public String deleteBrand(@RequestParam("bid") long bid,Model model){
		//调用删除的方法
		Integer i=bService.deleteBrand(bid);
		if (i>0) {
				List<Brand> blist=bService.brandAll();
				model.addAttribute("blist", blist);
				return "brandList";
			}
			return "brandList";
		
	}
	
}
