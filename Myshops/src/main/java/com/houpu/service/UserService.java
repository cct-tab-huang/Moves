package com.houpu.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.houpu.model.Client;
import com.houpu.model.Role;
import com.houpu.model.User;

public interface UserService  {
	
	  
	//员工登录
	User UserLogin(String userName,String passWord);
	
	//查询所有员工信息
	List<User> UserQueryAll(long roleId);

	//添加员工
	Integer addUserFrom(String userName,String phone,String passWord,String createUser,String createTime);
	
	//根据uid查询单行数据
	User queryUserOne(long uid);

	//更新数据
	Integer updateOne(User user);
	
	//根据id删除员工 -->
	Integer deleteUser(String updateTime,String updateUser,long uid);
	
	//员工进行模糊查询
	List<User> selNameLike(String name);

}
