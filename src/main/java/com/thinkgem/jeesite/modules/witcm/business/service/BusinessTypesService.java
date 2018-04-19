/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.business.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.witcm.business.entity.BusinessTypes;
import com.thinkgem.jeesite.modules.witcm.business.dao.BusinessTypesDao;

/**
 * 商户类型Service
 * @author liyongfang
 * @version 2017-12-04
 */
@Service
@Transactional(readOnly = true)
public class BusinessTypesService extends CrudService<BusinessTypesDao, BusinessTypes> {

	public BusinessTypes get(String id) {
		return super.get(id);
	}
	
	public List<BusinessTypes> findList(BusinessTypes businessTypes) {
		return super.findList(businessTypes);
	}
	
	public List<BusinessTypes> findAllList(BusinessTypes businessTypes) {
		return dao.findAllList(businessTypes);
	}
	
	public Page<BusinessTypes> findPage(Page<BusinessTypes> page, BusinessTypes businessTypes) {
		return super.findPage(page, businessTypes);
	}
	
	@Transactional(readOnly = false)
	public void save(BusinessTypes businessTypes) {
		super.save(businessTypes);
	}
	
	@Transactional(readOnly = false)
	public void delete(BusinessTypes businessTypes) {
		super.delete(businessTypes);
	}
	
}