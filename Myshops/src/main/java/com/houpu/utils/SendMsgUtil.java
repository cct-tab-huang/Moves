package com.houpu.utils;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

/** 
* 类说明 :SMS_webchinese发送短信util
*/
public class SendMsgUtil {
	
	public static HashMap<String,String> getMessageStatus(String phone,HttpServletRequest request){
		HashMap<String,String> map=new HashMap<String,String>();
		
		HttpClient client = new HttpClient();
		
		PostMethod post = new PostMethod("http://gbk.sms.webchinese.cn"); //sms平台接口
		post.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=gbk");//在头文件中设置编码集格式
		
		int num=(int)((Math.random()*9+1)*100000);//6位数验证码
		String num1=num+"";
		map.put("num", num1);
		String code=num+"";
		HttpSession session=request.getSession();
		session.setAttribute("code", code);
		NameValuePair[] data ={ 
				new NameValuePair("Uid", "zhangmei"),//sms平台的用户名
				new NameValuePair("Key", "d41d8cd98f00b204e980"),//短信秘钥，不是密码
				new NameValuePair("smsMob",phone),//目的手机号码，多个手机号用半角逗号隔开
				new NameValuePair("smsText","本次验证码为:"+code+""+"，有效时间为5分钟")};//短信内容，自定义
		map.put("code", code);
		post.setRequestBody(data);
 
		try {
			client.executeMethod(post);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//打印状态码和响应头信息
		int statusCode = post.getStatusCode();
		System.out.println("statusCode:"+statusCode);
		Header[] headers = post.getResponseHeaders();
		for(Header h : headers)
		{
			System.out.println(h.toString());
		}
		
	
		String result = null;
		try {
			result = new String(post.getResponseBodyAsString().getBytes("gbk"));
		} catch (IOException e) {
			e.printStackTrace();
		} 
		System.out.println(result); //打印返回的消息状态
		map.put("result", result);
		post.releaseConnection();
		return map;
	}	
}

