/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.business.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.witcm.business.entity.Business;

/**
 * 商户DAO接口
 * @author liyongfang
 * @version 2017-12-04
 */
@MyBatisDao
public interface BusinessDao extends CrudDao<Business> {
	Integer getStar(Map map);
	
	/**
	 * 根据手机号和密码查询
	 * @param tel
	 * @param pswd
	 * @return
	 */
	public List<Business> findByTelAndPswd(@Param("telphone")String tel,@Param("loginPswd")String pswd);
	
	/**
	 * 根据手机号查询 判断手机号是否已存在
	 * @param tel
	 * @return
	 */
	public List<Business> findByTel(@Param("telphone")String tel,@Param("id")String id);
	
	/**
	 * 修改密码
	 * @param tel
	 * @param pswd
	 * @return
	 */
	public void updatePswd(@Param("loginPswd")String pswd,@Param("id")String id);
	
	/**
	 * 商户中心－修改商户信息
	 * @param business
	 */
	public void updateFront(Business business);
	
	public void updateLoginDate(Business business);
	
	public int updateViewCount(String id);
	public List<Business> sortByComment(@Param("top")int top,@Param("orderBy")String orderBy);
}