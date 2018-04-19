/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.resident.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.CacheUtils;
import com.thinkgem.jeesite.modules.cms.utils.LinkUtil;
import com.thinkgem.jeesite.modules.witcm.resident.entity.LinkInfo;
import com.thinkgem.jeesite.modules.witcm.resident.dao.LinkInfoDao;

/**
 * 友情链接Service
 * @author luoyang
 * @version 2017-12-27
 */
@Service
@Transactional(readOnly = true)
public class LinkInfoService extends CrudService<LinkInfoDao, LinkInfo> {

	public LinkInfo get(String id) {
		return super.get(id);
	}
	
	public List<LinkInfo> findList(LinkInfo linkInfo) {
		return super.findList(linkInfo);
	}
	
	public Page<LinkInfo> findPage(Page<LinkInfo> page, LinkInfo linkInfo) {
		return super.findPage(page, linkInfo);
	}
	
	@Transactional(readOnly = false)
	public void save(LinkInfo linkInfo) {
		CacheUtils.removeAll(LinkUtil.LINK_CACHE);
		super.save(linkInfo);
	}
	
	@Transactional(readOnly = false)
	public void delete(LinkInfo linkInfo) {
		CacheUtils.removeAll(LinkUtil.LINK_CACHE);
		super.delete(linkInfo);
	}
	
}