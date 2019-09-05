package com.houpu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


import com.houpu.model.Shop;

@Repository
public interface shopDao {
	
	//商品模糊查询
	List<Shop> commdityShopLike(@Param("SName") String SName,@Param("brandid") long brandid,@Param("typeName") String typeName);
	
	//根据商品编号查询商品
	Shop queryBySid(@Param("cid") long cid);

	//查询所有商品
	public List<Shop> showQueryAll();
	
	//添加商品
	Integer addShopOne(@Param("shop") Shop shop);
	
	//根据编号删除数据
	Integer CommodityDelById(@Param("sid") long sid);
	
	//根据编号查看商品的全部信息
	Shop CommoditySelById(@Param("sid") long sid);
	
	//查询最新商品
	public List<Shop> queryByCreateTime();

	 //热销商品查询
	List<Shop> queryBySSum();
	
	//推荐商品给客户
	List<Shop> queryRecommend();
	
	//根据商品编号查询商品的详情
	Shop details(@Param("sid") long sid);
	
	//查询商品名称
	List<Shop> querySname();
	
	//根据商品名称查询数据
	List<Shop> queryAjaxSname(@Param("bid") String bid);
	
	//更新商品信息的修改
	Integer commodityModel(@Param("shops") Shop shops);
	
	
}
