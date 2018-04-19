/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.business.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.witcm.business.entity.Business;
import com.thinkgem.jeesite.modules.witcm.business.entity.GoodsComments;
import com.thinkgem.jeesite.modules.witcm.business.entity.Orders;
import com.thinkgem.jeesite.modules.witcm.business.entity.OrdersRecord;
import com.thinkgem.jeesite.modules.witcm.business.dao.GoodsCommentsDao;
import com.thinkgem.jeesite.modules.witcm.business.dao.OrdersDao;
import com.thinkgem.jeesite.modules.witcm.business.dao.OrdersRecordDao;

/**
 * 订单Service
 * @author liyongfang
 * @version 2017-12-04
 */
@Service
@Transactional(readOnly = true)
public class OrdersService extends CrudService<OrdersDao, Orders> {
	@Autowired
	OrdersRecordDao ordersRecordDao;
	@Autowired
	GoodsCommentsDao goodsCommentsDao;
	
	public Orders get(String id) {
		return super.get(id);
	}
	
	public List<Orders> findList(Orders orders) {
		return super.findList(orders);
	}
	
	public Page<Orders> findPage(Page<Orders> page, Orders orders) {
		return super.findPage(page, orders);
	}
	
	@Transactional(readOnly = false)
	public void save(Orders orders) {
		super.save(orders);
	}
	
	@Transactional(readOnly = false)
	public void delete(Orders orders) {
		super.delete(orders);
	}
	
	/**
	 * 个人中心－预订商品 save
	 * @param orders
	 */
	@Transactional(readOnly = false)
	public void saveFront(Orders orders,String userName) throws Exception{
		super.save(orders);
		//保存订单记录
		OrdersRecord record = new OrdersRecord();
		record.preInsert();
		record.setOrders(orders);
		record.setDealStatus(orders.getStatus());
		record.setDealUserName(userName);
		record.setDealDate(new Date());
		record.setBelongOrgI(orders.getBelongOrg());
		record.setBelongArea(orders.getBelongArea());
		record.setCreateBy(new User("1"));
		record.setUpdateBy(new User("1"));
		record.setCreateDate(new Date());
		record.setUpdateDate(new Date());
		ordersRecordDao.insert(record);
	}

	/**
	 * 个人中心/商家中心－预订商品 update
	 * @param orders
	 * @param userName
	 * @param remarks
	 */
	@Transactional(readOnly = false)
	public void updateFront(Orders orders,String userName,String remarks) throws Exception{
		dao.updateFront(orders);
		//保存订单记录
		OrdersRecord record = new OrdersRecord();
		record.preInsert();
		record.setOrders(orders);
		record.setDealStatus(orders.getStatus());
		record.setDealUserName(userName);
		record.setRemarks(remarks);
		record.setDealDate(new Date());
		record.setBelongOrgI(orders.getBelongOrg());
		record.setBelongArea(orders.getBelongArea());
		record.setCreateBy(new User("1"));
		record.setUpdateBy(new User("1"));
		record.setCreateDate(new Date());
		record.setUpdateDate(new Date());
		ordersRecordDao.insert(record);
	}
	
	/**
	 * 个人中心－评论商家 update
	 * @param orders
	 * @param userName
	 * @param remarks
	 */
	@Transactional(readOnly = false)
	public void updateComStatusFront(Orders orders,String stars,String remarks) throws Exception{
		dao.updateComStatusFront(orders);
		//保存评论
		Orders o = this.get(orders.getId());
		GoodsComments gc = new GoodsComments();
		gc.preInsert();
		gc.setResident(orders.getResident());
		gc.setBusiness(new Business(o.getBusinessId()));
		gc.setContents(remarks);
		gc.setStars(stars);
		
		gc.setBelongOrg(o.getBelongOrg());
		gc.setBelongArea(o.getBelongArea());
		gc.setCreateBy(new User("1"));
		gc.setUpdateBy(new User("1"));
		gc.setCreateDate(new Date());
		gc.setUpdateDate(new Date());
		
		goodsCommentsDao.insert(gc);
	}
	
}