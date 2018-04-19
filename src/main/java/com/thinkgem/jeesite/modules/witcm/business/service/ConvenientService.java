/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.business.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.witcm.business.entity.Convenient;
import com.thinkgem.jeesite.modules.witcm.business.dao.ConvenientDao;

/**
 * 便民热线Service
 * 
 * @author liyongfang
 * @version 2017-12-15
 */
@Service
@Transactional(readOnly = true)
public class ConvenientService extends CrudService<ConvenientDao, Convenient> {

	public Convenient get(String id) {
		return super.get(id);
	}

	public List<Convenient> findList(Convenient convenient) {
		return super.findList(convenient);
	}

	public Page<Convenient> findPage(Page<Convenient> page,
			Convenient convenient) {
		return super.findPage(page, convenient);
	}

	@Transactional(readOnly = false)
	public void save(Convenient convenient) {
		super.save(convenient);
	}

	@Transactional(readOnly = false)
	public void delete(Convenient convenient) {
		super.delete(convenient);
	}

	public int maxSort() {
		return dao.maxSort();
	}
}