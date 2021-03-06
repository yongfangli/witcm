/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.business.entity;

import com.thinkgem.jeesite.modules.witcm.business.entity.Business;
import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 促销Entity
 * @author liyongfang
 * @version 2017-12-06
 */
public class Promotion extends DataEntity<Promotion> {
	
	private static final long serialVersionUID = 1L;
	private Business business;		// 商户ID
	private String titles;		// 促销主题
	private String contents;		// 促销内容
	private String offlineFlag;		// 是否下线
	private Date endDate;		// 促销截止日期
	private String issusStatus;		// 发布状态
	private String deleteFlag;		// 删除标记
	private Date issusDate;		// 发布时间
	private String belongOrgId;		// 归属机构
	private String belongAreaId;		// 归属单位
	private String relativeTime;  //相对时间字符串
	public Promotion() {
		super();
	}

	public Promotion(String id){
		super(id);
	}

	public Business getBusiness() {
		return business;
	}

	public void setBusiness(Business business) {
		this.business = business;
	}
	
	@Length(min=0, max=500, message="促销主题长度必须介于 0 和 500 之间")
	public String getTitles() {
		return titles;
	}

	public void setTitles(String titles) {
		this.titles = titles;
	}
	
	@Length(min=0, max=2000, message="促销内容长度必须介于 0 和 2000 之间")
	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}
	
	@Length(min=0, max=2, message="是否下线长度必须介于 0 和 2 之间")
	public String getOfflineFlag() {
		return offlineFlag;
	}

	public void setOfflineFlag(String offlineFlag) {
		this.offlineFlag = offlineFlag;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	@Length(min=0, max=2, message="发布状态长度必须介于 0 和 2 之间")
	public String getIssusStatus() {
		return issusStatus;
	}

	public void setIssusStatus(String issusStatus) {
		this.issusStatus = issusStatus;
	}
	
	@Length(min=0, max=2, message="删除标记长度必须介于 0 和 2 之间")
	public String getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getIssusDate() {
		return issusDate;
	}

	public void setIssusDate(Date issusDate) {
		this.issusDate = issusDate;
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

	public String getRelativeTime() {
		return relativeTime;
	}

	public void setRelativeTime(String relativeTime) {
		this.relativeTime = relativeTime;
	}
	
}