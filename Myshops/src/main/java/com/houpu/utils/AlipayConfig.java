package com.houpu.utils;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
	//开发者中心 / 研发服务 / 沙箱环境 / 沙箱应用/ 信息配置/ 必看部分/ APPID（填自己的，下面都是改过的~）
    public static String app_id = "2016101400681670";
    
    //开发者中心 / 研发服务 / 沙箱环境 / 沙箱应用/ 信息配置/ 必看部分/ 生成公钥时对应的私钥（填自己的，下面都是改过的~）
    public static String private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCzsnASaiVUozyHzxvfeaKKPhfQcFbecImWeyyq4q3A/Gdj6XnQH10XDdXv3ZXgT+DclD4inZRZwaQYGTM3MuPr6YNNqAc2QR2V9AtDfWN6L3KtpzYUBvqae+wC8kt3An6oLfZmtlpXrqODIV/Q9aThoT2AFaQb+3JNhOMXmHTCCRKDWzR70AYHC8tICLVriz/Ab6uhKY8eWgID9PcyZm/159vdVTQOCzW4x0vMFhenwfS+TLrO3ghfLxk1/TRFHrSsyGYeHSjtKkFm8XMoC4eMY8uyN2+xKuqi5F5FmgMAxPnLmX/OdmnoGQDjjUVPf3YmQUFHIf54Fsm5dtZEYRRJAgMBAAECggEAIaVkhJ4pVTqnR8qIroRI4deUf+u46DdsG6f+ihSdcggQl82MiGKG/J0TlLEJshFiygpbxAF7WH8AaZ62TzyRHof/lNfEWe1BS+WBAmcE7EjcERXA82kHHUvcugSCCsuFyZmpjDvSmJ5TcWcbWLXV5IVbTZM/whmHomoiVzWtjvLxmY6nTdOn25k5xktZaXFkTq1TLKOLV/8LEzrJunzMPCOEM75Fpc4ajr87ssEx4X2GtZkYs059dz7xzxIjTUgmXoNevOuWZCS5GkJRlSVDKBWI+EDi/KD4QuilsV0xpJq1hDV524JaGhYBwTPjUDlEiQ4yS4TiSfweu05XjvoILQKBgQDXQTgSsfIC93o1jS6Zew+NtdAb+GVpPjFVa01+KdxQpag0oGt6DUlyL3OVsnO37HznLnjNG3QR5eHSC+Qb9uyFBrfWWM8deKvhBov4QsqJiI0WSc8fPdjRr7hIm3DSkyzdMmmbZXuJTXVMS7SEKlR7gSsh1u0v9tC419pn9umMvwKBgQDVtirf7/u57vruYiSylvJdZvI4ZLg3E14UdqbTsdicl5+XZesNuKmOXJ+pSn7qc2lutugjRDw806Bppjqs4JOery/ZgzTmOL3wPhxsiFuV0mwvZL0dM8EmMy3ob2pSH/AQb/wBrheSLIbLNBH9VI3+/5JENBPj3t+zeOxLT1+49wKBgCKRscym0UQStIi3JL23WrcadNKZIMg3GbsrIWXamSxGfm39OWV/jsUMw9ZNs3HdQ+3os7PU7d4V+h8+k6K+FBwFCS8eUhzcjVX1NDNpnpdZ27axodbVmuWJ/+GBPSxEQJdBil5PfPh+/RCEs/fpyGmRQ/kKSEtEqx6UY9oAeF+HAoGAOIFh9LPPKuo1DrKEYXPnwSpnAOIgku9cAK0ejvqG+2BbofwgmhApRKrYzDoWNIcvaUaTOj/gbXTHBSgee3clkN9hF3HJmtWF4u+JNGkZThPE5wMLvZzhhOgjS0GqKuym3LG/P/J36P485Z1u5DxnDvUkB0R9vdI/84QVdhQWiyECgYEArm22ZKU0RHULOOJS5WNZ2RLUPvkmLjARILXDFeJD3NF8LQgH5RxJ4sJFgq6xrQ1zTbII5BuYdReXQHnjbSsQ98+DHkZXUiRgp0BtlXh2+vuIo/jMh11yfvCjrVOzOHksARh/2+988JYJlA7tLzRRVOWAldQ1X9SMrXbDWhcoRkU=";
    
    //Controller Mapping:得放到服务器上，且使用域名解析 IP
    public static String notify_url = "http://127.0.0.1:8080/Myshops/logoshopstatus?status=1";
    
    //Controller Mapping:得放到服务器上，且使用域名解析 IP
    public static String return_url = "http://127.0.0.1:8080/Myshops/index";
    
    //开发者中心 / 研发服务 / 沙箱环境 / 沙箱应用/ 信息配置/ 必看部分/ 支付宝网关（注意沙箱alipaydev，正式则为 alipay）
    public static String url = "https://openapi.alipaydev.com/gateway.do";
    
    public static String charset = "UTF-8";
    
    public static String format = "json";
    
    //开发者中心 / 研发服务 / 沙箱环境 / 沙箱应用/ 信息配置/ 必看部分/ 公钥（填自己的，下面都是改过的~）
    public static String public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAs7JwEmolVKM8h88b33miij4X0HBW3nCJlnssquKtwPxnY+l50B9dFw3V792V4E/g3JQ+Ip2UWcGkGBkzNzLj6+mDTagHNkEdlfQLQ31jei9yrac2FAb6mnvsAvJLdwJ+qC32ZrZaV66jgyFf0PWk4aE9gBWkG/tyTYTjF5h0wgkSg1s0e9AGBwvLSAi1a4s/wG+roSmPHloCA/T3MmZv9efb3VU0Dgs1uMdLzBYXp8H0vky6zt4IXy8ZNf00RR60rMhmHh0o7SpBZvFzKAuHjGPLsjdvsSrqouReRZoDAMT5y5l/znZp6BkA441FT392JkFBRyH+eBbJuXbWRGEUSQIDAQAB";
    
    public static String signtype = "RSA2";
	

}

