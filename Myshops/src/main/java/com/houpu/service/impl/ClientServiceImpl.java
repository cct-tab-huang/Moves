package com.houpu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.houpu.dao.ClientDao;
import com.houpu.model.Client;
import com.houpu.model.User;
import com.houpu.service.cliService;
@Service
public class ClientServiceImpl implements cliService{


	  // 注入dao层
		@Resource
		private ClientDao cd;
		
		

		//注册
		public int zhuce(String CPhone, String CPassWord) {
			// TODO Auto-generated method stub
			return cd.zhuce(CPhone, CPassWord);
		}

		//通过phone查询
		public Client selectbyphone(String phone) {
			// TODO Auto-generated method stub
			return cd.selectbyphone(phone);
		}

		//登录
		public Client ClientLogin(String CPhone, String CPassWord) {
			// TODO Auto-generated method stub
			return cd.ClientLogin(CPhone, CPassWord);
		}

		//查询所有用户
		public List<Client> ClientQueryAll() {
			// TODO Auto-generated method stub
			return cd.ClientQueryAll();
		}

		//给用户完善信息
		public Integer addSelf(String sName, String address,long cid) {
			// TODO Auto-generated method stub
			return cd.addSelf(sName, address, cid);
		}

}
