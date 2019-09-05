package com.houpu.service;

import java.util.List;


import com.houpu.model.Type;

public interface typeServicer {

	//查询所有商品类型
	List<Type> TypeQueryAll();
	
	//添加类型
	Integer typeAdd(Type type);
}
