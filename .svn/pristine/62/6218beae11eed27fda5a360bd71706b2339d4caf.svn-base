/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.resident.entity;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 评论回复Entity
 * 
 * @author liyongfang
 * @version 2017-12-09
 */
public class CommentReply extends DataEntity<CommentReply> {

	private static final long serialVersionUID = 1L;
	private Comments comment; // 回复的评论
	private Resident resident; // 回复人
	private CommentReply parent; // 父回复
	private String content; // 回复的内容
	private String hasReply; // 是否有回复

	public CommentReply() {
		super();
	}

	public CommentReply(String id) {
		super(id);
	}

	@NotNull
	public Comments getComment() {
		return comment;
	}

	public void setComment(Comments comment) {
		this.comment = comment;
	}

	@JsonBackReference
	public CommentReply getParent() {
		return parent;
	}

	public void setParent(CommentReply parent) {
		this.parent = parent;
	}

	@NotNull
	public Resident getResident() {
		return resident;
	}

	public void setResident(Resident resident) {
		this.resident = resident;
	}

	@NotEmpty
	@Length(min = 0, max = 500, message = "回复的内容长度必须介于 0 和 500 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Length(min = 0, max = 1, message = "是否有回复长度必须介于 0 和 1 之间")
	public String getHasReply() {
		return hasReply;
	}

	public void setHasReply(String hasReply) {
		this.hasReply = hasReply;
	}

}