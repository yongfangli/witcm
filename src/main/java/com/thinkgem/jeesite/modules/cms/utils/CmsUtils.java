/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.utils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.constants.Constants;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.CacheUtils;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.cms.entity.Article;
import com.thinkgem.jeesite.modules.cms.entity.Category;
import com.thinkgem.jeesite.modules.cms.entity.Link;
import com.thinkgem.jeesite.modules.cms.entity.Site;
import com.thinkgem.jeesite.modules.cms.service.ArticleService;
import com.thinkgem.jeesite.modules.cms.service.CategoryService;
import com.thinkgem.jeesite.modules.cms.service.LinkService;
import com.thinkgem.jeesite.modules.cms.service.SiteService;

import freemarker.core.ReturnInstruction.Return;

import javax.servlet.ServletContext;

import org.springframework.ui.Model;

/**
 * 内容管理工具类
 * 
 * @author ThinkGem
 * @version 2013-5-29
 */
public class CmsUtils {

	private static SiteService siteService = SpringContextHolder
			.getBean(SiteService.class);
	private static CategoryService categoryService = SpringContextHolder
			.getBean(CategoryService.class);
	private static ArticleService articleService = SpringContextHolder
			.getBean(ArticleService.class);
	private static LinkService linkService = SpringContextHolder
			.getBean(LinkService.class);
	private static ServletContext context = SpringContextHolder
			.getBean(ServletContext.class);

	private static final String CMS_CACHE = "cmsCache";
	
	/**
	 * 获取文章列表
	 * 
	 * @param siteId
	 *            站点编号
	 * @param categoryId
	 *            分类编号
	 * @param number
	 *            获取数目
	 * @param param
	 *            预留参数，例： key1:'value1', key2:'value2' ... posid
	 *            推荐位（1：首页焦点图；2：栏目页文章推荐；） image 文章图片（1：有图片的文章） orderBy 排序字符串
	 * @return ${fnc:getArticleList(category.site.id, category.id, not empty
	 *         pageSize?pageSize:8, 'posid:2, orderBy: \"hits desc\"')}"
	 */
	public static List<Article> getCommunityList(String categoryId,int number) {
		Page<Article> page = new Page<Article>();
		page.setPageSize(number);
		Category category = new Category();
		category.setId(categoryId);
		category.setParentIds(categoryId);
		Article article = new Article(category);
		Page<Article> articles = articleService.findPage(page, article);
		return articles.getList();
	}
	
	
	public static List<Article> getNameList(String name,int number){
		Category category = new Category();
		category.setName(name);
		List<Category> categorys = categoryService.findList(category);
		if(categorys.size()==0)return null;
		Article searA = new Article();
		searA.setCategory(categorys.get(0));
		Page<Article> ap = new Page<Article>();
		ap.setPageSize(number);
		Page<Article> articleP = articleService.findPage(ap, searA);
		List<Article> articles = articleP.getList();
		for(Article ar:articles){
			ar.setArticleData(articleService.getArticleDate(ar.getId()));
		}
		return articles;
	}
	/**
	 * 获得主导航列表
	 * 
	 * @param siteId
	 *            站点编号
	 */
	public static List<Category> getTopMenu() {
		List<Category> categorys = Lists.newArrayList();
		Category categoryS;
		categoryS = new Category();
		categoryS.setName("社区新闻");
		List<Category> categorys1 = categoryService.findList(categoryS);
		if(categorys1.size()>0){
			categorys.add(categorys1.get(0));
		}
		categoryS.setName("社区帮扶");
		List<Category> categorys3 = categoryService.findList(categoryS);
		if(categorys1.size()>0){
			categorys.add(categorys3.get(0));
		}
		categoryS.setName("社区公告");
		List<Category> categorys2 = categoryService.findList(categoryS);
		if(categorys2.size()>0){
			categorys.add(categorys2.get(0));
		}
		return categorys;
	}

	/**
	 * 获得站点列表
	 */
	public static List<Site> getSiteList() {
		@SuppressWarnings("unchecked")
		List<Site> siteList = (List<Site>) CacheUtils
				.get(CMS_CACHE, "siteList");
		if (siteList == null) {
			Page<Site> page = new Page<Site>(1, -1);
			page = siteService.findPage(page, new Site());
			siteList = page.getList();
			CacheUtils.put(CMS_CACHE, "siteList", siteList);
		}
		return siteList;
	}

