package com.houpu.service;

import java.util.List;



import com.houpu.model.Client;

public interface cliService  {
	
	
	//完善信息
    Integer addSelf(String sName,String address,long cid);
	   //注册
		int  zhuce(String CPhone,String CPassWord);
		
		//通过phone查询
		Client selectbyphone(String CPhone);
		
		// 登录
		Client ClientLogin(String CPhone,String CPassWord);
	    
		//查询所有用户信息
		List<Client> ClientQueryAll();
}
