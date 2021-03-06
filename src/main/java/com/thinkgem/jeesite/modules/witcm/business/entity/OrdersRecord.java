/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.business.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 订单状态Entity
 * @author liyongfang
 * @version 2017-12-04
 */
public class OrdersRecord extends DataEntity<OrdersRecord> {
	
	private static final long serialVersionUID = 1L;
	private Orders orders;		// 订单ID
	private String dealStatus;		// 处理状态
	private String dealUserName;		// 处理人
	private Date dealDate;		// 处理时间
	private Office belongOrgI;		// 归属机构
	private String belongArea;		// 归属单位
	
	public OrdersRecord() {
		super();
	}

	public OrdersRecord(String id){
		super(id);
	}

	public Orders getOrders() {
		return orders;
	}

	public void setOrders(Orders orders) {
		this.orders = orders;
	}
	
	@Length(min=0, max=2, message="处理状态长度必须介于 0 和 2 之间")
	public String getDealStatus() {
		return dealStatus;
	}

	public void setDealStatus(String dealStatus) {
		this.dealStatus = dealStatus;
	}
	
	
	public String getDealUserName() {
		return dealUserName;
	}

	public void setDealUserName(String dealUserName) {
		this.dealUserName = dealUserName;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getDealDate() {
		return dealDate;
	}

	public void setDealDate(Date dealDate) {
		this.dealDate = dealDate;
	}
	
	public Office getBelongOrgI() {
		return belongOrgI;
	}

	public void setBelongOrgI(Office belongOrgI) {
		this.belongOrgI = belongOrgI;
	}
	
	@Length(min=0, max=64, message="归属单位长度必须介于 0 和 64 之间")
	public String getBelongArea() {
		return belongArea;
	}

	public void setBelongArea(String belongArea) {
		this.belongArea = belongArea;
	}
	
}