	/**
	 * 获得子节点都是文字的栏目类型的父栏目类型
	 * 
	 * @return
	 */
	public static void getArticleParentCategory(Category lastCategory,
			String ret) {
		if (StringUtils.isEmpty(lastCategory.getModule())) {
			Category c = new Category();
			c.setParent(lastCategory);
			List<Category> categories2 = categoryService.findList(c);
			if (categories2.size() > 0) {
				if (StringUtils.isEmpty(categories2.get(0).getModule())) {
					getArticleParentCategory(categories2.get(0), ret);
				} else {
					ret = categories2.get(0).getParentId();
				}
			}
		} else {
			ret = lastCategory.getParentId();
		}
	}

	/**
	 * 获得站点信息
	 * 
	 * @param siteId
	 *            站点编号
	 */
	public static Site getSite(String siteId) {
		String id = "1";
		if (StringUtils.isNotBlank(siteId)) {
			id = siteId;
		}
		for (Site site : getSiteList()) {
			if (site.getId().equals(id)) {
				return site;
			}
		}
		return new Site(id);
	}

	/**
	 * 获得主导航列表
	 * 
	 * @param siteId
	 *            站点编号
	 */
	public static List<Category> getMainNavList(String siteId) {
		@SuppressWarnings("unchecked")
		List<Category> mainNavList = (List<Category>) CacheUtils.get(CMS_CACHE,
				"mainNavList_" + siteId);
		if (mainNavList == null || mainNavList.size() <= 0) {
			Category category = new Category();
			category.setSite(new Site(siteId));
			category.setParent(new Category("1"));
			category.setInMenu(Global.SHOW);
			Page<Category> page = new Page<Category>(1, -1);
			page = categoryService.find(page, category);
			mainNavList = page.getList();
			CacheUtils.put(CMS_CACHE, "mainNavList_" + siteId, mainNavList);
		}
		return mainNavList;
	}

	/**
	 * 按分类名字搜索
	 * 
	 * @param siteId
	 *            站点编号
	 */
	public static List<Article> getMainFaceList(String siteId, String name) {
		Category category = new Category();
		category.setSite(new Site(siteId));
		category.setName(name);
		category.setInMenu(Global.SHOW);
		List<Category> categories = categoryService.findList(category);
		if (categories.size() > 0) {
			Article article = new Article();
			article.setCategory(categories.get(0));
			List<Article> articles = articleService.findList(article);
			return articles;
		}
		return null;
	}

	/**
	 * 获取栏目
	 * 
	 * @param categoryId
	 *            栏目编号
	 * @return
	 */
	public static Category getCategory(String categoryId) {
		return categoryService.get(categoryId);
	}

	/**
	 * 获得栏目列表
	 * 
	 * @param siteId
	 *            站点编号
	 * @param parentId
	 *            分类父编号
	 * @param number
	 *            获取数目
	 * @param param
	 *            预留参数，例： key1:'value1', key2:'value2' ...
	 */
	public static List<Category> getCategoryList(String siteId,
			String parentId, int number, String param) {
		Page<Category> page = new Page<Category>(1, number, -1);
		Category category = new Category();
		category.setSite(new Site(siteId));
		category.setParent(new Category(parentId));
		if (StringUtils.isNotBlank(param)) {
			@SuppressWarnings({ "unused", "rawtypes" })
			Map map = JsonMapper.getInstance().fromJson("{" + param + "}",
					Map.class);
		}
		page = categoryService.find(page, category);
		return page.getList();
	}

	public static String hasChild(String parentId, String siteId) {
		List<Category> page = new ArrayList<Category>();
		Category category = new Category();
		category.setSite(new Site(siteId));
		category.setParent(new Category(parentId));
		page = categoryService.findList(category);
		if (page.size() > 0) {
			return Global.YES;
		}
		return Global.NO;
	}

	/**
	 * 获取栏目
	 * 
	 * @param categoryIds
	 *            栏目编号
	 * @return
	 */
	public static List<Category> getCategoryListByIds(String categoryIds) {
		return categoryService.findByIds(categoryIds);
	}

