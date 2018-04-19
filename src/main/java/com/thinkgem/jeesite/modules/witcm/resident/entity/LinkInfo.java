/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.resident.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 友情链接Entity
 * @author luoyang
 * @version 2017-12-27
 */
public class LinkInfo extends DataEntity<LinkInfo> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 名称
	private Integer orders;		// 排序
	private String urls;		// 链接
	private String status;		// 状态
	private String belongOrgId;		// 归属机构
	private String belongAreaId;		// 归属单位
	
	public LinkInfo() {
		super();
	}

	public LinkInfo(String id){
		super(id);
	}

	@Length(min=0, max=100, message="名称长度必须介于 0 和 100 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
	public Integer getOrders() {
		return orders;
	}

	public void setOrders(Integer orders) {
		this.orders = orders;
	}

	@Length(min=0, max=200, message="链接长度必须介于 0 和 200 之间")
	public String getUrls() {
		return urls;
	}

	public void setUrls(String urls) {
		this.urls = urls;
	}
	
	@Length(min=0, max=2, message="状态长度必须介于 0 和 2 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Length(min=0, max=64, message="归属机构长度必须介于 0 和 64 之间")
	public String getBelongOrgId() {
		return belongOrgId;
	}

	public void setBelongOrgId(String belongOrgId) {
		this.belongOrgId = belongOrgId;
	}
	
	@Length(min=0, max=64, message="归属单位长度必须介于 0 和 64 之间")
	public String getBelongAreaId() {
		return belongAreaId;
	}

	public void setBelongAreaId(String belongAreaId) {
		this.belongAreaId = belongAreaId;
	}
	
}