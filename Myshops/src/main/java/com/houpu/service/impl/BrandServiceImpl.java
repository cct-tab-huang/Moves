package com.houpu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.houpu.dao.brandDao;
import com.houpu.model.Brand;
import com.houpu.service.BrandService;

@Service
public class BrandServiceImpl implements BrandService {

	//注入dao
	@Resource
	private brandDao bDao;
	public List<Brand> brandAll() {
		// TODO Auto-generated method stub
		return bDao.brandAll();
	}
	//添加品牌
	public Integer addbrandAction(String BrandName,String createUser,String createTime,long type) {
		// TODO Auto-generated method stub
		return bDao.addbrandAction(BrandName,createUser,createTime,type);
	}
	//删除品牌
	public Integer deleteBrand(long bid) {
		// TODO Auto-generated method stub
		return bDao.deleteBrand(bid);
	}
	//根据bid查询品牌
	public Brand brandQueryOne(long bid) {
		// TODO Auto-generated method stub
		return bDao.brandQueryOne(bid);
	}
	//品牌模糊查询
	public List<Brand> quertBrandLike(String BrandName) {
		// TODO Auto-generated method stub
		return bDao.quertBrandLike(BrandName);
	}

}
