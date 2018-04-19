/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.si.entity;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * si信息管理Entity
 * 
 * @author liyongfang
 * @version 2017-12-04
 */
public class SiInfo extends DataEntity<SiInfo> {

	private static final long serialVersionUID = 1L;
	private String name; // SI名称
	private String linkMan; // 联系人
	private String telphone; // 联系电话
	private String contents; // 合作内容
	private String belongOrgId; // 归属机构
	private String belongAreaId; // 归属单位

	public SiInfo() {
		super();
	}

	public SiInfo(String id) {
		super(id);
	}

	@NotEmpty
	@Length(min = 0, max = 100, message = "SI名称长度必须介于 0 和 100 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	@NotEmpty
	@Length(min = 0, max = 50, message = "联系人长度必须介于 0 和 50 之间")
	public String getLinkMan() {
		return linkMan;
	}

	public void setLinkMan(String linkMan) {
		this.linkMan = linkMan;
	}

	@NotEmpty
	@Pattern(regexp = "(^(\\(\\d{3,4}\\)|\\d{3,4}-|\\s)?\\d{7,14}$)|(^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$)", message = "身份证格式不正确")
	@Length(min = 0, max = 50, message = "联系电话长度必须介于 0 和 50 之间")
	public String getTelphone() {
		return telphone;
	}

	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}

	@Length(min = 0, max = 2000, message = "合作内容长度必须介于 0 和 2000 之间")
	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	@Length(min = 0, max = 64, message = "归属机构长度必须介于 0 和 64 之间")
	public String getBelongOrgId() {
		return belongOrgId;
	}

	public void setBelongOrgId(String belongOrgId) {
		this.belongOrgId = belongOrgId;
	}

	@Length(min = 0, max = 64, message = "归属单位长度必须介于 0 和 64 之间")
	public String getBelongAreaId() {
		return belongAreaId;
	}

	public void setBelongAreaId(String belongAreaId) {
		this.belongAreaId = belongAreaId;
	}

}