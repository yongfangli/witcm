package com.thinkgem.jeesite.modules.witcm.business.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.witcm.business.entity.Business;
import com.thinkgem.jeesite.modules.witcm.business.dao.BusinessDao;

/**
 * 商户Service
 * @author liyongfang
 * @version 2017-12-04
 */
@Service
@Transactional(readOnly = true)
public class BusinessService extends CrudService<BusinessDao, Business> {

	public Business get(String id) {
		return super.get(id);
	}
	
	public List<Business> findList(Business business) {
		return super.findList(business);
	}
	
	public Page<Business> findPage(Page<Business> page, Business business) {
		return super.findPage(page, business);
	}
	
	@Transactional(readOnly = false)
	public void save(Business business) {
		super.save(business);
	}
	
	@Transactional(readOnly = false)
	public void delete(Business business) {
		super.delete(business);
	}
	@Transactional(readOnly = false)
	public Integer  getStar(String businessId){
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("businessId",businessId);
		map.put("starsv",0);
		 dao.getStar(map);
		return (Integer) map.get("starsv");
	}
	/**
	 * 根据手机号和密码查询
	 * @param tel
	 * @param pswd
	 * @return
	 */
	public Business findByTelAndPswd(String tel,String pswd){
		List<Business> list = dao.findByTelAndPswd(tel, pswd);
		if(list!=null && list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}
	
	/**
	 * 根据手机号查询 判断手机号是否已存在
	 * @param tel
	 * @return
	 */
	public boolean findByTel(String tel,String id){
		List<Business> list = dao.findByTel(tel,id);
		if(list!=null && list.size()>0){
			return true;
		}
		return false;
	}
	@Transactional(readOnly = false)
	public void updateLoginDate(Business business){
		
		dao.updateLoginDate(business);
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
	 * 商户中心－修改商户信息
	 * @param business
	 */
	@Transactional(readOnly = false)
	public void updateFront(Business business){
		dao.updateFront(business);
	}
	
	/**
	 * 点击数加一
	 */
	@Transactional(readOnly = false)
	public void updateViewCount(String id){
		dao.updateViewCount(id);
	}
	@Transactional(readOnly = false)
	public List<Business> sortByComment(int top,String orderBy){
		return dao.sortByComment(top, orderBy);
	}
}