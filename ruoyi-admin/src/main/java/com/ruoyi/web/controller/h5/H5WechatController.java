package com.ruoyi.web.controller.h5;

import com.ruoyi.common.core.domain.AjaxResult;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.security.MessageDigest;
import java.util.*;

/**
 * H5 微信 JSSDK Controller
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/api/h5/wechat")
public class H5WechatController {

    @Value("${wechat.appId:}")
    private String appId;

    @Value("${wechat.appSecret:}")
    private String appSecret;

    // AccessToken 缓存
    private static String cachedAccessToken = null;
    private static long accessTokenExpireTime = 0;

    // JsapiTicket 缓存
    private static String cachedJsapiTicket = null;
    private static long jsapiTicketExpireTime = 0;

    private final RestTemplate restTemplate = new RestTemplate();

    /**
     * 获取 JSSDK 配置信息（用于前端 wx.config）
     *
     * @param url 当前页面URL（必须是调用JS接口页面的完整URL）
     * @return JSSDK 配置信息
     */
    @GetMapping("/config")
    public AjaxResult getJssdkConfig(@RequestParam String url) {
        try {
            // 检查配置
            if (appId == null || appId.isEmpty() || appSecret == null || appSecret.isEmpty()) {
                return AjaxResult.error("微信配置未完成，请在 application.yml 中配置 wechat.appId 和 wechat.appSecret");
            }

            // 获取 jsapi_ticket
            String jsapiTicket = getJsapiTicket();
            if (jsapiTicket == null) {
                return AjaxResult.error("获取 jsapi_ticket 失败");
            }

            // 生成签名
            String nonceStr = UUID.randomUUID().toString().replace("-", "");
            long timestamp = System.currentTimeMillis() / 1000;
            String signature = generateSignature(jsapiTicket, nonceStr, timestamp, url);

            // 返回配置信息
            Map<String, Object> config = new HashMap<>();
            config.put("appId", appId);
            config.put("timestamp", timestamp);
            config.put("nonceStr", nonceStr);
            config.put("signature", signature);

            return AjaxResult.success(config);
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error("生成 JSSDK 配置失败: " + e.getMessage());
        }
    }

    /**
     * 获取 Access Token（带缓存）
     *
     * @return access_token
     */
    private String getAccessToken() {
        // 检查缓存是否有效（提前 5 分钟刷新）
        if (cachedAccessToken != null && System.currentTimeMillis() < accessTokenExpireTime - 300000) {
            return cachedAccessToken;
        }

        try {
            String url = String.format(
                "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=%s&secret=%s",
                appId, appSecret
            );

            Map<String, Object> response = restTemplate.getForObject(url, Map.class);

            if (response != null && response.containsKey("access_token")) {
                cachedAccessToken = (String) response.get("access_token");
                Integer expiresIn = (Integer) response.get("expires_in");
                accessTokenExpireTime = System.currentTimeMillis() + (expiresIn * 1000L);

                System.out.println("获取 access_token 成功，有效期: " + expiresIn + "秒");
                return cachedAccessToken;
            } else {
                System.err.println("获取 access_token 失败: " + response);
                return null;
            }
        } catch (Exception e) {
            System.err.println("获取 access_token 异常: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 获取 Jsapi Ticket（带缓存）
     *
     * @return jsapi_ticket
     */
    private String getJsapiTicket() {
        // 检查缓存是否有效（提前 5 分钟刷新）
        if (cachedJsapiTicket != null && System.currentTimeMillis() < jsapiTicketExpireTime - 300000) {
            return cachedJsapiTicket;
        }

        String accessToken = getAccessToken();
        if (accessToken == null) {
            return null;
        }

        try {
            String url = String.format(
                "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=%s&type=jsapi",
                accessToken
            );

            Map<String, Object> response = restTemplate.getForObject(url, Map.class);

            if (response != null && response.containsKey("ticket")) {
                cachedJsapiTicket = (String) response.get("ticket");
                Integer expiresIn = (Integer) response.get("expires_in");
                jsapiTicketExpireTime = System.currentTimeMillis() + (expiresIn * 1000L);

                System.out.println("获取 jsapi_ticket 成功，有效期: " + expiresIn + "秒");
                return cachedJsapiTicket;
            } else {
                System.err.println("获取 jsapi_ticket 失败: " + response);
                return null;
            }
        } catch (Exception e) {
            System.err.println("获取 jsapi_ticket 异常: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 生成签名
     *
     * @param jsapiTicket jsapi_ticket
     * @param nonceStr 随机字符串
     * @param timestamp 时间戳
     * @param url 当前网页的URL
     * @return 签名
     */
    private String generateSignature(String jsapiTicket, String nonceStr, long timestamp, String url) {
        try {
            // 参数按字典序排序并拼接
            String string1 = String.format(
                "jsapi_ticket=%s&noncestr=%s&timestamp=%d&url=%s",
                jsapiTicket, nonceStr, timestamp, url
            );

            System.out.println("签名字符串: " + string1);

            // SHA1 加密
            MessageDigest digest = MessageDigest.getInstance("SHA-1");
            byte[] hash = digest.digest(string1.getBytes("UTF-8"));

            // 转换为十六进制字符串
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }

            return hexString.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