	/**
	 * 获取文章
	 * 
	 * @param articleId
	 *            文章编号
	 * @return
	 */
	public static Article getArticle(String articleId) {
		return articleService.get(articleId);
	}

	/**
	 * 获取文章列表
	 * 
	 * @param siteId
	 *            站点编号
	 * @param categoryId
	 *            分类编号
	 * @param number
	 *            获取数目
	 * @param param
	 *            预留参数，例： key1:'value1', key2:'value2' ... posid
	 *            推荐位（1：首页焦点图；2：栏目页文章推荐；） image 文章图片（1：有图片的文章） orderBy 排序字符串
	 * @return ${fnc:getArticleList(category.site.id, category.id, not empty
	 *         pageSize?pageSize:8, 'posid:2, orderBy: \"hits desc\"')}"
	 */
	public static List<Article> getArticleList(String siteId,
			String categoryId, int number, String param) {
		Page<Article> page = new Page<Article>(1, number, -1);
		Category category = new Category(categoryId, new Site(siteId));
		category.setParentIds(categoryId);
		Article article = new Article(category);
		if (StringUtils.isNotBlank(param)) {
			@SuppressWarnings({ "rawtypes" })
			Map map = JsonMapper.getInstance().fromJson("{" + param + "}",
					Map.class);
			if (new Integer(1).equals(map.get("posid"))
					|| new Integer(2).equals(map.get("posid"))) {
				article.setPosid(String.valueOf(map.get("posid")));
			}
			if (new Integer(1).equals(map.get("image"))) {
				article.setImage(Global.YES);
			}
			if (StringUtils.isNotBlank((String) map.get("orderBy"))) {
				page.setOrderBy((String) map.get("orderBy"));
			}
		}
		article.setDelFlag(Article.DEL_FLAG_NORMAL);
		page = articleService.findPage(page, article, false);
		return page.getList();
	}

	/**
	 * 获取链接
	 * 
	 * @param linkId
	 *            文章编号
	 * @return
	 */
	public static Link getLink(String linkId) {
		return linkService.get(linkId);
	}

	/**
	 * 获取链接列表
	 * 
	 * @param siteId
	 *            站点编号
	 * @param categoryId
	 *            分类编号
	 * @param number
	 *            获取数目
	 * @param param
	 *            预留参数，例： key1:'value1', key2:'value2' ...
	 * @return
	 */
	public static List<Link> getLinkList(String siteId, String categoryId,
			int number, String param) {
		Page<Link> page = new Page<Link>(1, number, -1);
		Link link = new Link(new Category(categoryId, new Site(siteId)));
		if (StringUtils.isNotBlank(param)) {
			@SuppressWarnings({ "unused", "rawtypes" })
			Map map = JsonMapper.getInstance().fromJson("{" + param + "}",
					Map.class);
		}
		link.setDelFlag(Link.DEL_FLAG_NORMAL);
		page = linkService.findPage(page, link, false);
		return page.getList();
	}

	// ============== Cms Cache ==============

	public static Object getCache(String key) {
		return CacheUtils.get(CMS_CACHE, key);
	}

	public static void putCache(String key, Object value) {
		CacheUtils.put(CMS_CACHE, key, value);
	}

	public static void removeCache(String key) {
		CacheUtils.remove(CMS_CACHE, key);
	}

	/**
	 * 获得文章动态URL地址
	 * 
	 * @param article
	 * @return url
	 */
	public static String getUrlDynamic(Article article) {
		if (StringUtils.isNotBlank(article.getLink())) {
			return article.getLink();
		}
		StringBuilder str = new StringBuilder();
		str.append(context.getContextPath()).append(Global.getFrontPath());
		str.append("/view-").append(article.getCategory().getId()).append("-")
				.append(article.getId()).append(Global.getUrlSuffix());
		return str.toString();
	}

	/**
	 * 获得栏目动态URL地址
	 * 
	 * @param category
	 * @return url
	 */
	public static String getUrlDynamic(Category category) {
		if (StringUtils.isNotBlank(category.getHref())) {
			if (!category.getHref().contains("://")) {
				return context.getContextPath() + Global.getFrontPath()
						+ category.getHref();
			} else {
				return category.getHref();
			}
		}
		StringBuilder str = new StringBuilder();
		str.append(context.getContextPath()).append(Global.getFrontPath());
		str.append("/list-").append(category.getId())
				.append(Global.getUrlSuffix());
		return str.toString();
	}

