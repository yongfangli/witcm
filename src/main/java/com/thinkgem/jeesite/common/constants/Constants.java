package com.thinkgem.jeesite.common.constants;

public class Constants {
	public static final String BUS_USER_KEY = "bususer";
	public static final String RES_USER_KEY = "resuser";
	public static final String ITV_USER_KEY = "itvuser";
	public static final String MOBILE_USER_KEY = "mobileuser";

	/**
	 * 类型状态(0：正常、1：停用)
	 */
	public static final String TYPE_STATUS_0 = "0";
	public static final String TYPE_STATUS_1 = "1";
	
	public static final String LOGIN_FLAG_NORMAL = "0";// 启用
	public static final String LOGIN_FLAG_DENY = "1";// 禁用
	public static final String ADUIT_STATUS_PRE = "0";// 待审核
	public static final String ADUIT_STATUS_YES = "1";// 审核通过
	public static final String ADUIT_STATUS_NO = "2";// 审核未通过
	public static final String DEFAULT_RESIDENT_PAW = "123456"; // 默认的导入的居民密码
	public static final String COMMUNITY_FLAG="3";   //指代小区
	
	public static final String LOGINFLAG_RESOLVE_URL = "/resident/resident/resolveLoginFlag";
	public static final String ARTCLE_INDEX_LINK="/articleIndex.html/{0}";//message  =  MessageFormat.format(message ,"world","!!!");  
	public static final String ARTCLE_LIST_LINK="/articleList.html/{0}";
	

	/**
	 * 订单状态(预订中、已接单、已配送、已收货、已取消)
	 */
	public static final String ORDER_STATUS_0 = "0";//预订中
	public static final String ORDER_STATUS_1 = "1";//已接单
	public static final String ORDER_STATUS_2 = "2";//已配送
	public static final String ORDER_STATUS_3 = "3";//已收货
	public static final String ORDER_STATUS_4 = "4";//已取消
	
	/**
	 * 评论状态(0：未评论、1：已评论)
	 */
	public static final String COM_STATUS_0 = "0";//未评论
	public static final String COM_STATUS_1 = "1";//已评论
	
	
	/**
	 * 内容类别模型分类
	 */
	public static final String ARTICLE = "article";//文章模型
	public static final String PICTURE = "picture";//图片模型
	public static final String SPECIAL = "special";//专题模型
	public static final String NEWS = "news";//新闻模型
	
	public static final String VIDEO_ENMU = "2";//新闻模型
}
