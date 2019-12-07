package com.cf.util;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import org.apache.commons.lang3.StringUtils;


/**
 * 日期时间工具类，进行各种日期时间格式的转化以及格式化
 *
 * @author 郑伟彬
 */
public class DateTimeUtil {
	public final static int TIME_DAY_MILLISECOND = 86400000;
	public final static int TIME_HOUR_MILLISECOND = 3600000;
    public final static int TIME_MINUTE_MILLISECOND = 60000;
    // /
    // 定义时间日期显示格式
    // /
    private final static String DATE_FORMAT = "yyyy-MM-dd";

    private final static String DATE_FORMAT_CN = "yyyy年MM月dd日";

    private final static String TIME_FORMAT = "yyyy-MM-dd HH:mm:ss";

    private final static String TIME_FORMAT_CN = "yyyy年MM月dd日 HH:mm:ss";

    private final static String MONTH_FORMAT = "yyyy-MM";

    private final static String DAY_FORMAT = "yyyyMMdd";

    // private final static String TIME_FORMAT_MILLI = "yyyy-MM-dd
    // HH:mm:ss.SSS";

    /**
     * 取得当前系统时间，返回java.util.Date类型
     *
     * @see java.util.Date
     * @return java.util.Date 返回服务器当前系统时间
     */
    public static java.util.Date getCurrDate() {
    	TimeZone time = TimeZone.getTimeZone("GMT+8"); //设置为东八区
//    	time = TimeZone.getDefault();// 这个是国际化所用的
    	TimeZone.setDefault(time);// 设置时区
    	Calendar calendar = Calendar.getInstance();// 获取实例
    	Date date = calendar.getTime(); //获取Date对象
        return  date;
    }

    /**
     * 取得当前系统时间戳
     *
     * @see java.sql.Timestamp
     * @return java.sql.Timestamp 系统时间戳
     */
    public static java.sql.Timestamp getCurrTimestamp() {
        return new java.sql.Timestamp(System.currentTimeMillis());
    }

  
    /**
     * 返回当前时间是上午还是下午
     *
     * @see Calendar.AM 0
     * @see Calendar.PM 1
     * @return
     */
    public static Integer getCurrDateAMorPM() {
        Calendar calendar = Calendar.getInstance();
        return calendar.get(Calendar.AM_PM);
    }

    /**
     * 得到格式化后的日期，格式为yyyy-MM-dd，如2006-02-15
     *
     * @param currDate
     *                要格式化的日期
     * @see #getFormatDate(java.util.Date, String)
     * @return String 返回格式化后的日期，默认格式为为yyyy-MM-dd，如2006-02-15
     */
    public static String getFormatDate(java.util.Date currDate) {
        return getFormatDate(currDate, DATE_FORMAT);
    }

    /**
     * 得到格式化后的日期，格式为yyyy-MM-dd，如2006-02-15
     *
     * @param currDate
     *                要格式化的日期
     * @see #getFormatDate(java.util.Date)
     * @return Date 返回格式化后的日期，默认格式为为yyyy-MM-dd，如2006-02-15
     */
    public static Date getFormatDateToDate(java.util.Date currDate) {
        return getFormatDate(getFormatDate(currDate));
    }

    /**
     * 得到格式化后的日期，格式为yyyy年MM月dd日，如2006年02月15日
     *
     * @param currDate
     *                要格式化的日期
     * @see #getFormatDate(java.util.Date, String)
     * @return String 返回格式化后的日期，默认格式为yyyy年MM月dd日，如2006年02月15日
     */
    public static String getFormatDate_CN(java.util.Date currDate) {
        return getFormatDate(currDate, DATE_FORMAT_CN);
    }

    /**
     * 得到格式化后的日期，格式为yyyy年MM月dd日，如2006年02月15日
     *
     * @param currDate
     *                要格式化的日期
     * @see #getFormatDate_CN(String)
     * @return Date 返回格式化后的日期，默认格式为yyyy年MM月dd日，如2006年02月15日
     */
    public static Date getFormatDateToDate_CN(java.util.Date currDate) {
        return getFormatDate_CN(getFormatDate_CN(currDate));
    }

    /**
     * 得到格式化后的日期，格式为yyyy-MM-dd，如2006-02-15
     *
     * @param currDate
     *                要格式化的日期
     * @see #getFormatDate(String, String)
     * @return Date 返回格式化后的日期，默认格式为yyyy-MM-dd，如2006-02-15
     */
    public static Date getFormatDate(String currDate) {
        return getFormatDate(currDate, DATE_FORMAT);
    }

    /**
     * 得到格式化后的日期，格式为yyyy年MM月dd日，如2006年02月15日
     *
     * @param currDate
     *                要格式化的日期
     * @see #getFormatDate(String, String)
     * @return 返回格式化后的日期，默认格式为yyyy年MM月dd日，如2006年02月15日
     */
    public static Date getFormatDate_CN(String currDate) {
        return getFormatDate(currDate, DATE_FORMAT_CN);
    }

    /**
     * 根据格式得到格式化后的日期
     *
     * @param currDate
     *                要格式化的日期
     * @param format
     *                日期格式，如yyyy-MM-dd
     * @see java.text.SimpleDateFormat#format(java.util.Date)
     * @return String 返回格式化后的日期，格式由参数<code>format</code>
     *         定义，如yyyy-MM-dd，如2006-02-15
     */
    public static String getFormatDate(java.util.Date currDate, String format) {
        if (currDate == null) {
            return "";
        }
        SimpleDateFormat dtFormatdB = null;
        try {
            dtFormatdB = new SimpleDateFormat(format);
            return dtFormatdB.format(currDate);
        } catch (Exception e) {
            dtFormatdB = new SimpleDateFormat(DATE_FORMAT);
            try {
                return dtFormatdB.format(currDate);
            } catch (Exception ex) {
            }
        }
        return null;
    }

    /**
     * 得到格式化后的时间，格式为yyyy-MM-dd HH:mm:ss，如2006-02-15 15:23:45
     *
     * @param currDate
     *                要格式化的时间
     * @see #getFormatDateTime(java.util.Date, String)
     * @return String 返回格式化后的时间，默认格式为yyyy-MM-dd HH:mm:ss，如2006-02-15
     *         15:23:45
     */
    public static String getFormatDateTime(java.util.Date currDate) {
        return getFormatDateTime(currDate, TIME_FORMAT);
    }

