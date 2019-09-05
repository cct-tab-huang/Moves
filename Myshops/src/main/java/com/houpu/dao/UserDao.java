package com.houpu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


import com.houpu.model.User;

@Repository
public interface UserDao {

   //员工登录
	User UserLogin(@Param("userName") String userName,@Param("passWord") String passWord);
	
	//查询所有员工信息
	List<User> UserQueryAll(@Param("roleId") long roleId);

	//添加员工
	Integer addUserFrom(@Param("userName") String userName,@Param("phone") String phone,@Param("passWord") String passWord,@Param("createUser") String createUser,@Param("createTime") String createTime);

	//根据uid查询单行数据
	User queryUserOne(@Param("uid") long uid);
	
	//更新数据
	Integer updateOne(@Param("user") User user);
	
	//根据id删除员工 -->
	Integer deleteUser(@Param("updateTime") String updateTime,@Param("updateUser") String updateUser,@Param("uid") long uid);
	  
	//员工进行模糊查询
	List<User> selNameLike(@Param("name") String name);
	  
	
}
