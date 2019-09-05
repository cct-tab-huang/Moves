package com.houpu.service;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.houpu.model.orderShop;

public interface orderService {

	//加入购物车
	Integer editAddcart(orderShop orderShop);
	
	//查询购物车
	List<orderShop> queryOrderCard(long uid);
	
	//订单详情页
	List<orderShop> logoshopstatus(long uid,int status);
	
	//根据oid删除用户不想要的商品
    Integer deleteById(long oid);
    
    //查询购物车
  	List<orderShop> queryOrderCards(long uid);
  	
    //管理员查询订单
  	List<orderShop> orderQueryAll();
  	
    //订单发货
  	Integer orderTracking(orderShop orderShop);
  	
    //模糊查询订单
  	List<orderShop> orderNumLike(String orderNum);
}
