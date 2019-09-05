package com.houpu.utils;

public enum ImagePath {

	/**
	 * 59的地址
	 * 
	 */
	EXHIBITION_IMAGE("/var/www/html/vhosts/asyware/dev/travelShop/assets/EXHIBITION/"),
	COMMERCIALS_IMAGE("/var/www/html/vhosts/asyware/dev/travelShop/assets/COMMERCIALS/"),
	SHARE_IMAGE("/var/www/html/vhosts/asyware/dev/travelShop/assets/SHARE_IMAGE/"),
	BASE_IMAGE("http://IP:端口/api/image/");
	
	/**
	 * 192的地址
	 * 
	 * EXHIBITION_IMAGE("/share/www/services/image/"),
	   COMMERCIALS_IMAGE("/share/www/services/image/"),
	   SHARE_IMAGE("/share/www/services/image/"),
	   BASE_IMAGE("http://IP:端口/api/image/");
	 *
	 */
	
	
	
//	EXHIBITION_IMAGE("D:\\images\\pic\\"),//多图
//	CONTENT_IMAGE("D:\\images\\content\\"),//长图
//	SHARE_IMAGE("D:\\images\\share\\");//分享图
	
	public String getValue() {
		return value;
	}
 
	public void setValue(String value) {
		this.value = value;
	}
 
	private String value;
	
	
	
	ImagePath(String value) {
		this.value = value;
	}
	
	/**
	 * 获取配置文件参数名
	 * @return
	 */
	public String value() {
		return value;
	}
	


}
