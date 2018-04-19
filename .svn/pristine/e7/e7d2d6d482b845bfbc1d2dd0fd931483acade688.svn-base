/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.resident.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.witcm.resident.entity.Consult;
import com.thinkgem.jeesite.modules.witcm.resident.entity.Family;
import com.thinkgem.jeesite.modules.witcm.resident.entity.Resident;
import com.thinkgem.jeesite.modules.witcm.resident.dao.ConsultDao;

/**
 * 咨询Service
 * @author liyongfang
 * @version 2017-12-04
 */
@Service
@Transactional(readOnly = true)
public class ConsultService extends CrudService<ConsultDao, Consult> {

	public Consult get(String id) {
		return super.get(id);
	}
	
	public List<Consult> findList(Consult consult) {
		return super.findList(consult);
	}
	
	public Page<Consult> findPage(Page<Consult> page, Consult consult) {
		return super.findPage(page, consult);
	}
	
	@Transactional(readOnly = false)
	public void save(Consult consult) {
		super.save(consult);
	}
	
	@Transactional(readOnly = false)
	public void delete(Consult consult) {
		super.delete(consult);
	}
	
	@Transactional(readOnly = false)
	public List<Consult> findByOfficeId(String officeId) {
		if (StringUtils.isEmpty(officeId)) {
			User user = UserUtils.getUser();
			// 如果是超级管理员，取出所有用户
			if (user.isAdmin()) {
				return super.findList(new Consult());
			} else {
				officeId = UserUtils.getUser().getOffice().getId();
				Consult consult = new Consult();
				consult.setBelongOrg(new Office(officeId));
				return super.findList(consult);
			}
		} else {
			Consult consult = new Consult();
			consult.setBelongOrg(new Office(officeId));
			return super.findList(consult);
		}
	}
	
	/**
	 * 设置实体搜索条件
	 */
	public void setScope(Consult consult) {
		if (null == consult.getBelongOrg()
				|| null == consult.getBelongOrg().getId()) {
			User user = UserUtils.getUser();
			// 如果是超级管理员，取出所有用户
			if (user.isAdmin()) {
				consult.setBelongOrg(null);
			} else {
				String officeId = UserUtils.getUser().getOffice().getId();
				consult.setBelongOrg(new Office(officeId));
			}
		}
	}
}