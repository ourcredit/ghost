package com.monkey.app.common;


import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.monkey.app.application.IIMUserService;
import com.monkey.app.entity.IMUser;
import com.monkey.tenant.CurrentTenant;
import org.apache.http.Header;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.CoreConnectionPNames;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.nio.charset.Charset;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@Component
public class ControllerUtil {

    @Resource
    @Qualifier(value = "imUserService")
    private IIMUserService iOnImuserService;

    @Value("${cloudtalk.api.url}")
    public String cloudTalkHttpApi;


    public void sendIMSystemMessage(int cmd, int uid, String msg) {
        Map<String, Object> p = new LinkedHashMap<>();
        p.put("app_key", "asdfsdf");
        p.put("req_user_id", 1);
        p.put("to_session_id", uid);
        p.put("msg_type", cmd);
        p.put("msg_data", msg);
        p.put("from_user_id", 1);
        String poststr = new JSONObject(p).toJSONString();

        httpPostWithJson(poststr);
    }


    public boolean httpPostWithJson(String msg) {
        boolean isSuccess = false;
        HttpPost post = null;
        try {
            HttpClient httpClient = new DefaultHttpClient();

            // 设置超时时间
            httpClient.getParams().setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, 2000);
            httpClient.getParams().setParameter(CoreConnectionPNames.SO_TIMEOUT, 2000);

            post = new HttpPost(cloudTalkHttpApi);
            // 构造消息头
            post.setHeader("Content-type", "application/json; charset=utf-8");
            post.setHeader("Connection", "Close");
            String sessionId = getSessionId();
            post.setHeader("SessionId", sessionId);

            // 构建消息实体
            StringEntity entity = new StringEntity(msg, Charset.forName("UTF-8"));
            entity.setContentEncoding("UTF-8");
            // 发送Json格式的数据请求
            entity.setContentType("application/json");
            post.setEntity(entity);

            HttpResponse response = httpClient.execute(post);

            // 检验返回码
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode != HttpStatus.SC_OK) {
                isSuccess = false;
            } else {
                int retCode = 0;
                String sessendId = "";
                // 返回码中包含retCode及会话Id
                for (Header header : response.getAllHeaders()) {
                    if (header.getName().equals("retcode")) {
                        retCode = Integer.parseInt(header.getValue());
                    }
                    if (header.getName().equals("SessionId")) {
                        sessendId = header.getValue();
                    }
                }
                isSuccess = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            isSuccess = false;
        } finally {
            if (post != null) {
                try {
                    post.releaseConnection();
                    Thread.sleep(500);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }
        return isSuccess;
    }


    public int getRandom(int count) {
        return (int) Math.round(Math.random() * (count));
    }

    public String string = "abcdefghijklmnopqrstuvwxyzABCDEFG123456789";

    public String getRandomString(int length) {
        StringBuffer sb = new StringBuffer();
        int len = string.length();
        for (int i = 0; i < length; i++) {
            sb.append(string.charAt(getRandom(len - 1)));
        }
        return sb.toString();
    }

    // 构建唯一会话Id
    public static String getSessionId() {
        UUID uuid = UUID.randomUUID();
        String str = uuid.toString();
        return str.substring(0, 8) + str.substring(9, 13) + str.substring(14, 18) + str.substring(19, 23) + str.substring(24);
    }

    public int getIntParameter(HttpServletRequest req, String key, int def) {
        String value = req.getParameter(key);
        if (value != null && value != "") {
            return Integer.parseInt(value);
        } else {
            return def;
        }
    }

    public double getDoubleParameter(HttpServletRequest req, String key, double def) {
        String value = req.getParameter(key);
        if (value != null && value != "") {
            return Double.parseDouble(value);
        } else {
            return def;
        }
    }

    public String getStringParameter(HttpServletRequest req, String key, String def) {
        String value = req.getParameter(key);
        if (value != null && value != "") {
            return value;
        } else {
            return def;
        }
    }

    public IMUser checkToken(HttpServletRequest req) {
        String appId = req.getHeader("appid");
        String token = req.getHeader("token");
        if (appId == null || appId == "") {
            appId = req.getParameter("appid");
            token = req.getParameter("token");
        }
        if (token == null || token == "") return null;

        IMUser user = iOnImuserService.getOne(new QueryWrapper<IMUser>().eq("appId", appId).eq("api_token", token));
        return user;
    }

    public Long timestamp() {
        long timeStampSec = System.currentTimeMillis() / 1000;
        String timestamp = String.format("%010d", timeStampSec);
        return Long.parseLong(timestamp);
    }

    public Integer timestamp2() {
        long timeStampSec = System.currentTimeMillis() / 1000;
        String timestamp = String.format("%010d", timeStampSec);
        return Integer.parseInt(timestamp);
    }

    /**
     * method 将字符串类型的日期转换为一个timestamp（时间戳记java.sql.Timestamp）
     * dateString 需要转换为timestamp的字符串
     * dataTime timestamp
     */
    public java.sql.Timestamp string2Time(String dateString)
            throws java.text.ParseException {
        DateFormat dateFormat;
        dateFormat = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss.SSS", Locale.ENGLISH);//设定格式
        //dateFormat = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss", Locale.ENGLISH);
        dateFormat.setLenient(false);
        java.util.Date timeDate = dateFormat.parse(dateString);//util类型
        java.sql.Timestamp dateTime = new java.sql.Timestamp(timeDate.getTime());//Timestamp类型,timeDate.getTime()返回一个long型
        return dateTime;
    }

    /**
     * method 将字符串类型的日期转换为一个Date（java.sql.Date）
     * dateString 需要转换为Date的字符串
     * dataTime Date
     */
    public java.sql.Date string2Date(String dateString)
            throws java.lang.Exception {
        DateFormat dateFormat;
        dateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
        dateFormat.setLenient(false);
        java.util.Date timeDate = dateFormat.parse(dateString);//util类型
        java.sql.Date dateTime = new java.sql.Date(timeDate.getTime());//sql类型
        return dateTime;
    }


    public String date2String(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
        return sdf.format(date);
    }

    public Integer deffTime(Date left, Date right) {
        Long b = right.getTime() - left.getTime();
        Integer c = (int) (b / 1000);
        if (c < 60) return 1;
        c = (int) (c / 60);
        return c;
    }

    /**
     * method 将字符串类型的日期转换为一个Date（java.sql.Date）
     * dateString 需要转换为Date的字符串
     * dataTime Date
     */
    public Timestamp date2Timestamp(Date date) {
        //第一种方法：使用new Timestamp(long)
        Timestamp t = new Timestamp(date.getTime());
        return t;
    }
}
