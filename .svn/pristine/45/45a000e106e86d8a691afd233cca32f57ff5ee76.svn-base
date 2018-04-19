/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.resident.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.witcm.resident.dao.CommentReplyDao;
import com.thinkgem.jeesite.modules.witcm.resident.dao.CommentsDao;
import com.thinkgem.jeesite.modules.witcm.resident.entity.CommentReply;
import com.thinkgem.jeesite.modules.witcm.resident.entity.Comments;

/**
 * 评论回复Service
 * 
 * @author liyongfang
 * @version 2017-12-09
 */
@Service
@Transactional(readOnly = true)
public class CommentReplyService extends
		CrudService<CommentReplyDao, CommentReply> {
	@Autowired
	private CommentsDao commentsDao;
	@Autowired
	private CommentReplyDao commentReplyDao;

	public CommentReply get(String id) {
		return super.get(id);
	}

	public List<CommentReply> findList(CommentReply commentReply) {
		return super.findList(commentReply);
	}

	public Page<CommentReply> findPage(Page<CommentReply> page,
			CommentReply commentReply) {
		return super.findPage(page, commentReply);
	}

	@Transactional(readOnly = false)
	public void save(CommentReply commentReply) {

		// 更新评论表
		if (!hasParent(commentReply)
				&& StringUtils.isEmpty(commentReply.getId())) {
			Comments c = commentsDao.get(commentReply.getComment().getId());
			if (null == c.getHasReply() || Global.NO.equals(c.getHasReply())) {
				c.setHasReply(Global.YES);
				commentsDao.update(c);
			} else {
				// 更新父辈
				CommentReply cReply = super.get(commentReply.getParent()
						.getId());
				if (null == cReply.getHasReply()
						|| Global.NO.equals(cReply.getHasReply())) {
					cReply.setHasReply(Global.YES);
					commentReplyDao.update(cReply);
				}
			}
		}
		super.save(commentReply);
	}

	@Transactional(readOnly = false)
	public void delete(CommentReply commentReply) {
		// 更新评论表
		if (!hasParent(commentReply)) {
			Comments c = commentsDao.get(commentReply.getComment().getId());
			if (null == c.getHasReply() || Global.YES.equals(c.getHasReply())) {
				c.setHasReply(Global.NO);
				commentsDao.update(c);
			}
		} else {
			// 更新父辈
			CommentReply cReply = super.get(commentReply.getParent().getId());
			if (null == cReply.getHasReply()
					|| Global.YES.equals(cReply.getHasReply())) {
				cReply.setHasReply(Global.NO);
				commentReplyDao.update(cReply);
			}
			// 删除所有子节点
			List<CommentReply> container = null;
			getAllChild(container, commentReply);
			if (container.size() > 0) {
				for (CommentReply c : container) {
					commentReplyDao.delete(c);
				}
			}
		}
		super.delete(commentReply);
	}

	/**
	 * 有父辈
	 * 
	 * @param commentReply
	 * @return
	 */
	public boolean hasParent(CommentReply commentReply) {
		return null != commentReply.getParent()
				&& StringUtils.isNotEmpty(commentReply.getParent().getId());
	}

	/**
	 * 获取子节点
	 * 
	 * @param commentReply
	 * @return
	 */
	public CommentReply getChild(CommentReply commentReply) {
		CommentReply cReply = new CommentReply();
		cReply.setParent(commentReply);
		List<CommentReply> commentReplys = super.findList(cReply);
		if (commentReplys != null && commentReplys.size() > 0) {
			return commentReplys.get(0);
		}
		return null;
	}

	/**
	 * 是否有子节点
	 * 
	 * @param commentReply
	 * @return
	 */
	public boolean hasChild(CommentReply commentReply) {
		CommentReply cReply = new CommentReply();
		cReply.setParent(commentReply);
		List<CommentReply> commentReplies = super.findList(cReply);
		return commentReplies != null && commentReplies.size() > 0;
	}

	/**
	 * 取出所有子节点
	 * 
	 * @param commentReply
	 * @return
	 */
	public List<CommentReply> getAllChild(List<CommentReply> container,
			CommentReply commentReply) {
		if (container == null) {
			container = new ArrayList<CommentReply>();
		}
		if (hasChild(commentReply)) {
			container.add(getChild(commentReply));
			getAllChild(container, getChild(commentReply));
		}
		return null;
	}
}