/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.resident.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.witcm.resident.entity.Resident;

/**
 * 居民DAO接口
 * @author liyongfang
 * @version 2017-12-04
 */
@MyBatisDao
public interface ResidentDao extends CrudDao<Resident> {
	/**
	 * 根据手机号和密码查询
	 * @param tel
	 * @param pswd
	 * @return
	 */
	public List<Resident> findByTelAndPswd(@Param("telphone")String tel,@Param("loginPswd")String pswd);
	
	/**
	 * 修改密码
	 * @param tel
	 * @param pswd
	 * @return
	 */
	public void updatePswd(@Param("loginPswd")String pswd,@Param("id")String id);
	
	/**
	 * 个人中心－修改信息
	 * @param business
	 */
	public void updateFront(Resident resident);
	
	/**
	 * 更新积分
	 * @param business
	 */
	public void updatePoints(@Param("id")String id,@Param("points")double points);
	
	public List<Resident> sortBy(@Param("top")int top,@Param("orderBy")String orderBy);
		
}