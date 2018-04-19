/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.resident.entity;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.Office;

/**
 * 咨询Entity
 * @author liyongfang
 * @version 2017-12-04
 */
public class Consult extends DataEntity<Consult> {
	
	private static final long serialVersionUID = 1L;
	private Resident resident;		// 发表人ID
	private String userName;		// 发表人姓名
	private String userTypes;		// 发表人类型(居民、社区)
	private String titles;		// 标题
	private String deleteFlag;		// 删除标记
	private String contents;		// 内容
	private Office belongOrg;		// 归属机构
	private String belongAreaId;		// 归属单位
	
	public Consult() {
		super();
	}

	public Consult(String id){
		super(id);
	}

	public Resident getResident() {
		return resident;
	}

	public void setResident(Resident resident) {
		this.resident = resident;
	}
	
	@Length(min=0, max=50, message="发表人姓名长度必须介于 0 和 50 之间")
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	@Length(min=0, max=2, message="发表人类型(居民、社区)长度必须介于 0 和 2 之间")
	public String getUserTypes() {
		return userTypes;
	}

	public void setUserTypes(String userTypes) {
		this.userTypes = userTypes;
	}
	
	@Length(min=0, max=64, message="标题长度必须介于 0 和 64 之间")
	public String getTitles() {
		return titles;
	}

	public void setTitles(String titles) {
		this.titles = titles;
	}
	
	@Length(min=0, max=2, message="删除标记长度必须介于 0 和 2 之间")
	public String getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	
	@Length(min=0, max=2000, message="内容长度必须介于 0 和 2000 之间")
	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}
	
	public Office getBelongOrg() {
		return belongOrg;
	}

	public void setBelongOrg(Office belongOrg) {
		this.belongOrg = belongOrg;
	}
	
	@Length(min=0, max=64, message="归属单位长度必须介于 0 和 64 之间")
	public String getBelongAreaId() {
		return belongAreaId;
	}

	public void setBelongAreaId(String belongAreaId) {
		this.belongAreaId = belongAreaId;
	}
	
}