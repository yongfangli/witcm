package com.thinkgem.jeesite.common.utils.excel.fieldtype;


import java.util.List;

import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.witcm.resident.entity.Resident;
import com.thinkgem.jeesite.modules.witcm.resident.service.ResidentService;

public class ResidentType {
	private static ResidentService residentService = SpringContextHolder.getBean(ResidentService.class);
	/**
	 * 获取对象值（导入）
	 */
	public static Object getValue(String val) {
		List<Resident> rList=Lists.newArrayList();
		Resident resident=new Resident();
		residentService.setScope(resident);
		rList=residentService.findList(resident);
		for (Resident e : rList){
			if (StringUtils.trimToEmpty(val).equals(e.getName())){
				return e;
			}
		}
		return null;
	}

	/**
	 * 设置对象值（导出）
	 */
	public static String setValue(Object val) {
		if (val != null && ((Resident)val).getName() != null){
			return ((Resident)val).getName();
		}
		return "";
	}
}
