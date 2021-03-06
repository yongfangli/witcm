/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.resident.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.witcm.resident.entity.Comments;

/**
 * 评论DAO接口
 * @author liyongfang
 * @version 2017-12-09
 */
@MyBatisDao
public interface CommentsDao extends CrudDao<Comments> {
	public void updateDF(Comments comment);
}