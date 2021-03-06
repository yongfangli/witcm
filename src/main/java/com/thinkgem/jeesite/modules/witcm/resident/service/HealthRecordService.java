/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.resident.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.witcm.resident.entity.Family;
import com.thinkgem.jeesite.modules.witcm.resident.entity.HealthRecord;
import com.thinkgem.jeesite.modules.witcm.resident.entity.Resident;
import com.thinkgem.jeesite.modules.witcm.resident.dao.FamilyDao;
import com.thinkgem.jeesite.modules.witcm.resident.dao.HealthRecordDao;

/**
 * 家庭健康档案Service
 * 
 * @author liyongfang
 * @version 2017-12-04
 */
@Service
@Transactional(readOnly = true)
public class HealthRecordService extends
		CrudService<HealthRecordDao, HealthRecord> {
	@Autowired
	private FamilyDao familyDao;

	public HealthRecord get(String id) {
		return super.get(id);
	}

	public List<HealthRecord> findList(HealthRecord healthRecord) {
		return super.findList(healthRecord);
	}

	public Page<HealthRecord> findPage(Page<HealthRecord> page,
			HealthRecord healthRecord) {
		return super.findPage(page, healthRecord);
	}

	@Transactional(readOnly = false)
	public void save(HealthRecord healthRecord) {
		if (null != healthRecord.getFamilyUser()) {
			Family family = familyDao.get(healthRecord.getFamilyUser().getId());
			healthRecord.setBelongOrg(family.getBelongOrg());
			healthRecord.setBelongArea(family.getBelongAreaId());
			healthRecord.setResidentId(family.getResident().getId());
		}
		super.save(healthRecord);
	}

	@Transactional(readOnly = false)
	public void delete(HealthRecord healthRecord) {
		super.delete(healthRecord);
	}

	/**
	 * 设置实体搜索条件
	 */
	public void setScope(HealthRecord healthRecord) {
		if (null == healthRecord.getBelongOrg()
				|| StringUtils.isBlank(healthRecord.getBelongOrg().getId())) {
			User user = UserUtils.getUser();
			// 如果是超级管理员，取出所有用户
			if (user.isAdmin()) {
				healthRecord.setBelongOrg(null);
			} else {
				String officeId = UserUtils.getUser().getOffice().getId();
				healthRecord.setBelongOrg(new Office(officeId));
			}
		}
	}
	
	public List<Office> getOffices(int top){
		Integer t = new Integer(top);
		return dao.getOffices(t);
	}

	public Integer getListByDate(String cid,Date start, Date end) {
		return dao.getListByDate(cid,start, end);
	}
}