package constant;

import java.util.ArrayList;
import java.util.List;

public class ApiConstant {
    // =====================RMS begin====================

    public static final String BASE = "";

    public static final String ACCOUNT = BASE + "/account/";

    public static final String ORG = BASE + "/org/";

    public static final String ATTENDANCE = BASE + "/attendance/";
    //无需验证的route
    public static final List<String> NOTAUTHROUTES=new ArrayList<String>(){
        {
            add("/account/account/login");
        }
    };
    public static boolean Contains(String url){
      return   NOTAUTHROUTES.contains(url);
    }
}
