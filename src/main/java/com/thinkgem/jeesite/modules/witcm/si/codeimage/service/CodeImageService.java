/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.si.codeimage.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.witcm.si.codeimage.entity.CodeImage;
import com.thinkgem.jeesite.modules.witcm.si.codeimage.dao.CodeImageDao;

/**
 * 二维码生成Service
 * @author liyongfang
 * @version 2018-01-25
 */
@Service
@Transactional(readOnly = true)
public class CodeImageService extends CrudService<CodeImageDao, CodeImage> {

	public CodeImage get(String id) {
		return super.get(id);
	}
	
	public List<CodeImage> findList(CodeImage codeImage) {
		return super.findList(codeImage);
	}
	
	public Page<CodeImage> findPage(Page<CodeImage> page, CodeImage codeImage) {
		return super.findPage(page, codeImage);
	}
	
	@Transactional(readOnly = false)
	public void save(CodeImage codeImage) {
		super.save(codeImage);
	}
	
	@Transactional(readOnly = false)
	public void delete(CodeImage codeImage) {
		super.delete(codeImage);
	}
	
}