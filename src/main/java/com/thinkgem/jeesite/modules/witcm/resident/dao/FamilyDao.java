/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.resident.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.witcm.resident.entity.Family;

/**
 * 家属DAO接口
 * @author liyongfang
 * @version 2017-12-04
 */
@MyBatisDao
public interface FamilyDao extends CrudDao<Family> {

	List<Family> findByName(@Param("name") String username);
	
}