	/**
	 * 从图片地址中去除ContextPath地址
	 * 
	 * @param src
	 * @return src
	 */
	public static String formatImageSrcToDb(String src) {
		if (StringUtils.isBlank(src))
			return src;
		if (src.startsWith(context.getContextPath() + "/userfiles")) {
			return src.substring(context.getContextPath().length());
		} else {
			return src;
		}
	}

	/**
	 * 从图片地址中加入ContextPath地址
	 * 
	 * @param src
	 * @return src
	 */
	public static String formatImageSrcToWeb(String src) {
		if (StringUtils.isBlank(src))
			return src;
		if (src.startsWith(context.getContextPath() + "/userfiles")) {
			return src;
		} else {
			return context.getContextPath() + src;
		}
	}

	public static void addViewConfigAttribute(Model model, String param) {
		if (StringUtils.isNotBlank(param)) {
			@SuppressWarnings("rawtypes")
			Map map = JsonMapper.getInstance().fromJson(param, Map.class);
			if (map != null) {
				for (Object o : map.keySet()) {
					model.addAttribute("viewConfig_" + o.toString(), map.get(o));
				}
			}
		}
	}

	public static void addViewConfigAttribute(Model model, Category category) {
		List<Category> categoryList = Lists.newArrayList();
		Category c = category;
		boolean goon = true;
		do {
			if (c.getParent() == null || c.getParent().isRoot()) {
				goon = false;
			}
			categoryList.add(c);
			c = c.getParent();
		} while (goon);
		Collections.reverse(categoryList);
		for (Category ca : categoryList) {
			addViewConfigAttribute(model, ca.getViewConfig());
		}
	}

	/**
	 * 是否是文章列表型的
	 * 
	 * @return
	 */
	public static boolean isArticleListCategory(String categoryId) {
		Category category = categoryService.get(categoryId);
		return category.getModule().equals(Constants.ARTICLE);
	}

	/**
	 * 是否是文章列表型的
	 * 
	 * @return
	 */
	public static boolean isArticleListCategory(Category category) {
		return category.getModule().equals(Constants.ARTICLE);
	}

	/**
	 * 是否是文章列表型的
	 * 
	 * @return
	 */
	public static boolean isNews(String categoryId) {
		Category category = categoryService.get(categoryId);
		return category.getModule().equals(Constants.NEWS);
	}

	/**
	 * 是否是文章列表型的
	 * 
	 * @return
	 */
	public static boolean isNews(Category category) {
		return category.getModule().equals(Constants.NEWS);
	}

	/**
	 * 是否是文章列表型的
	 * 
	 * @return
	 */
	public static boolean isPicture(String categoryId) {
		Category category = categoryService.get(categoryId);
		return category.getModule().equals(Constants.PICTURE);
	}

	/**
	 * 是否是文章列表型的
	 * 
	 * @return
	 */
	public static boolean isPicture(Category category) {
		return category.getModule().equals(Constants.PICTURE);
	}

	/**
	 * 是否是文章列表型的
	 * 
	 * @return
	 */
	public static boolean isSpecial(String categoryId) {
		Category category = categoryService.get(categoryId);
		return category.getModule().equals(Constants.SPECIAL);
	}

	/**
	 * 是否是文章列表型的
	 * 
	 * @return
	 */
	public static boolean isSpecial(Category category) {
		return category.getModule().equals(Constants.SPECIAL);
	}

	/**
	 * 设置model
	 */
	public static void setModel(Model model, String categoryId) {
		if (CmsUtils.isArticleListCategory(categoryId)) {
			model.addAttribute("categoryType", Constants.ARTICLE);
		} else if (CmsUtils.isNews(categoryId)) {
			model.addAttribute("categoryType", Constants.NEWS);
		} else if (CmsUtils.isPicture(categoryId)) {
			model.addAttribute("categoryType", Constants.PICTURE);
		} else if (CmsUtils.isSpecial(categoryId)) {
			model.addAttribute("categoryType", Constants.SPECIAL);
		}
	}

	public static boolean isVideo(String categoryId) {
		Category category = categoryService.get(categoryId);
		return category.getShowModes().equals(Constants.VIDEO_ENMU);
	}
}