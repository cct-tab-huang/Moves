package com.houpu.model;

public class Shop {

	// 商品id
	private long sid;
	// 商品名
	private String SName;
	// 商品价格
	private double SMoney;
	// 商品数量
	private int SSum;
	//销售量
	private int salSum;
	// 商品简介
	private String SIntro;

	// 商品图片
	private String Simg;

	// 品牌id
	private long BrandId;

	// 创建者
	private String createUser;
	// 创建时间
	private String createTime;
	// 修改者
	private String updateUser;
	// 修改时间
	private String updateTime;
	// 添加商品者的id
	private long UId;
	//商家id
	private long CId;
	
	private Brand brand;
	
	private User user;

	private Integer recommend;

	public long getSid() {
		return sid;
	}

	public void setSid(long sid) {
		this.sid = sid;
	}

	public String getSName() {
		return SName;
	}

	public void setSName(String sName) {
		SName = sName;
	}

	public double getSMoney() {
		return SMoney;
	}

	public void setSMoney(double sMoney) {
		SMoney = sMoney;
	}

	public int getSSum() {
		return SSum;
	}

	public void setSSum(int sSum) {
		SSum = sSum;
	}

	public int getSalSum() {
		return salSum;
	}

	public void setSalSum(int salSum) {
		this.salSum = salSum;
	}

	public String getSIntro() {
		return SIntro;
	}

	public void setSIntro(String sIntro) {
		SIntro = sIntro;
	}

	public String getSimg() {
		return Simg;
	}

	public void setSimg(String simg) {
		Simg = simg;
	}

	public long getBrandId() {
		return BrandId;
	}

	public void setBrandId(long brandId) {
		BrandId = brandId;
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

	public long getUId() {
		return UId;
	}

	public void setUId(long uId) {
		UId = uId;
	}

	public long getCId() {
		return CId;
	}

	public void setCId(long cId) {
		CId = cId;
	}

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getRecommend() {
		return recommend;
	}

	public void setRecommend(Integer recommend) {
		this.recommend = recommend;
	}

	@Override
	public String toString() {
		return "Shop [sid=" + sid + ", SName=" + SName + ", SMoney=" + SMoney + ", SSum=" + SSum + ", salSum=" + salSum
				+ ", SIntro=" + SIntro + ", Simg=" + Simg + ", BrandId=" + BrandId + ", createUser=" + createUser
				+ ", createTime=" + createTime + ", updateUser=" + updateUser + ", updateTime=" + updateTime + ", UId="
				+ UId + ", CId=" + CId + ", brand=" + brand + ", user=" + user + ", recommend=" + recommend + "]";
	}
	
	
}
