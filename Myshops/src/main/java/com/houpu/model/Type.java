package com.houpu.model;

public class Type {
	// 用户id
	private long tid;
	// 用户名
	private String TypeName;
	// 创建者
	private String createUser;
	// 创建时间
	private String createTime;
	// 修改者
	private String updateUser;
	// 修改时间
	private String updateTime;
	/**
	 * @return the tid
	 */
	public long getTid() {
		return tid;
	}
	/**
	 * @param tid the tid to set
	 */
	public void setTid(long tid) {
		this.tid = tid;
	}
	/**
	 * @return the typeName
	 */
	public String getTypeName() {
		return TypeName;
	}
	/**
	 * @param typeName the typeName to set
	 */
	public void setTypeName(String typeName) {
		TypeName = typeName;
	}
	/**
	 * @return the createUser
	 */
	public String getCreateUser() {
		return createUser;
	}
	/**
	 * @param createUser the createUser to set
	 */
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	/**
	 * @return the createTime
	 */
	public String getCreateTime() {
		return createTime;
	}
	/**
	 * @param createTime the createTime to set
	 */
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	/**
	 * @return the updateUser
	 */
	public String getUpdateUser() {
		return updateUser;
	}
	/**
	 * @param updateUser the updateUser to set
	 */
	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}
	/**
	 * @return the updateTime
	 */
	public String getUpdateTime() {
		return updateTime;
	}
	/**
	 * @param updateTime the updateTime to set
	 */
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Type [tid=" + tid + ", TypeName=" + TypeName + ", createUser=" + createUser + ", createTime="
				+ createTime + ", updateUser=" + updateUser + ", updateTime=" + updateTime + "]";
	}
	

}
