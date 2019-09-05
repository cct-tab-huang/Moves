package com.houpu.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.houpu.model.Brand;

public interface BrandService {

	//查询所有品牌
	List<Brand> brandAll();
	
	//添加品牌
	Integer addbrandAction(String BrandName,String createUser,String createTime,long type);
		
	//根据编号删除品牌
	Integer deleteBrand(long bid);
	
	//根据bid查询品牌表中的所有数据
	Brand brandQueryOne(long bid);
	//品牌模糊查询
	List<Brand> quertBrandLike(String BrandName);
}
