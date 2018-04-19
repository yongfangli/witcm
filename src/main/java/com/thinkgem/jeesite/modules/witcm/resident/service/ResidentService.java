package com.thinkgem.jeesite.modules.witcm.resident.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.dao.OfficeDao;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.witcm.resident.dao.FamilyDao;
import com.thinkgem.jeesite.modules.witcm.resident.dao.ResidentDao;
import com.thinkgem.jeesite.modules.witcm.resident.entity.Family;
import com.thinkgem.jeesite.modules.witcm.resident.entity.Resident;

/**
 * 居民Service
 * 
 * @author liyongfang
 * @version 2017-12-04
 */
@Service
@Transactional(readOnly = true)
public class ResidentService extends CrudService<ResidentDao, Resident> {
	@Autowired
	private OfficeDao officeDao;
	@Autowired
	private FamilyService familyService;
	public Resident get(String id) {
		return super.get(id);
	}

	public List<Resident> findList(Resident resident) {
		return super.findList(resident);
	}

	public Page<Resident> findPage(Page<Resident> page, Resident resident) {
		return super.findPage(page, resident);
	}

	/**
	 * 
	 */
	@Transactional(readOnly = false)
	public void save(Resident resident) {
		//冗余字段值添加
		if (null != resident.getBelongOrg()) {
			resident.setBelongArea(officeDao
					.get(resident.getBelongOrg().getId()).getArea().getId());
		}
		super.save(resident);
		
	}

	@Transactional(readOnly = false)
	public void delete(Resident resident) {
		super.delete(resident);
		Family family = new Family();
		family.setResident(new Resident());
		family.getResident().setId(resident.getId());
		List<Family> familys = familyService.findList(family);
		for(Family family1:familys){
			familyService.delete(family1);
		}
	}

	/*
	 * @Transactional(readOnly = false) public List<Resident> findByName(String
	 * name) { return dao.findByName(name); }
	 */
	@Transactional(readOnly = false)
	public List<Resident> findByOfficeId(String officeId) {
		if (StringUtils.isEmpty(officeId)) {
			User user = UserUtils.getUser();
			// 如果是超级管理员，取出所有用户
			if (user.isAdmin()) {
				return super.findList(new Resident());
			} else {
				officeId = UserUtils.getUser().getOffice().getId();
				Resident resident = new Resident();
				resident.setBelongOrg(new Office(officeId));
				return super.findList(resident);
			}
		} else {
			Resident resident = new Resident();
			resident.setBelongOrg(new Office(officeId));
			return super.findList(resident);
		}
	}

	/**
	 * 设置实体搜索条件
	 */
	public void setScope(Resident resident) {
		if (null == resident.getBelongOrg()
				|| null == resident.getBelongOrg().getId()) {
			User user = UserUtils.getUser();
			// 如果是超级管理员，取出所有用户
			if (user.isAdmin()) {
				resident.setBelongOrg(null);
			} else {
				String officeId = UserUtils.getUser().getOffice().getId();
				resident.setBelongOrg(new Office(officeId));
			}
		}
	}
	
	/**
	 * 根据手机号和密码查询
	 * @param tel
	 * @param pswd
	 * @return
	 */
	public Resident findByTelAndPswd(String tel,String pswd){
		List<Resident> list = dao.findByTelAndPswd(tel, pswd);
		if(list!=null && list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}
	
	/**
	 * 修改密码
	 * @param pswd
	 * @param id
	 */
	@Transactional(readOnly = false)
	public void updatePswd(String pswd,String id){
		dao.updatePswd(pswd, id);
	}

	/**
	 * 个人中心－修改信息
	 * @param business
	 */
	@Transactional(readOnly = false)
	public void updateFront(Resident resident){
		if (null != resident.getBelongOrg()) {
			resident.setBelongArea(officeDao.get(resident.getBelongOrg().getId()).getArea().getId());
		}
		
		Family familyUser=new Family();
		Resident resident2 = new Resident();
		resident2.setId(resident.getId());
		familyUser.setResident(resident2);
		familyUser.setResidentFlag(Global.YES);
		List<Family> familyUsers=familyService.findList(familyUser);
		if(familyUsers.size()<=0){
			Family family=new Family();
			family.setBelongOrg(resident.getBelongOrg());
			family.setName(resident.getName());
			family.setIdentityNo(resident.getIdentityNo());
			family.setGender(resident.getGender());
			
			familyService.save(family);
		}
		
		
		dao.updateFront(resident);
	}
	/**
	 * 更新积分
	 * @param id
	 * @param points
	 */
	@Transactional(readOnly = false)
	public void updatePoints(String id,double points){
		dao.updatePoints(id, points);
	}
	@Transactional(readOnly = false)
	public List<Resident> sortBy(int top,String orderBy){
		return dao.sortBy(top, orderBy);
	}
}
