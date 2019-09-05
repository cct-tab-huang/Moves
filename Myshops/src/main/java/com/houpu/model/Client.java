package com.houpu.model;

public class Client {

	// 客户id
	private long cid;
	// 客户电话号码
	private String CPhone;
	// 客户登录密码
	private String CPassWord;
	// 客户性别
	private String CSex;
	// 客户身份证号
	private String CCard;

	// 客户地址
	private String CAddress;

	// 客户支付密码
	private String PayPWD;
	// 客户姓名
	private String CName;
	// 客户邮箱
	private String CEmail;
	// 创建者
	private String createUser;
	// 创建时间
	private String createTime;
	// 修改者
	private String updateUser;
	// 修改时间
	private String updateTime;
	/**
	 * @return the cid
	 */
	public long getCid() {
		return cid;
	}
	/**
	 * @param cid the cid to set
	 */
	public void setCid(long cid) {
		this.cid = cid;
	}
	/**
	 * @return the cPhone
	 */
	public String getCPhone() {
		return CPhone;
	}
	/**
	 * @param cPhone the cPhone to set
	 */
	public void setCPhone(String cPhone) {
		CPhone = cPhone;
	}
	/**
	 * @return the cPassWord
	 */
	public String getCPassWord() {
		return CPassWord;
	}
	/**
	 * @param cPassWord the cPassWord to set
	 */
	public void setCPassWord(String cPassWord) {
		CPassWord = cPassWord;
	}
	/**
	 * @return the cSex
	 */
	public String getCSex() {
		return CSex;
	}
	/**
	 * @param cSex the cSex to set
	 */
	public void setCSex(String cSex) {
		CSex = cSex;
	}
	/**
	 * @return the cCard
	 */
	public String getCCard() {
		return CCard;
	}
	/**
	 * @param cCard the cCard to set
	 */
	public void setCCard(String cCard) {
		CCard = cCard;
	}
	/**
	 * @return the cAddress
	 */
	public String getCAddress() {
		return CAddress;
	}
	/**
	 * @param cAddress the cAddress to set
	 */
	public void setCAddress(String cAddress) {
		CAddress = cAddress;
	}
	/**
	 * @return the payPWD
	 */
	public String getPayPWD() {
		return PayPWD;
	}
	/**
	 * @param payPWD the payPWD to set
	 */
	public void setPayPWD(String payPWD) {
		PayPWD = payPWD;
	}
	/**
	 * @return the cName
	 */
	public String getCName() {
		return CName;
	}
	/**
	 * @param cName the cName to set
	 */
	public void setCName(String cName) {
		CName = cName;
	}
	/**
	 * @return the cEmail
	 */
	public String getCEmail() {
		return CEmail;
	}
	/**
	 * @param cEmail the cEmail to set
	 */
	public void setCEmail(String cEmail) {
		CEmail = cEmail;
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
		return "Client [cid=" + cid + ", CPhone=" + CPhone + ", CPassWord=" + CPassWord + ", CSex=" + CSex + ", CCard="
				+ CCard + ", CAddress=" + CAddress + ", PayPWD=" + PayPWD + ", CName=" + CName + ", CEmail=" + CEmail
				+ ", createUser=" + createUser + ", createTime=" + createTime + ", updateUser=" + updateUser
				+ ", updateTime=" + updateTime + "]";
	}
	
	

}
