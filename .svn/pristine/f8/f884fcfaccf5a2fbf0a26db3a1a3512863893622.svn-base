/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.business.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.witcm.business.entity.OrdersRecord;
import com.thinkgem.jeesite.modules.witcm.business.dao.OrdersRecordDao;

/**
 * 订单状态Service
 * @author liyongfang
 * @version 2017-12-04
 */
@Service
@Transactional(readOnly = true)
public class OrdersRecordService extends CrudService<OrdersRecordDao, OrdersRecord> {

	public OrdersRecord get(String id) {
		return super.get(id);
	}
	
	public List<OrdersRecord> findList(OrdersRecord ordersRecord) {
		return super.findList(ordersRecord);
	}
	
	public Page<OrdersRecord> findPage(Page<OrdersRecord> page, OrdersRecord ordersRecord) {
		return super.findPage(page, ordersRecord);
	}
	
	@Transactional(readOnly = false)
	public void save(OrdersRecord ordersRecord) {
		super.save(ordersRecord);
	}
	
	@Transactional(readOnly = false)
	public void delete(OrdersRecord ordersRecord) {
		super.delete(ordersRecord);
	}
	
}