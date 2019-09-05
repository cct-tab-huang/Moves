package com.houpu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.houpu.model.Client;
import com.houpu.model.User;

@Repository
public interface ClientDao {

	    //完善信息
	    Integer addSelf(@Param("sName") String sName,@Param("address") String address,@Param("cid") long cid);
	    // 注册
		int zhuce(@Param("CPhone") String CPhone, @Param("CPassWord") String CPassWord);

		// 通过phone查询
		Client selectbyphone(@Param("CPhone") String CPassWord);
		
		// 登录
		Client ClientLogin(@Param("CPhone") String CPhone, @Param("CPassWord") String CPassWord);
		
		//查询所有用户信息
		List<Client> ClientQueryAll();
}
