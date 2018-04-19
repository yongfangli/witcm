/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.si.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.witcm.si.entity.SiInfo;
import com.thinkgem.jeesite.modules.witcm.si.dao.SiInfoDao;

/**
 * si信息管理Service
 * @author liyongfang
 * @version 2017-12-04
 */
@Service
@Transactional(readOnly = true)
public class SiInfoService extends CrudService<SiInfoDao, SiInfo> {

	public SiInfo get(String id) {
		return super.get(id);
	}
	
	public List<SiInfo> findList(SiInfo siInfo) {
		return super.findList(siInfo);
	}
	
	public Page<SiInfo> findPage(Page<SiInfo> page, SiInfo siInfo) {
		return super.findPage(page, siInfo);
	}
	
	@Transactional(readOnly = false)
	public void save(SiInfo siInfo) {
		super.save(siInfo);
	}
	
	@Transactional(readOnly = false)
	public void delete(SiInfo siInfo) {
		super.delete(siInfo);
	}
	
}