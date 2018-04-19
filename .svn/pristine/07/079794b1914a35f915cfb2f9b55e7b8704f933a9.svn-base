/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.resident.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.witcm.business.dao.BusinessDao;
import com.thinkgem.jeesite.modules.witcm.business.entity.Business;
import com.thinkgem.jeesite.modules.witcm.resident.entity.Collect;
import com.thinkgem.jeesite.modules.witcm.resident.entity.Resident;
import com.thinkgem.jeesite.modules.witcm.resident.dao.CollectDao;
import com.thinkgem.jeesite.modules.witcm.resident.dao.ResidentDao;

/**
 * 收藏Service
 * 
 * @author liyongfang
 * @version 2017-12-04
 */
@Service
@Transactional(readOnly = true)
public class CollectService extends CrudService<CollectDao, Collect> {
	@Autowired
	private ResidentDao residentDao;
	@Autowired
	private BusinessDao businessDao;

	public Collect get(String id) {
		return super.get(id);
	}

	public List<Collect> findList(Collect collect) {
		return super.findList(collect);
	}

	public Page<Collect> findPage(Page<Collect> page, Collect collect) {
		return super.findPage(page, collect);
	}

	@Transactional(readOnly = false)
	public void save(Collect collect) {
		super.save(collect);
	}

	@Transactional(readOnly = false)
	public void delete(Collect collect) {
		super.delete(collect);
	}

	// 前台新建添加收藏
	@Transactional(readOnly = false)
	public Collect saveNewInstance(String residentId, String businessId) throws Exception{
		if (StringUtils.isNotEmpty(residentId)
				& StringUtils.isNotEmpty(businessId)) {
			Resident resident = residentDao.get(residentId);
			Business business=businessDao.get(businessId);
			if(null==resident||null==business){
				throw new Exception("收藏添加失败，缺少参数");
			}
			Collect collect = new Collect();
			//前台收藏添加，添加管理员字段
			
			collect.setResident(resident);
			collect.setCollectItemId(businessId);
			List<Collect> collects=dao.findList(collect);
			if(collects.size()>0){
				throw new Exception("收藏添加失败，重复添加");
			}
			collect.setCreateBy(new User("1"));
			collect.setUpdateBy(new User("1"));
			collect.setCollectDate(new Date());
			collect.setBelongOrgId(resident.getBelongOrg());
			collect.setBelongAreaId(StringUtils.isEmpty(resident.getBelongArea())?null:resident.getBelongArea());
		    save(collect);
		}else{
			//收藏添加失败，缺少参数
			throw new Exception("收藏添加失败，缺少参数");
		}
		return null;
	}
}