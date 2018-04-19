package com.thinkgem.jeesite.modules.cms.web.wrap;

import java.io.Serializable;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.act.rest.servlet.JsonpCallbackFilter;
import com.thinkgem.jeesite.modules.cms.entity.Article;
import com.thinkgem.jeesite.modules.cms.entity.Category;
import com.thinkgem.jeesite.modules.cms.entity.Site;
import com.thinkgem.jeesite.modules.cms.utils.CmsUtils;

public class CategoryWrap implements Serializable {
	private static Logger log = LoggerFactory.getLogger(CategoryWrap.class);
	private static final long serialVersionUID = 1L;
	private String categoryId;// 第一个categoryId
	private String parentId;// 第二个categoryId
	private String curId;// 当前的categoryId
	private Integer pageNo;//
	private Integer pageSize;
	private Model model;// 返回的model数据
	private String page;

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getCurId() {
		return curId;
	}

	public void setCurId(String curId) {
		this.curId = curId;
	}

	public Model getModel() {
		return model;
	}

	public void setModel(Model model) {
		this.model = model;
	}

	// 是否是刚开始请求或者可以说是首页请求
	private boolean isIndex() {
		return StringUtils.isEmpty(curId) && StringUtils.isEmpty(categoryId)
				&& StringUtils.isEmpty(parentId);
	}

	// 是否是首页切换
	private boolean isIndexToggle() {
		return StringUtils.isNotEmpty(categoryId);
	}

	private boolean isCategoryToggleBegin() {
		return StringUtils.isNotEmpty(parentId) && StringUtils.isEmpty(curId);
	}

	// 是否是类型切换加载数据页面
	private boolean isCategoryToggle() {
		return StringUtils.isNotEmpty(parentId)
				&& StringUtils.isNotEmpty(curId);
	}
	//setting the request param in the index toggle page
	public void setData() throws Exception{
		if(isIndex()){
			log.debug("用户开始访问首页");
				Site site = CmsUtils.getSite(Site.defaultSiteId());
				List<Category> categories = CmsUtils.getMainNavList(site.getId());
				setCategoryId(categories.get(0).getId());
				//article.setCategory(new Category(getCategoryId()));
				model.addAttribute("categoryId", getCategoryId());
		}else if(isIndexToggle()){
			log.debug("用户进行首页的切换");
			    Article article=new Article();
			    article.setCategory(new Category(getCategoryId()));
		}
		
	}
	
}
