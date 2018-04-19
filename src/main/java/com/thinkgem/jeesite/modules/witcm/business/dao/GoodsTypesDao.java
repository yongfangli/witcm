/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.business.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.witcm.business.entity.GoodsTypes;

/**
 * 商品类型DAO接口
 * @author liyongfang
 * @version 2017-12-04
 */
@MyBatisDao
public interface GoodsTypesDao extends CrudDao<GoodsTypes> {
	
}