    /**
     * 得到格式化后的时间，格式为yyyy-MM-dd HH:mm:ss，如2006-02-15 15:23:45
     *
     * @param currDate
     *                要格式环的时间
     * @see #getFormatDateTime(String)
     * @return Date 返回格式化后的时间，默认格式为yyyy-MM-dd HH:mm:ss，如2006-02-15 15:23:45
     */
    public static Date getFormatDateTimeToTime(java.util.Date currDate) {
        return getFormatDateTime(getFormatDateTime(currDate));
    }

    /**
     * 得到格式化后的时间，格式为yyyy-MM-dd HH:mm:ss，如2006-02-15 15:23:45
     *
     * @param currDate
     *                要格式化的时间
     * @see #getFormatDateTime(String, String)
     * @return Date 返回格式化后的时间，默认格式为yyyy-MM-dd HH:mm:ss，如2006-02-15 15:23:45
     */
    public static Date getFormatDateTime(String currDate) {
        return getFormatDateTime(currDate, TIME_FORMAT);
    }

    /**
     * 得到格式化后的时间，格式为yyyy年MM月dd日 HH:mm:ss，如2006年02月15日 15:23:45
     *
     * @param currDate
     *                要格式化的时间
     * @see #getFormatDateTime(java.util.Date, String)
     * @return String 返回格式化后的时间，默认格式为yyyy年MM月dd日 HH:mm:ss，如2006年02月15日
     *         15:23:45
     */
    public static String getFormatDateTime_CN(java.util.Date currDate) {
        return getFormatDateTime(currDate, TIME_FORMAT_CN);
    }

    /**
     * 得到格式化后的时间，格式为yyyy年MM月dd日 HH:mm:ss，如2006年02月15日 15:23:45
     *
     * @param currDate
     *                要格式化的时间
     * @see #getFormatDateTime_CN(String)
     * @return Date 返回格式化后的时间，默认格式为yyyy年MM月dd日 HH:mm:ss，如2006年02月15日
     *         15:23:45
     */
    public static Date getFormatDateTimeToTime_CN(java.util.Date currDate) {
        return getFormatDateTime_CN(getFormatDateTime_CN(currDate));
    }

    /**
     * 得到格式化后的时间，格式为yyyy年MM月dd日 HH:mm:ss，如2006年02月15日 15:23:45
     *
     * @param currDate
     *                要格式化的时间
     * @see #getFormatDateTime(String, String)
     * @return Date 返回格式化后的时间，默认格式为yyyy年MM月dd日 HH:mm:ss，如2006年02月15日
     *         15:23:45
     */
    public static Date getFormatDateTime_CN(String currDate) {
        return getFormatDateTime(currDate, TIME_FORMAT_CN);
    }

    /**
     * 根据格式得到格式化后的时间
     *
     * @param currDate
     *                要格式化的时间
     * @param format
     *                时间格式，如yyyy-MM-dd HH:mm:ss
     * @see java.text.SimpleDateFormat#format(java.util.Date)
     * @return String 返回格式化后的时间，格式由参数<code>format</code>定义，如yyyy-MM-dd
     *         HH:mm:ss
     */
    public static String getFormatDateTime(java.util.Date currDate, String format) {
        if (currDate == null) {
            return "";
        }
        SimpleDateFormat dtFormatdB = null;
        try {
            dtFormatdB = new SimpleDateFormat(format);
            return dtFormatdB.format(currDate);
        } catch (Exception e) {
            dtFormatdB = new SimpleDateFormat(TIME_FORMAT);
            try {
                return dtFormatdB.format(currDate);
            } catch (Exception ex) {
            }
        }
        return "";
    }

    /**
     * 根据格式得到格式化后的日期
     *
     * @param currDate
     *                要格式化的日期
     * @param format
     *                日期格式，如yyyy-MM-dd
     * @see java.text.SimpleDateFormat#parse(java.lang.String)
     * @return Date 返回格式化后的日期，格式由参数<code>format</code>
     *         定义，如yyyy-MM-dd，如2006-02-15
     */
    public static Date getFormatDate(String currDate, String format) {
        if (currDate == null) {
            return null;
        }
        SimpleDateFormat dtFormatdB = null;
        try {
            dtFormatdB = new SimpleDateFormat(format);
            return dtFormatdB.parse(currDate);
        } catch (Exception e) {
            dtFormatdB = new SimpleDateFormat(DATE_FORMAT);
            try {
                return dtFormatdB.parse(currDate);
            } catch (Exception ex) {
            }
        }
        return null;
    }

    /**
     * 根据格式得到格式化后的时间
     *
     * @param currDate
     *                要格式化的时间
     * @param format
     *                时间格式，如yyyy-MM-dd HH:mm:ss
     * @see java.text.SimpleDateFormat#parse(java.lang.String)
     * @return Date 返回格式化后的时间，格式由参数<code>format</code>定义，如yyyy-MM-dd
     *         HH:mm:ss
     */
    public static Date getFormatDateTime(String currDate, String format) {
        if (currDate == null) {
            return null;
        }
        SimpleDateFormat dtFormatdB = null;
        try {
            dtFormatdB = new SimpleDateFormat(format);
            return dtFormatdB.parse(currDate);
        } catch (Exception e) {
            dtFormatdB = new SimpleDateFormat(TIME_FORMAT);
            try {
                return dtFormatdB.parse(currDate);
            } catch (Exception ex) {
            }
        }
        return null;
    }

