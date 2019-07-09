package tools;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.Locale;

public class DateUtil {

    public static Long timestamp() {
        long timeStampSec = System.currentTimeMillis() / 1000;
        String timestamp = String.format("%010d", timeStampSec);
        return Long.parseLong(timestamp);
    }

    public static Integer timestamp2() {
        long timeStampSec = System.currentTimeMillis() / 1000;
        String timestamp = String.format("%010d", timeStampSec);
        return Integer.parseInt(timestamp);
    }

    /**
     * method 将字符串类型的日期转换为一个timestamp（时间戳记java.sql.Timestamp）
     * dateString 需要转换为timestamp的字符串
     * dataTime timestamp
     */
    public static java.sql.Timestamp string2Time(String dateString)
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
    public static java.sql.Date string2Date(String dateString)
            throws java.lang.Exception {
        DateFormat dateFormat;
        dateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
        dateFormat.setLenient(false);
        java.util.Date timeDate = dateFormat.parse(dateString);//util类型
        java.sql.Date dateTime = new java.sql.Date(timeDate.getTime());//sql类型
        return dateTime;
    }


    public static String date2String(LocalDateTime date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
        return sdf.format(date);
    }

    public static Integer deffTime(LocalDateTime left, LocalDateTime right) {
        Long c = right.atZone(ZoneId.systemDefault()).toInstant().getEpochSecond() -left.atZone(ZoneId.systemDefault()).toInstant().getEpochSecond();
        if (c < 60) return 1;
        return  (int) (c / 60);
    }
    public static Long GetDateSecond(LocalDateTime left) {
      return left.atZone(ZoneId.systemDefault()).toInstant().getEpochSecond();
    }
    /**
     * method 将字符串类型的日期转换为一个Date（java.sql.Date）
     * dateString 需要转换为Date的字符串
     * dataTime Date
     */
    public static Timestamp date2Timestamp(Date date) {
        //第一种方法：使用new Timestamp(long)
        Timestamp t = new Timestamp(date.getTime());
        return t;
    }
}
