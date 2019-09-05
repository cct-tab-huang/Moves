package com.houpu.model;

public class User {
	// 用户id
	private long uid;
	// 用户名
	private String userName;
	// 用户密码
	private String passWord;
	// 用户性别
	private String sex;
	// 用户年龄
	private int age;
	
	private String email;
	
	private String card;
	
	private Integer status;
	
	private String name;
	
	private String phone;
	
	private String address;


	private Role role;
	
	private long roleId;
	// 创建者
	private String createUser;
	// 创建时间
	private String createTime;
	// 修改者
	private String updateUser;
	// 修改时间
	private String updateTime;
	public long getUid() {
		return uid;
	}
	public void setUid(long uid) {
		this.uid = uid;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCard() {
		return card;
	}
	public void setCard(String card) {
		this.card = card;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public long getRoleId() {
		return roleId;
	}
	public void setRoleId(long roleId) {
		this.roleId = roleId;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getUpdateUser() {
		return updateUser;
	}
	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	@Override
	public String toString() {
		return "User [uid=" + uid + ", userName=" + userName + ", passWord=" + passWord + ", sex=" + sex + ", age="
				+ age + ", email=" + email + ", card=" + card + ", status=" + status + ", name=" + name + ", phone="
				+ phone + ", address=" + address + ", role=" + role + ", roleId=" + roleId + ", createUser="
				+ createUser + ", createTime=" + createTime + ", updateUser=" + updateUser + ", updateTime="
				+ updateTime + "]";
	}
	
	

	
	
	
	
}
