package com.houpu.model;

public class orderShop {


	//订单编号
	private long oid;
	// 员工编号客户电话号码
	private long uid;
	//运单号
	private String trackingNumber;
	//订单总价
	private double zMoney;
	// 订单大小
	private String yfSize;
	// 客户编号
	private long cid;
	// 订单编号
	private String orderNum;
	// 订单状态
	private Integer orderStatus;
	// 订单数量
	private Integer number;

	private String createUser;
	// 创建时间
	private String createTime;
	// 修改者
	private String updateUser;
	// 修改时间
	private String updateTime;
	//发货人
	private String trackingUser;
	//发货时间
	private String trackingTime;
	
	private Shop shop;

	public long getOid() {
		return oid;
	}

	public void setOid(long oid) {
		this.oid = oid;
	}

	public long getUid() {
		return uid;
	}

	public void setUid(long uid) {
		this.uid = uid;
	}

	public String getTrackingNumber() {
		return trackingNumber;
	}

	public void setTrackingNumber(String trackingNumber) {
		this.trackingNumber = trackingNumber;
	}

	public double getzMoney() {
		return zMoney;
	}

	public void setzMoney(double zMoney) {
		this.zMoney = zMoney;
	}

	public String getYfSize() {
		return yfSize;
	}

	public void setYfSize(String yfSize) {
		this.yfSize = yfSize;
	}

	public long getCid() {
		return cid;
	}

	public void setCid(long cid) {
		this.cid = cid;
	}

	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}

	public Integer getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
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

	public String getTrackingUser() {
		return trackingUser;
	}

	public void setTrackingUser(String trackingUser) {
		this.trackingUser = trackingUser;
	}

	public String getTrackingTime() {
		return trackingTime;
	}

	public void setTrackingTime(String trackingTime) {
		this.trackingTime = trackingTime;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	@Override
	public String toString() {
		return "orderShop [oid=" + oid + ", uid=" + uid + ", trackingNumber=" + trackingNumber + ", zMoney=" + zMoney
				+ ", yfSize=" + yfSize + ", cid=" + cid + ", orderNum=" + orderNum + ", orderStatus=" + orderStatus
				+ ", number=" + number + ", createUser=" + createUser + ", createTime=" + createTime + ", updateUser="
				+ updateUser + ", updateTime=" + updateTime + ", trackingUser=" + trackingUser + ", trackingTime="
				+ trackingTime + ", shop=" + shop + "]";
	}

	
}