    /**
     * 得到本日的上月时间 如果当日为2007-9-1,那么获得2007-8-1
     */
    public static String getDateBeforeMonth() {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.MONTH, -1);
        return getFormatDate(cal.getTime(), DATE_FORMAT);
    }

    /**
     * 得到本日的前几个月时间 如果number=2当日为2007-9-1,那么获得2007-7-1
     */
    public static String getDateBeforeMonth(int number) {
    	Calendar cal = Calendar.getInstance();
    	cal.add(Calendar.MONTH, -number);
    	return getFormatDate(cal.getTime(), DATE_FORMAT);
    }
    
    
    /**
     * 得到本日的后几个月时间 如果number=2当日为2007-9-1,那么获得2007-11-1
     */
    public static String getDateAfterMonth(int number) {
    	
    	TimeZone time = TimeZone.getTimeZone("GMT+8");
    	time = TimeZone.getDefault();
    	TimeZone.setDefault(time);
    	
    	Calendar cal = Calendar.getInstance();
    	cal.add(Calendar.MONTH, +number);
    	return getFormatDate(cal.getTime(), DATE_FORMAT);
    }
    
    /**
     * 得到指定日期的后几个月时间 如果number=2指定日期日为2007-9-1,那么获得2007-11-1
     */
    public static String getDesignatedDateAfterMonth(String date,int number) {
    	Calendar cal = null;
			try {
				TimeZone time = TimeZone.getTimeZone("GMT+8");
				time = TimeZone.getDefault();
				TimeZone.setDefault(time);
				
				SimpleDateFormat sft = new SimpleDateFormat("yyyy-MM-dd");
				Date fdate = sft.parse(date);
				cal = Calendar.getInstance();
				cal.setTime(fdate);
				cal.add(Calendar.MONTH, +number);
			} catch (ParseException e) {
					e.printStackTrace();
			}
      return getFormatDate(cal.getTime(), DATE_FORMAT);
    }

    
    public static long getDaysOfDates(Date first, Date second) {
        Date d1 = getFormatDateTime(getFormatDate(first), DATE_FORMAT);
        Date d2 = getFormatDateTime(getFormatDate(second), DATE_FORMAT);

        long mils = d1.getTime() - d2.getTime();

        return mils / (TIME_DAY_MILLISECOND);
    }

    /**
     * 获得两个Date型日期之间相差的天数（第2个减第1个）
     *
     * @param Date
     *                first, Date second
     * @return int 相差的天数
     */
    public static int getDaysBetweenDates(Date first, Date second) {
    	Date d1 = getFormatDateTime(getFormatDate(first), DATE_FORMAT);
    	Date d2 = getFormatDateTime(getFormatDate(second), DATE_FORMAT);
    	
    	Long mils = (d2.getTime() - d1.getTime()) / (TIME_DAY_MILLISECOND);
    	
    	return mils.intValue();
    }
    
    /**
     * 获得两个Date型日期之间相差的分钟数（第2个减第1个）
     *
     * @param Date
     *                first, Date second
     * @return int 相差的分钟数
     */
    public static int getMinutesBetweenDays(Date first, Date second) {
    	Date d1 = getFormatDateTime(getFormatDateTime(first), TIME_FORMAT);
    	Date d2 = getFormatDateTime(getFormatDateTime(second), TIME_FORMAT);
    	
    	Long mils = ((d2.getTime() - d1.getTime()) % TIME_DAY_MILLISECOND % TIME_HOUR_MILLISECOND) / TIME_MINUTE_MILLISECOND;
    	
    	return mils.intValue();
    }
    
    /**
     * 获得两个Date型日期之间相差的小时数（第2个减第1个）
     *
     * @param Date
     *                first, Date second
     * @return int 相差的小时数
     */
    public static int getHoursBetweenDays(Date first, Date second) {
        Date d1 = getFormatDateTime(getFormatDateTime(first), TIME_FORMAT);
        Date d2 = getFormatDateTime(getFormatDateTime(second), TIME_FORMAT);

        Long mils = ((d2.getTime() - d1.getTime()) % (TIME_DAY_MILLISECOND)) / TIME_HOUR_MILLISECOND;

        return mils.intValue();
    }

    /**
     * 获得两个String型日期之间相差的天数（第2个减第1个）
     *
     * @param String
     *                first, String second
     * @return int 相差的天数
     */
    public static int getDaysBetweenDates(String first, String second) {
        Date d1 = getFormatDateTime(first, DATE_FORMAT);
        Date d2 = getFormatDateTime(second, DATE_FORMAT);

        Long mils = (d2.getTime() - d1.getTime()) / (TIME_DAY_MILLISECOND);

        return mils.intValue();
    }

    /**
     * @author lenghao
     * @createTime 2008-8-5 下午01:57:09
     * @param first
     * @param second
     * @return 获取两个Date之间的天数的列表
     */
    public static List<Date> getDaysListBetweenDates(Date first, Date second) {
        List<Date> dateList = new ArrayList<Date>();
        Date d1 = getFormatDateTime(getFormatDate(first),DATE_FORMAT);
        Date d2 = getFormatDateTime(getFormatDate(second),DATE_FORMAT);
        if(d1.compareTo(d2)>0) {
            return dateList;
        }
        do {
            dateList.add(d1);
            d1 = getDateBeforeOrAfter(d1, 1);
        } while (d1.compareTo(d2) <= 0);
        return dateList;
    }

    /**
     *
     *
     */
    public static String getDateBeforeDay() {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DAY_OF_YEAR, -1);
        return getFormatDate(cal.getTime(), DATE_FORMAT);
    }

    /**
     * 得到格式化后的当前系统日期，格式为yyyy-MM-dd，如2006-02-15
     *
     * @see #getFormatDate(java.util.Date)
     * @return String 返回格式化后的当前服务器系统日期，格式为yyyy-MM-dd，如2006-02-15
     */
    public static String getCurrDateStr() {
        return getFormatDate(getCurrDate());
    }

    /**
     * 得到格式化后的当前系统时间，格式为yyyy-MM-dd HH:mm:ss，如2006-02-15 15:23:45
     *
     * @see #getFormatDateTime(java.util.Date)
     * @return String 返回格式化后的当前服务器系统时间，格式为yyyy-MM-dd HH:mm:ss，如2006-02-15
     *         15:23:45
     */
    public static String getCurrDateTimeStr() {
        return getFormatDateTime(getCurrDate());
    }

    /**
     * 得到格式化后的当前系统日期，格式为yyyy年MM月dd日，如2006年02月15日
     *
     * @see #getFormatDate(java.util.Date, String)
     * @return String 返回当前服务器系统日期，格式为yyyy年MM月dd日，如2006年02月15日
     */
    public static String getCurrDateStr_CN() {
        return getFormatDate(getCurrDate(), DATE_FORMAT_CN);
    }

    /**
     * 得到格式化后的当前系统时间，格式为yyyy年MM月dd日 HH:mm:ss，如2006年02月15日 15:23:45
     *
     * @see #getFormatDateTime(java.util.Date, String)
     * @return String 返回格式化后的当前服务器系统时间，格式为yyyy年MM月dd日 HH:mm:ss，如2006年02月15日
     *         15:23:45
     */
    public static String getCurrDateTimeStr_CN() {
        return getFormatDateTime(getCurrDate(), TIME_FORMAT_CN);
    }

    /**
     * 得到系统当前日期的前或者后几天
     *
     * @param iDate
     *                如果要获得前几天日期，该参数为负数； 如果要获得后几天日期，该参数为正数
     * @see java.util.Calendar#add(int, int)
     * @return Date 返回系统当前日期的前或者后几天
     */
    public static Date getDateBeforeOrAfter(int iDate) {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DAY_OF_MONTH, iDate);
        return cal.getTime();
    }

    /**
     * 得到日期的前或者后几天
     *
     * @param iDate
     *                如果要获得前几天日期，该参数为负数； 如果要获得后几天日期，该参数为正数
     * @see java.util.Calendar#add(int, int)
     * @return Date 返回参数<code>curDate</code>定义日期的前或者后几天
     */
    public static Date getDateBeforeOrAfter(Date curDate, int iDate) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(curDate);
        cal.add(Calendar.DAY_OF_MONTH, iDate);
        return cal.getTime();
    }

    /**
     * 得到格式化后的月份，格式为yyyy-MM，如2006-02
     *
     * @param currDate
     *                要格式化的日期
     * @see #getFormatDate(java.util.Date, String)
     * @return String 返回格式化后的月份，格式为yyyy-MM，如2006-02
     */
    public static String getFormatMonth(java.util.Date currDate) {
        return getFormatDate(currDate, MONTH_FORMAT);
    }

    /**
     * 得到格式化后的日，格式为yyyyMMdd，如20060210
     *
     * @param currDate
     *                要格式化的日期
     * @see #getFormatDate(java.util.Date, String)
     * @return String 返回格式化后的日，格式为yyyyMMdd，如20060210
     */
    public static String getFormatDay(java.util.Date currDate) {
        return getFormatDate(currDate, DAY_FORMAT);
    }

    /**
     * 得到格式化后的当月第一天，格式为yyyy-MM-dd，如2006-02-01
     *
     * @param currDate
     *                要格式化的日期
     * @see java.util.Calendar#getMinimum(int)
     * @see #getFormatDate(java.util.Date, String)
     * @return String 返回格式化后的当月第一天，格式为yyyy-MM-dd，如2006-02-01
     */
    public static String getFirstDayOfMonth() {
        Calendar cal = Calendar.getInstance();
        int firstDay = cal.getMinimum(Calendar.DAY_OF_MONTH);
        cal.set(Calendar.DAY_OF_MONTH, firstDay);
        return getFormatDate(cal.getTime(), DATE_FORMAT);
    }

    /**
     * 得到格式化后的下月第一天，格式为yyyy-MM-dd，如2006-02-01
     *
     * @param currDate
     *                要格式化的日期
     * @see java.util.Calendar#getMinimum(int)
     * @see #getFormatDate(java.util.Date, String)
     * @return String 返回格式化后的下月第一天，格式为yyyy-MM-dd，如2006-02-01
     */
    public static String getFirstDayOfNextMonth() {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.MONTH, +1);
        int firstDay = cal.getMinimum(Calendar.DAY_OF_MONTH);
        cal.set(Calendar.DAY_OF_MONTH, firstDay);
        return getFormatDate(cal.getTime(), DATE_FORMAT);
    }

    /**
     * 得到格式化后的当月第一天，格式为yyyy-MM-dd，如2006-02-01
     *
     * @param currDate
     *                要格式化的日期
     * @see java.util.Calendar#getMinimum(int)
     * @see #getFormatDate(java.util.Date, String)
     * @return String 返回格式化后的当月第一天，格式为yyyy-MM-dd，如2006-02-01
     */
    public static String getFirstDayOfMonth(Date currDate) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(currDate);
        int firstDay = cal.getMinimum(Calendar.DAY_OF_MONTH);
        cal.set(Calendar.DAY_OF_MONTH, firstDay);
        return getFormatDate(cal.getTime(), DATE_FORMAT);
    }

    /**
     * 得到格式化后的当月最后一天，格式为yyyy-MM-dd，如2006-02-28
     *
     * @param currDate
     *                要格式化的日期
     * @see java.util.Calendar#getMinimum(int)
     * @see #getFormatDate(java.util.Date, String)
     * @return String 返回格式化后的当月最后一天，格式为yyyy-MM-dd，如2006-02-28
     */
    public static String getLastDayOfMonth(Date currDate) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(currDate);
        int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
        cal.set(Calendar.DAY_OF_MONTH, lastDay);
        return getFormatDate(cal.getTime(), DATE_FORMAT);
    }

    /**
     * 得到格式化后的当月最后一天，格式为yyyy-MM-dd，如2006-02-28
     *
     * @param currDate
     *                要格式化的日期
     * @see java.util.Calendar#getMinimum(int)
     * @see #getFormatDate(java.util.Date, String)
     * @return String 返回格式化后的当月最后一天，格式为yyyy-MM-dd，如2006-02-28
     */
    public static String getLastDayOfMonth() {
        Calendar cal = Calendar.getInstance();
        int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
        cal.set(Calendar.DAY_OF_MONTH, lastDay);
        return getFormatDate(cal.getTime(), DATE_FORMAT);
    }

    /**
     * 得到日期的前或者后几小时
     *
     * @param iHour
     *                如果要获得前几小时日期，该参数为负数； 如果要获得后几小时日期，该参数为正数
     * @see java.util.Calendar#add(int, int)
     * @return Date 返回参数<code>curDate</code>定义日期的前或者后几小时
     */
    public static Date getDateBeforeOrAfterHours(Date curDate, int iHour) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(curDate);
        cal.add(Calendar.HOUR_OF_DAY, iHour);
        return cal.getTime();
    }

    /**
     * 判断日期是否在当前周内
     *
     * @param curDate
     * @param compareDate
     * @return
     */
    public static boolean isSameWeek(Date curDate, Date compareDate) {
        if (curDate == null || compareDate == null) {
            return false;
        }

        Calendar calSun = Calendar.getInstance();
        calSun.setTime(getFormatDateToDate(curDate));
        calSun.set(Calendar.DAY_OF_WEEK, 1);

        Calendar calNext = Calendar.getInstance();
        calNext.setTime(calSun.getTime());
        calNext.add(Calendar.DATE, 7);

        Calendar calComp = Calendar.getInstance();
        calComp.setTime(compareDate);
        if (calComp.after(calSun) && calComp.before(calNext)) {
            return true;
        } else {
            return false;
        }
    }
    
    /**
     * 根据日期获取周几
     * @param curDate
     * @return
     */
    public static int dayOfWeek(Date curDate) {
    	 Calendar calSun = Calendar.getInstance();
         calSun.setTime(getFormatDateToDate(curDate));
         int week = calSun.get(Calendar.DAY_OF_WEEK) - 1;
         return week;
    }

    /**
     * 时间查询时,结束时间的 23:59:59
     */
    public static String addDateEndfix(String datestring) {
        if ((datestring == null) || datestring.equals("")) {
            return null;
        }
        return datestring + " 23:59:59";
    }

    /**
     * 返回格式化的日期
     *
     * @param datePre
     *                格式"yyyy-MM-dd 23:59:59";
     * @return
     */
    public static Date getFormatDateEndfix(String dateStr) {
        dateStr = addDateEndfix(dateStr);
        return getFormatDateTime(dateStr);
    }

    /**
     * 返回格式化的日期
     *
     * @param datePre
     *                格式"yyyy-MM-dd HH:mm:ss";
     * @return
     */
    public static Date formatEndTime(String datePre) {
        if (datePre == null)
            return null;
        String dateStr = addDateEndfix(datePre);
        return getFormatDateTime(dateStr);
    }

    /**
     * date1加上compday天数以后的日期与当前时间比较，如果大于当前时间返回true，否则false
     * @param date1
     * @param compday
     * @return
     */
    public static Boolean compareDay(Date date1, int compday) {
        if (date1 == null)
            return false;
        Date dateComp = getDateBeforeOrAfter(date1, compday);
        Date nowdate = new Date();
        if (dateComp.after(nowdate))
            return true;
        else
            return false;
    }

    /**
     * 进行时段格式转换，对于输入的48位的01串，将进行如下操作： <li>
     * 1.先将输入中每个0变成两个0，每个1变成2个1，形成一个96位的二进制串。</li> <li>
     * 2.将上述的96位的二进制串分成3组，每组32位。</li> <li>3.将每个32位的二进制串转换成一个8位的16进制串。</li>
     * <li>4.将3个8位的16进制串合并成一个串，中间以","分割。</li>
     *
     * @param timespan
     *                一个48位的二进制串，如："011111111011111111111111111111111111111111111110"
     * @return 一个16进制串，每位间以","分割。如："3fffcfff,ffffffff,fffffffc"
     */
    public static String convertBinaryTime2Hex(String timespan) {
        if (timespan == null || timespan.equals("")) {
            return "";
        }

        String ret = "";
        String tmp = "";
        for (int i = 0; i < timespan.length(); i++) {
            tmp += timespan.charAt(i);
            tmp += timespan.charAt(i);
            // tmp += i;
            if ((i + 1) % 16 == 0) {
                if (!ret.equals("")) {
                    ret += ",";
                }
                Long t = Long.parseLong(tmp, 2);
                String hexStr = Long.toHexString(t);
                if (hexStr.length() < 8) {
                    int length = hexStr.length();
                    for (int n = 0; n < 8 - length; n++) {
                        hexStr = "0" + hexStr;
                    }
                }

                ret += hexStr;
                tmp = "";
            }
        }

        return ret;
    }

    /**
     * 进行时段格式转换，将输入的26位的2进制串转换成48位的二进制串。
     *
     * @param timespan
     *                一个16进制串，每位间以","分割。如："3fffcfff,ffffffff,fffffffc"
     * @return
     *         一个48位的二进制串，如："011111111011111111111111111111111111111111111110"
     */
    public static String convertHexTime2Binary(String timespan) {
        if (timespan == null || timespan.equals("")) {
            return "";
        }

        String tmp = "";
        String ret = "";
        String[] strArr = timespan.split(",");
        for (int i = 0; i < strArr.length; i++) {
            String binStr = Long.toBinaryString(Long.parseLong(strArr[i], 16));
            if (binStr.length() < 32) {
                int length = binStr.length();
                for (int n = 0; n < 32 - length; n++) {
                    binStr = "0" + binStr;
                }
            }
            tmp += binStr;
        }

        for (int i = 0; i < 48; i++) {
            ret += tmp.charAt(i * 2);
        }

        return ret;
    }

    /**
     * 进行时段格式转换，将输入的32位的10进制串转换成48位的二进制串。
     *
     * @param timespan
     *                一个16进制串，每位间以","分割。如："1234567890,1234567890,1234567890c"
     * @return
     *         一个48位的二进制串，如："011111111011111111111111111111111111111111111110"
     */
    public static String convertDecTime2Binary(String timespan) {
        if (timespan == null || timespan.equals("")) {
            return "";
        }

        String tmp = "";
        String ret = "";
        String[] strArr = timespan.split(",");
        for (int i = 0; i < strArr.length; i++) {
            String binStr = Long.toBinaryString(Long.parseLong(strArr[i], 10));
            if (binStr.length() < 32) {
                int length = binStr.length();
                for (int n = 0; n < 32 - length; n++) {
                    binStr = "0" + binStr;
                }
            }
            tmp += binStr;
        }

        for (int i = 0; i < 48; i++) {
            ret += tmp.charAt(i * 2);
        }

        return ret;
    }

    /**
     * 进行时段格式转换，对于输入的48位的01串，将进行如下操作： <li>
     * 1.先将输入中每个0变成两个0，每个1变成2个1，形成一个96位的二进制串。</li> <li>
     * 2.将上述的96位的二进制串分成3组，每组32位。</li> <li>3.将每个32位的二进制串转换成一个10位的10进制串。</li>
     * <li>4.将3个8位的16进制串合并成一个串，中间以","分割。</li>
     *
     * @param timespan
     *                一个48位的二进制串，如："011111111011111111111111111111111111111111111110"
     * @return 一个16进制串，每位间以","分割。如："1234567890,1234567890,1234567890"
     */
    public static String convertBinaryTime2Dec(String timespan) {
        if (timespan == null || timespan.equals("")) {
            return "";
        }

        String ret = "";
        String tmp = "";
        for (int i = 0; i < timespan.length(); i++) {
            tmp += timespan.charAt(i);
            tmp += timespan.charAt(i);
            // tmp += i;
            if ((i + 1) % 16 == 0) {
                if (!ret.equals("")) {
                    ret += ",";
                }
                Long t = Long.parseLong(tmp, 2);
                String decStr = Long.toString(t);
                if (decStr.length() < 10) {
                    int length = decStr.length();
                    for (int n = 0; n < 10 - length; n++) {
                        decStr = "0" + decStr;
                    }
                }

                ret += decStr;
                tmp = "";
            }
        }

        return ret;
    }

    /**
     * 计算指定日期+addMonth月+15号 返回格式"2008-02-15"
     *
     * @param date
     * @param addMonth
     * @param monthDay
     * @return
     */
    public static String genericSpecdate(Date date, int addMonth, int monthDay) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.MONTH, addMonth);
        cal.set(Calendar.DAY_OF_MONTH, monthDay);
        return getFormatDate(cal.getTime(), DATE_FORMAT);
    }

    /**
     * 获得以今天为单位若干天以前或以后的日期的标准格式"Wed Feb 20 00:00:00 CST 2008"，是0点0分0秒。
     *
     * @param idx
     * @return
     */
    public static Date getDateBeforeOrAfterV2(int idx) {
        return getDateBeforeOrAfter(getFormatDateToDate(getCurrDate()), idx);
    }

    /**
     * 获得给定时间若干秒以前或以后的日期的标准格式。
     *
     * @param curDate
     * @param seconds
     * @return curDate
     */
    public static Date getSpecifiedDateTimeBySeconds(Date curDate, int seconds) {
        long time = (curDate.getTime() / 1000) + seconds;
        curDate.setTime(time * 1000);
        return curDate;
    }

    /**
     * 获得给定日期当天23点59分59秒的标准格式。
     *
     * @param curDate
     * @return curDate
     */
    public static Date getSpecifiedDateTime_235959(Date curDate) {
        return getSpecifiedDateTimeBySeconds(getFormatDateToDate(curDate), 24 * 60 * 60 - 1);
    }

    public static String getSpecifiedDateTime_month(Date curDate) {
        return getFormatDateTime(curDate, "MM.dd");
    }

    // change by bbq
    public static final String dtSimple = "yyyy-MM-dd";

    /**
     * alahan add 20050825 获取传入时间相差的日期
     *
     * @param dt
     *                传入日期，可以为空
     * @param diff
     *                需要获取相隔diff天的日期 如果为正则取以后的日期，否则时间往前推
     * @return
     */
    public static String getDiffStringDate(Date dt, int diff) {
        Calendar ca = Calendar.getInstance();

        if (dt == null) {
            ca.setTime(new Date());
        } else {
            ca.setTime(dt);
        }

        ca.add(Calendar.DATE, diff);
        return dtSimpleFormat(ca.getTime());
    }

    /**
     * yyyy-MM-dd
     *
     * @param date
     * @return
     */
    public static final String dtSimpleFormat(Date date) {
        if (date == null) {
            return "";
        }

        return getFormat(dtSimple).format(date);
    }

    // SimpleDateFormat("yyyy-MM-dd HH:mm");
    private static final DateFormat getFormat(String format) {
        return new SimpleDateFormat(format);
    }

    /**
     * 取得多个日期中间隔的最大天数
     *
     * @author Alvise
     * @param startDateAndEndDate
     * @return
     */
    public static int maxContinuousDays(Date[][] startDateAndEndDate) {
        // 冒泡排序
        for (int i = 0; i < startDateAndEndDate.length - 1; i++) {
            for (int j = 0; j < startDateAndEndDate.length - i - 1; j++) {
                if (DateTimeUtil.getDaysBetweenDates(startDateAndEndDate[j + 1][0],
                        startDateAndEndDate[j][0]) > 0) {
                    Date[] tempDate = startDateAndEndDate[j];
                    startDateAndEndDate[j] = startDateAndEndDate[j + 1];
                    startDateAndEndDate[j + 1] = tempDate;
                }
            }
        }

//         for (int i = 0; i < startDateAndEndDate.length; i++) {
//         if (startDateAndEndDate[i][0] == null)
//         break;
//         System.out.println(DateTimeUtil.getFormatDate(
//         startDateAndEndDate[i][0]) + ","
//         + DateTimeUtil.getFormatDate(startDateAndEndDate[i][1]));
//         }
//
//         System.out.println(
//         "===========================================");

        // 合并连续的时间段
        int j = 0;
        Date[][] startDateAndEndDateNew = new Date[startDateAndEndDate.length][2];
        for (int i = 0; i < startDateAndEndDateNew.length ; i++) {
            if (j >= startDateAndEndDate.length)
                break;

            startDateAndEndDateNew[i] = startDateAndEndDate[j];
            j++;
            while (j < startDateAndEndDate.length) {
                if (DateTimeUtil.getDaysBetweenDates(startDateAndEndDateNew[i][1],
                        startDateAndEndDate[j][0]) > 0) {
                    break;
                } else if (DateTimeUtil.getDaysBetweenDates(startDateAndEndDateNew[i][1],
                        startDateAndEndDate[j][1]) > 0) {
                    startDateAndEndDateNew[i][1] = startDateAndEndDate[j][1];
                    j++;
                } else if (DateTimeUtil.getDaysBetweenDates(startDateAndEndDateNew[i][1],
                        startDateAndEndDate[j][1]) <= 0) {
                    j++;
                }

            }
        }

//         for (int i = 0; i < startDateAndEndDateNew.length; i++) {
//            if (startDateAndEndDateNew[i][0] == null)
//                break;
//            System.out.println(DateTimeUtil.getFormatDate(startDateAndEndDateNew[i][0]) + ","
//                    + DateTimeUtil.getFormatDate(startDateAndEndDateNew[i][1]));
//        }

        // 选择法排序
        int maxDays = 0;
        for (int i = 0; i < startDateAndEndDateNew.length - 1; i++) {
            Date curEndDate = startDateAndEndDateNew[i][1];
            Date nextStartDate = startDateAndEndDateNew[i + 1][0];
            if (curEndDate == null || nextStartDate == null) {
                break;
            }

            int temDays = DateTimeUtil.getDaysBetweenDates(curEndDate, nextStartDate);
            if (temDays > maxDays) {
                maxDays = temDays;
            }
        }
        return maxDays;
    }

    /**
     * 取得多个日期中间隔的最大天数,这里的参数是用 ","和";"分割的字符字符串例如 "2008-08-03,2008-08-04;"
     *
     * @author Alvise
     * @param startDateAndEndDate
     * @return
     */
    public static int maxContinuousDays(String dateStr) {
        String[] seDate = dateStr.split(";");
        Date[][] startDateAndEndDate = new Date[seDate.length][2];

        for (int i = 0; i < seDate.length; i++) {
            String[] tempDate = seDate[i].split(",");
            startDateAndEndDate[i][0] = DateTimeUtil.getFormatDate(tempDate[0]);
            startDateAndEndDate[i][1] = DateTimeUtil.getFormatDate(tempDate[1]);
        }

        return maxContinuousDays(startDateAndEndDate);

    }


    /**
     * 判断时间段1和时间段2是否有交集
     * @param begintimeOne
     * @param endtimeOne
     * @param begintimeTwo
     * @param endtimeTwo
     * @return true:有交集,false:没有交集
     */
    public static boolean isConfilct(String begintimeOne, String endtimeOne, String begintimeTwo,
            String endtimeTwo) {
        Date beginOne = getFormatDate(begintimeOne);
        Date endOne = getFormatDate(endtimeOne);
        Date beginTwo = getFormatDate(begintimeTwo);
        Date endTwo = getFormatDate(endtimeTwo);
        if ((beginOne.compareTo(beginTwo) <= 0 && endOne.compareTo(beginTwo) >= 0)
                || (beginOne.compareTo(endTwo) <= 0 && endOne.compareTo(endTwo) >= 0)
                || (beginTwo.compareTo(beginOne) <= 0 && endTwo.compareTo(beginOne) >= 0)
                || (beginTwo.compareTo(endOne) <= 0 && endTwo.compareTo(endOne) >= 0)) {
            return true;
        }
        return false;
    }

    /**
     * 取得最早可购买时间
     * @param busytimes 被购买时间,格式为2008-08-06,2008-08-06;2008-08-9,2008-08-12;2008-08-14,2008-08-22;2008-09-04,2008-09-04
     * @param days 购买时长
     * @return 最高可购买时间
     */
    public static String getCansellTime(String busytimes, int days) {
        Map<String, Integer> dayMap = new HashMap<String, Integer>();
        String[] busytimeArr = StringUtils.split(busytimes, ";");
        for (int i = 0; i < busytimeArr.length; i++) {
            String[] time = StringUtils.split(busytimeArr[i], ",");
            Date d1 = getFormatDateTime(time[0], DATE_FORMAT);
            Date d2 = getFormatDateTime(time[1], DATE_FORMAT);
            while (d1.compareTo(d2) <= 0) {
                dayMap.put(getFormatDate(d1), null);
                d1 = getDateBeforeOrAfter(d1, 1);
            }
        }

        Date lastDate = getFormatDateTime(getFormatDate(getDateBeforeOrAfter(29)), DATE_FORMAT);
        Date beginDate = getFormatDateTime(getFormatDate(getDateBeforeOrAfter(2)), DATE_FORMAT);
        Date endDate = getDateBeforeOrAfter(beginDate, days - 1);

        while (beginDate.compareTo(lastDate) <= 0) {
            boolean conflict = false;
            List<Date> daysList = getDaysListBetweenDates(beginDate, endDate);
            for (Date d : daysList) {
                if (dayMap.containsKey(getFormatDate(d))) {
                    conflict = true;
                    break;
                }
            }
            if(!conflict){
                break;
            }
            beginDate = getDateBeforeOrAfter(beginDate, 1);
            endDate = getDateBeforeOrAfter(beginDate, days - 1);
        }
        return getFormatDate(beginDate);
    }
    /**
  	 * 将传入的java.util.Date型参数增加月数
  	 * 
  	 * @param java.util.Date
  	 *            pdate ,
  	 * @param int
  	 *            paddmon 增加月数，可以是负数
  	 * @return java.util.Date
  	 */
  	public static java.util.Date addMonth(java.util.Date pdate, int paddmon)
  			throws Exception {

  		Calendar vcal = Calendar.getInstance();
  		vcal.setTime(pdate);
  		vcal.add(Calendar.MONTH, paddmon);
  		pdate = vcal.getTime();
  		return pdate;
  	}
  	/**
  	 * 将传入的java.util.Date型参数增加天数
  	 * 
  	 * @param java.util.Date
  	 *            pdate ,
  	 * @param int
  	 *            paddmon 增加月数，可以是负数
  	 * @return java.util.Date
  	 */
  	public static java.util.Date addDay(java.util.Date pdate, int paddday)
  			throws Exception {

  		Calendar vcal = Calendar.getInstance();
  		vcal.setTime(pdate);
  		vcal.add(Calendar.DATE, paddday);
  		pdate = vcal.getTime();
  		return pdate;
  	}
  	/**
  	 * addHour
  	 * @param pdate
  	 * @param paddHour
  	 * @return
  	 */
  	public static java.util.Date addHour(java.util.Date pdate, int paddHour){

  		Calendar vcal = Calendar.getInstance();
  		vcal.setTime(pdate);
  		vcal.add(Calendar.HOUR, paddHour);
  		pdate = vcal.getTime();
  		return pdate;
  	}
  	/**
  	 * addMinute
  	 * @param pdate
  	 * @param paddday
  	 * @return
  	 */
  	public static java.util.Date addMinute(java.util.Date pdate, int paddday) {

  		Calendar vcal = Calendar.getInstance();
  		vcal.setTime(pdate);
  		vcal.add(Calendar.MINUTE, paddday);
  		pdate = vcal.getTime();
  		return pdate;
  	}
  	
  	/**
  	 * 根据出生日期获取年龄
  	 * @param birthDayStr
  	 * @return
  	 * @throws Exception
  	 */
  	public static int getAgeByBirthDay(String birthDayStr) throws Exception { 
        Calendar cal = Calendar.getInstance(); 
  
        Date birthDay = getFormatDate(birthDayStr);
        
        if (cal.before(birthDay)) { 
            throw new IllegalArgumentException( 
                "The birthDay is before Now.It's unbelievable!"); 
        } 
        int yearNow = cal.get(Calendar.YEAR); 
        int monthNow = cal.get(Calendar.MONTH); 
        int dayOfMonthNow = cal.get(Calendar.DAY_OF_MONTH); 
        cal.setTime(birthDay); 
  
        int yearBirth = cal.get(Calendar.YEAR); 
        int monthBirth = cal.get(Calendar.MONTH); 
        int dayOfMonthBirth = cal.get(Calendar.DAY_OF_MONTH); 
  
        int age = yearNow - yearBirth; 
  
        if (monthNow <= monthBirth) { 
            if (monthNow == monthBirth) { 
                if (dayOfMonthNow < dayOfMonthBirth) age--; 
            }else{ 
                age--; 
            } 
        } 
        return age; 
    }
  	
  	/**
  	 * 根据日期获取传入日期所在的周
  	 * @param dateStr
  	 * @return
  	 */
  	public static int getWeekForDate(String dateStr) {
  		Date date = getFormatDate(dateStr);
  		Calendar calendar = Calendar.getInstance();  
  		calendar.setFirstDayOfWeek(Calendar.MONDAY);  
  		calendar.setTime(date);  
  		int week = calendar.get(Calendar.WEEK_OF_YEAR);
  		return week;
  	}
  	
  	 // 获取当前时间所在年的周数
  	 private static int getWeekOfYear(Date date) {
  	  Calendar c = Calendar.getInstance();  
  	  c.setFirstDayOfWeek(Calendar.MONDAY);
  	  c.setMinimalDaysInFirstWeek(7);
  	  c.setTime(date);
  	  return c.get(Calendar.WEEK_OF_YEAR);
  	 }
  	
  	 /**
  	  * 根据年份获取当年有多少周
  	  * @param year
  	  * @return
  	  */
  	 public static int getMaxWeekNumOfYear(int year) {
  	  Calendar c = Calendar.getInstance();
  	  c.set(year, Calendar.DECEMBER, 31, 23, 59, 59);
  	  return getWeekOfYear(c.getTime());
  	 }
  	
  	
  	 /**
  	  *     获取两个时间的时间差
  	  * @param startTime
  	  * @param endTime
  	  * @return
  	  */
  	 public static String getTimeExpend(String startTime, String endTime){
  	     
         long longStart = getTimeMillis(startTime); //获取开始时间毫秒数
         long longEnd = getTimeMillis(endTime);  //获取结束时间毫秒数
         long longExpend = longEnd - longStart;  //获取时间差

         long longHours = longExpend / (60 * 60 * 1000); //根据时间差来计算小时数
         long longMinutes = (longExpend - longHours * (60 * 60 * 1000)) / (60 * 1000);   //根据时间差来计算分钟数

         return String.valueOf(longMinutes);
     }


     private static long getTimeMillis(String strTime) {
         long returnMillis = 0;
         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
         Date d = null;
         try {
             d = sdf.parse(strTime);
             returnMillis = d.getTime();
         } catch (ParseException e) {
//             Toast.makeText(MainActivity.this, e.toString(), Toast.LENGTH_SHORT).show();
         }
         return returnMillis;
     }
  	 
  	public static void main(String[] args) throws Exception{
//  		String recentlyTime = "";
//  		int day = DateTimeUtil.getDaysBetweenDates("2015-05-05", "2015-05-04");
//  		System.out.println(day);
  		  //  System.out.println(DateTimeUtil.getMaxWeekNumOfYear(2019));
//  		System.out.println(DateTimeUtil.dayOfWeek(DateTimeUtil.getCurrDate()));
//  		Date createDate = DateTimeUtil.getFormatDateTime("2014-01-15 06:20:00");
//  		System.out.println(DateTimeUtil.getDateBeforeOrAfter(createDate, -1));
  		
//  		 System.out.println(getTimeExpend("2019-03-25 13:10","2019-03-25 15:12"));
  		
  		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		Date parse = format.parse("20180321141000");
		Date date = format.parse("20180321141111");
		long between = date.getTime() - parse.getTime();
		long day = between / (24 * 60 * 60 * 1000);
		long hour = (between / (60 * 60 * 1000) - day * 24);
		long min = ((between / (60 * 1000)) - day * 24 * 60 - hour * 60);
		long s = (between / 1000 - day * 24 * 60 * 60 - hour * 60 * 60 - min * 60);
		System.out.println(between / 1000);
		//System.out.println(day + "天" + hour + "小时" + min + "分" + s + "秒");

  		
//  		Date nowDate = DateTimeUtil.getFormatDateTime(DateTimeUtil
//				.getCurrDateTimeStr()); // 现在的时间
//		int minute = DateTimeUtil.getMinutesBetweenDays(DateTimeUtil.getFormatDateTime("2014-07-29 08:10:00"),
//				nowDate); // 相
//  		System.out.println(minute);
  		
//  		System.out.println(DateTimeUtil.getMinutesBetweenDays(DateTimeUtil.getFormatDate("2014-01-15 06:20:00"),DateTimeUtil.getFormatDate("2014-01-15 08:20:00")));
  		/*Date now = DateTimeUtil.getCurrTimestamp();
  		int day =  DateTimeUtil.getDaysBetweenDates(createDate, now);
  		int hours =  DateTimeUtil.getHoursBetweenDays(createDate, now);
		int min =  DateTimeUtil.getMinutesBetweenDays(createDate, now);
		System.out.println(hours);
		
		if (day > 0) {
			recentlyTime = DateTimeUtil.getFormatDateTime(createDate, "MM-dd");
		} else {
			if (hours < 1) {
				if (min == 0) {
					min++;
				}
				recentlyTime = min + "分钟内";
			}else if (hours >= 1 && hours <= 24) {
				 if (min > 0) {
					hours++;
				}
				recentlyTime = hours + "小时内";
			}
		}*/
		
//		System.out.println(day);
//		System.out.println(hours);
//		System.out.println(min);
//		System.out.println(recentlyTime);
	}
}
