package tools;



import com.alibaba.fastjson.JSONObject;

import java.net.URL;
import java.util.HashMap;
import java.util.Map;

public class AddressUtil {
    public static Map<String,Object> getAddress(String log, String lat ){
        //lat 小 log 大
        //参数解释: 纬度,经度 type 001 (100代表道路，010代表POI，001代表门址，111可以同时显示前三项)
        String urlString = "http://api.map.baidu.com/geocoder/v2/?ak=f72BmbnulkYkxmS3YGqz94CTmutP0jbL&location="+lat+","+log+"&output=json&pois=1";
        String res = "";
        Map map=new HashMap();
        try {
            URL url = new URL(urlString);
            java.net.HttpURLConnection conn = (java.net.HttpURLConnection)url.openConnection();
            conn.setDoOutput(true);
            conn.setRequestMethod("POST");
            java.io.BufferedReader in = new java.io.BufferedReader(new java.io.InputStreamReader(conn.getInputStream(),"UTF-8"));
            String line;
            while ((line = in.readLine()) != null) {
                res += line+"\n";
            }
            in.close();
            if(!res.isEmpty()){
              JSONObject jb=  JSONObject.parseObject(res);
                map =    jb.getInnerMap();
            }
        } catch (Exception e) {
        }
        return map;
    }

}