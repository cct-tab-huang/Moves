package com.houpu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.houpu.dao.ClientDao;
import com.houpu.dao.UserDao;
import com.houpu.model.Client;
import com.houpu.model.Role;
import com.houpu.model.User;
import com.houpu.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Resource 
	private UserDao ud;
	//员工登录
	public User UserLogin(String userName, String passWord) {
		// TODO Auto-generated method stub
		return ud.UserLogin(userName, passWord);
	}
	//查询员工与管理员
	public List<User> UserQueryAll(long roleId) {
		// TODO Auto-generated method stub
		return ud.UserQueryAll(roleId);
	}
	//添加员工
	public Integer addUserFrom(String userName, String phone, String passWord, String createUser, String createTime) {
		// TODO Auto-generated method stub
		return ud.addUserFrom(userName,phone, passWord, createUser, createTime);
	}
	//查询单行数据
	public User queryUserOne(long uid) {
		// TODO Auto-generated method stub
		return ud.queryUserOne(uid);
	}
	//更新单行数据
	public Integer updateOne(User user) {
		// TODO Auto-generated method stub
		return ud.updateOne(user);
	}
	//根据id删除员工
	public Integer deleteUser(String updateTime, String updateUser, long uid) {
		// TODO Auto-generated method stub
		return ud.deleteUser(updateTime, updateUser, uid);
	}
	//对员工进行模糊查询
	public List<User> selNameLike(String name) {
		// TODO Auto-generated method stub
		return ud.selNameLike(name);
	}
	
	
}
