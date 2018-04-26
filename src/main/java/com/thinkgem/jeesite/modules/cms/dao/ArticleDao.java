/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.cms.entity.Article;
import com.thinkgem.jeesite.modules.cms.entity.Category;

/**
 * 文章DAO接口
 * 
 * @author ThinkGem
 * @version 2013-8-23
 */
@MyBatisDao
public interface ArticleDao extends CrudDao<Article> {

	public List<Article> findByIdIn(String[] ids);

	// {
	// return find("from Article where id in (:p1)", new Parameter(new
	// Object[]{ids}));
	// }

	public int updateHitsAddOne(String id);

	// {
	// return update("update Article set hits=hits+1 where id = :p1", new
	// Parameter(id));
	// }
	public List<Article> findImage(String id);

	public int updateExpiredWeight(Article article);

	public List<Category> findStats(Category category);

	// {
	// return
	// update("update Article set weight=0 where weight > 0 and weightDate < current_timestamp()");
	// }

	public List<Article> getList(@Param("categoryId") String categoryId,
			@Param("siteId") String siteId,
			@Param("communityId") String communityId, @Param("num") int num);

	public List<Article> searchList(Article article);

}
