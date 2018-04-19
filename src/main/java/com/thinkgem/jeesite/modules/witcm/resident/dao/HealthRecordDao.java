/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.resident.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.witcm.chart.frontEntity.DateUtil;
import com.thinkgem.jeesite.modules.witcm.resident.entity.HealthRecord;

/**
 * 家庭健康档案DAO接口
 * @author liyongfang
 * @version 2017-12-04
 */
@MyBatisDao
public interface HealthRecordDao extends CrudDao<HealthRecord> {
	Integer getListByDate(@Param("communityId")String communityId,@Param("start")Date start,@Param("end")Date end);
}