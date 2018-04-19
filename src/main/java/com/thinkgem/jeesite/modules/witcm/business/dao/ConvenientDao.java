/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.business.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.witcm.business.entity.Convenient;

/**
 * 便民热线DAO接口
 * @author liyongfang
 * @version 2017-12-15
 */
@MyBatisDao
public interface ConvenientDao extends CrudDao<Convenient> {
	int maxSort();
}