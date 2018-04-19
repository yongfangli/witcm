/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.business.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.witcm.business.entity.GoodsTypes;
import com.thinkgem.jeesite.modules.witcm.business.dao.GoodsTypesDao;

/**
 * 商品类型Service
 * @author liyongfang
 * @version 2017-12-04
 */
@Service
@Transactional(readOnly = true)
public class GoodsTypesService extends CrudService<GoodsTypesDao, GoodsTypes> {

	public GoodsTypes get(String id) {
		return super.get(id);
	}
	
	public List<GoodsTypes> findList(GoodsTypes goodsTypes) {
		return super.findList(goodsTypes);
	}
	
	public List<GoodsTypes> findAllList(GoodsTypes goodsTypes) {
		return dao.findAllList(goodsTypes);
	}
	
	public Page<GoodsTypes> findPage(Page<GoodsTypes> page, GoodsTypes goodsTypes) {
		return super.findPage(page, goodsTypes);
	}
	
	@Transactional(readOnly = false)
	public void save(GoodsTypes goodsTypes) {
		super.save(goodsTypes);
	}
	
	@Transactional(readOnly = false)
	public void delete(GoodsTypes goodsTypes) {
		super.delete(goodsTypes);
	}
	
}