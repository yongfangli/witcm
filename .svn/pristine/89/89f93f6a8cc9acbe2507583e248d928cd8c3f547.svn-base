/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.business.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.witcm.business.entity.Convenient;
import com.thinkgem.jeesite.modules.witcm.business.service.ConvenientService;

/**
 * 便民热线Controller
 * @author liyongfang
 * @version 2017-12-15
 */
@Controller
@RequestMapping(value = "${adminPath}/business/convenient")
public class ConvenientController extends BaseController {

	@Autowired
	private ConvenientService convenientService;
	
	@ModelAttribute
	public Convenient get(@RequestParam(required=false) String id) {
		Convenient entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = convenientService.get(id);
		}
		if (entity == null){
			entity = new Convenient();
		}
		return entity;
	}
	
	@RequiresPermissions("business:convenient:view")
	@RequestMapping(value = {"list", ""})
	public String list(Convenient convenient, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Convenient> page = convenientService.findPage(new Page<Convenient>(request, response), convenient); 
		model.addAttribute("page", page);
		return "witcm/business/convenientList";
	}

	@RequiresPermissions("business:convenient:view")
	@RequestMapping(value = "form")
	public String form(Convenient convenient, Model model) {
		model.addAttribute("convenient", convenient);
		return "witcm/business/convenientForm";
	}

	@RequiresPermissions("business:convenient:edit")
	@RequestMapping(value = "save")
	public String save(Convenient convenient, Model model, RedirectAttributes redirectAttributes) {
		//设置默认的排序
		if(convenient.getSort()==null){
			convenient.setSort(convenientService.maxSort()+1);
		}
		if (!beanValidator(model, convenient)){
			return form(convenient, model);
		}
		convenientService.save(convenient);
		addMessage(redirectAttributes, "保存便民热线成功");
		return "redirect:"+Global.getAdminPath()+"/business/convenient/?repage";
	}
	
	@RequiresPermissions("business:convenient:edit")
	@RequestMapping(value = "delete")
	public String delete(Convenient convenient, RedirectAttributes redirectAttributes) {
		convenientService.delete(convenient);
		addMessage(redirectAttributes, "删除便民热线成功");
		return "redirect:"+Global.getAdminPath()+"/business/convenient/?repage";
	}

}