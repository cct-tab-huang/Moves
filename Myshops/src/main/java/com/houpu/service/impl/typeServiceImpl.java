package com.houpu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.houpu.dao.typeDao;
import com.houpu.model.Type;
import com.houpu.service.typeServicer;
@Service
public class typeServiceImpl implements typeServicer{

	//接入dao
	@Resource
	private typeDao td;
	//查询所有类型
	public List<Type> TypeQueryAll() {
		// TODO Auto-generated method stub
		return td.TypeQueryAll();
	}
	//添加类型
	public Integer typeAdd(Type type) {
		// TODO Auto-generated method stub
		return td.typeAdd(type);
	}

}
