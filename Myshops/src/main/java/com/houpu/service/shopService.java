package com.houpu.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.houpu.model.Brand;
import com.houpu.model.Shop;

public interface shopService {
	
	//商品模糊查询
	List<Shop> commdityShopLike(String SName,long brandid,String typeName);
	
	//根据商品编号查询商品
	Shop queryBySid(long cid);

	//查询所有商品
	public List<Shop> showQueryAll();
	
	//查询所有品牌
	List<Brand> brandAll();
	
	//根据bid查询数据
	List<Brand> shopBandid(long bid);
	
	//添加商品
	Integer addShopOne(Shop shop);
	
	//根据编号删除数据
	Integer CommodityDelById(long sid);
	
	//根据编号查看商品的全部信息
	Shop CommoditySelById(long sid);
	
	//查询最新商品
	List<Shop> queryByCreateTime();
	
	//热销商品查询
	List<Shop> queryBySSum();
	
	//推荐商品给客户
	List<Shop> queryRecommend();
	
	//根据商品编号查询商品的详情
	Shop details(@Param("sid") long sid);
	
	//查询商品名称
	List<Shop> querySname();
	
	//根据商品名称查询数据
	List<Shop> queryAjaxSname(String bid);
	
	//更新商品信息的修改
	Integer commodityModel(Shop shops);
	
	
}
