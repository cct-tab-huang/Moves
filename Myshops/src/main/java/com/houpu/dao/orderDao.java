package com.houpu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.houpu.model.orderShop;

@ResponseBody
public interface orderDao {

	//加入购物车
	Integer editAddcart(@Param("orderShop") orderShop orderShop);
	
	//查询购物车
	List<orderShop> queryOrderCard(@Param("uid") long uid);
	
	//查询购物车
	List<orderShop> queryOrderCards(@Param("uid") long uid);
	
	//订单详情页
	List<orderShop> logoshopstatus(@Param("uid") long uid,@Param("status") int status);
	
	//根据oid删除用户不想要的商品
	Integer deleteById(@Param("oid") long oid);
	
	//管理员查询订单
	List<orderShop> orderQueryAll();
	
	//订单发货
	Integer orderTracking(@Param("orderShop") orderShop orderShop);
	
	//模糊查询订单
	List<orderShop> orderNumLike(@Param("orderNum") String orderNum);
}
