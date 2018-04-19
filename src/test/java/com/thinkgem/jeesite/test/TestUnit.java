package com.thinkgem.jeesite.test;

import java.util.List;

import junit.framework.Assert;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.thinkgem.jeesite.modules.cms.entity.Category;
import com.thinkgem.jeesite.modules.cms.entity.Site;
import com.thinkgem.jeesite.modules.cms.service.CategoryService;
import com.thinkgem.jeesite.modules.cms.utils.CmsUtils;
import com.thinkgem.jeesite.modules.witcm.business.entity.Business;
import com.thinkgem.jeesite.modules.witcm.resident.front.dao.FresidentDao;
import com.thinkgem.jeesite.modules.witcm.resident.front.entity.Fresident;
import com.thinkgem.jeesite.modules.witcm.resident.service.BusinessSorted;
import com.thinkgem.jeesite.modules.witcm.resident.service.CollectService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath*:/spring-context*.xml" })
public class TestUnit {
	@Autowired
	CollectService collectService;
	@Autowired
	CategoryService categoryService;
	@Autowired
	FresidentDao fresidentDao;
	@Test
	public void testAddCollect() {
		try {
			collectService.saveNewInstance("221fd60cb7544f51af6e7443dacdec5a",
					"1a6f30d2a4694e2bbf32bfd5752b08bd");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 测试获取文章分类列表
	 */
	@Test
	public void testGetCategory(){
		Category category = new Category();
		category.setSite(new Site("1"));
		category.setParent(new Category("1"));
		List<Category> categories=categoryService.findList(category);
		StringBuffer buffer=new StringBuffer();
		for (Category category2 : categories) {
			buffer.append(category2.getName());
		}
		System.err.println(buffer.toString());
	}
	
	/**
	 * 测试前台的数据取值
	 */
	@Test
	public void testGetFresidentList(){
		List<Fresident> fresidents=fresidentDao.findList(new Fresident());
	}
	
	
	/**
	 * 测试商家排序
	 */
	@Test
	public void testSortedBusiness(){
		Business business=new Business();
		business.setStar(0);
		BusinessSorted.getSortedNum(business);
		System.err.println(business.getSortedNum());
	}
}
