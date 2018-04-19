/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.resident.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 咨询回复Entity
 * @author liyongfang
 * @version 2017-12-04
 */
public class ConsultReply extends DataEntity<ConsultReply> {
	
	private static final long serialVersionUID = 1L;
	private Consult consult;		// 咨询ID
	private User user;		// 回复人ID
	private String userName;		// 回复人姓名
	private String userTypes;		// 回复人类型(居民、社区)
	private String deleteFlag;		// 删除标记
	private String contents;		// 内容
	private Office belongOrg;		// 归属机构
	private String belongAreaId;		// 归属单位
	
	public ConsultReply() {
		super();
	}

	public ConsultReply(String id){
		super(id);
	}

	public Consult getConsult() {
		return consult;
	}

	public void setConsult(Consult consult) {
		this.consult = consult;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Length(min=0, max=50, message="回复人姓名长度必须介于 0 和 50 之间")
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	@Length(min=0, max=2, message="回复人类型(居民、社区)长度必须介于 0 和 2 之间")
	public String getUserTypes() {
		return userTypes;
	}

	public void setUserTypes(String userTypes) {
		this.userTypes = userTypes;
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