package com.thinkgem.jeesite.modules.cms.utils;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.CacheUtils;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.cms.entity.Site;
import com.thinkgem.jeesite.modules.witcm.resident.entity.LinkInfo;
import com.thinkgem.jeesite.modules.witcm.resident.service.LinkInfoService;

/**
 * 友情链接
 * @author lyf
 *
 */
public class LinkUtil {
	private static LinkInfoService linkInfoService = SpringContextHolder.getBean(LinkInfoService.class);
	public static final String LINK_CACHE = "LinkCache";
	public static List<LinkInfo> getLinkInfos(){
		@SuppressWarnings("unchecked")
		List<LinkInfo> linkInfoList = (List<LinkInfo>)CacheUtils.get(LINK_CACHE, "linkList");
		if (linkInfoList == null){
			linkInfoList = linkInfoService.findList(new LinkInfo());
			CacheUtils.put(LINK_CACHE, "linkList", linkInfoList);
		}
		return linkInfoList;
	}
}
