package com.houpu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.houpu.dao.orderDao;
import com.houpu.model.orderShop;
import com.houpu.service.orderService;
@Service
public class orderServiceImpl implements orderService {

	//接入dao
	@Resource
	private orderDao od;
	//加入购物差
	public Integer editAddcart(orderShop orderShop) {
		// TODO Auto-generated method stub
		return od.editAddcart(orderShop);
	}
	//加入购物车
	public List<orderShop> queryOrderCard(long uid) {
		// TODO Auto-generated method stub
		return od.queryOrderCard(uid);
	}
	//订单详情
	public List<orderShop> logoshopstatus(long uid, int status) {
		// TODO Auto-generated method stub
		return od.logoshopstatus(uid, status);
	}
	//删除商品
	public Integer deleteById(long oid) {
		// TODO Auto-generated method stub
		return od.deleteById(oid);
	}
	//查询所有购物车
	public List<orderShop> queryOrderCards(long uid) {
		// TODO Auto-generated method stub
		return od.queryOrderCards(uid);
	}
	//管理员进行订单管理
	public List<orderShop> orderQueryAll() {
		// TODO Auto-generated method stub
		return od.orderQueryAll();
	}
	//订单发货
	public Integer orderTracking(orderShop orderShop) {
		// TODO Auto-generated method stub
		return od.orderTracking(orderShop);
	}
	//模糊查询订单
	public List<orderShop> orderNumLike(String orderNum) {
		// TODO Auto-generated method stub
		return od.orderNumLike(orderNum);
	}

}
