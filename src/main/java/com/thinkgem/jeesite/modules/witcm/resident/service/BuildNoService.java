/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.resident.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.witcm.resident.entity.BuildNo;
import com.thinkgem.jeesite.modules.witcm.resident.dao.BuildNoDao;

/**
 * 楼栋信息Service
 * @author luoyang
 * @version 2017-12-27
 */
@Service
@Transactional(readOnly = true)
public class BuildNoService extends CrudService<BuildNoDao, BuildNo> {

	public BuildNo get(String id) {
		return super.get(id);
	}
	
	public List<BuildNo> findList(BuildNo buildNo) {
		return super.findList(buildNo);
	}
	
	public Page<BuildNo> findPage(Page<BuildNo> page, BuildNo buildNo) {
		return super.findPage(page, buildNo);
	}
	
	@Transactional(readOnly = false)
	public void save(BuildNo buildNo) {
		super.save(buildNo);
	}
	
	@Transactional(readOnly = false)
	public void delete(BuildNo buildNo) {
		super.delete(buildNo);
	}
	
}