/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.business.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.witcm.business.entity.Promotion;
import com.thinkgem.jeesite.modules.witcm.business.dao.PromotionDao;

/**
 * 促销Service
 * @author liyongfang
 * @version 2017-12-06
 */
@Service
@Transactional(readOnly = true)
public class PromotionService extends CrudService<PromotionDao, Promotion> {

	public Promotion get(String id) {
		return super.get(id);
	}
	
	public List<Promotion> findList(Promotion promotion) {
		return super.findList(promotion);
	}
	
	public Page<Promotion> findPage(Page<Promotion> page, Promotion promotion) {
		return super.findPage(page, promotion);
	}
	
	@Transactional(readOnly = false)
	public void save(Promotion promotion) {
		super.save(promotion);
	}
	
	@Transactional(readOnly = false)
	public void delete(Promotion promotion) {
		super.delete(promotion);
	}
	
}