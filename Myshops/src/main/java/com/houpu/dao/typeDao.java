package com.houpu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.houpu.model.Type;
@Repository
public interface typeDao {

	//查询所有商品类型
	List<Type> TypeQueryAll();
	
	//添加类型
	Integer typeAdd(@Param("type") Type type);
}
