/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.resident.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.witcm.resident.entity.BuildNo;

/**
 * 楼栋信息DAO接口
 * @author luoyang
 * @version 2017-12-27
 */
@MyBatisDao
public interface BuildNoDao extends CrudDao<BuildNo> {
	
}