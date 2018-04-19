package com.thinkgem.jeesite.modules.witcm.resident.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.witcm.business.dao.BusinessDao;
import com.thinkgem.jeesite.modules.witcm.business.entity.Business;
/**
 * 商戶排名
 * @author pc004
 *
 */
public class BusinessSorted {
	private static BusinessDao businessDao = SpringContextHolder
			.getBean(BusinessDao.class);

	public static void getSortedNum(Business business) {
		Business bus=new Business();
		Page<Business> page=new Page<Business>(1,-1);
		page.setOrderBy("star desc");
		bus.setPage(page);
		List<Business> businesses = businessDao.findList(bus);
		long i = 1;
		long current = business.getStar();
		for (Business b : businesses) {
			if (b.getStar() > current) {
				i++;
			} else {
				break;
			}
		}
		business.setSortedNum(i);
	}

}
