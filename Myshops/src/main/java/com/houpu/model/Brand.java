package com.houpu.model;

public class Brand {
	
	
	// 品牌id
	private long bid;
	// 品牌名称
	private String BrandName;
	// 类型id
	private long TypeId;
	// 创建者
	private String createUser;
	// 创建时间
	private String createTime;
	// 修改者
	private String updateUser;
	// 修改时间
	private String updateTime;
	
	private Type type;

	public long getBid() {
		return bid;
	}

	public void setBid(long bid) {
		this.bid = bid;
	}

	public String getBrandName() {
		return BrandName;
	}

	public void setBrandName(String brandName) {
		BrandName = brandName;
	}

	public long getTypeId() {
		return TypeId;
	}

	public void setTypeId(long typeId) {
		TypeId = typeId;
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

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Brand [bid=" + bid + ", BrandName=" + BrandName + ", TypeId=" + TypeId + ", createUser=" + createUser
				+ ", createTime=" + createTime + ", updateUser=" + updateUser + ", updateTime=" + updateTime + ", type="
				+ type + "]";
	}
	
	
	
	

}
