package com.thinkgem.jeesite.modules.cms.web.search;

import groovy.util.logging.Commons;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.BaseEntity;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.cms.entity.Article;
import com.thinkgem.jeesite.modules.cms.service.ArticleDataService;
import com.thinkgem.jeesite.modules.cms.service.ArticleService;
import com.thinkgem.jeesite.modules.witcm.business.entity.Business;
import com.thinkgem.jeesite.modules.witcm.business.entity.Goods;
import com.thinkgem.jeesite.modules.witcm.business.service.BusinessService;
import com.thinkgem.jeesite.modules.witcm.business.service.GoodsService;

@Component
public class SearchContent {
	private List<String> typeList;// 搜索的分类名集合
	@Autowired
	private BusinessService businessService;
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private ArticleService articleService;
	@Autowired
	private ArticleDataService articleDataService;
	/**
	 * 一些搜索分类的常量
	 */
	public static final String BS_NAME = "商家";
	public static final String GS_NAME = "商品";
	public static final String AL_NAME = "帖子";
	public static final String CX_NAME = "促销信息";

	public SearchContent() {
		typeList = new ArrayList<String>();
		typeList.add(BS_NAME);
		typeList.add(AL_NAME);
		typeList.add(CX_NAME);
		typeList.add(GS_NAME);
	}

	/**
	 * 提供的搜索对象
	 * 
	 * @param content
	 * @return
	 */
	public ListPage search(String content, HttpServletRequest request,
			int pageSize, int pageNo) {
		if (StringUtils.isEmpty(content)) {
			return null;
		} else {
			List<SearchEntity> warp = new ArrayList<SearchEntity>();
			String ctx = request.getContextPath() + Global.getFrontPath();
			for (String n : typeList) {
				// 搜索商家
				if (n.equals(BS_NAME)) {
					// 先根据名字来搜索

					Business b = new Business();
					b.setSearchContent(content);
					List<Business> bs = businessService.findList(b);
					for (Business business : bs) {
						SearchEntity searchE = new SearchEntity();
						searchE.setContent(business.getFullName());
						searchE.setUrl(ctx + "/business-detail-"
								+ business.getId() + "-1-1"
								+ Global.getUrlSuffix());
						searchE.setTitle("(商家)"+business.getFullName());
						warp.add(searchE);
					}
				} else if (n.equals(AL_NAME)) {

					Article article = new Article();
					article.setSearchContent(content);
					List<Article> articles = articleService.searchList(article);
					for (Article a : articles) {
						SearchEntity searchE = new SearchEntity();
						searchE.setContent(articleDataService.get(a.getId())
								.getContent());
						searchE.setUrl(ctx + "/view-" + a.getId()
								+ Global.getUrlSuffix());
						searchE.setTitle("(文章)"+a.getTitle());
						warp.add(searchE);
					}

				}
			}
			ListPage listPage = getPage(pageNo, pageSize, warp);
			return listPage;
		}

	}

	public ListPage getPage(int pageNo, int pageSize,
			List<SearchEntity> contentList) {
		int len = contentList.size();
		ListPage listPage = new ListPage();
		int start = 0;
		int end = 0;
		if (len > 0) {
			// total
			listPage.setCount(len);
			int zhechu = len / pageSize;
			int yushu = len % pageSize;
			if (zhechu == 0) {
				start = 0;
				end = yushu;
				listPage.setCurPage(1);
				listPage.setTotal(1);
			} else if (yushu > 0) {
				listPage.setTotal(zhechu + 1);
				if (pageNo >= (zhechu + 1)) {
					start = (zhechu) * pageSize;
					end = start + yushu;
					listPage.setCurPage(zhechu + 1);
				} else if (pageNo <= 0) {
					start = 0;
					end = start + pageSize;
					listPage.setCurPage(1);
				} else {
					start = (pageNo - 1) * pageSize;
					end = start + pageSize;
					listPage.setCurPage(zhechu + 1);
				}
				listPage.setCurPage(pageNo);
			} else if (yushu == 0) {
				listPage.setTotal(zhechu);
				if (pageNo >= (zhechu)) {
					start = (zhechu - 1) * pageSize;
					end = start + pageSize;
					listPage.setCurPage(zhechu);
				} else if (pageNo <= 0) {
					start = 0;
					end = start + pageSize;
					listPage.setCurPage(1);
				} else {
					start = (pageNo - 1) * pageSize;
					end = start + pageSize;
					listPage.setCurPage(zhechu);
				}
				listPage.setCurPage(pageNo);
			}
			List<SearchEntity> searchEntities = new ArrayList<SearchEntity>();
			for (int i = start; i < end; i++) {
				searchEntities.add(contentList.get(i));
			}
			listPage.setPage(searchEntities);
		}
		return listPage;
	}

	public List<String> getTypeList() {
		return typeList;
	}

	public void setTypeList(List<String> typeList) {
		this.typeList = typeList;
	}

	public class ListPage {
		private int total;
		private int curPage;
		private int count;
		private List<SearchEntity> page;

		public int getTotal() {
			return total;
		}

		public void setTotal(int total) {
			this.total = total;
		}

		public int getCurPage() {
			return curPage;
		}

		public void setCurPage(int curPage) {
			this.curPage = curPage;
		}

		public List<SearchEntity> getPage() {
			return page;
		}

		public void setPage(List<SearchEntity> page) {
			this.page = page;
		}

		public int getCount() {
			return count;
		}

		public void setCount(int count) {
			this.count = count;
		}

	}
}
