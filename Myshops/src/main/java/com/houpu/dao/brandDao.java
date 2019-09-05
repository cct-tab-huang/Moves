package com.houpu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.houpu.model.Brand;
@Repository
public interface brandDao {

	//查询所有品牌
	List<Brand> brandAll();
	
	//根据bid查询数据
	List<Brand> shopBandid(@Param("bid") long bid);
	
	//添加品牌
	Integer addbrandAction(@Param("BrandName") String BrandName,@Param("createUser") String createUser,@Param("createTime") String createTime,@Param("type") long type);
	  
	//根据编号删除品牌
	Integer deleteBrand(@Param("bid") long bid);
	
	//根据bid查询品牌表中的所有数据
	Brand brandQueryOne(@Param("bid") long bid);
	
	//品牌模糊查询
	List<Brand> quertBrandLike(@Param("BrandName") String BrandName);
}
