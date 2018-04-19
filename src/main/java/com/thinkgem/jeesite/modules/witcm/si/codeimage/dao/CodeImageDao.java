/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.si.codeimage.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.witcm.si.codeimage.entity.CodeImage;

/**
 * 二维码生成DAO接口
 * @author liyongfang
 * @version 2018-01-25
 */
@MyBatisDao
public interface CodeImageDao extends CrudDao<CodeImage> {
	
}