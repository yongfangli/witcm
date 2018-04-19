/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.resident.entity;

import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.modules.cms.entity.Article;
import com.thinkgem.jeesite.modules.witcm.resident.entity.Resident;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 评论Entity
 * @author liyongfang
 * @version 2017-12-09
 */
public class Comments extends DataEntity<Comments> {
	
	private static final long serialVersionUID = 1L;
	private Resident resident;		// 评论居民
	private Article article;		// 评论的帖子
	private String content;		// 评论内容
	private String hasReply;		// 是否有回复
	private boolean canDel;
	public Comments() {
		super();
	}

	public Comments(String id){
		super(id);
	}
	@NotNull
	public Resident getResident() {
		return resident;
	}

	public void setResident(Resident resident) {
		this.resident = resident;
	}
	
	@Length(min=0, max=64, message="评论的帖子长度必须介于 0 和 64 之间")
	@NotNull
	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article= article;
	}
	@NotEmpty
	@Length(min=0, max=500, message="评论内容长度必须介于 0 和 500 之间")
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=1, message="是否有回复长度必须介于 0 和 1 之间")
	public String getHasReply() {
		return hasReply;
	}

	public void setHasReply(String hasReply) {
		this.hasReply = hasReply;
	}

	public boolean isCanDel() {
		return canDel;
	}

	public void setCanDel(boolean canDel) {
		this.canDel = canDel;
	}
	
}