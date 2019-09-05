package com.houpu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.houpu.dao.brandDao;
import com.houpu.dao.shopDao;
import com.houpu.model.Brand;
import com.houpu.model.Shop;
import com.houpu.service.shopService;
@Service
public class shopServiceImpl implements shopService {

	@Resource
	private shopDao sDao;
	@Resource
	private brandDao bd;
	//查询所有商品
	public List<Shop> showQueryAll() {
		// TODO Auto-generated method stub
		return sDao.showQueryAll();
	}
	//查询所有品牌
	public List<Brand> brandAll() {
		// TODO Auto-generated method stub
		return bd.brandAll();
	}
	//根据bid查询数据
	public List<Brand> shopBandid(long bid) {
		// TODO Auto-generated method stub
		return bd.shopBandid(bid);
	}
	//向数据库添加商品
	public Integer addShopOne(Shop shop) {
		// TODO Auto-generated method stub
		return  sDao.addShopOne(shop);
	}
	//根据编号删除数据@Override
	public Integer CommodityDelById(long sid) {
		// TODO Auto-generated method stub
		return sDao.CommodityDelById(sid);
	}
	//根据编号查看商品的全部信息
	public Shop CommoditySelById(long sid) {
		// TODO Auto-generated method stub
		return sDao.CommoditySelById(sid);
	}
	//查询最新商品
	public List<Shop> queryByCreateTime() {
		// TODO Auto-generated method stub
		return sDao.queryByCreateTime();
	}
	//热销商品查询
	public List<Shop> queryBySSum() {
		// TODO Auto-generated method stub
		return sDao.queryBySSum();
	}
	//给客户推荐商品
	public List<Shop> queryRecommend() {
		// TODO Auto-generated method stub
		return sDao.queryRecommend();
	}
	//查询商品详情
	public Shop details(long sid) {
		// TODO Auto-generated method stub
		return sDao.details(sid);
	}
	//根据商品编号查询商品
	public Shop queryBySid(long cid) {
		// TODO Auto-generated method stub
		return sDao.queryBySid(cid);
	}
	//查询商品名称
	public List<Shop> querySname() {
		// TODO Auto-generated method stub
		return sDao.querySname();
	}
	//根据商品名称查询数据
	public List<Shop> queryAjaxSname(String sName) {
		// TODO Auto-generated method stub
		return sDao.queryAjaxSname(sName);
	}
	//商品模糊查询
	public List<Shop> commdityShopLike(String SName, long brandid, String typeName) {
		// TODO Auto-generated method stub
		return sDao.commdityShopLike(SName, brandid, typeName);
	}
	public Integer commodityModel(Shop shops) {
		// TODO Auto-generated method stub
		return sDao.commodityModel(shops);
	}


}
